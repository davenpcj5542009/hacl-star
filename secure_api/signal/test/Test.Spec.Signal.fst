module Test.Spec.Signal

open Lib.IntTypes
open Lib.RawIntTypes
open Lib.ByteSequence
open Lib.Sequence


///
/// Test for ratchet
///

let t0_input_ourEphemeralPrivKey : lbytes 32 =
  let l = [
    0x08; 0x2e; 0x63; 0x91; 0xde; 0xb7; 0x15; 0x4b;
    0xd0; 0x37; 0x5d; 0xf3; 0xfc; 0x07; 0xf8; 0x70;
    0x20; 0xa3; 0xb0; 0xfd; 0x7a; 0x8c; 0x6c; 0x90;
    0xe7; 0x3f; 0x0e; 0x05; 0x4b; 0xc2; 0xbf; 0x5d
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t0_input_theirEphemeralPubKey : lbytes 33 =
  let l = [
    0x05; 0xa9; 0xec; 0xf6; 0x66; 0xec; 0x55; 0xfc;
    0x27; 0x98; 0x8e; 0xcc; 0x41; 0x7d; 0xb0; 0xd6;
    0x2d; 0xd5; 0xe1; 0xfa; 0x75; 0x1d; 0xa1; 0xf7;
    0xa2; 0xdd; 0x2e; 0xca; 0x0d; 0x14; 0xc8; 0xbd;
    0x46
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t0_input_rootKey : lbytes 32 =
  let l = [
    0x99; 0xca; 0x9f; 0xe1; 0xd0; 0x94; 0x6f; 0x20;
    0x61; 0xad; 0xca; 0x39; 0x4c; 0x2e; 0x57; 0x4f;
    0xb3; 0xb5; 0x25; 0xe2; 0xee; 0x1b; 0x9f; 0x94;
    0x69; 0x1f; 0xd1; 0xee; 0x75; 0xa3; 0x77; 0x01
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t0_output_rootKey : lbytes 32 =
  let l = [
    0xfa; 0x60; 0xbc; 0x6d; 0x0d; 0xf9; 0x0c; 0xf1;
    0x52; 0x2d; 0xad; 0x25; 0x6d; 0x0e; 0x82; 0xe6;
    0xca; 0x6d; 0x21; 0xb2; 0x6f; 0xe1; 0x42; 0x82;
    0x02; 0x19; 0x10; 0xcb; 0xbe; 0x88; 0x31; 0x4d
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t0_output_chainKey : lbytes 32 =
  let l = [
    0xd2; 0x1b; 0xde; 0xb5; 0x79; 0xfa; 0x98; 0x2e;
    0x9a; 0xa9; 0xc8; 0x34; 0x5b; 0x57; 0xd4; 0x5d;
    0xdb; 0x68; 0x80; 0xec; 0xe0; 0xa7; 0xd9; 0xd1;
    0x72; 0xe7; 0x51; 0x06; 0x2d; 0xb6; 0x92; 0x96
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

///
/// Test for initiate
///


let t1_input_ourIdentityPrivKey : lbytes 32 =
  let l = [
    0xd8; 0x3d; 0x81; 0x41; 0xaa; 0xd5; 0xf1; 0xd6;
    0x2d; 0x78; 0xa1; 0xaf; 0x09; 0xff; 0xbe; 0x61;
    0xf2; 0xd3; 0x45; 0x8e; 0xeb; 0x88; 0x7a; 0x04;
    0x7a; 0x58; 0xa0; 0x75; 0x65; 0xd2; 0x44; 0x63
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t1_input_basePrivKey : lbytes 32 =
  let l = [
    0x20; 0x60; 0xfe; 0x31; 0xb0; 0x41; 0xd2; 0x81;
    0x27; 0xac; 0x35; 0xcb; 0xfe; 0x79; 0x0e; 0x2a;
    0x25; 0xf9; 0x2d; 0x2e; 0x21; 0xeb; 0x22; 0x51;
    0x69; 0x0a; 0xe7; 0x5e; 0x73; 0x2f; 0x5c; 0x4d
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t1_input_ourOneTimePrivKey : lbytes 32 =
  let l = [
    0x08; 0x2e; 0x63; 0x91; 0xde; 0xb7; 0x15; 0x4b;
    0xd0; 0x37; 0x5d; 0xf3; 0xfc; 0x07; 0xf8; 0x70;
    0x20; 0xa3; 0xb0; 0xfd; 0x7a; 0x8c; 0x6c; 0x90;
    0xe7; 0x3f; 0x0e; 0x05; 0x4b; 0xc2; 0xbf; 0x5d
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t1_input_theirIdentityPubKey : lbytes 33 =
  let l = [
    0x05; 0x9c; 0x21; 0x97; 0xbe; 0x51; 0xba; 0xe7;
    0x03; 0xae; 0x2e; 0xdd; 0x26; 0xb6; 0xff; 0x2b;
    0x03; 0xd5; 0x89; 0xef; 0x48; 0x51; 0xbe; 0x33;
    0xa3; 0xf8; 0xd9; 0x23; 0xad; 0x86; 0xa6; 0xb4;
    0x39
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t1_input_theirSignedPubKey : lbytes 33 =
  let l = [
    0x05; 0xa9; 0xec; 0xf6; 0x66; 0xec; 0x55; 0xfc;
    0x27; 0x98; 0x8e; 0xcc; 0x41; 0x7d; 0xb0; 0xd6;
    0x2d; 0xd5; 0xe1; 0xfa; 0x75; 0x1d; 0xa1; 0xf7;
    0xa2; 0xdd; 0x2e; 0xca; 0x0d; 0x14; 0xc8; 0xbd;
    0x46
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t1_input_theirOneTimePubKey : lbytes 33 =
  let l = [
    0x05; 0x2c; 0xd5; 0x00; 0x4a; 0x4c; 0x31; 0xdd;
    0x7b; 0x89; 0xb7; 0xfc; 0x80; 0xcc; 0x3e; 0x62;
    0xab; 0xcf; 0x9c; 0xf1; 0xaf; 0x01; 0x4c; 0x93;
    0xec; 0x45; 0x89; 0xf7; 0xca; 0x3e; 0x79; 0xe6;
    0x5c
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t1_output_rootKey : lbytes 32 =
  let l = [
    0xfa; 0x60; 0xbc; 0x6d; 0x0d; 0xf9; 0x0c; 0xf1;
    0x52; 0x2d; 0xad; 0x25; 0x6d; 0x0e; 0x82; 0xe6;
    0xca; 0x6d; 0x21; 0xb2; 0x6f; 0xe1; 0x42; 0x82;
    0x02; 0x19; 0x10; 0xcb; 0xbe; 0x88; 0x31; 0x4d
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t1_output_chainKey : lbytes 32 =
  let l = [
    0xd2; 0x1b; 0xde; 0xb5; 0x79; 0xfa; 0x98; 0x2e;
    0x9a; 0xa9; 0xc8; 0x34; 0x5b; 0x57; 0xd4; 0x5d;
    0xdb; 0x68; 0x80; 0xec; 0xe0; 0xa7; 0xd9; 0xd1;
    0x72; 0xe7; 0x51; 0x06; 0x2d; 0xb6; 0x92; 0x96
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t2_input_ourIdentityPrivKey : lbytes 32 =
  let l = [
    0x58; 0xc9; 0xfb; 0x2e; 0xc2; 0xc6; 0xb1; 0x3e;
    0x27; 0x9e; 0x7d; 0xb5; 0x7c; 0xe8; 0x37; 0xc0;
    0x2a; 0xac; 0x15; 0x31; 0x50; 0x4f; 0x71; 0x13;
    0x0d; 0x16; 0x7c; 0xc8; 0xfb; 0x25; 0xa8; 0x57
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t2_input_ourSignedPrivKey : lbytes 32 =
  let l = [
    0x88; 0x8b; 0x3f; 0x14; 0xaf; 0xf8; 0x0e; 0x36;
    0xbb; 0x2d; 0x2c; 0xc2; 0x6a; 0x72; 0xda; 0x2e;
    0x1a; 0x99; 0x33; 0x09; 0x62; 0xf5; 0x06; 0x6c;
    0x7c; 0x1d; 0xde; 0xd1; 0x26; 0x2c; 0xa6; 0x65
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t2_input_ourEphemeralPrivKey : lbytes 32 =
  let l = [
    0x88; 0xd9; 0xa1; 0x2e; 0x7b; 0x03; 0xaf; 0xda;
    0xc4; 0x2e; 0x49; 0xec; 0x9d; 0x4e; 0x54; 0x88;
    0xe1; 0xb1; 0xe6; 0xd4; 0x8c; 0x6e; 0xef; 0x60;
    0x29; 0xe4; 0x5d; 0xec; 0x09; 0xa9; 0xd5; 0x62
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t2_input_theirIdentityPubKey : lbytes 33 =
  let l = [
    0x05; 0x0a; 0x6c; 0xf5; 0xe0; 0x75; 0xc9; 0x97;
    0x0f; 0x14; 0x86; 0x2d; 0xb8; 0xa7; 0x03; 0xa6;
    0xc7; 0x61; 0xf5; 0x0b; 0x51; 0x82; 0xd1; 0x78;
    0x74; 0x90; 0x89; 0x40; 0x55; 0x6a; 0x22; 0x37;
    0x22
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t2_input_theirOneTimePubKey : lbytes 33 =
  let l = [
    0x05; 0x8a; 0x49; 0xfa; 0x8a; 0x94; 0x22; 0x4a;
    0xaa; 0x8f; 0x58; 0x73; 0x40; 0x4e; 0x01; 0x71;
    0x0f; 0xf9; 0xef; 0x02; 0x16; 0x9a; 0x75; 0xf9;
    0x0a; 0xf4; 0xfb; 0xbc; 0x60; 0x07; 0x96; 0xe0;
    0x52
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t2_output_rootKey : lbytes 32 =
  let l = [
    0x99; 0xca; 0x9f; 0xe1; 0xd0; 0x94; 0x6f; 0x20;
    0x61; 0xad; 0xca; 0x39; 0x4c; 0x2e; 0x57; 0x4f;
    0xb3; 0xb5; 0x25; 0xe2; 0xee; 0x1b; 0x9f; 0x94;
    0x69; 0x1f; 0xd1; 0xee; 0x75; 0xa3; 0x77; 0x01
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t3_input_ourIdentityPubKey : lbytes 33 =
  let l = [
    0x05; 0x0a; 0x6c; 0xf5; 0xe0; 0x75; 0xc9; 0x97;
    0x0f; 0x14; 0x86; 0x2d; 0xb8; 0xa7; 0x03; 0xa6;
    0xc7; 0x61; 0xf5; 0x0b; 0x51; 0x82; 0xd1; 0x78;
    0x74; 0x90; 0x89; 0x40; 0x55; 0x6a; 0x22; 0x37;
    0x22
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t3_input_theirIdentityPubKey : lbytes 33 =
  let l = [
    0x05; 0x9c; 0x21; 0x97; 0xbe; 0x51; 0xba; 0xe7;
    0x03; 0xae; 0x2e; 0xdd; 0x26; 0xb6; 0xff; 0x2b;
    0x03; 0xd5; 0x89; 0xef; 0x48; 0x51; 0xbe; 0x33;
    0xa3; 0xf8; 0xd9; 0x23; 0xad; 0x86; 0xa6; 0xb4;
    0x39
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t3_input_msgKey : lbytes 32 =
  let l = [
    0x8f; 0xa1; 0xfd; 0xa3; 0xae; 0x1d; 0x8a; 0x50;
    0x1b; 0x28; 0xdc; 0x11; 0xdf; 0xcb; 0xb4; 0x81;
    0x90; 0xbd; 0xd7; 0x5c; 0x1d; 0x8d; 0xa9; 0x5d;
    0xd7; 0xec; 0xbe; 0xa3; 0x16; 0xa3; 0x58; 0x1c
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t3_input_ourEphemeralPubKey: lbytes 33 =
  let l = [
    0x05; 0x88; 0x3a; 0xb5; 0x8b; 0x3e; 0xb6; 0xdb;
    0x93; 0xb3; 0x2b; 0xf9; 0x18; 0x99; 0xa5; 0xb5;
    0x17; 0x5e; 0x7b; 0x21; 0xe9; 0x6f; 0xff; 0x2c;
    0xec; 0x02; 0xc8; 0x3d; 0xff; 0x16; 0xba; 0x1b;
    0x27
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t3_input_previousCounter : size_nat = 0

let t3_input_counter : size_nat = 0

let t3_input_msg: lbytes 159 =
  let l = [
    0x0a; 0x01; 0x41; 0x80; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00
  ] in
  assert_norm(List.Tot.length l == 159);
  of_list (List.Tot.map u8 l)

let t3_output_result: lbytes 211 =
  let l = [
    0x33; 0x0a; 0x21; 0x05; 0x88; 0x3a; 0xb5; 0x8b;
    0x3e; 0xb6; 0xdb; 0x93; 0xb3; 0x2b; 0xf9; 0x18;
    0x99; 0xa5; 0xb5; 0x17; 0x5e; 0x7b; 0x21; 0xe9;
    0x6f; 0xff; 0x2c; 0xec; 0x02; 0xc8; 0x3d; 0xff;
    0x16; 0xba; 0x1b; 0x27; 0x10; 0x00; 0x18; 0x00;
    0x22; 0xa0; 0x01; 0x3c; 0x5d; 0x07; 0x0d; 0x1b;
    0x75; 0xc4; 0x18; 0xce; 0xf7; 0x69; 0xbd; 0x73;
    0x78; 0xa5; 0x89; 0x69; 0x53; 0x7a; 0x00; 0xe0;
    0xff; 0x60; 0xcb; 0xb9; 0x9d; 0xef; 0xb4; 0x86;
    0xfc; 0xfb; 0x43; 0x38; 0x42; 0x64; 0xda; 0x4e;
    0xa9; 0x82; 0x1c; 0x13; 0x36; 0xf0; 0x2d; 0x98;
    0x8d; 0xa3; 0x89; 0x44; 0x45; 0x33; 0x31; 0xc4;
    0xb3; 0x01; 0x81; 0x70; 0x4c; 0xbc; 0xec; 0x5a;
    0x79; 0x2a; 0xb8; 0x7c; 0x5c; 0xcf; 0xf2; 0x56;
    0xe0; 0xb4; 0xd6; 0x1b; 0xa6; 0xa3; 0x0a; 0x69;
    0x64; 0x78; 0x38; 0x75; 0x01; 0x88; 0x82; 0xe6;
    0x6b; 0xfb; 0xd9; 0x44; 0x5a; 0xc4; 0x4f; 0xee;
    0x9d; 0xc6; 0x7e; 0xdc; 0x2a; 0xd9; 0xde; 0x78;
    0xad; 0xbe; 0x0e; 0xb7; 0xe9; 0xcb; 0x99; 0x02;
    0x72; 0x18; 0x3c; 0xe5; 0xfa; 0xc6; 0x82; 0xee;
    0x51; 0x06; 0xf6; 0x7d; 0x73; 0x2c; 0xd1; 0x6d;
    0xfb; 0x73; 0x12; 0x39; 0x59; 0x0b; 0xa6; 0x7d;
    0xc8; 0x27; 0xe8; 0x49; 0xc4; 0x9a; 0x9f; 0xb5;
    0xed; 0x8e; 0xed; 0x41; 0xd8; 0x5d; 0x5e; 0x6d;
    0xe3; 0x29; 0x4e; 0x74; 0xf3; 0x52; 0x4c; 0x64;
    0x89; 0xc2; 0xf2; 0x54; 0x82; 0xff; 0x52; 0xf9;
    0xea; 0x29; 0xc9
  ] in
  assert_norm(List.Tot.length l == 211);
  of_list (List.Tot.map u8 l)

let t3_output_chainKey : lbytes 32 =
  let l = [
    0x71; 0x78; 0xf4; 0x1a; 0x63; 0x34; 0xb5; 0xe2;
    0xf6; 0x9f; 0x81; 0x13; 0xd8; 0x70; 0x31; 0x3e;
    0x27; 0x81; 0xa7; 0x2b; 0x89; 0x81; 0x6b; 0xa2;
    0x67; 0xa2; 0xc5; 0x5f; 0x20; 0x5d; 0xbc; 0x50
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t4_input_ourIdentityPubKey : lbytes 33 =
  let l = [
    0x05; 0x0a; 0x6c; 0xf5; 0xe0; 0x75; 0xc9; 0x97;
    0x0f; 0x14; 0x86; 0x2d; 0xb8; 0xa7; 0x03; 0xa6;
    0xc7; 0x61; 0xf5; 0x0b; 0x51; 0x82; 0xd1; 0x78;
    0x74; 0x90; 0x89; 0x40; 0x55; 0x6a; 0x22; 0x37;
    0x22
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t4_input_theirIdentityPubKey : lbytes 33 =
  let l = [
    0x05; 0x9c; 0x21; 0x97; 0xbe; 0x51; 0xba; 0xe7;
    0x03; 0xae; 0x2e; 0xdd; 0x26; 0xb6; 0xff; 0x2b;
    0x03; 0xd5; 0x89; 0xef; 0x48; 0x51; 0xbe; 0x33;
    0xa3; 0xf8; 0xd9; 0x23; 0xad; 0x86; 0xa6; 0xb4;
    0x39
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t4_input_msgKey : lbytes 32 =
  let l = [
    0xe1; 0x09; 0x15; 0x98; 0x39; 0xd7; 0x3c; 0x7a;
    0xc0; 0x28; 0x25; 0xdd; 0xf1; 0x0d; 0x0b; 0x75;
    0x4f; 0x03; 0xdf; 0x8e; 0x67; 0x42; 0x3f; 0x21;
    0x1f; 0x7b; 0xa2; 0x17; 0x50; 0x73; 0xdc; 0x83
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t4_input_ourEphemeralPubKey : lbytes 33 =
  let l = [
    0x05; 0x88; 0x3a; 0xb5; 0x8b; 0x3e; 0xb6; 0xdb;
    0x93; 0xb3; 0x2b; 0xf9; 0x18; 0x99; 0xa5; 0xb5;
    0x17; 0x5e; 0x7b; 0x21; 0xe9; 0x6f; 0xff; 0x2c;
    0xec; 0x02; 0xc8; 0x3d; 0xff; 0x16; 0xba; 0x1b;
    0x27
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t4_input_msg : lbytes 159 =
  let l = [
    0x0a; 0x01; 0x42; 0x80; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00
  ] in
  assert_norm(List.Tot.length l == 159);
  of_list (List.Tot.map u8 l)

let t4_input_previousCounter : size_nat = 0

let t4_input_counter : size_nat = 1

let t4_output_result : lbytes 211 =
  let l = [
    0x33; 0x0a; 0x21; 0x05; 0x88; 0x3a; 0xb5; 0x8b;
    0x3e; 0xb6; 0xdb; 0x93; 0xb3; 0x2b; 0xf9; 0x18;
    0x99; 0xa5; 0xb5; 0x17; 0x5e; 0x7b; 0x21; 0xe9;
    0x6f; 0xff; 0x2c; 0xec; 0x02; 0xc8; 0x3d; 0xff;
    0x16; 0xba; 0x1b; 0x27; 0x10; 0x01; 0x18; 0x00;
    0x22; 0xa0; 0x01; 0x25; 0x6a; 0xae; 0x85; 0xba;
    0xbf; 0x8c; 0x08; 0x08; 0xf7; 0x5e; 0x08; 0xbf;
    0x10; 0xa6; 0x3f; 0x7f; 0x3a; 0xea; 0x97; 0x32;
    0x4c; 0x25; 0x83; 0xd7; 0x77; 0xf6; 0x09; 0xdf;
    0x49; 0x3d; 0x7d; 0x45; 0x23; 0x2c; 0x88; 0x83;
    0xc3; 0xe1; 0x11; 0x8f; 0xbc; 0x29; 0xb6; 0x31;
    0x8a; 0x30; 0x91; 0xae; 0x57; 0xfe; 0xd4; 0xf1;
    0xc5; 0x44; 0x58; 0xc6; 0xbb; 0x83; 0x2f; 0xbb;
    0x35; 0xf2; 0x49; 0x33; 0xcb; 0x79; 0x76; 0x5d;
    0x00; 0xf4; 0xa1; 0x61; 0xe2; 0x87; 0x7a; 0x5a;
    0x21; 0xa2; 0x65; 0x92; 0xcd; 0xb0; 0xaa; 0x8a;
    0x2f; 0x70; 0xf5; 0xfb; 0xe8; 0xc6; 0x01; 0xec;
    0xdf; 0xf0; 0xbe; 0xf1; 0xb7; 0x33; 0xd7; 0xfd;
    0x0c; 0xb7; 0xb7; 0xd8; 0xfc; 0x1e; 0x45; 0xf7;
    0x9c; 0x01; 0x6c; 0x8f; 0x90; 0x44; 0x92; 0x39;
    0xca; 0x1a; 0x04; 0xb3; 0x74; 0x53; 0x8f; 0x27;
    0x60; 0xee; 0xf4; 0x31; 0x27; 0xdd; 0xc9; 0xa6;
    0x43; 0x9c; 0x6c; 0xec; 0xa5; 0xfa; 0xf5; 0x96;
    0x2f; 0xb2; 0x6d; 0x72; 0x48; 0x25; 0x7d; 0x4d;
    0x5e; 0xe3; 0xfe; 0x4c; 0xf8; 0x79; 0x5a; 0xcc;
    0x55; 0x57; 0x18; 0x55; 0x8e; 0x53; 0x17; 0xf6;
    0x18; 0x82; 0x83
  ] in
  assert_norm(List.Tot.length l == 211);
  of_list (List.Tot.map u8 l)

let t4_output_chainKey : lbytes 32 =
  let l = [
    0x30; 0x25; 0xbc; 0x12; 0xa6; 0xa3; 0x22; 0xfd;
    0x6d; 0xd2; 0x25; 0x4a; 0xb9; 0xaa; 0x8d; 0xc0;
    0x5d; 0x07; 0xda; 0x9a; 0x67; 0x8f; 0x06; 0xb5;
    0x9a; 0xce; 0xad; 0x5b; 0x52; 0xf9; 0x87; 0x94
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t5_input_ourIdentityPubKey : lbytes 33 =
  let l = [
    0x05; 0x0a; 0x6c; 0xf5; 0xe0; 0x75; 0xc9; 0x97;
    0x0f; 0x14; 0x86; 0x2d; 0xb8; 0xa7; 0x03; 0xa6;
    0xc7; 0x61; 0xf5; 0x0b; 0x51; 0x82; 0xd1; 0x78;
    0x74; 0x90; 0x89; 0x40; 0x55; 0x6a; 0x22; 0x37;
    0x22
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t5_input_theirIdentityPubKey : lbytes 33 =
  let l = [
    0x05; 0x9c; 0x21; 0x97; 0xbe; 0x51; 0xba; 0xe7;
    0x03; 0xae; 0x2e; 0xdd; 0x26; 0xb6; 0xff; 0x2b;
    0x03; 0xd5; 0x89; 0xef; 0x48; 0x51; 0xbe; 0x33;
    0xa3; 0xf8; 0xd9; 0x23; 0xad; 0x86; 0xa6; 0xb4;
    0x39
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t5_input_remoteEphemeralKey : lbytes 33 =
  let l = [
    0x05; 0xbc; 0x81; 0xf1; 0x34; 0x8a; 0x1d; 0x06;
    0x5b; 0x2b; 0xd2; 0x77; 0x6e; 0xdb; 0x9f; 0x29;
    0xbc; 0x41; 0x50; 0x39; 0x9d; 0xb3; 0x5c; 0x1d;
    0x87; 0xdc; 0x25; 0x8b; 0x94; 0x89; 0x4b; 0xc5;
    0x7a
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t5_input_chainKey : lbytes 32 =
  let l = [
    0x0e; 0x3f; 0x0e; 0xdf; 0xe6; 0x3c; 0xbc; 0xb6;
    0x84; 0xec; 0xfa; 0xce; 0x7b; 0x29; 0x34; 0xd2;
    0x01; 0x4f; 0xf7; 0x7c; 0xd3; 0x3c; 0x75; 0x67;
    0xb7; 0x91; 0x8a; 0x91; 0xd0; 0x5a; 0x7a; 0x2d
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t5_input_counter : size_nat = 0

let t5_input_previousCounter : size_nat = 0

let t5_input_ciphertext : lbytes 160 =
  let l = [
    0xc9; 0x3a; 0xf1; 0x10; 0x76; 0x34; 0xd9; 0xea;
    0xa1; 0x51; 0x6a; 0x4f; 0x8e; 0x95; 0xc6; 0xa4;
    0x54; 0xc2; 0x73; 0x13; 0xb3; 0x88; 0x30; 0x70;
    0x9e; 0xb8; 0x63; 0x60; 0x8f; 0x08; 0xf2; 0xf3;
    0xa5; 0x98; 0xff; 0x8f; 0x55; 0x86; 0x45; 0x42;
    0x7f; 0x7b; 0x6e; 0xa8; 0xe1; 0x82; 0xe4; 0x0f;
    0x7b; 0x4a; 0x92; 0xce; 0x03; 0x25; 0xf2; 0xe2;
    0x2f; 0x76; 0xf3; 0x6f; 0x69; 0x54; 0xf6; 0xf3;
    0x91; 0xdd; 0x21; 0xd2; 0xca; 0xd1; 0x2e; 0x5b;
    0x62; 0x0e; 0x75; 0xb9; 0x91; 0xe6; 0x9d; 0xf8;
    0x82; 0x1a; 0xb0; 0xe8; 0x26; 0xe3; 0xcb; 0x2a;
    0xe1; 0xc7; 0xa1; 0xfb; 0x8e; 0xd7; 0x22; 0x13;
    0xe3; 0x6f; 0xc5; 0x08; 0xca; 0x1f; 0x0a; 0x92;
    0xeb; 0xe2; 0x08; 0x95; 0x35; 0xb5; 0xd5; 0xe1;
    0xb3; 0x4e; 0xae; 0x5f; 0x91; 0x49; 0x7b; 0xd0;
    0x72; 0xde; 0x47; 0xde; 0x32; 0x91; 0xba; 0x78;
    0xa6; 0xfd; 0x67; 0xd3; 0xf8; 0xf3; 0xf2; 0x0d;
    0x04; 0xab; 0x3a; 0x11; 0x59; 0xdf; 0x8f; 0x36;
    0xef; 0x7e; 0x46; 0x96; 0x84; 0x7e; 0x32; 0xce;
    0x6b; 0xe0; 0x7e; 0xdb; 0x93; 0x76; 0x3a; 0x22
  ] in
  assert_norm(List.Tot.length l == 202);
  of_list (List.Tot.map u8 l)

let t5_input_macTag : lbytes 8 =
  let l = [
    0x26; 0xc8; 0x7f; 0xef; 0xf8; 0xcc; 0x48; 0x27
  ] in
  assert_norm(List.Tot.length l == 8);
  of_list (List.Tot.map u8 l)

let t5_output_plaintext : lbytes 159 =
  let l = [
    0x0a; 0x01; 0x43; 0x80; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00
  ] in
  assert_norm(List.Tot.length l == 159);
  of_list (List.Tot.map u8 l)

let t6_input_ourIdentityPubKey : lbytes 33 =
  let l = [
    0x05; 0x9c; 0x21; 0x97; 0xbe; 0x51; 0xba; 0xe7;
    0x03; 0xae; 0x2e; 0xdd; 0x26; 0xb6; 0xff; 0x2b;
    0x03; 0xd5; 0x89; 0xef; 0x48; 0x51; 0xbe; 0x33;
    0xa3; 0xf8; 0xd9; 0x23; 0xad; 0x86; 0xa6; 0xb4;
    0x39
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t6_input_theirIdentityPubKey : lbytes 33 =
  let l = [
    0x05; 0x0a; 0x6c; 0xf5; 0xe0; 0x75; 0xc9; 0x97;
    0x0f; 0x14; 0x86; 0x2d; 0xb8; 0xa7; 0x03; 0xa6;
    0xc7; 0x61; 0xf5; 0x0b; 0x51; 0x82; 0xd1; 0x78;
    0x74; 0x90; 0x89; 0x40; 0x55; 0x6a; 0x22; 0x37;
    0x22
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t6_input_remoteEphemeralKey : lbytes 33 =
  let l = [
    0x05; 0x88; 0x3a; 0xb5; 0x8b; 0x3e; 0xb6; 0xdb;
    0x93; 0xb3; 0x2b; 0xf9; 0x18; 0x99; 0xa5; 0xb5;
    0x17; 0x5e; 0x7b; 0x21; 0xe9; 0x6f; 0xff; 0x2c;
    0xec; 0x02; 0xc8; 0x3d; 0xff; 0x16; 0xba; 0x1b;
    0x27
  ] in
  assert_norm(List.Tot.length l == 33);
  of_list (List.Tot.map u8 l)

let t6_input_chainKey : lbytes 32 =
  let l = [
    0x30; 0x25; 0xbc; 0x12; 0xa6; 0xa3; 0x22; 0xfd;
    0x6d; 0xd2; 0x25; 0x4a; 0xb9; 0xaa; 0x8d; 0xc0;
    0x5d; 0x07; 0xda; 0x9a; 0x67; 0x8f; 0x06; 0xb5;
    0x9a; 0xce; 0xad; 0x5b; 0x52; 0xf9; 0x87; 0x94
  ] in
  assert_norm(List.Tot.length l == 32);
  of_list (List.Tot.map u8 l)

let t6_input_counter : size_nat = 1

let t6_input_previousCounter : size_nat = 0

let t6_input_ciphertext : lbytes 160 =
  let l = [
    0x25; 0x6a; 0xae; 0x85; 0xba; 0xbf; 0x8c; 0x08;
    0x08; 0xf7; 0x5e; 0x08; 0xbf; 0x10; 0xa6; 0x3f;
    0x7f; 0x3a; 0xea; 0x97; 0x32; 0x4c; 0x25; 0x83;
    0xd7; 0x77; 0xf6; 0x09; 0xdf; 0x49; 0x3d; 0x7d;
    0x45; 0x23; 0x2c; 0x88; 0x83; 0xc3; 0xe1; 0x11;
    0x8f; 0xbc; 0x29; 0xb6; 0x31; 0x8a; 0x30; 0x91;
    0xae; 0x57; 0xfe; 0xd4; 0xf1; 0xc5; 0x44; 0x58;
    0xc6; 0xbb; 0x83; 0x2f; 0xbb; 0x35; 0xf2; 0x49;
    0x33; 0xcb; 0x79; 0x76; 0x5d; 0x00; 0xf4; 0xa1;
    0x61; 0xe2; 0x87; 0x7a; 0x5a; 0x21; 0xa2; 0x65;
    0x92; 0xcd; 0xb0; 0xaa; 0x8a; 0x2f; 0x70; 0xf5;
    0xfb; 0xe8; 0xc6; 0x01; 0xec; 0xdf; 0xf0; 0xbe;
    0xf1; 0xb7; 0x33; 0xd7; 0xfd; 0x0c; 0xb7; 0xb7;
    0xd8; 0xfc; 0x1e; 0x45; 0xf7; 0x9c; 0x01; 0x6c;
    0x8f; 0x90; 0x44; 0x92; 0x39; 0xca; 0x1a; 0x04;
    0xb3; 0x74; 0x53; 0x8f; 0x27; 0x60; 0xee; 0xf4;
    0x31; 0x27; 0xdd; 0xc9; 0xa6; 0x43; 0x9c; 0x6c;
    0xec; 0xa5; 0xfa; 0xf5; 0x96; 0x2f; 0xb2; 0x6d;
    0x72; 0x48; 0x25; 0x7d; 0x4d; 0x5e; 0xe3; 0xfe;
    0x4c; 0xf8; 0x79; 0x5a; 0xcc; 0x55; 0x57; 0x18
  ] in
  assert_norm(List.Tot.length l == 202);
  of_list (List.Tot.map u8 l)

let t6_input_macTag : lbytes 8 =
  let l = [
    0x55; 0x8e; 0x53; 0x17; 0xf6; 0x18; 0x82; 0x83
  ] in
  assert_norm(List.Tot.length l == 8);
  of_list (List.Tot.map u8 l)

let t6_output_plaintext : lbytes 159 =
  let l = [
    0x0a; 0x01; 0x42; 0x80; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00;
    0x00; 0x00; 0x00; 0x00; 0x00; 0x00; 0x00
  ] in
  assert_norm(List.Tot.length l == 159);
  of_list (List.Tot.map u8 l)


let test_compare_buffers (msg:string) (expected:seq uint8) (computed:seq uint8) : All.ML bool =
  IO.print_string "\n";
  IO.print_string msg;
  IO.print_string "\nexpected (";
  IO.print_uint32_dec (UInt32.uint_to_t (length expected));
  IO.print_string "):\n";
  FStar.List.iter (fun a -> IO.print_uint8_hex_pad (u8_to_UInt8 a)) (to_list expected);
  IO.print_string "\n";
  IO.print_string "computed (";
  IO.print_uint32_dec (UInt32.uint_to_t (length computed));
  IO.print_string "):\n";
  FStar.List.iter (fun a -> IO.print_uint8_hex_pad (u8_to_UInt8 a)) (to_list computed);
  IO.print_string "\n";
  let result =
    for_all2 #uint8 #uint8 #(length computed) (fun x y -> uint_to_nat #U8 x = uint_to_nat #U8 y)
      computed expected
  in
  if result then IO.print_string "\nSuccess !\n"
  else IO.print_string "\nFailed !\n";
  result


let test () =
  IO.print_string "\n\nTEST 0: (Spec.Signal.Core.ratchet)";
  let t0_computed_rootKey, t0_computed_chainKey =
    Spec.Signal.Core.ratchet t0_input_rootKey t0_input_ourEphemeralPrivKey t0_input_theirEphemeralPubKey in
  let result0a = test_compare_buffers "0a. rootKey" t0_output_rootKey t0_computed_rootKey in
  let result0b = test_compare_buffers "0b. chainKey" t0_output_chainKey t0_computed_chainKey in


  IO.print_string "\n\nTEST 1: (Spec.Signal.Core.initiate)";
  let t1_computed_rootKey, t1_computed_chainKey =
    Spec.Signal.Core.initiate' t1_input_ourIdentityPrivKey
			       t1_input_basePrivKey
                               t1_input_ourOneTimePrivKey
                               t1_input_theirIdentityPubKey
                               t1_input_theirSignedPubKey
                               (Some t1_input_theirOneTimePubKey) in

  let result1a = test_compare_buffers "1a. rootKey" t1_output_rootKey t1_computed_rootKey in
  let result1b = test_compare_buffers "1b. chainKey" t1_output_chainKey t1_computed_chainKey in

  IO.print_string "\n\nTEST 2: (Spec.Signal.Core.respond)";
  let t2_computed_rootKey =
    Spec.Signal.Core.respond t2_input_ourIdentityPrivKey
			     t2_input_ourSignedPrivKey
			     (Some t2_input_ourEphemeralPrivKey)
			     t2_input_theirIdentityPubKey
			     t2_input_theirOneTimePubKey in

  let result2 = test_compare_buffers "2. rootKey" t2_output_rootKey t2_computed_rootKey in


  IO.print_string "\n\nTEST 3: (Spec.Signal.Core.encrypt)\n";
  let t3_computed_result =
    Spec.Signal.Core.encrypt
      t3_input_ourIdentityPubKey
      t3_input_theirIdentityPubKey
      t3_input_msgKey
      t3_input_ourEphemeralPubKey
      t3_input_previousCounter
      t3_input_counter
      t3_input_msg
  in

  let result3 = test_compare_buffers "3. Ciphertext" t3_output_result t3_computed_result in


  IO.print_string "\n\nTEST 4: (Spec.Signal.Core.encrypt)\n";
  let t4_computed_result =
    Spec.Signal.Core.encrypt
      t4_input_ourIdentityPubKey
      t4_input_theirIdentityPubKey
      t4_input_msgKey
      t4_input_ourEphemeralPubKey
      t4_input_previousCounter
      t4_input_counter
      t4_input_msg
  in

  let result4 = test_compare_buffers "4. Ciphertext" t4_output_result t4_computed_result in

  IO.print_string "\n\nTEST 5: (Spec.Signal.Core.decrypt)\n";
  let t5_result =
    Spec.Signal.Core.decrypt
      t5_input_ourIdentityPubKey
      t5_input_theirIdentityPubKey
      t5_input_remoteEphemeralKey
      t5_input_chainKey
      t5_input_previousCounter
      t5_input_counter
      t5_input_ciphertext
      t5_input_macTag
  in
  let result5 = match t5_result with
  | Some t5_computed_plaintext ->
    let result5a = test_compare_buffers "5a. plaintext" t5_output_plaintext t5_computed_plaintext in
    result5a
  | None -> begin
    IO.print_string "\nCould not decipher : Failed !\n"; false
  end in

  IO.print_string "\n\nTEST 6: (Spec.Signal.Core.decrypt)\n";
  let t6_result =
    Spec.Signal.Core.decrypt
      t6_input_ourIdentityPubKey
      t6_input_theirIdentityPubKey
      t6_input_remoteEphemeralKey
      t6_input_chainKey
      t6_input_previousCounter
      t6_input_counter
      t6_input_ciphertext
      t6_input_macTag
  in
  let result6 = match t6_result with
  | Some (t6_computed_plaintext) ->
    let result6a = test_compare_buffers "6a. plaintext" t6_output_plaintext t6_computed_plaintext in
    result6a
  | None -> begin
    IO.print_string "\nCould not decipher : Failed !\n"; false
  end in

  //
  // RESULT
  //
  if
    result0a && result0b && result1a && result1b && result2 && result3 &&
    result4 && result5 && result6
  then
    IO.print_string "\n\nComposite Result: Success !\n"
  else
    IO.print_string "\n\nComposite Result: Failed !\n"