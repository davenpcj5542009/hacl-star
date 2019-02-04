module Vale.AsLowStar.ValeSig
open Interop.Base
module B = LowStar.Buffer
module BS = X64.Bytes_Semantics_s
module BV = LowStar.BufferView
module HS = FStar.HyperStack
module ME = X64.Memory
module TS = X64.Taint_Semantics_s
module MS = X64.Machine_s
module IA = Interop.Assumptions
module V = X64.Vale.Decls
module VS = X64.Vale.State
module IX64 = Interop.X64
module List = FStar.List.Tot
open X64.MemoryAdapters

[@__reduce__]
let vale_pre_tl (num_b8_slots:IX64.max_slots) (dom:list td) =
    n_arrow dom (V.va_state -> IX64.stack_buffer num_b8_slots -> prop)

[@__reduce__]
let vale_pre n (dom:list td) =
    code:V.va_code ->
    vale_pre_tl n dom

[@__reduce__]
let vale_post_tl n (dom:list td) =
    n_arrow dom
            (s0:V.va_state -> sb:IX64.stack_buffer n -> s1:V.va_state -> f:V.va_fuel -> prop)

[@__reduce__]
let vale_post n (dom:list td) =
    code:V.va_code ->
    vale_post_tl n dom

let vale_save_reg (r:MS.reg) (s0 s1:V.va_state) =
  VS.eval_reg r s0 == VS.eval_reg r s1

let vale_save_xmm (r:MS.xmm) (s0 s1:V.va_state) =
  VS.eval_xmm r s0 == VS.eval_xmm r s1

let vale_calling_conventions (s0 s1:V.va_state) =
  let open MS in
  vale_save_reg Rbx s0 s1 /\
  (IA.win ==> vale_save_reg Rsi s0 s1) /\
  (IA.win ==> vale_save_reg Rdi s0 s1) /\
  vale_save_reg Rbp s0 s1 /\
  (IA.win ==> vale_save_reg Rsp s0 s1) /\ // TODO: also needed for !IA.win
  vale_save_reg R12 s0 s1 /\
  vale_save_reg R13 s0 s1 /\
  vale_save_reg R14 s0 s1 /\
  vale_save_reg R15 s0 s1 /\
  (IA.win ==>
    vale_save_xmm 6 s0 s1 /\
    vale_save_xmm 7 s0 s1 /\
    vale_save_xmm 8 s0 s1 /\
    vale_save_xmm 9 s0 s1 /\
    vale_save_xmm 10 s0 s1 /\
    vale_save_xmm 11 s0 s1 /\
    vale_save_xmm 12 s0 s1 /\
    vale_save_xmm 13 s0 s1 /\
    vale_save_xmm 14 s0 s1 /\
    vale_save_xmm 15 s0 s1
  ) /\
  s1.VS.ok


