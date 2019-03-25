module GCMencryptOpt_stdcalls

open X64.CPU_Features_s
open FStar.HyperStack.ST
module B = LowStar.Buffer
module HS = FStar.HyperStack
module DV = LowStar.BufferView.Down
module UV = LowStar.BufferView.Up
open Vale.AsLowStar.MemoryHelpers
open FStar.Mul
open Words_s
open Words.Seq_s
open Types_s
open GCM_helpers
open AES_s
open GCM_s
open GHash_s
open GCTR_s
open GCTR
open Interop.Base

let uint8_p = B.buffer UInt8.t
let uint64 = UInt64.t

let disjoint_or_eq (b1 b2:uint8_p) = B.disjoint b1 b2 \/ b1 == b2

let length_aux (b:uint8_p) : Lemma
  (requires B.length b = 176)
  (ensures DV.length (get_downview b) % 16 = 0) = 
    let db = get_downview b in
    DV.length_eq db

let length_aux2 (b:uint8_p) : Lemma
  (requires B.length b = 240)
  (ensures DV.length (get_downview b) % 16 = 0) = 
    let db = get_downview b in
    DV.length_eq db

let length_aux3 (b:uint8_p) (n:nat) : Lemma
  (requires B.length b = 16 * n)
  (ensures DV.length (get_downview b) % 16 = 0) =
    let db = get_downview b in
    DV.length_eq db;
    FStar.Math.Lemmas.cancel_mul_mod n 16

let length_aux4 (b:uint8_p) : Lemma
  (requires B.length b = 16)
  (ensures DV.length (get_downview b) % 16 = 0) =
    let db = get_downview b in
    DV.length_eq db

let length_aux5 (b:uint8_p) : Lemma
  (requires B.length b = 160)
  (ensures DV.length (get_downview b) % 16 = 0) =
    let db = get_downview b in
    DV.length_eq db

inline_for_extraction
val gcm128_encrypt_opt_stdcall:
  key:Ghost.erased (Seq.seq nat32) ->
  plain_b:uint8_p ->
  plain_len:uint64 ->
  auth_b:uint8_p ->
  auth_len:uint64 ->
  iv_b:uint8_p ->
  out_b:uint8_p ->
  tag_b:uint8_p ->
  keys_b:uint8_p ->
  hkeys_b:uint8_p ->

  Stack unit
    (requires fun h0 ->
      B.disjoint tag_b out_b /\ B.disjoint tag_b hkeys_b /\
      disjoint_or_eq tag_b plain_b /\ disjoint_or_eq iv_b auth_b /\
      disjoint_or_eq tag_b iv_b /\ disjoint_or_eq tag_b keys_b /\

      B.disjoint iv_b keys_b /\ B.disjoint iv_b out_b /\
      B.disjoint iv_b plain_b /\ B.disjoint iv_b hkeys_b /\
      disjoint_or_eq iv_b auth_b /\

      B.disjoint out_b keys_b /\ B.disjoint out_b hkeys_b /\
      disjoint_or_eq out_b auth_b /\ disjoint_or_eq out_b plain_b /\
      
      B.disjoint plain_b keys_b /\ B.disjoint plain_b hkeys_b /\
      disjoint_or_eq plain_b auth_b /\

      disjoint_or_eq keys_b hkeys_b /\ disjoint_or_eq keys_b auth_b /\
      disjoint_or_eq hkeys_b auth_b /\

      B.live h0 auth_b /\ B.live h0 keys_b /\
      B.live h0 iv_b /\ B.live h0 hkeys_b /\
      B.live h0 out_b /\ B.live h0 plain_b /\
      B.live h0 tag_b /\

      B.length auth_b = UInt64.v auth_len /\
      B.length iv_b = 16 /\
      B.length plain_b = UInt64.v plain_len /\
      B.length hkeys_b = 160 /\
      B.length tag_b == 16 /\
      B.length keys_b = 176 /\

      4096 * (UInt64.v plain_len) < pow2_32 /\
      4096 * (UInt64.v auth_len) < pow2_32 /\

      aesni_enabled /\ pclmulqdq_enabled /\
      is_aes_key_LE AES_128 (Ghost.reveal key) /\
      (let db = get_downview keys_b in
      length_aux keys_b;
      let ub = UV.mk_buffer db Views.up_view128 in
      Seq.equal (UV.as_seq h0 ub) (key_to_round_keys_LE AES_128 (Ghost.reveal key)))
    )
    (ensures fun h0 _ h1 -> True
    )