[@__reduce__]
let modified_arg_mloc (x:arg) : GTot ME.loc =
    match x with
    | (|TD_Buffer t {modified=true}, x|) -> ME.loc_buffer (as_vale_buffer #t x)
    | _ -> ME.loc_none

[@__reduce__]
let mloc_modified_args (args:list arg) : GTot ME.loc =
    List.fold_right_gtot (List.map_gtot modified_arg_mloc args) ME.loc_union ME.loc_none

let state_of (x:(V.va_state & V.va_fuel)) = fst x
let fuel_of (x:(V.va_state & V.va_fuel)) = snd x
let sprop = VS.state -> prop


[@__reduce__]
let readable_one (s:ME.mem) (arg:arg) : prop =
  match arg with
  | (|TD_Buffer bt _, x |) ->
    ME.buffer_readable s (as_vale_buffer #bt x) /\
    ME.buffer_writeable (as_vale_buffer #bt x)
    /\ True //promote to prop
  | (|TD_ImmBuffer bt _, x |) ->
    ME.buffer_readable s (as_vale_immbuffer #bt x) /\
    True
  | _ -> True

[@__reduce__]
let readable (args:list arg) (s:ME.mem) : prop =
    BigOps.big_and' (readable_one s) args


[@__reduce__]
let disjoint_or_eq_1 (a:arg) (b:arg) =
    match a, b with
    | (| TD_Buffer tx {strict_disjointness=true}, xb |), (| TD_Buffer ty _, yb |)
    | (| TD_Buffer tx _, xb |), (| TD_Buffer ty {strict_disjointness=true}, yb |) ->
      ME.loc_disjoint (ME.loc_buffer (as_vale_buffer #tx xb)) (ME.loc_buffer (as_vale_buffer #ty yb))
    | (| TD_ImmBuffer tx {strict_disjointness=true}, xb |), (| TD_ImmBuffer ty _, yb |) 
    | (| TD_ImmBuffer tx _, xb |), (| TD_ImmBuffer ty {strict_disjointness=true}, yb |) ->
      ME.loc_disjoint (ME.loc_buffer (as_vale_immbuffer #tx xb)) (ME.loc_buffer (as_vale_immbuffer #ty yb))
    // An immutable buffer and a trivial buffer should not be equal
    | (| TD_ImmBuffer tx _, xb |), (| TD_Buffer ty _, yb |) ->
      ME.loc_disjoint (ME.loc_buffer (as_vale_immbuffer #tx xb)) (ME.loc_buffer (as_vale_buffer #ty yb))
    | (| TD_Buffer tx _, xb |), (| TD_ImmBuffer ty _, yb |) ->
      ME.loc_disjoint (ME.loc_buffer (as_vale_buffer #tx xb)) (ME.loc_buffer (as_vale_immbuffer #ty yb))
    | (| TD_Buffer tx _, xb |), (| TD_Buffer ty _, yb |) ->
      ME.loc_disjoint (ME.loc_buffer (as_vale_buffer #tx xb)) (ME.loc_buffer (as_vale_buffer #ty yb)) \/
      eq3 xb yb
    | (| TD_ImmBuffer tx _, xb |), (| TD_ImmBuffer ty _, yb |) ->
      ME.loc_disjoint (ME.loc_buffer (as_vale_immbuffer #tx xb)) (ME.loc_buffer (as_vale_immbuffer #ty yb)) \/
      eq3 xb yb
    | _ -> True

[@__reduce__]
let disjoint_or_eq (l:list arg) =
  BigOps.pairwise_and' disjoint_or_eq_1  l

[@__reduce__] unfold
let vale_sig_nil #n
                 (args:list arg)
                 (code:V.va_code)
                 (pre:vale_pre_tl n [])
                 (post:vale_post_tl n []) =
    va_s0:V.va_state ->
    stack_b:IX64.stack_buffer n ->
    Ghost (V.va_state & V.va_fuel)
     (requires
       elim_nil pre va_s0 stack_b)
     (ensures (fun r ->
       let va_s1 = state_of r in
       let f = fuel_of r in
       V.eval_code code va_s0 f va_s1 /\
       vale_calling_conventions va_s0 va_s1 /\
       elim_nil post va_s0 stack_b va_s1 f /\
       readable args VS.(va_s1.mem) /\
       ME.modifies (mloc_modified_args (arg_of_sb stack_b :: args)) va_s0.VS.mem va_s1.VS.mem))

[@__reduce__]
let rec vale_sig_tl #n
                    (#dom:list td)
                    (args:list arg)
                    (code:V.va_code)
                    (pre:vale_pre_tl n dom)
                    (post:vale_post_tl n dom)
  : Type =
    match dom with
    | [] ->
      vale_sig_nil args code pre post

    | hd::tl ->
      x:td_as_type hd ->
      vale_sig_tl #n #tl ((|hd,x|)::args) code (elim_1 pre x) (elim_1 post x)


[@__reduce__]
let elim_vale_sig_nil #n #code
                       (#args:list arg)
                       (#pre:vale_pre_tl n [])
                       (#post:vale_post_tl n [])
                       (v:vale_sig_tl #n #[] args code pre post)
    : vale_sig_nil args code pre post
    = v

[@__reduce__]
let elim_vale_sig_cons #n #code
                       (hd:td)
                       (tl:list td)
                       (args:list arg)
                       (pre:vale_pre_tl n (hd::tl))
                       (post:vale_post_tl n (hd::tl))
                       (v:vale_sig_tl args code pre post)
    : x:td_as_type hd
    -> vale_sig_tl ((|hd, x|)::args) code (elim_1 pre x) (elim_1 post x)
    = v

[@__reduce__]
let vale_sig #n (#dom:list td)
             (pre:vale_pre n dom)
             (post:vale_post n dom)
  : Type =
    code:V.va_code ->
    win:bool ->
    vale_sig_tl
      []
      code
      (pre code)
      (post code)