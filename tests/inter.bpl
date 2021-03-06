procedure {:entrypoint} main_trace_1() returns ($r: i32);
  modifies $exn, $CurrAddr;



procedure $initialize_trace_1();
  modifies $exn, $CurrAddr;



procedure __SMACK_static_init_trace_1();
  modifies $exn;



implementation {:origRTname "__SMACK_static_init"} __SMACK_static_init_trace_1()
{

  $bb0__unique__1:
    $exn := false;
    return;
}



procedure __SMACK_init_func_memory_model_trace_1();
  modifies $CurrAddr, $exn;



implementation {:origRTname "__SMACK_init_func_memory_model"} __SMACK_init_func_memory_model_trace_1()
{

  $bb0__unique__1:
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 2223, 3} true;
    $CurrAddr := $1024.ref;
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 2228, 1} true;
    $exn := false;
    return;
}



implementation {:origRTname "$initialize"} $initialize_trace_1()
{

  anon0__unique__1:
    call corral_fix_context_0();
    call {:si_unique_call 24} __SMACK_static_init_trace_1();
    call corral_fix_context_0();
    call {:si_unique_call 25} __SMACK_init_func_memory_model_trace_1();
    return;
}



procedure __VERIFIER_nondet_ushort_trace_1() returns ($r: i16);
  modifies $exn;



procedure __VERIFIER_nondet_unsigned_short_trace_1() returns ($r: i16);
  modifies $exn;



procedure __VERIFIER_assume_trace_1(x: i32);
  modifies $exn;



implementation {:origRTname "__VERIFIER_assume"} {:ForceInline} __VERIFIER_assume_trace_1(x: i32)
{

  $bb0__unique__1:
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 713, 3} true;
    assume true;
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 34, 21} true;
    call corral_fix_context_0();
    assume x != $0;
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 35, 1} true;
    $exn := false;
    return;
}



implementation {:origRTname "__VERIFIER_nondet_unsigned_short"} {:ForceInline} __VERIFIER_nondet_unsigned_short_trace_1() returns ($r: i16)
{
  var $i0: i16;
  var $i1: i32;
  var $i2: i1;
  var $i4: i32;
  var $i5: i1;
  var $i3: i1;
  var $i6: i32;

  $bb0__unique__1:
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 108, 22} true;
    call corral_fix_context_0();
    call {:si_unique_call 0} $i0 := __SMACK_nondet_unsigned_short();
    call corral_fix_context_0();
    call {:si_unique_call 1} {:cexpr "x"} boogie_si_record_i16($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 21} true;
    call corral_fix_context_0();
    $i1 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 23} true;
    call corral_fix_context_0();
    $i2 := $sge.i32($i1, 0);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 28} true;
    call corral_fix_context_0();
    $i3 := 0;
    call corral_fix_context_0();
    assume {:branchcond $i2} true;
    goto $bb1__unique__2;

  $bb1__unique__2:
    call corral_fix_context_0();
    assume $i2 == 1;
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 31} true;
    call corral_fix_context_0();
    $i4 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 33} true;
    call corral_fix_context_0();
    $i5 := $sle.i32($i4, 65535);
    call corral_fix_context_0();
    $i3 := $i5;
    goto $bb3__unique__3;

  $bb3__unique__3:
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 28} true;
    call corral_fix_context_0();
    $i6 := $zext.i1.i32($i3);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 3} true;
    call corral_fix_context_0();
    call {:si_unique_call 2} __VERIFIER_assume_trace_1($i6);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 110, 3} true;
    call corral_fix_context_0();
    $r := $i0;
    $exn := false;
    return;
}



implementation {:origRTname "__VERIFIER_nondet_ushort"} {:ForceInline} __VERIFIER_nondet_ushort_trace_1() returns ($r: i16)
{
  var $i0: i16;

  $bb0__unique__1:
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 228, 22} true;
    call corral_fix_context_0();
    call {:si_unique_call 3} $i0 := __VERIFIER_nondet_unsigned_short_trace_1();
    call corral_fix_context_0();
    call {:si_unique_call 4} {:cexpr "x"} boogie_si_record_i16($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 229, 3} true;
    call corral_fix_context_0();
    $r := $i0;
    $exn := false;
    return;
}



procedure __VERIFIER_nondet_ushort_trace_2() returns ($r: i16);
  modifies $exn;



procedure __VERIFIER_nondet_unsigned_short_trace_2() returns ($r: i16);
  modifies $exn;



procedure __VERIFIER_assume_trace_2(x: i32);
  modifies $exn;



implementation {:origRTname "__VERIFIER_assume"} {:ForceInline} __VERIFIER_assume_trace_2(x: i32)
{

  $bb0__unique__1:
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 713, 3} true;
    assume true;
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 34, 21} true;
    call corral_fix_context_0();
    assume x != $0;
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 35, 1} true;
    $exn := false;
    return;
}



implementation {:origRTname "__VERIFIER_nondet_unsigned_short"} {:ForceInline} __VERIFIER_nondet_unsigned_short_trace_2() returns ($r: i16)
{
  var $i0: i16;
  var $i1: i32;
  var $i2: i1;
  var $i4: i32;
  var $i5: i1;
  var $i3: i1;
  var $i6: i32;

  $bb0__unique__1:
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 108, 22} true;
    call corral_fix_context_0();
    call {:si_unique_call 0} $i0 := __SMACK_nondet_unsigned_short();
    call corral_fix_context_0();
    call {:si_unique_call 1} {:cexpr "x"} boogie_si_record_i16($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 21} true;
    call corral_fix_context_0();
    $i1 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 23} true;
    call corral_fix_context_0();
    $i2 := $sge.i32($i1, 0);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 28} true;
    call corral_fix_context_0();
    $i3 := 0;
    call corral_fix_context_0();
    assume {:branchcond $i2} true;
    goto $bb1__unique__2;

  $bb1__unique__2:
    call corral_fix_context_0();
    assume $i2 == 1;
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 31} true;
    call corral_fix_context_0();
    $i4 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 33} true;
    call corral_fix_context_0();
    $i5 := $sle.i32($i4, 65535);
    call corral_fix_context_0();
    $i3 := $i5;
    goto $bb3__unique__3;

  $bb3__unique__3:
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 28} true;
    call corral_fix_context_0();
    $i6 := $zext.i1.i32($i3);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 109, 3} true;
    call corral_fix_context_0();
    call {:si_unique_call 2} __VERIFIER_assume_trace_2($i6);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 110, 3} true;
    call corral_fix_context_0();
    $r := $i0;
    $exn := false;
    return;
}



implementation {:origRTname "__VERIFIER_nondet_ushort"} {:ForceInline} __VERIFIER_nondet_ushort_trace_2() returns ($r: i16)
{
  var $i0: i16;

  $bb0__unique__1:
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 228, 22} true;
    call corral_fix_context_0();
    call {:si_unique_call 3} $i0 := __VERIFIER_nondet_unsigned_short_trace_2();
    call corral_fix_context_0();
    call {:si_unique_call 4} {:cexpr "x"} boogie_si_record_i16($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 229, 3} true;
    call corral_fix_context_0();
    $r := $i0;
    $exn := false;
    return;
}



procedure __VERIFIER_assert_trace_1(cond: i32);
  modifies $exn;



procedure __VERIFIER_error_trace_1();
  modifies $exn;



implementation {:origRTname "__VERIFIER_error"} {:ForceInline} __VERIFIER_error_trace_1()
{

  $bb0__unique__1:
    call corral_fix_context_0();
    assume {:sourceloc "/usr/local/share/smack/lib/smack.c", 47, 3} true;
    call corral_fix_context_0();
    assert false;
    return;
}



implementation {:origRTname "__VERIFIER_assert"} {:ForceInline} __VERIFIER_assert_trace_1(cond: i32)
{
  var $i0: i1;

  $bb0__unique__1:
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 5, 8} true;
    call corral_fix_context_0();
    $i0 := $ne.i32(cond, 0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 5, 7} true;
    call corral_fix_context_0();
    assume {:branchcond $i0} true;
    goto $bb3__unique__2;

  $bb3__unique__2:
    call corral_fix_context_0();
    assume !($i0 == 1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 5, 16} true;
    goto $bb4__unique__3;

  $bb4__unique__3:
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 6, 12} true;
    call corral_fix_context_0();
    call {:si_unique_call 5} __VERIFIER_error_trace_1();
    return;
}



implementation {:origRTname "main"} {:entrypoint} main_trace_1() returns ($r: i32)
{
  var $i0: i16;
  var $i1: i16;
  var $i2: i32;
  var $i3: i32;
  var $i4: i32;
  var $i5: i32;
  var $i6: i32;
  var $i7: i32;
  var $i8: i32;
  var $i9: i32;
  var $i10: i32;
  var $i11: i32;
  var $i12: i32;
  var $i13: i32;
  var $i14: i32;
  var $i15: i32;
  var $i16: i32;
  var $i17: i32;
  var $i18: i32;
  var $i19: i32;
  var $i20: i32;
  var $i21: i32;
  var $i22: i32;
  var $i23: i32;
  var $i24: i32;
  var $i25: i32;
  var $i26: i32;
  var $i27: i32;
  var $i28: i32;
  var $i29: i32;
  var $i30: i32;
  var $i31: i32;
  var $i32: i32;
  var $i33: i32;
  var $i34: i32;
  var $i35: i32;
  var $i36: i32;
  var $i37: i32;
  var $i38: i32;
  var $i39: i32;
  var $i40: i32;
  var $i41: i32;
  var $i42: i32;
  var $i43: i32;
  var $i44: i32;
  var $i45: i32;
  var $i46: i32;
  var $i47: i32;
  var $i48: i32;
  var $i49: i32;
  var $i50: i32;
  var $i51: i32;
  var $i52: i32;
  var $i53: i32;
  var $i54: i32;
  var $i55: i32;
  var $i56: i32;
  var $i57: i32;
  var $i58: i32;
  var $i59: i32;
  var $i60: i32;
  var $i61: i32;
  var $i62: i32;
  var $i63: i32;
  var $i64: i32;
  var $i65: i32;
  var $i66: i32;
  var $i67: i32;
  var $i68: i32;
  var $i69: i32;
  var $i70: i32;
  var $i71: i32;
  var $i72: i32;
  var $i73: i32;
  var $i74: i32;
  var $i75: i32;
  var $i76: i32;
  var $i77: i32;
  var $i78: i32;
  var $i79: i32;
  var $i80: i32;
  var $i81: i32;
  var $i82: i32;
  var $i83: i32;
  var $i84: i32;
  var $i85: i32;
  var $i86: i32;
  var $i87: i32;
  var $i88: i32;
  var $i89: i32;
  var $i90: i32;
  var $i91: i32;
  var $i92: i32;
  var $i93: i32;
  var $i94: i32;
  var $i95: i32;
  var $i96: i32;
  var $i97: i32;
  var $i98: i32;
  var $i99: i32;
  var $i100: i32;
  var $i101: i32;
  var $i102: i32;
  var $i103: i32;
  var $i104: i32;
  var $i105: i32;
  var $i106: i32;
  var $i107: i32;
  var $i108: i32;
  var $i109: i32;
  var $i110: i32;
  var $i111: i32;
  var $i112: i32;
  var $i113: i32;
  var $i114: i32;
  var $i115: i32;
  var $i116: i32;
  var $i117: i32;
  var $i118: i32;
  var $i119: i32;
  var $i120: i32;
  var $i121: i32;
  var $i122: i32;
  var $i123: i32;
  var $i124: i32;
  var $i125: i32;
  var $i126: i32;
  var $i127: i32;
  var $i128: i32;
  var $i129: i32;
  var $i130: i32;
  var $i131: i32;
  var $i132: i32;
  var $i133: i32;
  var $i134: i32;
  var $i135: i32;
  var $i136: i32;
  var $i137: i32;
  var $i138: i32;
  var $i139: i32;
  var $i140: i32;
  var $i141: i32;
  var $i142: i32;
  var $i143: i32;
  var $i144: i32;
  var $i145: i32;
  var $i146: i32;
  var $i147: i32;
  var $i148: i32;
  var $i149: i32;
  var $i150: i32;
  var $i151: i32;
  var $i152: i32;
  var $i153: i32;
  var $i154: i32;
  var $i155: i32;
  var $i156: i1;
  var $i157: i32;

  $bb0__unique__1:
    call corral_fix_context_0();
    call {:si_unique_call 6} $initialize_trace_1();
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 23, 24} true;
    call corral_fix_context_0();
    call {:si_unique_call 7} $i0 := __VERIFIER_nondet_ushort_trace_1();
    call corral_fix_context_0();
    call {:si_unique_call 8} {:cexpr "x"} boogie_si_record_i16($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 24, 24} true;
    call corral_fix_context_0();
    call {:si_unique_call 9} $i1 := __VERIFIER_nondet_ushort_trace_2();
    call corral_fix_context_0();
    call {:si_unique_call 10} {:cexpr "y"} boogie_si_record_i16($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 30, 5} true;
    goto $bb1__unique__2;

  $bb1__unique__2:
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i2 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i3 := $and.i32($i2, 1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i4 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i5 := $and.i32($i4, 1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i6 := $shl.i32($i5, 1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i7 := $or.i32($i3, $i6);
    call corral_fix_context_0();
    call {:si_unique_call 11} {:cexpr "z"} boogie_si_record_i32($i7);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i8 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i9 := $and.i32($i8, 2);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i10 := $shl.i32($i9, 1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i11 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i12 := $and.i32($i11, 2);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i13 := $shl.i32($i12, 2);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i14 := $or.i32($i10, $i13);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i15 := $or.i32($i7, $i14);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i16 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i17 := $and.i32($i16, 4);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i18 := $shl.i32($i17, 2);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i19 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i20 := $and.i32($i19, 4);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i21 := $shl.i32($i20, 3);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i22 := $or.i32($i18, $i21);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i23 := $or.i32($i15, $i22);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i24 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i25 := $and.i32($i24, 8);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i26 := $shl.i32($i25, 3);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i27 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i28 := $and.i32($i27, 8);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i29 := $shl.i32($i28, 4);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i30 := $or.i32($i26, $i29);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i31 := $or.i32($i23, $i30);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i32 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i33 := $and.i32($i32, 16);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i34 := $shl.i32($i33, 4);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i35 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i36 := $and.i32($i35, 16);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i37 := $shl.i32($i36, 5);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i38 := $or.i32($i34, $i37);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i39 := $or.i32($i31, $i38);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i40 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i41 := $and.i32($i40, 32);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i42 := $shl.i32($i41, 5);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i43 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i44 := $and.i32($i43, 32);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i45 := $shl.i32($i44, 6);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i46 := $or.i32($i42, $i45);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i47 := $or.i32($i39, $i46);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i48 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i49 := $and.i32($i48, 64);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i50 := $shl.i32($i49, 6);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i51 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i52 := $and.i32($i51, 64);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i53 := $shl.i32($i52, 7);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i54 := $or.i32($i50, $i53);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i55 := $or.i32($i47, $i54);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i56 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i57 := $and.i32($i56, 128);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i58 := $shl.i32($i57, 7);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i59 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i60 := $and.i32($i59, 128);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i61 := $shl.i32($i60, 8);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i62 := $or.i32($i58, $i61);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i63 := $or.i32($i55, $i62);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i64 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i65 := $and.i32($i64, 256);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i66 := $shl.i32($i65, 8);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i67 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i68 := $and.i32($i67, 256);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i69 := $shl.i32($i68, 9);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i70 := $or.i32($i66, $i69);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i71 := $or.i32($i63, $i70);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i72 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i73 := $and.i32($i72, 512);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i74 := $shl.i32($i73, 9);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i75 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i76 := $and.i32($i75, 512);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i77 := $shl.i32($i76, 10);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i78 := $or.i32($i74, $i77);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i79 := $or.i32($i71, $i78);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i80 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i81 := $and.i32($i80, 1024);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i82 := $shl.i32($i81, 10);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i83 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i84 := $and.i32($i83, 1024);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i85 := $shl.i32($i84, 11);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i86 := $or.i32($i82, $i85);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i87 := $or.i32($i79, $i86);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i88 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i89 := $and.i32($i88, 2048);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i90 := $shl.i32($i89, 11);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i91 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i92 := $and.i32($i91, 2048);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i93 := $shl.i32($i92, 12);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i94 := $or.i32($i90, $i93);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i95 := $or.i32($i87, $i94);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i96 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i97 := $and.i32($i96, 4096);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i98 := $shl.i32($i97, 12);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i99 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i100 := $and.i32($i99, 4096);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i101 := $shl.i32($i100, 13);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i102 := $or.i32($i98, $i101);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i103 := $or.i32($i95, $i102);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i104 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i105 := $and.i32($i104, 8192);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i106 := $shl.i32($i105, 13);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i107 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i108 := $and.i32($i107, 8192);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i109 := $shl.i32($i108, 14);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i110 := $or.i32($i106, $i109);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i111 := $or.i32($i103, $i110);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i112 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i113 := $and.i32($i112, 16384);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i114 := $shl.i32($i113, 14);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i115 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i116 := $and.i32($i115, 16384);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i117 := $shl.i32($i116, 15);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i118 := $or.i32($i114, $i117);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i119 := $or.i32($i111, $i118);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 16} true;
    call corral_fix_context_0();
    $i120 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 18} true;
    call corral_fix_context_0();
    $i121 := $and.i32($i120, 32768);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 31} true;
    call corral_fix_context_0();
    $i122 := $shl.i32($i121, 15);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 41} true;
    call corral_fix_context_0();
    $i123 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 43} true;
    call corral_fix_context_0();
    $i124 := $and.i32($i123, 32768);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 56} true;
    call corral_fix_context_0();
    $i125 := $shl.i32($i124, 16);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 37} true;
    call corral_fix_context_0();
    $i126 := $or.i32($i122, $i125);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 31, 11} true;
    call corral_fix_context_0();
    $i127 := $or.i32($i119, $i126);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 34, 10} true;
    call corral_fix_context_0();
    $i128 := $zext.i16.i32($i0);
    call corral_fix_context_0();
    call {:si_unique_call 12} {:cexpr "xx"} boogie_si_record_i32($i128);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 35, 10} true;
    call corral_fix_context_0();
    $i129 := $zext.i16.i32($i1);
    call corral_fix_context_0();
    call {:si_unique_call 13} {:cexpr "yy"} boogie_si_record_i32($i129);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 36, 20} true;
    call corral_fix_context_0();
    $i130 := $shl.i32($i128, 8);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 36, 14} true;
    call corral_fix_context_0();
    $i131 := $or.i32($i128, $i130);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 36, 28} true;
    call corral_fix_context_0();
    $i132 := $and.i32($i131, 16711935);
    call corral_fix_context_0();
    call {:si_unique_call 14} {:cexpr "xx"} boogie_si_record_i32($i132);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 37, 20} true;
    call corral_fix_context_0();
    $i133 := $shl.i32($i132, 4);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 37, 14} true;
    call corral_fix_context_0();
    $i134 := $or.i32($i132, $i133);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 37, 28} true;
    call corral_fix_context_0();
    $i135 := $and.i32($i134, 252645135);
    call corral_fix_context_0();
    call {:si_unique_call 15} {:cexpr "xx"} boogie_si_record_i32($i135);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 38, 20} true;
    call corral_fix_context_0();
    $i136 := $shl.i32($i135, 2);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 38, 14} true;
    call corral_fix_context_0();
    $i137 := $or.i32($i135, $i136);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 38, 28} true;
    call corral_fix_context_0();
    $i138 := $and.i32($i137, 858993459);
    call corral_fix_context_0();
    call {:si_unique_call 16} {:cexpr "xx"} boogie_si_record_i32($i138);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 39, 20} true;
    call corral_fix_context_0();
    $i139 := $shl.i32($i138, 1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 39, 14} true;
    call corral_fix_context_0();
    $i140 := $or.i32($i138, $i139);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 39, 28} true;
    call corral_fix_context_0();
    $i141 := $and.i32($i140, 1431655765);
    call corral_fix_context_0();
    call {:si_unique_call 17} {:cexpr "xx"} boogie_si_record_i32($i141);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 40, 20} true;
    call corral_fix_context_0();
    $i142 := $shl.i32($i129, 8);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 40, 14} true;
    call corral_fix_context_0();
    $i143 := $or.i32($i129, $i142);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 40, 28} true;
    call corral_fix_context_0();
    $i144 := $and.i32($i143, 16711935);
    call corral_fix_context_0();
    call {:si_unique_call 18} {:cexpr "yy"} boogie_si_record_i32($i144);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 41, 20} true;
    call corral_fix_context_0();
    $i145 := $shl.i32($i144, 4);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 41, 14} true;
    call corral_fix_context_0();
    $i146 := $or.i32($i144, $i145);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 41, 28} true;
    call corral_fix_context_0();
    $i147 := $and.i32($i146, 252645135);
    call corral_fix_context_0();
    call {:si_unique_call 19} {:cexpr "yy"} boogie_si_record_i32($i147);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 42, 20} true;
    call corral_fix_context_0();
    $i148 := $shl.i32($i147, 2);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 42, 14} true;
    call corral_fix_context_0();
    $i149 := $or.i32($i147, $i148);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 42, 28} true;
    call corral_fix_context_0();
    $i150 := $and.i32($i149, 858993459);
    call corral_fix_context_0();
    call {:si_unique_call 20} {:cexpr "yy"} boogie_si_record_i32($i150);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 43, 20} true;
    call corral_fix_context_0();
    $i151 := $shl.i32($i150, 1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 43, 14} true;
    call corral_fix_context_0();
    $i152 := $or.i32($i150, $i151);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 43, 28} true;
    call corral_fix_context_0();
    $i153 := $and.i32($i152, 1431655765);
    call corral_fix_context_0();
    call {:si_unique_call 21} {:cexpr "yy"} boogie_si_record_i32($i153);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 45, 19} true;
    call corral_fix_context_0();
    $i154 := $shl.i32($i153, 1);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 45, 13} true;
    call corral_fix_context_0();
    $i155 := $or.i32($i141, $i154);
    call corral_fix_context_0();
    call {:si_unique_call 22} {:cexpr "zz"} boogie_si_record_i32($i155);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 47, 25} true;
    call corral_fix_context_0();
    $i156 := $eq.i32($i127, $i155);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 47, 25} true;
    call corral_fix_context_0();
    $i157 := $zext.i1.i32($i156);
    call corral_fix_context_0();
    assume {:sourceloc "/mnt/local/smack/interleave_bits_true-unreach-call_true-no-overflow-Wbx5bX.i", 47, 5} true;
    call corral_fix_context_0();
    call {:si_unique_call 23} __VERIFIER_assert_trace_1($i157);
    return;
}



type i1 = int;

type i8 = int;

type i16 = int;

type i24 = int;

type i32 = int;

type i40 = int;

type i48 = int;

type i56 = int;

type i64 = int;

type i88 = int;

type i96 = int;

type i128 = int;

type ref = i64;

type float = i32;

const $0: i32;

axiom $0 == 0;

const $0.ref: ref;

axiom $0.ref == 0;

const $1.ref: ref;

axiom $1.ref == 1;

const $2.ref: ref;

axiom $2.ref == 2;

const $3.ref: ref;

axiom $3.ref == 3;

const $4.ref: ref;

axiom $4.ref == 4;

const $5.ref: ref;

axiom $5.ref == 5;

const $6.ref: ref;

axiom $6.ref == 6;

const $7.ref: ref;

axiom $7.ref == 7;

const $8.ref: ref;

axiom $8.ref == 8;

const $9.ref: ref;

axiom $9.ref == 9;

const $10.ref: ref;

axiom $10.ref == 10;

const $11.ref: ref;

axiom $11.ref == 11;

const $12.ref: ref;

axiom $12.ref == 12;

const $13.ref: ref;

axiom $13.ref == 13;

const $14.ref: ref;

axiom $14.ref == 14;

const $1024.ref: ref;

axiom $1024.ref == 1024;

axiom $GLOBALS_BOTTOM == $sub.ref(0, 39222);

axiom $EXTERNS_BOTTOM == $sub.ref(0, 32768);

axiom $MALLOC_TOP == 2136997887;

function {:builtin "bv2int"} $bv2int.64(i: bv64) : i64;

function {:builtin "(_ int2bv 64)"} $int2bv.64(i: i64) : bv64;

function {:inline} $p2i.ref.i8(p: ref) : i8
{
  $trunc.i64.i8(p)
}

function {:inline} $i2p.i8.ref(i: i8) : ref
{
  $zext.i8.i64(i)
}

function {:inline} $p2i.ref.i16(p: ref) : i16
{
  $trunc.i64.i16(p)
}

function {:inline} $i2p.i16.ref(i: i16) : ref
{
  $zext.i16.i64(i)
}

function {:inline} $p2i.ref.i32(p: ref) : i32
{
  $trunc.i64.i32(p)
}

function {:inline} $i2p.i32.ref(i: i32) : ref
{
  $zext.i32.i64(i)
}

function {:inline} $p2i.ref.i64(p: ref) : i64
{
  p
}

function {:inline} $i2p.i64.ref(i: i64) : ref
{
  i
}

function {:inline} $eq.ref(p1: ref, p2: ref) : i1
{
  (if $eq.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $eq.ref.bool(p1: ref, p2: ref) : bool
{
  $eq.i64.bool(p1, p2)
}

function {:inline} $ne.ref(p1: ref, p2: ref) : i1
{
  (if $ne.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $ne.ref.bool(p1: ref, p2: ref) : bool
{
  $ne.i64.bool(p1, p2)
}

function {:inline} $ugt.ref(p1: ref, p2: ref) : i1
{
  (if $ugt.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $ugt.ref.bool(p1: ref, p2: ref) : bool
{
  $ugt.i64.bool(p1, p2)
}

function {:inline} $uge.ref(p1: ref, p2: ref) : i1
{
  (if $uge.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $uge.ref.bool(p1: ref, p2: ref) : bool
{
  $uge.i64.bool(p1, p2)
}

function {:inline} $ult.ref(p1: ref, p2: ref) : i1
{
  (if $ult.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $ult.ref.bool(p1: ref, p2: ref) : bool
{
  $ult.i64.bool(p1, p2)
}

function {:inline} $ule.ref(p1: ref, p2: ref) : i1
{
  (if $ule.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $ule.ref.bool(p1: ref, p2: ref) : bool
{
  $ule.i64.bool(p1, p2)
}

function {:inline} $sgt.ref(p1: ref, p2: ref) : i1
{
  (if $sgt.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $sgt.ref.bool(p1: ref, p2: ref) : bool
{
  $sgt.i64.bool(p1, p2)
}

function {:inline} $sge.ref(p1: ref, p2: ref) : i1
{
  (if $sge.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $sge.ref.bool(p1: ref, p2: ref) : bool
{
  $sge.i64.bool(p1, p2)
}

function {:inline} $slt.ref(p1: ref, p2: ref) : i1
{
  (if $slt.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $slt.ref.bool(p1: ref, p2: ref) : bool
{
  $slt.i64.bool(p1, p2)
}

function {:inline} $sle.ref(p1: ref, p2: ref) : i1
{
  (if $sle.i64.bool(p1, p2) then 1 else 0)
}

function {:inline} $sle.ref.bool(p1: ref, p2: ref) : bool
{
  $sle.i64.bool(p1, p2)
}

function {:inline} $add.ref(p1: ref, p2: ref) : ref
{
  $add.i64(p1, p2)
}

function {:inline} $sub.ref(p1: ref, p2: ref) : ref
{
  $sub.i64(p1, p2)
}

function {:inline} $mul.ref(p1: ref, p2: ref) : ref
{
  $mul.i64(p1, p2)
}

const {:count 14} .str.2: ref;

axiom .str.2 == $sub.ref(0, 1038);

const __VERIFIER_assume: ref;

axiom __VERIFIER_assume == $sub.ref(0, 2070);

const __SMACK_dummy: ref;

axiom __SMACK_dummy == $sub.ref(0, 3102);

const __SMACK_code: ref;

axiom __SMACK_code == $sub.ref(0, 4134);

const __VERIFIER_error: ref;

axiom __VERIFIER_error == $sub.ref(0, 5166);

const __SMACK_nondet_char: ref;

axiom __SMACK_nondet_char == $sub.ref(0, 6198);

const __SMACK_nondet_signed_char: ref;

axiom __SMACK_nondet_signed_char == $sub.ref(0, 7230);

const __SMACK_nondet_unsigned_char: ref;

axiom __SMACK_nondet_unsigned_char == $sub.ref(0, 8262);

const __SMACK_nondet_short: ref;

axiom __SMACK_nondet_short == $sub.ref(0, 9294);

const __SMACK_nondet_signed_short: ref;

axiom __SMACK_nondet_signed_short == $sub.ref(0, 10326);

const __SMACK_nondet_signed_short_int: ref;

axiom __SMACK_nondet_signed_short_int == $sub.ref(0, 11358);

const __VERIFIER_nondet_unsigned_short: ref;

axiom __VERIFIER_nondet_unsigned_short == $sub.ref(0, 12390);

const __SMACK_nondet_unsigned_short: ref;

axiom __SMACK_nondet_unsigned_short == $sub.ref(0, 13422);

const __SMACK_nondet_unsigned_short_int: ref;

axiom __SMACK_nondet_unsigned_short_int == $sub.ref(0, 14454);

const __SMACK_nondet_int: ref;

axiom __SMACK_nondet_int == $sub.ref(0, 15486);

const __SMACK_nondet_signed_int: ref;

axiom __SMACK_nondet_signed_int == $sub.ref(0, 16518);

const __SMACK_nondet_unsigned: ref;

axiom __SMACK_nondet_unsigned == $sub.ref(0, 17550);

const __SMACK_nondet_unsigned_int: ref;

axiom __SMACK_nondet_unsigned_int == $sub.ref(0, 18582);

const __SMACK_nondet_long: ref;

axiom __SMACK_nondet_long == $sub.ref(0, 19614);

const __SMACK_nondet_long_int: ref;

axiom __SMACK_nondet_long_int == $sub.ref(0, 20646);

const __SMACK_nondet_signed_long: ref;

axiom __SMACK_nondet_signed_long == $sub.ref(0, 21678);

const __SMACK_nondet_signed_long_int: ref;

axiom __SMACK_nondet_signed_long_int == $sub.ref(0, 22710);

const __SMACK_nondet_unsigned_long: ref;

axiom __SMACK_nondet_unsigned_long == $sub.ref(0, 23742);

const __SMACK_nondet_unsigned_long_int: ref;

axiom __SMACK_nondet_unsigned_long_int == $sub.ref(0, 24774);

const __SMACK_nondet_long_long: ref;

axiom __SMACK_nondet_long_long == $sub.ref(0, 25806);

const __SMACK_nondet_long_long_int: ref;

axiom __SMACK_nondet_long_long_int == $sub.ref(0, 26838);

const __SMACK_nondet_signed_long_long: ref;

axiom __SMACK_nondet_signed_long_long == $sub.ref(0, 27870);

const __SMACK_nondet_signed_long_long_int: ref;

axiom __SMACK_nondet_signed_long_long_int == $sub.ref(0, 28902);

const __SMACK_nondet_unsigned_long_long: ref;

axiom __SMACK_nondet_unsigned_long_long == $sub.ref(0, 29934);

const __SMACK_nondet_unsigned_long_long_int: ref;

axiom __SMACK_nondet_unsigned_long_long_int == $sub.ref(0, 30966);

const __VERIFIER_nondet_ushort: ref;

axiom __VERIFIER_nondet_ushort == $sub.ref(0, 31998);

const __SMACK_decls: ref;

axiom __SMACK_decls == $sub.ref(0, 33030);

function {:inline} $bitcast.ref.ref(i: ref) : ref
{
  i
}

function {:bvbuiltin "bvadd"} $add.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvadd"} $add.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvadd"} $add.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvadd"} $add.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvadd"} $add.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvadd"} $add.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvadd"} $add.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvadd"} $add.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvadd"} $add.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvadd"} $add.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvadd"} $add.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvadd"} $add.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvsub"} $sub.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvsub"} $sub.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvsub"} $sub.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvsub"} $sub.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvsub"} $sub.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvsub"} $sub.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvsub"} $sub.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvsub"} $sub.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvsub"} $sub.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvsub"} $sub.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvsub"} $sub.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvsub"} $sub.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvmul"} $mul.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvmul"} $mul.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvmul"} $mul.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvmul"} $mul.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvmul"} $mul.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvmul"} $mul.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvmul"} $mul.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvmul"} $mul.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvmul"} $mul.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvmul"} $mul.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvmul"} $mul.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvmul"} $mul.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvudiv"} $udiv.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvudiv"} $udiv.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvudiv"} $udiv.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvudiv"} $udiv.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvudiv"} $udiv.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvudiv"} $udiv.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvudiv"} $udiv.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvudiv"} $udiv.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvudiv"} $udiv.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvudiv"} $udiv.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvudiv"} $udiv.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvudiv"} $udiv.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvsdiv"} $sdiv.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvsdiv"} $sdiv.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvsdiv"} $sdiv.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvsdiv"} $sdiv.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvsdiv"} $sdiv.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvsdiv"} $sdiv.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvsdiv"} $sdiv.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvsdiv"} $sdiv.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvsdiv"} $sdiv.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvsdiv"} $sdiv.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvsdiv"} $sdiv.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvsdiv"} $sdiv.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvsmod"} $smod.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvsmod"} $smod.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvsmod"} $smod.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvsmod"} $smod.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvsmod"} $smod.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvsmod"} $smod.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvsmod"} $smod.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvsmod"} $smod.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvsmod"} $smod.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvsmod"} $smod.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvsmod"} $smod.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvsmod"} $smod.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvsrem"} $srem.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvsrem"} $srem.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvsrem"} $srem.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvsrem"} $srem.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvsrem"} $srem.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvsrem"} $srem.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvsrem"} $srem.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvsrem"} $srem.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvsrem"} $srem.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvsrem"} $srem.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvsrem"} $srem.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvsrem"} $srem.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvurem"} $urem.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvurem"} $urem.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvurem"} $urem.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvurem"} $urem.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvurem"} $urem.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvurem"} $urem.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvurem"} $urem.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvurem"} $urem.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvurem"} $urem.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvurem"} $urem.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvurem"} $urem.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvurem"} $urem.bv1(i1: bv1, i2: bv1) : bv1;

function {:inline} $min.bv128(i1: bv128, i2: bv128) : bv128
{
  (if $slt.bv128.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv96(i1: bv96, i2: bv96) : bv96
{
  (if $slt.bv96.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv88(i1: bv88, i2: bv88) : bv88
{
  (if $slt.bv88.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv64(i1: bv64, i2: bv64) : bv64
{
  (if $slt.bv64.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv56(i1: bv56, i2: bv56) : bv56
{
  (if $slt.bv56.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv48(i1: bv48, i2: bv48) : bv48
{
  (if $slt.bv48.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv40(i1: bv40, i2: bv40) : bv40
{
  (if $slt.bv40.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv32(i1: bv32, i2: bv32) : bv32
{
  (if $slt.bv32.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv24(i1: bv24, i2: bv24) : bv24
{
  (if $slt.bv24.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv16(i1: bv16, i2: bv16) : bv16
{
  (if $slt.bv16.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv8(i1: bv8, i2: bv8) : bv8
{
  (if $slt.bv8.bool(i1, i2) then i1 else i2)
}

function {:inline} $min.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $slt.bv1.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv128(i1: bv128, i2: bv128) : bv128
{
  (if $sgt.bv128.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv96(i1: bv96, i2: bv96) : bv96
{
  (if $sgt.bv96.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv88(i1: bv88, i2: bv88) : bv88
{
  (if $sgt.bv88.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv64(i1: bv64, i2: bv64) : bv64
{
  (if $sgt.bv64.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv56(i1: bv56, i2: bv56) : bv56
{
  (if $sgt.bv56.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv48(i1: bv48, i2: bv48) : bv48
{
  (if $sgt.bv48.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv40(i1: bv40, i2: bv40) : bv40
{
  (if $sgt.bv40.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv32(i1: bv32, i2: bv32) : bv32
{
  (if $sgt.bv32.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv24(i1: bv24, i2: bv24) : bv24
{
  (if $sgt.bv24.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv16(i1: bv16, i2: bv16) : bv16
{
  (if $sgt.bv16.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv8(i1: bv8, i2: bv8) : bv8
{
  (if $sgt.bv8.bool(i1, i2) then i1 else i2)
}

function {:inline} $max.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $sgt.bv1.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv128(i1: bv128, i2: bv128) : bv128
{
  (if $ult.bv128.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv96(i1: bv96, i2: bv96) : bv96
{
  (if $ult.bv96.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv88(i1: bv88, i2: bv88) : bv88
{
  (if $ult.bv88.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv64(i1: bv64, i2: bv64) : bv64
{
  (if $ult.bv64.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv56(i1: bv56, i2: bv56) : bv56
{
  (if $ult.bv56.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv48(i1: bv48, i2: bv48) : bv48
{
  (if $ult.bv48.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv40(i1: bv40, i2: bv40) : bv40
{
  (if $ult.bv40.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv32(i1: bv32, i2: bv32) : bv32
{
  (if $ult.bv32.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv24(i1: bv24, i2: bv24) : bv24
{
  (if $ult.bv24.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv16(i1: bv16, i2: bv16) : bv16
{
  (if $ult.bv16.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv8(i1: bv8, i2: bv8) : bv8
{
  (if $ult.bv8.bool(i1, i2) then i1 else i2)
}

function {:inline} $umin.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ult.bv1.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv128(i1: bv128, i2: bv128) : bv128
{
  (if $ugt.bv128.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv96(i1: bv96, i2: bv96) : bv96
{
  (if $ugt.bv96.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv88(i1: bv88, i2: bv88) : bv88
{
  (if $ugt.bv88.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv64(i1: bv64, i2: bv64) : bv64
{
  (if $ugt.bv64.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv56(i1: bv56, i2: bv56) : bv56
{
  (if $ugt.bv56.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv48(i1: bv48, i2: bv48) : bv48
{
  (if $ugt.bv48.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv40(i1: bv40, i2: bv40) : bv40
{
  (if $ugt.bv40.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv32(i1: bv32, i2: bv32) : bv32
{
  (if $ugt.bv32.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv24(i1: bv24, i2: bv24) : bv24
{
  (if $ugt.bv24.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv16(i1: bv16, i2: bv16) : bv16
{
  (if $ugt.bv16.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv8(i1: bv8, i2: bv8) : bv8
{
  (if $ugt.bv8.bool(i1, i2) then i1 else i2)
}

function {:inline} $umax.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ugt.bv1.bool(i1, i2) then i1 else i2)
}

function {:bvbuiltin "bvshl"} $shl.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvshl"} $shl.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvshl"} $shl.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvshl"} $shl.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvshl"} $shl.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvshl"} $shl.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvshl"} $shl.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvshl"} $shl.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvshl"} $shl.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvshl"} $shl.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvshl"} $shl.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvshl"} $shl.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvlshr"} $lshr.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvlshr"} $lshr.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvlshr"} $lshr.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvlshr"} $lshr.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvlshr"} $lshr.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvlshr"} $lshr.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvlshr"} $lshr.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvlshr"} $lshr.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvlshr"} $lshr.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvlshr"} $lshr.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvlshr"} $lshr.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvlshr"} $lshr.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvashr"} $ashr.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvashr"} $ashr.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvashr"} $ashr.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvashr"} $ashr.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvashr"} $ashr.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvashr"} $ashr.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvashr"} $ashr.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvashr"} $ashr.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvashr"} $ashr.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvashr"} $ashr.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvashr"} $ashr.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvashr"} $ashr.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvnot"} $not.bv128(i: bv128) : bv128;

function {:bvbuiltin "bvnot"} $not.bv96(i: bv96) : bv96;

function {:bvbuiltin "bvnot"} $not.bv88(i: bv88) : bv88;

function {:bvbuiltin "bvnot"} $not.bv64(i: bv64) : bv64;

function {:bvbuiltin "bvnot"} $not.bv56(i: bv56) : bv56;

function {:bvbuiltin "bvnot"} $not.bv48(i: bv48) : bv48;

function {:bvbuiltin "bvnot"} $not.bv40(i: bv40) : bv40;

function {:bvbuiltin "bvnot"} $not.bv32(i: bv32) : bv32;

function {:bvbuiltin "bvnot"} $not.bv24(i: bv24) : bv24;

function {:bvbuiltin "bvnot"} $not.bv16(i: bv16) : bv16;

function {:bvbuiltin "bvnot"} $not.bv8(i: bv8) : bv8;

function {:bvbuiltin "bvnot"} $not.bv1(i: bv1) : bv1;

function {:bvbuiltin "bvand"} $and.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvand"} $and.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvand"} $and.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvand"} $and.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvand"} $and.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvand"} $and.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvand"} $and.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvand"} $and.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvand"} $and.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvand"} $and.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvand"} $and.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvand"} $and.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvor"} $or.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvor"} $or.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvor"} $or.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvor"} $or.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvor"} $or.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvor"} $or.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvor"} $or.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvor"} $or.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvor"} $or.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvor"} $or.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvor"} $or.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvor"} $or.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvxor"} $xor.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvxor"} $xor.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvxor"} $xor.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvxor"} $xor.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvxor"} $xor.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvxor"} $xor.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvxor"} $xor.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvxor"} $xor.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvxor"} $xor.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvxor"} $xor.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvxor"} $xor.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvxor"} $xor.bv1(i1: bv1, i2: bv1) : bv1;

function {:bvbuiltin "bvnand"} $nand.bv128(i1: bv128, i2: bv128) : bv128;

function {:bvbuiltin "bvnand"} $nand.bv96(i1: bv96, i2: bv96) : bv96;

function {:bvbuiltin "bvnand"} $nand.bv88(i1: bv88, i2: bv88) : bv88;

function {:bvbuiltin "bvnand"} $nand.bv64(i1: bv64, i2: bv64) : bv64;

function {:bvbuiltin "bvnand"} $nand.bv56(i1: bv56, i2: bv56) : bv56;

function {:bvbuiltin "bvnand"} $nand.bv48(i1: bv48, i2: bv48) : bv48;

function {:bvbuiltin "bvnand"} $nand.bv40(i1: bv40, i2: bv40) : bv40;

function {:bvbuiltin "bvnand"} $nand.bv32(i1: bv32, i2: bv32) : bv32;

function {:bvbuiltin "bvnand"} $nand.bv24(i1: bv24, i2: bv24) : bv24;

function {:bvbuiltin "bvnand"} $nand.bv16(i1: bv16, i2: bv16) : bv16;

function {:bvbuiltin "bvnand"} $nand.bv8(i1: bv8, i2: bv8) : bv8;

function {:bvbuiltin "bvnand"} $nand.bv1(i1: bv1, i2: bv1) : bv1;

function {:inline} $eq.bv128.bool(i1: bv128, i2: bv128) : bool
{
  i1 == i2
}

function {:inline} $eq.bv128(i1: bv128, i2: bv128) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv96.bool(i1: bv96, i2: bv96) : bool
{
  i1 == i2
}

function {:inline} $eq.bv96(i1: bv96, i2: bv96) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv88.bool(i1: bv88, i2: bv88) : bool
{
  i1 == i2
}

function {:inline} $eq.bv88(i1: bv88, i2: bv88) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv64.bool(i1: bv64, i2: bv64) : bool
{
  i1 == i2
}

function {:inline} $eq.bv64(i1: bv64, i2: bv64) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv56.bool(i1: bv56, i2: bv56) : bool
{
  i1 == i2
}

function {:inline} $eq.bv56(i1: bv56, i2: bv56) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv48.bool(i1: bv48, i2: bv48) : bool
{
  i1 == i2
}

function {:inline} $eq.bv48(i1: bv48, i2: bv48) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv40.bool(i1: bv40, i2: bv40) : bool
{
  i1 == i2
}

function {:inline} $eq.bv40(i1: bv40, i2: bv40) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv32.bool(i1: bv32, i2: bv32) : bool
{
  i1 == i2
}

function {:inline} $eq.bv32(i1: bv32, i2: bv32) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv24.bool(i1: bv24, i2: bv24) : bool
{
  i1 == i2
}

function {:inline} $eq.bv24(i1: bv24, i2: bv24) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv16.bool(i1: bv16, i2: bv16) : bool
{
  i1 == i2
}

function {:inline} $eq.bv16(i1: bv16, i2: bv16) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv8.bool(i1: bv8, i2: bv8) : bool
{
  i1 == i2
}

function {:inline} $eq.bv8(i1: bv8, i2: bv8) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $eq.bv1.bool(i1: bv1, i2: bv1) : bool
{
  i1 == i2
}

function {:inline} $eq.bv1(i1: bv1, i2: bv1) : bv1
{
  (if i1 == i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv128.bool(i1: bv128, i2: bv128) : bool
{
  i1 != i2
}

function {:inline} $ne.bv128(i1: bv128, i2: bv128) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv96.bool(i1: bv96, i2: bv96) : bool
{
  i1 != i2
}

function {:inline} $ne.bv96(i1: bv96, i2: bv96) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv88.bool(i1: bv88, i2: bv88) : bool
{
  i1 != i2
}

function {:inline} $ne.bv88(i1: bv88, i2: bv88) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv64.bool(i1: bv64, i2: bv64) : bool
{
  i1 != i2
}

function {:inline} $ne.bv64(i1: bv64, i2: bv64) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv56.bool(i1: bv56, i2: bv56) : bool
{
  i1 != i2
}

function {:inline} $ne.bv56(i1: bv56, i2: bv56) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv48.bool(i1: bv48, i2: bv48) : bool
{
  i1 != i2
}

function {:inline} $ne.bv48(i1: bv48, i2: bv48) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv40.bool(i1: bv40, i2: bv40) : bool
{
  i1 != i2
}

function {:inline} $ne.bv40(i1: bv40, i2: bv40) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv32.bool(i1: bv32, i2: bv32) : bool
{
  i1 != i2
}

function {:inline} $ne.bv32(i1: bv32, i2: bv32) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv24.bool(i1: bv24, i2: bv24) : bool
{
  i1 != i2
}

function {:inline} $ne.bv24(i1: bv24, i2: bv24) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv16.bool(i1: bv16, i2: bv16) : bool
{
  i1 != i2
}

function {:inline} $ne.bv16(i1: bv16, i2: bv16) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv8.bool(i1: bv8, i2: bv8) : bool
{
  i1 != i2
}

function {:inline} $ne.bv8(i1: bv8, i2: bv8) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:inline} $ne.bv1.bool(i1: bv1, i2: bv1) : bool
{
  i1 != i2
}

function {:inline} $ne.bv1(i1: bv1, i2: bv1) : bv1
{
  (if i1 != i2 then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $ule.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $ule.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $ule.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $ule.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv88.bool(i1: bv88, i2: bv88) : bool;

function {:inline} $ule.bv88(i1: bv88, i2: bv88) : bv1
{
  (if $ule.bv88.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $ule.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $ule.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv56.bool(i1: bv56, i2: bv56) : bool;

function {:inline} $ule.bv56(i1: bv56, i2: bv56) : bv1
{
  (if $ule.bv56.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv48.bool(i1: bv48, i2: bv48) : bool;

function {:inline} $ule.bv48(i1: bv48, i2: bv48) : bv1
{
  (if $ule.bv48.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv40.bool(i1: bv40, i2: bv40) : bool;

function {:inline} $ule.bv40(i1: bv40, i2: bv40) : bv1
{
  (if $ule.bv40.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $ule.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $ule.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv24.bool(i1: bv24, i2: bv24) : bool;

function {:inline} $ule.bv24(i1: bv24, i2: bv24) : bv1
{
  (if $ule.bv24.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $ule.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $ule.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $ule.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $ule.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvule"} $ule.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $ule.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ule.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $ult.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $ult.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $ult.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $ult.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv88.bool(i1: bv88, i2: bv88) : bool;

function {:inline} $ult.bv88(i1: bv88, i2: bv88) : bv1
{
  (if $ult.bv88.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $ult.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $ult.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv56.bool(i1: bv56, i2: bv56) : bool;

function {:inline} $ult.bv56(i1: bv56, i2: bv56) : bv1
{
  (if $ult.bv56.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv48.bool(i1: bv48, i2: bv48) : bool;

function {:inline} $ult.bv48(i1: bv48, i2: bv48) : bv1
{
  (if $ult.bv48.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv40.bool(i1: bv40, i2: bv40) : bool;

function {:inline} $ult.bv40(i1: bv40, i2: bv40) : bv1
{
  (if $ult.bv40.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $ult.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $ult.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv24.bool(i1: bv24, i2: bv24) : bool;

function {:inline} $ult.bv24(i1: bv24, i2: bv24) : bv1
{
  (if $ult.bv24.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $ult.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $ult.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $ult.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $ult.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvult"} $ult.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $ult.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ult.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $uge.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $uge.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $uge.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $uge.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv88.bool(i1: bv88, i2: bv88) : bool;

function {:inline} $uge.bv88(i1: bv88, i2: bv88) : bv1
{
  (if $uge.bv88.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $uge.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $uge.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv56.bool(i1: bv56, i2: bv56) : bool;

function {:inline} $uge.bv56(i1: bv56, i2: bv56) : bv1
{
  (if $uge.bv56.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv48.bool(i1: bv48, i2: bv48) : bool;

function {:inline} $uge.bv48(i1: bv48, i2: bv48) : bv1
{
  (if $uge.bv48.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv40.bool(i1: bv40, i2: bv40) : bool;

function {:inline} $uge.bv40(i1: bv40, i2: bv40) : bv1
{
  (if $uge.bv40.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $uge.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $uge.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv24.bool(i1: bv24, i2: bv24) : bool;

function {:inline} $uge.bv24(i1: bv24, i2: bv24) : bv1
{
  (if $uge.bv24.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $uge.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $uge.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $uge.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $uge.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvuge"} $uge.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $uge.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $uge.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $ugt.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $ugt.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $ugt.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $ugt.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv88.bool(i1: bv88, i2: bv88) : bool;

function {:inline} $ugt.bv88(i1: bv88, i2: bv88) : bv1
{
  (if $ugt.bv88.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $ugt.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $ugt.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv56.bool(i1: bv56, i2: bv56) : bool;

function {:inline} $ugt.bv56(i1: bv56, i2: bv56) : bv1
{
  (if $ugt.bv56.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv48.bool(i1: bv48, i2: bv48) : bool;

function {:inline} $ugt.bv48(i1: bv48, i2: bv48) : bv1
{
  (if $ugt.bv48.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv40.bool(i1: bv40, i2: bv40) : bool;

function {:inline} $ugt.bv40(i1: bv40, i2: bv40) : bv1
{
  (if $ugt.bv40.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $ugt.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $ugt.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv24.bool(i1: bv24, i2: bv24) : bool;

function {:inline} $ugt.bv24(i1: bv24, i2: bv24) : bv1
{
  (if $ugt.bv24.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $ugt.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $ugt.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $ugt.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $ugt.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvugt"} $ugt.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $ugt.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $ugt.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $sle.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $sle.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $sle.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $sle.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv88.bool(i1: bv88, i2: bv88) : bool;

function {:inline} $sle.bv88(i1: bv88, i2: bv88) : bv1
{
  (if $sle.bv88.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $sle.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $sle.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv56.bool(i1: bv56, i2: bv56) : bool;

function {:inline} $sle.bv56(i1: bv56, i2: bv56) : bv1
{
  (if $sle.bv56.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv48.bool(i1: bv48, i2: bv48) : bool;

function {:inline} $sle.bv48(i1: bv48, i2: bv48) : bv1
{
  (if $sle.bv48.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv40.bool(i1: bv40, i2: bv40) : bool;

function {:inline} $sle.bv40(i1: bv40, i2: bv40) : bv1
{
  (if $sle.bv40.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $sle.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $sle.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv24.bool(i1: bv24, i2: bv24) : bool;

function {:inline} $sle.bv24(i1: bv24, i2: bv24) : bv1
{
  (if $sle.bv24.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $sle.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $sle.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $sle.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $sle.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsle"} $sle.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $sle.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $sle.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $slt.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $slt.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $slt.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $slt.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv88.bool(i1: bv88, i2: bv88) : bool;

function {:inline} $slt.bv88(i1: bv88, i2: bv88) : bv1
{
  (if $slt.bv88.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $slt.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $slt.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv56.bool(i1: bv56, i2: bv56) : bool;

function {:inline} $slt.bv56(i1: bv56, i2: bv56) : bv1
{
  (if $slt.bv56.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv48.bool(i1: bv48, i2: bv48) : bool;

function {:inline} $slt.bv48(i1: bv48, i2: bv48) : bv1
{
  (if $slt.bv48.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv40.bool(i1: bv40, i2: bv40) : bool;

function {:inline} $slt.bv40(i1: bv40, i2: bv40) : bv1
{
  (if $slt.bv40.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $slt.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $slt.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv24.bool(i1: bv24, i2: bv24) : bool;

function {:inline} $slt.bv24(i1: bv24, i2: bv24) : bv1
{
  (if $slt.bv24.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $slt.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $slt.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $slt.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $slt.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvslt"} $slt.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $slt.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $slt.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $sge.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $sge.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $sge.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $sge.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv88.bool(i1: bv88, i2: bv88) : bool;

function {:inline} $sge.bv88(i1: bv88, i2: bv88) : bv1
{
  (if $sge.bv88.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $sge.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $sge.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv56.bool(i1: bv56, i2: bv56) : bool;

function {:inline} $sge.bv56(i1: bv56, i2: bv56) : bv1
{
  (if $sge.bv56.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv48.bool(i1: bv48, i2: bv48) : bool;

function {:inline} $sge.bv48(i1: bv48, i2: bv48) : bv1
{
  (if $sge.bv48.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv40.bool(i1: bv40, i2: bv40) : bool;

function {:inline} $sge.bv40(i1: bv40, i2: bv40) : bv1
{
  (if $sge.bv40.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $sge.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $sge.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv24.bool(i1: bv24, i2: bv24) : bool;

function {:inline} $sge.bv24(i1: bv24, i2: bv24) : bv1
{
  (if $sge.bv24.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $sge.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $sge.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $sge.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $sge.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsge"} $sge.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $sge.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $sge.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv128.bool(i1: bv128, i2: bv128) : bool;

function {:inline} $sgt.bv128(i1: bv128, i2: bv128) : bv1
{
  (if $sgt.bv128.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv96.bool(i1: bv96, i2: bv96) : bool;

function {:inline} $sgt.bv96(i1: bv96, i2: bv96) : bv1
{
  (if $sgt.bv96.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv88.bool(i1: bv88, i2: bv88) : bool;

function {:inline} $sgt.bv88(i1: bv88, i2: bv88) : bv1
{
  (if $sgt.bv88.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv64.bool(i1: bv64, i2: bv64) : bool;

function {:inline} $sgt.bv64(i1: bv64, i2: bv64) : bv1
{
  (if $sgt.bv64.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv56.bool(i1: bv56, i2: bv56) : bool;

function {:inline} $sgt.bv56(i1: bv56, i2: bv56) : bv1
{
  (if $sgt.bv56.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv48.bool(i1: bv48, i2: bv48) : bool;

function {:inline} $sgt.bv48(i1: bv48, i2: bv48) : bv1
{
  (if $sgt.bv48.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv40.bool(i1: bv40, i2: bv40) : bool;

function {:inline} $sgt.bv40(i1: bv40, i2: bv40) : bv1
{
  (if $sgt.bv40.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv32.bool(i1: bv32, i2: bv32) : bool;

function {:inline} $sgt.bv32(i1: bv32, i2: bv32) : bv1
{
  (if $sgt.bv32.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv24.bool(i1: bv24, i2: bv24) : bool;

function {:inline} $sgt.bv24(i1: bv24, i2: bv24) : bv1
{
  (if $sgt.bv24.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv16.bool(i1: bv16, i2: bv16) : bool;

function {:inline} $sgt.bv16(i1: bv16, i2: bv16) : bv1
{
  (if $sgt.bv16.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv8.bool(i1: bv8, i2: bv8) : bool;

function {:inline} $sgt.bv8(i1: bv8, i2: bv8) : bv1
{
  (if $sgt.bv8.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:bvbuiltin "bvsgt"} $sgt.bv1.bool(i1: bv1, i2: bv1) : bool;

function {:inline} $sgt.bv1(i1: bv1, i2: bv1) : bv1
{
  (if $sgt.bv1.bool(i1, i2) then 1bv1 else 0bv1)
}

function {:inline} $trunc.bv128.bv96(i: bv128) : bv96
{
  i[96:0]
}

function {:inline} $trunc.bv128.bv88(i: bv128) : bv88
{
  i[88:0]
}

function {:inline} $trunc.bv128.bv64(i: bv128) : bv64
{
  i[64:0]
}

function {:inline} $trunc.bv128.bv56(i: bv128) : bv56
{
  i[56:0]
}

function {:inline} $trunc.bv128.bv48(i: bv128) : bv48
{
  i[48:0]
}

function {:inline} $trunc.bv128.bv40(i: bv128) : bv40
{
  i[40:0]
}

function {:inline} $trunc.bv128.bv32(i: bv128) : bv32
{
  i[32:0]
}

function {:inline} $trunc.bv128.bv24(i: bv128) : bv24
{
  i[24:0]
}

function {:inline} $trunc.bv128.bv16(i: bv128) : bv16
{
  i[16:0]
}

function {:inline} $trunc.bv128.bv8(i: bv128) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv128.bv1(i: bv128) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv96.bv88(i: bv96) : bv88
{
  i[88:0]
}

function {:inline} $trunc.bv96.bv64(i: bv96) : bv64
{
  i[64:0]
}

function {:inline} $trunc.bv96.bv56(i: bv96) : bv56
{
  i[56:0]
}

function {:inline} $trunc.bv96.bv48(i: bv96) : bv48
{
  i[48:0]
}

function {:inline} $trunc.bv96.bv40(i: bv96) : bv40
{
  i[40:0]
}

function {:inline} $trunc.bv96.bv32(i: bv96) : bv32
{
  i[32:0]
}

function {:inline} $trunc.bv96.bv24(i: bv96) : bv24
{
  i[24:0]
}

function {:inline} $trunc.bv96.bv16(i: bv96) : bv16
{
  i[16:0]
}

function {:inline} $trunc.bv96.bv8(i: bv96) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv96.bv1(i: bv96) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv88.bv64(i: bv88) : bv64
{
  i[64:0]
}

function {:inline} $trunc.bv88.bv56(i: bv88) : bv56
{
  i[56:0]
}

function {:inline} $trunc.bv88.bv48(i: bv88) : bv48
{
  i[48:0]
}

function {:inline} $trunc.bv88.bv40(i: bv88) : bv40
{
  i[40:0]
}

function {:inline} $trunc.bv88.bv32(i: bv88) : bv32
{
  i[32:0]
}

function {:inline} $trunc.bv88.bv24(i: bv88) : bv24
{
  i[24:0]
}

function {:inline} $trunc.bv88.bv16(i: bv88) : bv16
{
  i[16:0]
}

function {:inline} $trunc.bv88.bv8(i: bv88) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv88.bv1(i: bv88) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv64.bv56(i: bv64) : bv56
{
  i[56:0]
}

function {:inline} $trunc.bv64.bv48(i: bv64) : bv48
{
  i[48:0]
}

function {:inline} $trunc.bv64.bv40(i: bv64) : bv40
{
  i[40:0]
}

function {:inline} $trunc.bv64.bv32(i: bv64) : bv32
{
  i[32:0]
}

function {:inline} $trunc.bv64.bv24(i: bv64) : bv24
{
  i[24:0]
}

function {:inline} $trunc.bv64.bv16(i: bv64) : bv16
{
  i[16:0]
}

function {:inline} $trunc.bv64.bv8(i: bv64) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv64.bv1(i: bv64) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv56.bv48(i: bv56) : bv48
{
  i[48:0]
}

function {:inline} $trunc.bv56.bv40(i: bv56) : bv40
{
  i[40:0]
}

function {:inline} $trunc.bv56.bv32(i: bv56) : bv32
{
  i[32:0]
}

function {:inline} $trunc.bv56.bv24(i: bv56) : bv24
{
  i[24:0]
}

function {:inline} $trunc.bv56.bv16(i: bv56) : bv16
{
  i[16:0]
}

function {:inline} $trunc.bv56.bv8(i: bv56) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv56.bv1(i: bv56) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv48.bv32(i: bv48) : bv32
{
  i[32:0]
}

function {:inline} $trunc.bv48.bv24(i: bv48) : bv24
{
  i[24:0]
}

function {:inline} $trunc.bv48.bv16(i: bv48) : bv16
{
  i[16:0]
}

function {:inline} $trunc.bv48.bv8(i: bv48) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv48.bv1(i: bv48) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv40.bv32(i: bv40) : bv32
{
  i[32:0]
}

function {:inline} $trunc.bv40.bv24(i: bv40) : bv24
{
  i[24:0]
}

function {:inline} $trunc.bv40.bv16(i: bv40) : bv16
{
  i[16:0]
}

function {:inline} $trunc.bv40.bv8(i: bv40) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv40.bv1(i: bv40) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv32.bv24(i: bv32) : bv24
{
  i[24:0]
}

function {:inline} $trunc.bv32.bv16(i: bv32) : bv16
{
  i[16:0]
}

function {:inline} $trunc.bv32.bv8(i: bv32) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv32.bv1(i: bv32) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv24.bv16(i: bv24) : bv16
{
  i[16:0]
}

function {:inline} $trunc.bv24.bv8(i: bv24) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv24.bv1(i: bv24) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv16.bv8(i: bv16) : bv8
{
  i[8:0]
}

function {:inline} $trunc.bv16.bv1(i: bv16) : bv1
{
  i[1:0]
}

function {:inline} $trunc.bv8.bv1(i: bv8) : bv1
{
  i[1:0]
}

function {:inline} $zext.bv1.bv8(i: bv1) : bv8
{
  (if i == 0bv1 then 0bv8 else 1bv8)
}

function {:inline} $zext.bv1.bv16(i: bv1) : bv16
{
  (if i == 0bv1 then 0bv16 else 1bv16)
}

function {:inline} $zext.bv1.bv24(i: bv1) : bv24
{
  (if i == 0bv1 then 0bv24 else 1bv24)
}

function {:inline} $zext.bv1.bv32(i: bv1) : bv32
{
  (if i == 0bv1 then 0bv32 else 1bv32)
}

function {:inline} $zext.bv1.bv40(i: bv1) : bv40
{
  (if i == 0bv1 then 0bv40 else 1bv40)
}

function {:inline} $zext.bv1.bv48(i: bv1) : bv48
{
  (if i == 0bv1 then 0bv48 else 1bv48)
}

function {:inline} $zext.bv1.bv56(i: bv1) : bv56
{
  (if i == 0bv1 then 0bv56 else 1bv56)
}

function {:inline} $zext.bv1.bv64(i: bv1) : bv64
{
  (if i == 0bv1 then 0bv64 else 1bv64)
}

function {:inline} $zext.bv1.bv88(i: bv1) : bv88
{
  (if i == 0bv1 then 0bv88 else 1bv88)
}

function {:inline} $zext.bv1.bv96(i: bv1) : bv96
{
  (if i == 0bv1 then 0bv96 else 1bv96)
}

function {:inline} $zext.bv1.bv128(i: bv1) : bv128
{
  (if i == 0bv1 then 0bv128 else 1bv128)
}

function {:bvbuiltin "(_ zero_extend 8)"} $zext.bv8.bv16(i: bv8) : bv16;

function {:bvbuiltin "(_ zero_extend 16)"} $zext.bv8.bv24(i: bv8) : bv24;

function {:bvbuiltin "(_ zero_extend 24)"} $zext.bv8.bv32(i: bv8) : bv32;

function {:bvbuiltin "(_ zero_extend 32)"} $zext.bv8.bv40(i: bv8) : bv40;

function {:bvbuiltin "(_ zero_extend 40)"} $zext.bv8.bv48(i: bv8) : bv48;

function {:bvbuiltin "(_ zero_extend 48)"} $zext.bv8.bv56(i: bv8) : bv56;

function {:bvbuiltin "(_ zero_extend 56)"} $zext.bv8.bv64(i: bv8) : bv64;

function {:bvbuiltin "(_ zero_extend 80)"} $zext.bv8.bv88(i: bv8) : bv88;

function {:bvbuiltin "(_ zero_extend 88)"} $zext.bv8.bv96(i: bv8) : bv96;

function {:bvbuiltin "(_ zero_extend 120)"} $zext.bv8.bv128(i: bv8) : bv128;

function {:bvbuiltin "(_ zero_extend 8)"} $zext.bv16.bv24(i: bv16) : bv24;

function {:bvbuiltin "(_ zero_extend 16)"} $zext.bv16.bv32(i: bv16) : bv32;

function {:bvbuiltin "(_ zero_extend 24)"} $zext.bv16.bv40(i: bv16) : bv40;

function {:bvbuiltin "(_ zero_extend 32)"} $zext.bv16.bv48(i: bv16) : bv48;

function {:bvbuiltin "(_ zero_extend 40)"} $zext.bv16.bv56(i: bv16) : bv56;

function {:bvbuiltin "(_ zero_extend 48)"} $zext.bv16.bv64(i: bv16) : bv64;

function {:bvbuiltin "(_ zero_extend 72)"} $zext.bv16.bv88(i: bv16) : bv88;

function {:bvbuiltin "(_ zero_extend 80)"} $zext.bv16.bv96(i: bv16) : bv96;

function {:bvbuiltin "(_ zero_extend 112)"} $zext.bv16.bv128(i: bv16) : bv128;

function {:bvbuiltin "(_ zero_extend 8)"} $zext.bv24.bv32(i: bv24) : bv32;

function {:bvbuiltin "(_ zero_extend 16)"} $zext.bv24.bv40(i: bv24) : bv40;

function {:bvbuiltin "(_ zero_extend 24)"} $zext.bv24.bv48(i: bv24) : bv48;

function {:bvbuiltin "(_ zero_extend 32)"} $zext.bv24.bv56(i: bv24) : bv56;

function {:bvbuiltin "(_ zero_extend 40)"} $zext.bv24.bv64(i: bv24) : bv64;

function {:bvbuiltin "(_ zero_extend 64)"} $zext.bv24.bv88(i: bv24) : bv88;

function {:bvbuiltin "(_ zero_extend 72)"} $zext.bv24.bv96(i: bv24) : bv96;

function {:bvbuiltin "(_ zero_extend 104)"} $zext.bv24.bv128(i: bv24) : bv128;

function {:bvbuiltin "(_ zero_extend 8)"} $zext.bv32.bv40(i: bv32) : bv40;

function {:bvbuiltin "(_ zero_extend 16)"} $zext.bv32.bv48(i: bv32) : bv48;

function {:bvbuiltin "(_ zero_extend 24)"} $zext.bv32.bv56(i: bv32) : bv56;

function {:bvbuiltin "(_ zero_extend 32)"} $zext.bv32.bv64(i: bv32) : bv64;

function {:bvbuiltin "(_ zero_extend 56)"} $zext.bv32.bv88(i: bv32) : bv88;

function {:bvbuiltin "(_ zero_extend 64)"} $zext.bv32.bv96(i: bv32) : bv96;

function {:bvbuiltin "(_ zero_extend 96)"} $zext.bv32.bv128(i: bv32) : bv128;

function {:bvbuiltin "(_ zero_extend 8)"} $zext.bv40.bv48(i: bv40) : bv48;

function {:bvbuiltin "(_ zero_extend 16)"} $zext.bv40.bv56(i: bv40) : bv56;

function {:bvbuiltin "(_ zero_extend 24)"} $zext.bv40.bv64(i: bv40) : bv64;

function {:bvbuiltin "(_ zero_extend 48)"} $zext.bv40.bv88(i: bv40) : bv88;

function {:bvbuiltin "(_ zero_extend 56)"} $zext.bv40.bv96(i: bv40) : bv96;

function {:bvbuiltin "(_ zero_extend 88)"} $zext.bv40.bv128(i: bv40) : bv128;

function {:bvbuiltin "(_ zero_extend 16)"} $zext.bv48.bv64(i: bv48) : bv64;

function {:bvbuiltin "(_ zero_extend 40)"} $zext.bv48.bv88(i: bv48) : bv88;

function {:bvbuiltin "(_ zero_extend 48)"} $zext.bv48.bv96(i: bv48) : bv96;

function {:bvbuiltin "(_ zero_extend 80)"} $zext.bv48.bv128(i: bv48) : bv128;

function {:bvbuiltin "(_ zero_extend 8)"} $zext.bv56.bv64(i: bv56) : bv64;

function {:bvbuiltin "(_ zero_extend 32)"} $zext.bv56.bv88(i: bv56) : bv88;

function {:bvbuiltin "(_ zero_extend 40)"} $zext.bv56.bv96(i: bv56) : bv96;

function {:bvbuiltin "(_ zero_extend 72)"} $zext.bv56.bv128(i: bv56) : bv128;

function {:bvbuiltin "(_ zero_extend 24)"} $zext.bv64.bv88(i: bv64) : bv88;

function {:bvbuiltin "(_ zero_extend 32)"} $zext.bv64.bv96(i: bv64) : bv96;

function {:bvbuiltin "(_ zero_extend 64)"} $zext.bv64.bv128(i: bv64) : bv128;

function {:bvbuiltin "(_ zero_extend 8)"} $zext.bv88.bv96(i: bv88) : bv96;

function {:bvbuiltin "(_ zero_extend 40)"} $zext.bv88.bv128(i: bv88) : bv128;

function {:bvbuiltin "(_ zero_extend 32)"} $zext.bv96.bv128(i: bv96) : bv128;

function {:inline} $sext.bv1.bv8(i: bv1) : bv8
{
  (if i == 0bv1 then 0bv8 else 255bv8)
}

function {:inline} $sext.bv1.bv16(i: bv1) : bv16
{
  (if i == 0bv1 then 0bv16 else 65535bv16)
}

function {:inline} $sext.bv1.bv24(i: bv1) : bv24
{
  (if i == 0bv1 then 0bv24 else 16777215bv24)
}

function {:inline} $sext.bv1.bv32(i: bv1) : bv32
{
  (if i == 0bv1 then 0bv32 else 4294967295bv32)
}

function {:inline} $sext.bv1.bv40(i: bv1) : bv40
{
  (if i == 0bv1 then 0bv40 else 1099511627775bv40)
}

function {:inline} $sext.bv1.bv48(i: bv1) : bv48
{
  (if i == 0bv1 then 0bv48 else 281474976710655bv48)
}

function {:inline} $sext.bv1.bv56(i: bv1) : bv56
{
  (if i == 0bv1 then 0bv56 else 72057594037927935bv56)
}

function {:inline} $sext.bv1.bv64(i: bv1) : bv64
{
  (if i == 0bv1 then 0bv64 else 18446744073709551615bv64)
}

function {:inline} $sext.bv1.bv88(i: bv1) : bv88
{
  (if i == 0bv1 then 0bv88 else 309485009821345068724781055bv88)
}

function {:inline} $sext.bv1.bv96(i: bv1) : bv96
{
  (if i == 0bv1 then 0bv96 else 79228162514264337593543950335bv96)
}

function {:inline} $sext.bv1.bv128(i: bv1) : bv128
{
  (if i == 0bv1 then 0bv128 else 340282366920938463463374607431768211455bv128)
}

function {:bvbuiltin "(_ sign_extend 8)"} $sext.bv8.bv16(i: bv8) : bv16;

function {:bvbuiltin "(_ sign_extend 16)"} $sext.bv8.bv24(i: bv8) : bv24;

function {:bvbuiltin "(_ sign_extend 24)"} $sext.bv8.bv32(i: bv8) : bv32;

function {:bvbuiltin "(_ sign_extend 32)"} $sext.bv8.bv40(i: bv8) : bv40;

function {:bvbuiltin "(_ sign_extend 40)"} $sext.bv8.bv48(i: bv8) : bv48;

function {:bvbuiltin "(_ sign_extend 48)"} $sext.bv8.bv56(i: bv8) : bv56;

function {:bvbuiltin "(_ sign_extend 56)"} $sext.bv8.bv64(i: bv8) : bv64;

function {:bvbuiltin "(_ sign_extend 80)"} $sext.bv8.bv88(i: bv8) : bv88;

function {:bvbuiltin "(_ sign_extend 88)"} $sext.bv8.bv96(i: bv8) : bv96;

function {:bvbuiltin "(_ sign_extend 120)"} $sext.bv8.bv128(i: bv8) : bv128;

function {:bvbuiltin "(_ sign_extend 8)"} $sext.bv16.bv24(i: bv16) : bv24;

function {:bvbuiltin "(_ sign_extend 16)"} $sext.bv16.bv32(i: bv16) : bv32;

function {:bvbuiltin "(_ sign_extend 24)"} $sext.bv16.bv40(i: bv16) : bv40;

function {:bvbuiltin "(_ sign_extend 32)"} $sext.bv16.bv48(i: bv16) : bv48;

function {:bvbuiltin "(_ sign_extend 40)"} $sext.bv16.bv56(i: bv16) : bv56;

function {:bvbuiltin "(_ sign_extend 48)"} $sext.bv16.bv64(i: bv16) : bv64;

function {:bvbuiltin "(_ sign_extend 72)"} $sext.bv16.bv88(i: bv16) : bv88;

function {:bvbuiltin "(_ sign_extend 80)"} $sext.bv16.bv96(i: bv16) : bv96;

function {:bvbuiltin "(_ sign_extend 112)"} $sext.bv16.bv128(i: bv16) : bv128;

function {:bvbuiltin "(_ sign_extend 8)"} $sext.bv24.bv32(i: bv24) : bv32;

function {:bvbuiltin "(_ sign_extend 16)"} $sext.bv24.bv40(i: bv24) : bv40;

function {:bvbuiltin "(_ sign_extend 24)"} $sext.bv24.bv48(i: bv24) : bv48;

function {:bvbuiltin "(_ sign_extend 32)"} $sext.bv24.bv56(i: bv24) : bv56;

function {:bvbuiltin "(_ sign_extend 40)"} $sext.bv24.bv64(i: bv24) : bv64;

function {:bvbuiltin "(_ sign_extend 64)"} $sext.bv24.bv88(i: bv24) : bv88;

function {:bvbuiltin "(_ sign_extend 72)"} $sext.bv24.bv96(i: bv24) : bv96;

function {:bvbuiltin "(_ sign_extend 104)"} $sext.bv24.bv128(i: bv24) : bv128;

function {:bvbuiltin "(_ sign_extend 8)"} $sext.bv32.bv40(i: bv32) : bv40;

function {:bvbuiltin "(_ sign_extend 16)"} $sext.bv32.bv48(i: bv32) : bv48;

function {:bvbuiltin "(_ sign_extend 24)"} $sext.bv32.bv56(i: bv32) : bv56;

function {:bvbuiltin "(_ sign_extend 32)"} $sext.bv32.bv64(i: bv32) : bv64;

function {:bvbuiltin "(_ sign_extend 56)"} $sext.bv32.bv88(i: bv32) : bv88;

function {:bvbuiltin "(_ sign_extend 64)"} $sext.bv32.bv96(i: bv32) : bv96;

function {:bvbuiltin "(_ sign_extend 96)"} $sext.bv32.bv128(i: bv32) : bv128;

function {:bvbuiltin "(_ sign_extend 8)"} $sext.bv40.bv48(i: bv40) : bv48;

function {:bvbuiltin "(_ sign_extend 16)"} $sext.bv40.bv56(i: bv40) : bv56;

function {:bvbuiltin "(_ sign_extend 24)"} $sext.bv40.bv64(i: bv40) : bv64;

function {:bvbuiltin "(_ sign_extend 48)"} $sext.bv40.bv88(i: bv40) : bv88;

function {:bvbuiltin "(_ sign_extend 56)"} $sext.bv40.bv96(i: bv40) : bv96;

function {:bvbuiltin "(_ sign_extend 88)"} $sext.bv40.bv128(i: bv40) : bv128;

function {:bvbuiltin "(_ sign_extend 8)"} $sext.bv48.bv56(i: bv48) : bv56;

function {:bvbuiltin "(_ sign_extend 16)"} $sext.bv48.bv64(i: bv48) : bv64;

function {:bvbuiltin "(_ sign_extend 40)"} $sext.bv48.bv88(i: bv48) : bv88;

function {:bvbuiltin "(_ sign_extend 48)"} $sext.bv48.bv96(i: bv48) : bv96;

function {:bvbuiltin "(_ sign_extend 80)"} $sext.bv48.bv128(i: bv48) : bv128;

function {:bvbuiltin "(_ sign_extend 8)"} $sext.bv56.bv64(i: bv56) : bv64;

function {:bvbuiltin "(_ sign_extend 32)"} $sext.bv56.bv88(i: bv56) : bv88;

function {:bvbuiltin "(_ sign_extend 40)"} $sext.bv56.bv96(i: bv56) : bv96;

function {:bvbuiltin "(_ sign_extend 72)"} $sext.bv56.bv128(i: bv56) : bv128;

function {:bvbuiltin "(_ sign_extend 24)"} $sext.bv64.bv88(i: bv64) : bv88;

function {:bvbuiltin "(_ sign_extend 32)"} $sext.bv64.bv96(i: bv64) : bv96;

function {:bvbuiltin "(_ sign_extend 64)"} $sext.bv64.bv128(i: bv64) : bv128;

function {:bvbuiltin "(_ sign_extend 8)"} $sext.bv88.bv96(i: bv88) : bv96;

function {:bvbuiltin "(_ sign_extend 40)"} $sext.bv88.bv128(i: bv88) : bv128;

function {:bvbuiltin "(_ sign_extend 32)"} $sext.bv96.bv128(i: bv96) : bv128;

function {:inline} $add.i128(i1: i128, i2: i128) : i128
{
  i1 + i2
}

function {:inline} $add.i96(i1: i96, i2: i96) : i96
{
  i1 + i2
}

function {:inline} $add.i88(i1: i88, i2: i88) : i88
{
  i1 + i2
}

function {:inline} $add.i64(i1: i64, i2: i64) : i64
{
  i1 + i2
}

function {:inline} $add.i56(i1: i56, i2: i56) : i56
{
  i1 + i2
}

function {:inline} $add.i48(i1: i48, i2: i48) : i48
{
  i1 + i2
}

function {:inline} $add.i40(i1: i40, i2: i40) : i40
{
  i1 + i2
}

function {:inline} $add.i32(i1: i32, i2: i32) : i32
{
  i1 + i2
}

function {:inline} $add.i24(i1: i24, i2: i24) : i24
{
  i1 + i2
}

function {:inline} $add.i16(i1: i16, i2: i16) : i16
{
  i1 + i2
}

function {:inline} $add.i8(i1: i8, i2: i8) : i8
{
  i1 + i2
}

function {:inline} $add.i1(i1: i1, i2: i1) : i1
{
  i1 + i2
}

function {:inline} $sub.i128(i1: i128, i2: i128) : i128
{
  i1 - i2
}

function {:inline} $sub.i96(i1: i96, i2: i96) : i96
{
  i1 - i2
}

function {:inline} $sub.i88(i1: i88, i2: i88) : i88
{
  i1 - i2
}

function {:inline} $sub.i64(i1: i64, i2: i64) : i64
{
  i1 - i2
}

function {:inline} $sub.i56(i1: i56, i2: i56) : i56
{
  i1 - i2
}

function {:inline} $sub.i48(i1: i48, i2: i48) : i48
{
  i1 - i2
}

function {:inline} $sub.i40(i1: i40, i2: i40) : i40
{
  i1 - i2
}

function {:inline} $sub.i32(i1: i32, i2: i32) : i32
{
  i1 - i2
}

function {:inline} $sub.i24(i1: i24, i2: i24) : i24
{
  i1 - i2
}

function {:inline} $sub.i16(i1: i16, i2: i16) : i16
{
  i1 - i2
}

function {:inline} $sub.i8(i1: i8, i2: i8) : i8
{
  i1 - i2
}

function {:inline} $sub.i1(i1: i1, i2: i1) : i1
{
  i1 - i2
}

function {:inline} $mul.i128(i1: i128, i2: i128) : i128
{
  i1 * i2
}

function {:inline} $mul.i96(i1: i96, i2: i96) : i96
{
  i1 * i2
}

function {:inline} $mul.i88(i1: i88, i2: i88) : i88
{
  i1 * i2
}

function {:inline} $mul.i64(i1: i64, i2: i64) : i64
{
  i1 * i2
}

function {:inline} $mul.i56(i1: i56, i2: i56) : i56
{
  i1 * i2
}

function {:inline} $mul.i48(i1: i48, i2: i48) : i48
{
  i1 * i2
}

function {:inline} $mul.i40(i1: i40, i2: i40) : i40
{
  i1 * i2
}

function {:inline} $mul.i32(i1: i32, i2: i32) : i32
{
  i1 * i2
}

function {:inline} $mul.i24(i1: i24, i2: i24) : i24
{
  i1 * i2
}

function {:inline} $mul.i16(i1: i16, i2: i16) : i16
{
  i1 * i2
}

function {:inline} $mul.i8(i1: i8, i2: i8) : i8
{
  i1 * i2
}

function {:inline} $mul.i1(i1: i1, i2: i1) : i1
{
  i1 * i2
}

function {:builtin "div"} $div(i1: int, i2: int) : int;

function {:builtin "mod"} $mod(i1: int, i2: int) : int;

function {:builtin "rem"} $rem(i1: int, i2: int) : int;

function {:inline} $min(i1: int, i2: int) : int
{
  (if i1 < i2 then i1 else i2)
}

function {:inline} $max(i1: int, i2: int) : int
{
  (if i1 > i2 then i1 else i2)
}

function {:builtin "div"} $sdiv.i128(i1: i128, i2: i128) : i128;

function {:builtin "div"} $sdiv.i96(i1: i96, i2: i96) : i96;

function {:builtin "div"} $sdiv.i88(i1: i88, i2: i88) : i88;

function {:builtin "div"} $sdiv.i64(i1: i64, i2: i64) : i64;

function {:builtin "div"} $sdiv.i56(i1: i56, i2: i56) : i56;

function {:builtin "div"} $sdiv.i48(i1: i48, i2: i48) : i48;

function {:builtin "div"} $sdiv.i40(i1: i40, i2: i40) : i40;

function {:builtin "div"} $sdiv.i32(i1: i32, i2: i32) : i32;

function {:builtin "div"} $sdiv.i24(i1: i24, i2: i24) : i24;

function {:builtin "div"} $sdiv.i16(i1: i16, i2: i16) : i16;

function {:builtin "div"} $sdiv.i8(i1: i8, i2: i8) : i8;

function {:builtin "div"} $sdiv.i1(i1: i1, i2: i1) : i1;

function {:builtin "mod"} $smod.i128(i1: i128, i2: i128) : i128;

function {:builtin "mod"} $smod.i96(i1: i96, i2: i96) : i96;

function {:builtin "mod"} $smod.i88(i1: i88, i2: i88) : i88;

function {:builtin "mod"} $smod.i64(i1: i64, i2: i64) : i64;

function {:builtin "mod"} $smod.i56(i1: i56, i2: i56) : i56;

function {:builtin "mod"} $smod.i48(i1: i48, i2: i48) : i48;

function {:builtin "mod"} $smod.i40(i1: i40, i2: i40) : i40;

function {:builtin "mod"} $smod.i32(i1: i32, i2: i32) : i32;

function {:builtin "mod"} $smod.i24(i1: i24, i2: i24) : i24;

function {:builtin "mod"} $smod.i16(i1: i16, i2: i16) : i16;

function {:builtin "mod"} $smod.i8(i1: i8, i2: i8) : i8;

function {:builtin "mod"} $smod.i1(i1: i1, i2: i1) : i1;

function {:builtin "rem"} $srem.i128(i1: i128, i2: i128) : i128;

function {:builtin "rem"} $srem.i96(i1: i96, i2: i96) : i96;

function {:builtin "rem"} $srem.i88(i1: i88, i2: i88) : i88;

function {:builtin "rem"} $srem.i64(i1: i64, i2: i64) : i64;

function {:builtin "rem"} $srem.i56(i1: i56, i2: i56) : i56;

function {:builtin "rem"} $srem.i48(i1: i48, i2: i48) : i48;

function {:builtin "rem"} $srem.i40(i1: i40, i2: i40) : i40;

function {:builtin "rem"} $srem.i32(i1: i32, i2: i32) : i32;

function {:builtin "rem"} $srem.i24(i1: i24, i2: i24) : i24;

function {:builtin "rem"} $srem.i16(i1: i16, i2: i16) : i16;

function {:builtin "rem"} $srem.i8(i1: i8, i2: i8) : i8;

function {:builtin "rem"} $srem.i1(i1: i1, i2: i1) : i1;

function {:builtin "div"} $udiv.i128(i1: i128, i2: i128) : i128;

function {:builtin "div"} $udiv.i96(i1: i96, i2: i96) : i96;

function {:builtin "div"} $udiv.i88(i1: i88, i2: i88) : i88;

function {:builtin "div"} $udiv.i64(i1: i64, i2: i64) : i64;

function {:builtin "div"} $udiv.i56(i1: i56, i2: i56) : i56;

function {:builtin "div"} $udiv.i48(i1: i48, i2: i48) : i48;

function {:builtin "div"} $udiv.i40(i1: i40, i2: i40) : i40;

function {:builtin "div"} $udiv.i32(i1: i32, i2: i32) : i32;

function {:builtin "div"} $udiv.i24(i1: i24, i2: i24) : i24;

function {:builtin "div"} $udiv.i16(i1: i16, i2: i16) : i16;

function {:builtin "div"} $udiv.i8(i1: i8, i2: i8) : i8;

function {:builtin "div"} $udiv.i1(i1: i1, i2: i1) : i1;

function {:builtin "rem"} $urem.i128(i1: i128, i2: i128) : i128;

function {:builtin "rem"} $urem.i96(i1: i96, i2: i96) : i96;

function {:builtin "rem"} $urem.i88(i1: i88, i2: i88) : i88;

function {:builtin "rem"} $urem.i64(i1: i64, i2: i64) : i64;

function {:builtin "rem"} $urem.i56(i1: i56, i2: i56) : i56;

function {:builtin "rem"} $urem.i48(i1: i48, i2: i48) : i48;

function {:builtin "rem"} $urem.i40(i1: i40, i2: i40) : i40;

function {:builtin "rem"} $urem.i32(i1: i32, i2: i32) : i32;

function {:builtin "rem"} $urem.i24(i1: i24, i2: i24) : i24;

function {:builtin "rem"} $urem.i16(i1: i16, i2: i16) : i16;

function {:builtin "rem"} $urem.i8(i1: i8, i2: i8) : i8;

function {:builtin "rem"} $urem.i1(i1: i1, i2: i1) : i1;

function {:inline} $smin.i128(i1: i128, i2: i128) : i128
{
  $min(i1, i2)
}

function {:inline} $smin.i96(i1: i96, i2: i96) : i96
{
  $min(i1, i2)
}

function {:inline} $smin.i88(i1: i88, i2: i88) : i88
{
  $min(i1, i2)
}

function {:inline} $smin.i64(i1: i64, i2: i64) : i64
{
  $min(i1, i2)
}

function {:inline} $smin.i56(i1: i56, i2: i56) : i56
{
  $min(i1, i2)
}

function {:inline} $smin.i48(i1: i48, i2: i48) : i48
{
  $min(i1, i2)
}

function {:inline} $smin.i40(i1: i40, i2: i40) : i40
{
  $min(i1, i2)
}

function {:inline} $smin.i32(i1: i32, i2: i32) : i32
{
  $min(i1, i2)
}

function {:inline} $smin.i24(i1: i24, i2: i24) : i24
{
  $min(i1, i2)
}

function {:inline} $smin.i16(i1: i16, i2: i16) : i16
{
  $min(i1, i2)
}

function {:inline} $smin.i8(i1: i8, i2: i8) : i8
{
  $min(i1, i2)
}

function {:inline} $smin.i1(i1: i1, i2: i1) : i1
{
  $min(i1, i2)
}

function {:inline} $smax.i128(i1: i128, i2: i128) : i128
{
  $max(i1, i2)
}

function {:inline} $smax.i96(i1: i96, i2: i96) : i96
{
  $max(i1, i2)
}

function {:inline} $smax.i88(i1: i88, i2: i88) : i88
{
  $max(i1, i2)
}

function {:inline} $smax.i64(i1: i64, i2: i64) : i64
{
  $max(i1, i2)
}

function {:inline} $smax.i56(i1: i56, i2: i56) : i56
{
  $max(i1, i2)
}

function {:inline} $smax.i48(i1: i48, i2: i48) : i48
{
  $max(i1, i2)
}

function {:inline} $smax.i40(i1: i40, i2: i40) : i40
{
  $max(i1, i2)
}

function {:inline} $smax.i32(i1: i32, i2: i32) : i32
{
  $max(i1, i2)
}

function {:inline} $smax.i24(i1: i24, i2: i24) : i24
{
  $max(i1, i2)
}

function {:inline} $smax.i16(i1: i16, i2: i16) : i16
{
  $max(i1, i2)
}

function {:inline} $smax.i8(i1: i8, i2: i8) : i8
{
  $max(i1, i2)
}

function {:inline} $smax.i1(i1: i1, i2: i1) : i1
{
  $max(i1, i2)
}

function {:inline} $umin.i128(i1: i128, i2: i128) : i128
{
  $min(i1, i2)
}

function {:inline} $umin.i96(i1: i96, i2: i96) : i96
{
  $min(i1, i2)
}

function {:inline} $umin.i88(i1: i88, i2: i88) : i88
{
  $min(i1, i2)
}

function {:inline} $umin.i64(i1: i64, i2: i64) : i64
{
  $min(i1, i2)
}

function {:inline} $umin.i56(i1: i56, i2: i56) : i56
{
  $min(i1, i2)
}

function {:inline} $umin.i48(i1: i48, i2: i48) : i48
{
  $min(i1, i2)
}

function {:inline} $umin.i40(i1: i40, i2: i40) : i40
{
  $min(i1, i2)
}

function {:inline} $umin.i32(i1: i32, i2: i32) : i32
{
  $min(i1, i2)
}

function {:inline} $umin.i24(i1: i24, i2: i24) : i24
{
  $min(i1, i2)
}

function {:inline} $umin.i16(i1: i16, i2: i16) : i16
{
  $min(i1, i2)
}

function {:inline} $umin.i8(i1: i8, i2: i8) : i8
{
  $min(i1, i2)
}

function {:inline} $umin.i1(i1: i1, i2: i1) : i1
{
  $min(i1, i2)
}

function {:inline} $umax.i128(i1: i128, i2: i128) : i128
{
  $max(i1, i2)
}

function {:inline} $umax.i96(i1: i96, i2: i96) : i96
{
  $max(i1, i2)
}

function {:inline} $umax.i88(i1: i88, i2: i88) : i88
{
  $max(i1, i2)
}

function {:inline} $umax.i64(i1: i64, i2: i64) : i64
{
  $max(i1, i2)
}

function {:inline} $umax.i56(i1: i56, i2: i56) : i56
{
  $max(i1, i2)
}

function {:inline} $umax.i48(i1: i48, i2: i48) : i48
{
  $max(i1, i2)
}

function {:inline} $umax.i40(i1: i40, i2: i40) : i40
{
  $max(i1, i2)
}

function {:inline} $umax.i32(i1: i32, i2: i32) : i32
{
  $max(i1, i2)
}

function {:inline} $umax.i24(i1: i24, i2: i24) : i24
{
  $max(i1, i2)
}

function {:inline} $umax.i16(i1: i16, i2: i16) : i16
{
  $max(i1, i2)
}

function {:inline} $umax.i8(i1: i8, i2: i8) : i8
{
  $max(i1, i2)
}

function {:inline} $umax.i1(i1: i1, i2: i1) : i1
{
  $max(i1, i2)
}

function $shl.i128(i1: i128, i2: i128) : i128;

function $shl.i96(i1: i96, i2: i96) : i96;

function $shl.i88(i1: i88, i2: i88) : i88;

function $shl.i64(i1: i64, i2: i64) : i64;

function $shl.i56(i1: i56, i2: i56) : i56;

function $shl.i48(i1: i48, i2: i48) : i48;

function $shl.i40(i1: i40, i2: i40) : i40;

function $shl.i32(i1: i32, i2: i32) : i32;

function $shl.i24(i1: i24, i2: i24) : i24;

function $shl.i16(i1: i16, i2: i16) : i16;

function $shl.i8(i1: i8, i2: i8) : i8;

function $shl.i1(i1: i1, i2: i1) : i1;

function $lshr.i128(i1: i128, i2: i128) : i128;

function $lshr.i96(i1: i96, i2: i96) : i96;

function $lshr.i88(i1: i88, i2: i88) : i88;

function $lshr.i64(i1: i64, i2: i64) : i64;

function $lshr.i56(i1: i56, i2: i56) : i56;

function $lshr.i48(i1: i48, i2: i48) : i48;

function $lshr.i40(i1: i40, i2: i40) : i40;

function $lshr.i32(i1: i32, i2: i32) : i32;

function $lshr.i24(i1: i24, i2: i24) : i24;

function $lshr.i16(i1: i16, i2: i16) : i16;

function $lshr.i8(i1: i8, i2: i8) : i8;

function $lshr.i1(i1: i1, i2: i1) : i1;

function $ashr.i128(i1: i128, i2: i128) : i128;

function $ashr.i96(i1: i96, i2: i96) : i96;

function $ashr.i88(i1: i88, i2: i88) : i88;

function $ashr.i64(i1: i64, i2: i64) : i64;

function $ashr.i56(i1: i56, i2: i56) : i56;

function $ashr.i48(i1: i48, i2: i48) : i48;

function $ashr.i40(i1: i40, i2: i40) : i40;

function $ashr.i32(i1: i32, i2: i32) : i32;

function $ashr.i24(i1: i24, i2: i24) : i24;

function $ashr.i16(i1: i16, i2: i16) : i16;

function $ashr.i8(i1: i8, i2: i8) : i8;

function $ashr.i1(i1: i1, i2: i1) : i1;

function $not.i128(i: i128) : i128;

function $not.i96(i: i96) : i96;

function $not.i88(i: i88) : i88;

function $not.i64(i: i64) : i64;

function $not.i56(i: i56) : i56;

function $not.i48(i: i48) : i48;

function $not.i40(i: i40) : i40;

function $not.i32(i: i32) : i32;

function $not.i24(i: i24) : i24;

function $not.i16(i: i16) : i16;

function $not.i8(i: i8) : i8;

function $not.i1(i: i1) : i1;

function $and.i128(i1: i128, i2: i128) : i128;

function $and.i96(i1: i96, i2: i96) : i96;

function $and.i88(i1: i88, i2: i88) : i88;

function $and.i64(i1: i64, i2: i64) : i64;

function $and.i56(i1: i56, i2: i56) : i56;

function $and.i48(i1: i48, i2: i48) : i48;

function $and.i40(i1: i40, i2: i40) : i40;

function $and.i32(i1: i32, i2: i32) : i32;

function $and.i24(i1: i24, i2: i24) : i24;

function $and.i16(i1: i16, i2: i16) : i16;

function $and.i8(i1: i8, i2: i8) : i8;

function $and.i1(i1: i1, i2: i1) : i1;

function $or.i128(i1: i128, i2: i128) : i128;

function $or.i96(i1: i96, i2: i96) : i96;

function $or.i88(i1: i88, i2: i88) : i88;

function $or.i64(i1: i64, i2: i64) : i64;

function $or.i56(i1: i56, i2: i56) : i56;

function $or.i48(i1: i48, i2: i48) : i48;

function $or.i40(i1: i40, i2: i40) : i40;

function $or.i32(i1: i32, i2: i32) : i32;

function $or.i24(i1: i24, i2: i24) : i24;

function $or.i16(i1: i16, i2: i16) : i16;

function $or.i8(i1: i8, i2: i8) : i8;

function $or.i1(i1: i1, i2: i1) : i1;

function $xor.i128(i1: i128, i2: i128) : i128;

function $xor.i96(i1: i96, i2: i96) : i96;

function $xor.i88(i1: i88, i2: i88) : i88;

function $xor.i64(i1: i64, i2: i64) : i64;

function $xor.i56(i1: i56, i2: i56) : i56;

function $xor.i48(i1: i48, i2: i48) : i48;

function $xor.i40(i1: i40, i2: i40) : i40;

function $xor.i32(i1: i32, i2: i32) : i32;

function $xor.i24(i1: i24, i2: i24) : i24;

function $xor.i16(i1: i16, i2: i16) : i16;

function $xor.i8(i1: i8, i2: i8) : i8;

function $xor.i1(i1: i1, i2: i1) : i1;

function $nand.i128(i1: i128, i2: i128) : i128;

function $nand.i96(i1: i96, i2: i96) : i96;

function $nand.i88(i1: i88, i2: i88) : i88;

function $nand.i64(i1: i64, i2: i64) : i64;

function $nand.i56(i1: i56, i2: i56) : i56;

function $nand.i48(i1: i48, i2: i48) : i48;

function $nand.i40(i1: i40, i2: i40) : i40;

function $nand.i32(i1: i32, i2: i32) : i32;

function $nand.i24(i1: i24, i2: i24) : i24;

function $nand.i16(i1: i16, i2: i16) : i16;

function $nand.i8(i1: i8, i2: i8) : i8;

function $nand.i1(i1: i1, i2: i1) : i1;

function {:inline} $eq.i128.bool(i1: i128, i2: i128) : bool
{
  i1 == i2
}

function {:inline} $eq.i128(i1: i128, i2: i128) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i96.bool(i1: i96, i2: i96) : bool
{
  i1 == i2
}

function {:inline} $eq.i96(i1: i96, i2: i96) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i88.bool(i1: i88, i2: i88) : bool
{
  i1 == i2
}

function {:inline} $eq.i88(i1: i88, i2: i88) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i64.bool(i1: i64, i2: i64) : bool
{
  i1 == i2
}

function {:inline} $eq.i64(i1: i64, i2: i64) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i56.bool(i1: i56, i2: i56) : bool
{
  i1 == i2
}

function {:inline} $eq.i56(i1: i56, i2: i56) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i48.bool(i1: i48, i2: i48) : bool
{
  i1 == i2
}

function {:inline} $eq.i48(i1: i48, i2: i48) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i40.bool(i1: i40, i2: i40) : bool
{
  i1 == i2
}

function {:inline} $eq.i40(i1: i40, i2: i40) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i32.bool(i1: i32, i2: i32) : bool
{
  i1 == i2
}

function {:inline} $eq.i32(i1: i32, i2: i32) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i24.bool(i1: i24, i2: i24) : bool
{
  i1 == i2
}

function {:inline} $eq.i24(i1: i24, i2: i24) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i16.bool(i1: i16, i2: i16) : bool
{
  i1 == i2
}

function {:inline} $eq.i16(i1: i16, i2: i16) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i8.bool(i1: i8, i2: i8) : bool
{
  i1 == i2
}

function {:inline} $eq.i8(i1: i8, i2: i8) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $eq.i1.bool(i1: i1, i2: i1) : bool
{
  i1 == i2
}

function {:inline} $eq.i1(i1: i1, i2: i1) : i1
{
  (if i1 == i2 then 1 else 0)
}

function {:inline} $ne.i128.bool(i1: i128, i2: i128) : bool
{
  i1 != i2
}

function {:inline} $ne.i128(i1: i128, i2: i128) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i96.bool(i1: i96, i2: i96) : bool
{
  i1 != i2
}

function {:inline} $ne.i96(i1: i96, i2: i96) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i88.bool(i1: i88, i2: i88) : bool
{
  i1 != i2
}

function {:inline} $ne.i88(i1: i88, i2: i88) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i64.bool(i1: i64, i2: i64) : bool
{
  i1 != i2
}

function {:inline} $ne.i64(i1: i64, i2: i64) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i56.bool(i1: i56, i2: i56) : bool
{
  i1 != i2
}

function {:inline} $ne.i56(i1: i56, i2: i56) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i48.bool(i1: i48, i2: i48) : bool
{
  i1 != i2
}

function {:inline} $ne.i48(i1: i48, i2: i48) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i40.bool(i1: i40, i2: i40) : bool
{
  i1 != i2
}

function {:inline} $ne.i40(i1: i40, i2: i40) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i32.bool(i1: i32, i2: i32) : bool
{
  i1 != i2
}

function {:inline} $ne.i32(i1: i32, i2: i32) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i24.bool(i1: i24, i2: i24) : bool
{
  i1 != i2
}

function {:inline} $ne.i24(i1: i24, i2: i24) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i16.bool(i1: i16, i2: i16) : bool
{
  i1 != i2
}

function {:inline} $ne.i16(i1: i16, i2: i16) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i8.bool(i1: i8, i2: i8) : bool
{
  i1 != i2
}

function {:inline} $ne.i8(i1: i8, i2: i8) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ne.i1.bool(i1: i1, i2: i1) : bool
{
  i1 != i2
}

function {:inline} $ne.i1(i1: i1, i2: i1) : i1
{
  (if i1 != i2 then 1 else 0)
}

function {:inline} $ule.i128.bool(i1: i128, i2: i128) : bool
{
  i1 <= i2
}

function {:inline} $ule.i128(i1: i128, i2: i128) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i96.bool(i1: i96, i2: i96) : bool
{
  i1 <= i2
}

function {:inline} $ule.i96(i1: i96, i2: i96) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i88.bool(i1: i88, i2: i88) : bool
{
  i1 <= i2
}

function {:inline} $ule.i88(i1: i88, i2: i88) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i64.bool(i1: i64, i2: i64) : bool
{
  i1 <= i2
}

function {:inline} $ule.i64(i1: i64, i2: i64) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i56.bool(i1: i56, i2: i56) : bool
{
  i1 <= i2
}

function {:inline} $ule.i56(i1: i56, i2: i56) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i48.bool(i1: i48, i2: i48) : bool
{
  i1 <= i2
}

function {:inline} $ule.i48(i1: i48, i2: i48) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i40.bool(i1: i40, i2: i40) : bool
{
  i1 <= i2
}

function {:inline} $ule.i40(i1: i40, i2: i40) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i32.bool(i1: i32, i2: i32) : bool
{
  i1 <= i2
}

function {:inline} $ule.i32(i1: i32, i2: i32) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i24.bool(i1: i24, i2: i24) : bool
{
  i1 <= i2
}

function {:inline} $ule.i24(i1: i24, i2: i24) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i16.bool(i1: i16, i2: i16) : bool
{
  i1 <= i2
}

function {:inline} $ule.i16(i1: i16, i2: i16) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i8.bool(i1: i8, i2: i8) : bool
{
  i1 <= i2
}

function {:inline} $ule.i8(i1: i8, i2: i8) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ule.i1.bool(i1: i1, i2: i1) : bool
{
  i1 <= i2
}

function {:inline} $ule.i1(i1: i1, i2: i1) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $ult.i128.bool(i1: i128, i2: i128) : bool
{
  i1 < i2
}

function {:inline} $ult.i128(i1: i128, i2: i128) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i96.bool(i1: i96, i2: i96) : bool
{
  i1 < i2
}

function {:inline} $ult.i96(i1: i96, i2: i96) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i88.bool(i1: i88, i2: i88) : bool
{
  i1 < i2
}

function {:inline} $ult.i88(i1: i88, i2: i88) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i64.bool(i1: i64, i2: i64) : bool
{
  i1 < i2
}

function {:inline} $ult.i64(i1: i64, i2: i64) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i56.bool(i1: i56, i2: i56) : bool
{
  i1 < i2
}

function {:inline} $ult.i56(i1: i56, i2: i56) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i48.bool(i1: i48, i2: i48) : bool
{
  i1 < i2
}

function {:inline} $ult.i48(i1: i48, i2: i48) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i40.bool(i1: i40, i2: i40) : bool
{
  i1 < i2
}

function {:inline} $ult.i40(i1: i40, i2: i40) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i32.bool(i1: i32, i2: i32) : bool
{
  i1 < i2
}

function {:inline} $ult.i32(i1: i32, i2: i32) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i24.bool(i1: i24, i2: i24) : bool
{
  i1 < i2
}

function {:inline} $ult.i24(i1: i24, i2: i24) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i16.bool(i1: i16, i2: i16) : bool
{
  i1 < i2
}

function {:inline} $ult.i16(i1: i16, i2: i16) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i8.bool(i1: i8, i2: i8) : bool
{
  i1 < i2
}

function {:inline} $ult.i8(i1: i8, i2: i8) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $ult.i1.bool(i1: i1, i2: i1) : bool
{
  i1 < i2
}

function {:inline} $ult.i1(i1: i1, i2: i1) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $uge.i128.bool(i1: i128, i2: i128) : bool
{
  i1 >= i2
}

function {:inline} $uge.i128(i1: i128, i2: i128) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i96.bool(i1: i96, i2: i96) : bool
{
  i1 >= i2
}

function {:inline} $uge.i96(i1: i96, i2: i96) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i88.bool(i1: i88, i2: i88) : bool
{
  i1 >= i2
}

function {:inline} $uge.i88(i1: i88, i2: i88) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i64.bool(i1: i64, i2: i64) : bool
{
  i1 >= i2
}

function {:inline} $uge.i64(i1: i64, i2: i64) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i56.bool(i1: i56, i2: i56) : bool
{
  i1 >= i2
}

function {:inline} $uge.i56(i1: i56, i2: i56) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i48.bool(i1: i48, i2: i48) : bool
{
  i1 >= i2
}

function {:inline} $uge.i48(i1: i48, i2: i48) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i40.bool(i1: i40, i2: i40) : bool
{
  i1 >= i2
}

function {:inline} $uge.i40(i1: i40, i2: i40) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i32.bool(i1: i32, i2: i32) : bool
{
  i1 >= i2
}

function {:inline} $uge.i32(i1: i32, i2: i32) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i24.bool(i1: i24, i2: i24) : bool
{
  i1 >= i2
}

function {:inline} $uge.i24(i1: i24, i2: i24) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i16.bool(i1: i16, i2: i16) : bool
{
  i1 >= i2
}

function {:inline} $uge.i16(i1: i16, i2: i16) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i8.bool(i1: i8, i2: i8) : bool
{
  i1 >= i2
}

function {:inline} $uge.i8(i1: i8, i2: i8) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $uge.i1.bool(i1: i1, i2: i1) : bool
{
  i1 >= i2
}

function {:inline} $uge.i1(i1: i1, i2: i1) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $ugt.i128.bool(i1: i128, i2: i128) : bool
{
  i1 > i2
}

function {:inline} $ugt.i128(i1: i128, i2: i128) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i96.bool(i1: i96, i2: i96) : bool
{
  i1 > i2
}

function {:inline} $ugt.i96(i1: i96, i2: i96) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i88.bool(i1: i88, i2: i88) : bool
{
  i1 > i2
}

function {:inline} $ugt.i88(i1: i88, i2: i88) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i64.bool(i1: i64, i2: i64) : bool
{
  i1 > i2
}

function {:inline} $ugt.i64(i1: i64, i2: i64) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i56.bool(i1: i56, i2: i56) : bool
{
  i1 > i2
}

function {:inline} $ugt.i56(i1: i56, i2: i56) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i48.bool(i1: i48, i2: i48) : bool
{
  i1 > i2
}

function {:inline} $ugt.i48(i1: i48, i2: i48) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i40.bool(i1: i40, i2: i40) : bool
{
  i1 > i2
}

function {:inline} $ugt.i40(i1: i40, i2: i40) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i32.bool(i1: i32, i2: i32) : bool
{
  i1 > i2
}

function {:inline} $ugt.i32(i1: i32, i2: i32) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i24.bool(i1: i24, i2: i24) : bool
{
  i1 > i2
}

function {:inline} $ugt.i24(i1: i24, i2: i24) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i16.bool(i1: i16, i2: i16) : bool
{
  i1 > i2
}

function {:inline} $ugt.i16(i1: i16, i2: i16) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i8.bool(i1: i8, i2: i8) : bool
{
  i1 > i2
}

function {:inline} $ugt.i8(i1: i8, i2: i8) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $ugt.i1.bool(i1: i1, i2: i1) : bool
{
  i1 > i2
}

function {:inline} $ugt.i1(i1: i1, i2: i1) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sle.i128.bool(i1: i128, i2: i128) : bool
{
  i1 <= i2
}

function {:inline} $sle.i128(i1: i128, i2: i128) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i96.bool(i1: i96, i2: i96) : bool
{
  i1 <= i2
}

function {:inline} $sle.i96(i1: i96, i2: i96) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i88.bool(i1: i88, i2: i88) : bool
{
  i1 <= i2
}

function {:inline} $sle.i88(i1: i88, i2: i88) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i64.bool(i1: i64, i2: i64) : bool
{
  i1 <= i2
}

function {:inline} $sle.i64(i1: i64, i2: i64) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i56.bool(i1: i56, i2: i56) : bool
{
  i1 <= i2
}

function {:inline} $sle.i56(i1: i56, i2: i56) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i48.bool(i1: i48, i2: i48) : bool
{
  i1 <= i2
}

function {:inline} $sle.i48(i1: i48, i2: i48) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i40.bool(i1: i40, i2: i40) : bool
{
  i1 <= i2
}

function {:inline} $sle.i40(i1: i40, i2: i40) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i32.bool(i1: i32, i2: i32) : bool
{
  i1 <= i2
}

function {:inline} $sle.i32(i1: i32, i2: i32) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i24.bool(i1: i24, i2: i24) : bool
{
  i1 <= i2
}

function {:inline} $sle.i24(i1: i24, i2: i24) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i16.bool(i1: i16, i2: i16) : bool
{
  i1 <= i2
}

function {:inline} $sle.i16(i1: i16, i2: i16) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i8.bool(i1: i8, i2: i8) : bool
{
  i1 <= i2
}

function {:inline} $sle.i8(i1: i8, i2: i8) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $sle.i1.bool(i1: i1, i2: i1) : bool
{
  i1 <= i2
}

function {:inline} $sle.i1(i1: i1, i2: i1) : i1
{
  (if i1 <= i2 then 1 else 0)
}

function {:inline} $slt.i128.bool(i1: i128, i2: i128) : bool
{
  i1 < i2
}

function {:inline} $slt.i128(i1: i128, i2: i128) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i96.bool(i1: i96, i2: i96) : bool
{
  i1 < i2
}

function {:inline} $slt.i96(i1: i96, i2: i96) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i88.bool(i1: i88, i2: i88) : bool
{
  i1 < i2
}

function {:inline} $slt.i88(i1: i88, i2: i88) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i64.bool(i1: i64, i2: i64) : bool
{
  i1 < i2
}

function {:inline} $slt.i64(i1: i64, i2: i64) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i56.bool(i1: i56, i2: i56) : bool
{
  i1 < i2
}

function {:inline} $slt.i56(i1: i56, i2: i56) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i48.bool(i1: i48, i2: i48) : bool
{
  i1 < i2
}

function {:inline} $slt.i48(i1: i48, i2: i48) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i40.bool(i1: i40, i2: i40) : bool
{
  i1 < i2
}

function {:inline} $slt.i40(i1: i40, i2: i40) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i32.bool(i1: i32, i2: i32) : bool
{
  i1 < i2
}

function {:inline} $slt.i32(i1: i32, i2: i32) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i24.bool(i1: i24, i2: i24) : bool
{
  i1 < i2
}

function {:inline} $slt.i24(i1: i24, i2: i24) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i16.bool(i1: i16, i2: i16) : bool
{
  i1 < i2
}

function {:inline} $slt.i16(i1: i16, i2: i16) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i8.bool(i1: i8, i2: i8) : bool
{
  i1 < i2
}

function {:inline} $slt.i8(i1: i8, i2: i8) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $slt.i1.bool(i1: i1, i2: i1) : bool
{
  i1 < i2
}

function {:inline} $slt.i1(i1: i1, i2: i1) : i1
{
  (if i1 < i2 then 1 else 0)
}

function {:inline} $sge.i128.bool(i1: i128, i2: i128) : bool
{
  i1 >= i2
}

function {:inline} $sge.i128(i1: i128, i2: i128) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i96.bool(i1: i96, i2: i96) : bool
{
  i1 >= i2
}

function {:inline} $sge.i96(i1: i96, i2: i96) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i88.bool(i1: i88, i2: i88) : bool
{
  i1 >= i2
}

function {:inline} $sge.i88(i1: i88, i2: i88) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i64.bool(i1: i64, i2: i64) : bool
{
  i1 >= i2
}

function {:inline} $sge.i64(i1: i64, i2: i64) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i56.bool(i1: i56, i2: i56) : bool
{
  i1 >= i2
}

function {:inline} $sge.i56(i1: i56, i2: i56) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i48.bool(i1: i48, i2: i48) : bool
{
  i1 >= i2
}

function {:inline} $sge.i48(i1: i48, i2: i48) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i40.bool(i1: i40, i2: i40) : bool
{
  i1 >= i2
}

function {:inline} $sge.i40(i1: i40, i2: i40) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i32.bool(i1: i32, i2: i32) : bool
{
  i1 >= i2
}

function {:inline} $sge.i32(i1: i32, i2: i32) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i24.bool(i1: i24, i2: i24) : bool
{
  i1 >= i2
}

function {:inline} $sge.i24(i1: i24, i2: i24) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i16.bool(i1: i16, i2: i16) : bool
{
  i1 >= i2
}

function {:inline} $sge.i16(i1: i16, i2: i16) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i8.bool(i1: i8, i2: i8) : bool
{
  i1 >= i2
}

function {:inline} $sge.i8(i1: i8, i2: i8) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sge.i1.bool(i1: i1, i2: i1) : bool
{
  i1 >= i2
}

function {:inline} $sge.i1(i1: i1, i2: i1) : i1
{
  (if i1 >= i2 then 1 else 0)
}

function {:inline} $sgt.i128.bool(i1: i128, i2: i128) : bool
{
  i1 > i2
}

function {:inline} $sgt.i128(i1: i128, i2: i128) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i96.bool(i1: i96, i2: i96) : bool
{
  i1 > i2
}

function {:inline} $sgt.i96(i1: i96, i2: i96) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i88.bool(i1: i88, i2: i88) : bool
{
  i1 > i2
}

function {:inline} $sgt.i88(i1: i88, i2: i88) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i64.bool(i1: i64, i2: i64) : bool
{
  i1 > i2
}

function {:inline} $sgt.i64(i1: i64, i2: i64) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i56.bool(i1: i56, i2: i56) : bool
{
  i1 > i2
}

function {:inline} $sgt.i56(i1: i56, i2: i56) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i48.bool(i1: i48, i2: i48) : bool
{
  i1 > i2
}

function {:inline} $sgt.i48(i1: i48, i2: i48) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i40.bool(i1: i40, i2: i40) : bool
{
  i1 > i2
}

function {:inline} $sgt.i40(i1: i40, i2: i40) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i32.bool(i1: i32, i2: i32) : bool
{
  i1 > i2
}

function {:inline} $sgt.i32(i1: i32, i2: i32) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i24.bool(i1: i24, i2: i24) : bool
{
  i1 > i2
}

function {:inline} $sgt.i24(i1: i24, i2: i24) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i16.bool(i1: i16, i2: i16) : bool
{
  i1 > i2
}

function {:inline} $sgt.i16(i1: i16, i2: i16) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i8.bool(i1: i8, i2: i8) : bool
{
  i1 > i2
}

function {:inline} $sgt.i8(i1: i8, i2: i8) : i1
{
  (if i1 > i2 then 1 else 0)
}

function {:inline} $sgt.i1.bool(i1: i1, i2: i1) : bool
{
  i1 > i2
}

function {:inline} $sgt.i1(i1: i1, i2: i1) : i1
{
  (if i1 > i2 then 1 else 0)
}

axiom $and.i1(0, 0) == 0;

axiom $and.i1(0, 1) == 0;

axiom $and.i1(1, 0) == 0;

axiom $and.i1(1, 1) == 1;

axiom $or.i1(0, 0) == 0;

axiom $or.i1(0, 1) == 1;

axiom $or.i1(1, 0) == 1;

axiom $or.i1(1, 1) == 1;

axiom $xor.i1(0, 0) == 0;

axiom $xor.i1(0, 1) == 1;

axiom $xor.i1(1, 0) == 1;

axiom $xor.i1(1, 1) == 0;

axiom $and.i32(32, 16) == 0;

function {:inline} $trunc.i128.i96(i: i128) : i96
{
  i
}

function {:inline} $trunc.i128.i88(i: i128) : i88
{
  i
}

function {:inline} $trunc.i128.i64(i: i128) : i64
{
  i
}

function {:inline} $trunc.i128.i56(i: i128) : i56
{
  i
}

function {:inline} $trunc.i128.i48(i: i128) : i48
{
  i
}

function {:inline} $trunc.i128.i40(i: i128) : i40
{
  i
}

function {:inline} $trunc.i128.i32(i: i128) : i32
{
  i
}

function {:inline} $trunc.i128.i24(i: i128) : i24
{
  i
}

function {:inline} $trunc.i128.i16(i: i128) : i16
{
  i
}

function {:inline} $trunc.i128.i8(i: i128) : i8
{
  i
}

function {:inline} $trunc.i128.i1(i: i128) : i1
{
  i
}

function {:inline} $trunc.i96.i64(i: i96) : i64
{
  i
}

function {:inline} $trunc.i96.i88(i: i96) : i88
{
  i
}

function {:inline} $trunc.i96.i56(i: i96) : i56
{
  i
}

function {:inline} $trunc.i96.i48(i: i96) : i48
{
  i
}

function {:inline} $trunc.i96.i40(i: i96) : i40
{
  i
}

function {:inline} $trunc.i96.i32(i: i96) : i32
{
  i
}

function {:inline} $trunc.i96.i24(i: i96) : i24
{
  i
}

function {:inline} $trunc.i96.i16(i: i96) : i16
{
  i
}

function {:inline} $trunc.i96.i8(i: i96) : i8
{
  i
}

function {:inline} $trunc.i96.i1(i: i96) : i1
{
  i
}

function {:inline} $trunc.i88.i64(i: i88) : i64
{
  i
}

function {:inline} $trunc.i88.i88(i: i88) : i88
{
  i
}

function {:inline} $trunc.i88.i56(i: i88) : i56
{
  i
}

function {:inline} $trunc.i88.i48(i: i88) : i48
{
  i
}

function {:inline} $trunc.i88.i40(i: i88) : i40
{
  i
}

function {:inline} $trunc.i88.i32(i: i88) : i32
{
  i
}

function {:inline} $trunc.i88.i24(i: i88) : i24
{
  i
}

function {:inline} $trunc.i88.i16(i: i88) : i16
{
  i
}

function {:inline} $trunc.i88.i8(i: i88) : i8
{
  i
}

function {:inline} $trunc.i88.i1(i: i88) : i1
{
  i
}

function {:inline} $trunc.i64.i56(i: i64) : i56
{
  i
}

function {:inline} $trunc.i64.i48(i: i64) : i48
{
  i
}

function {:inline} $trunc.i64.i40(i: i64) : i40
{
  i
}

function {:inline} $trunc.i64.i32(i: i64) : i32
{
  i
}

function {:inline} $trunc.i64.i24(i: i64) : i24
{
  i
}

function {:inline} $trunc.i64.i16(i: i64) : i16
{
  i
}

function {:inline} $trunc.i64.i8(i: i64) : i8
{
  i
}

function {:inline} $trunc.i64.i1(i: i64) : i1
{
  i
}

function {:inline} $trunc.i56.i48(i: i56) : i48
{
  i
}

function {:inline} $trunc.i56.i40(i: i56) : i40
{
  i
}

function {:inline} $trunc.i56.i32(i: i56) : i32
{
  i
}

function {:inline} $trunc.i56.i24(i: i56) : i24
{
  i
}

function {:inline} $trunc.i56.i16(i: i56) : i16
{
  i
}

function {:inline} $trunc.i56.i8(i: i56) : i8
{
  i
}

function {:inline} $trunc.i56.i1(i: i56) : i1
{
  i
}

function {:inline} $trunc.i48.i40(i: i48) : i40
{
  i
}

function {:inline} $trunc.i48.i32(i: i48) : i32
{
  i
}

function {:inline} $trunc.i48.i24(i: i48) : i24
{
  i
}

function {:inline} $trunc.i48.i16(i: i48) : i16
{
  i
}

function {:inline} $trunc.i48.i8(i: i48) : i8
{
  i
}

function {:inline} $trunc.i48.i1(i: i48) : i1
{
  i
}

function {:inline} $trunc.i40.i32(i: i40) : i32
{
  i
}

function {:inline} $trunc.i40.i24(i: i40) : i24
{
  i
}

function {:inline} $trunc.i40.i16(i: i40) : i16
{
  i
}

function {:inline} $trunc.i40.i8(i: i40) : i8
{
  i
}

function {:inline} $trunc.i40.i1(i: i40) : i1
{
  i
}

function {:inline} $trunc.i32.i24(i: i32) : i24
{
  i
}

function {:inline} $trunc.i32.i16(i: i32) : i16
{
  i
}

function {:inline} $trunc.i32.i8(i: i32) : i8
{
  i
}

function {:inline} $trunc.i32.i1(i: i32) : i1
{
  i
}

function {:inline} $trunc.i24.i16(i: i24) : i16
{
  i
}

function {:inline} $trunc.i24.i8(i: i24) : i8
{
  i
}

function {:inline} $trunc.i24.i1(i: i24) : i1
{
  i
}

function {:inline} $trunc.i16.i8(i: i16) : i8
{
  i
}

function {:inline} $trunc.i16.i1(i: i16) : i1
{
  i
}

function {:inline} $trunc.i8.i1(i: i8) : i1
{
  i
}

function {:inline} $zext.i1.i8(i: i1) : i8
{
  i
}

function {:inline} $zext.i1.i16(i: i1) : i16
{
  i
}

function {:inline} $zext.i1.i24(i: i1) : i24
{
  i
}

function {:inline} $zext.i1.i32(i: i1) : i32
{
  i
}

function {:inline} $zext.i1.i40(i: i1) : i40
{
  i
}

function {:inline} $zext.i1.i48(i: i1) : i48
{
  i
}

function {:inline} $zext.i1.i56(i: i1) : i56
{
  i
}

function {:inline} $zext.i1.i64(i: i1) : i64
{
  i
}

function {:inline} $zext.i1.i88(i: i1) : i88
{
  i
}

function {:inline} $zext.i1.i96(i: i1) : i96
{
  i
}

function {:inline} $zext.i1.i128(i: i1) : i128
{
  i
}

function {:inline} $zext.i8.i16(i: i8) : i16
{
  i
}

function {:inline} $zext.i8.i24(i: i8) : i24
{
  i
}

function {:inline} $zext.i8.i32(i: i8) : i32
{
  i
}

function {:inline} $zext.i8.i40(i: i8) : i40
{
  i
}

function {:inline} $zext.i8.i48(i: i8) : i48
{
  i
}

function {:inline} $zext.i8.i56(i: i8) : i56
{
  i
}

function {:inline} $zext.i8.i64(i: i8) : i64
{
  i
}

function {:inline} $zext.i8.i88(i: i8) : i88
{
  i
}

function {:inline} $zext.i8.i96(i: i8) : i96
{
  i
}

function {:inline} $zext.i8.i128(i: i8) : i128
{
  i
}

function {:inline} $zext.i16.i24(i: i16) : i24
{
  i
}

function {:inline} $zext.i16.i32(i: i16) : i32
{
  i
}

function {:inline} $zext.i16.i40(i: i16) : i40
{
  i
}

function {:inline} $zext.i16.i48(i: i16) : i48
{
  i
}

function {:inline} $zext.i16.i56(i: i16) : i56
{
  i
}

function {:inline} $zext.i16.i64(i: i16) : i64
{
  i
}

function {:inline} $zext.i16.i88(i: i16) : i88
{
  i
}

function {:inline} $zext.i16.i96(i: i16) : i96
{
  i
}

function {:inline} $zext.i16.i128(i: i16) : i128
{
  i
}

function {:inline} $zext.i24.i32(i: i24) : i32
{
  i
}

function {:inline} $zext.i24.i40(i: i24) : i40
{
  i
}

function {:inline} $zext.i24.i48(i: i24) : i48
{
  i
}

function {:inline} $zext.i24.i56(i: i24) : i56
{
  i
}

function {:inline} $zext.i24.i64(i: i24) : i64
{
  i
}

function {:inline} $zext.i24.i88(i: i24) : i88
{
  i
}

function {:inline} $zext.i24.i96(i: i24) : i96
{
  i
}

function {:inline} $zext.i24.i128(i: i24) : i128
{
  i
}

function {:inline} $zext.i32.i40(i: i32) : i40
{
  i
}

function {:inline} $zext.i32.i48(i: i32) : i48
{
  i
}

function {:inline} $zext.i32.i56(i: i32) : i56
{
  i
}

function {:inline} $zext.i32.i64(i: i32) : i64
{
  i
}

function {:inline} $zext.i32.i88(i: i32) : i88
{
  i
}

function {:inline} $zext.i32.i96(i: i32) : i96
{
  i
}

function {:inline} $zext.i32.i128(i: i32) : i128
{
  i
}

function {:inline} $zext.i40.i48(i: i40) : i48
{
  i
}

function {:inline} $zext.i40.i56(i: i40) : i56
{
  i
}

function {:inline} $zext.i40.i64(i: i40) : i64
{
  i
}

function {:inline} $zext.i40.i88(i: i40) : i88
{
  i
}

function {:inline} $zext.i40.i96(i: i40) : i96
{
  i
}

function {:inline} $zext.i40.i128(i: i40) : i128
{
  i
}

function {:inline} $zext.i48.i56(i: i48) : i56
{
  i
}

function {:inline} $zext.i48.i64(i: i48) : i64
{
  i
}

function {:inline} $zext.i48.i88(i: i48) : i88
{
  i
}

function {:inline} $zext.i48.i96(i: i48) : i96
{
  i
}

function {:inline} $zext.i48.i128(i: i48) : i128
{
  i
}

function {:inline} $zext.i56.i64(i: i56) : i64
{
  i
}

function {:inline} $zext.i56.i88(i: i56) : i88
{
  i
}

function {:inline} $zext.i56.i96(i: i56) : i96
{
  i
}

function {:inline} $zext.i56.i128(i: i56) : i128
{
  i
}

function {:inline} $zext.i64.i88(i: i64) : i88
{
  i
}

function {:inline} $zext.i64.i96(i: i64) : i96
{
  i
}

function {:inline} $zext.i64.i128(i: i64) : i128
{
  i
}

function {:inline} $zext.i88.i96(i: i88) : i96
{
  i
}

function {:inline} $zext.i88.i128(i: i88) : i128
{
  i
}

function {:inline} $zext.i96.i128(i: i96) : i128
{
  i
}

function {:inline} $sext.i1.i8(i: i1) : i8
{
  i
}

function {:inline} $sext.i1.i16(i: i1) : i16
{
  i
}

function {:inline} $sext.i1.i24(i: i1) : i24
{
  i
}

function {:inline} $sext.i1.i32(i: i1) : i32
{
  i
}

function {:inline} $sext.i1.i40(i: i1) : i40
{
  i
}

function {:inline} $sext.i1.i48(i: i1) : i48
{
  i
}

function {:inline} $sext.i1.i56(i: i1) : i56
{
  i
}

function {:inline} $sext.i1.i64(i: i1) : i64
{
  i
}

function {:inline} $sext.i1.i88(i: i1) : i88
{
  i
}

function {:inline} $sext.i1.i96(i: i1) : i96
{
  i
}

function {:inline} $sext.i1.i128(i: i1) : i128
{
  i
}

function {:inline} $sext.i8.i16(i: i8) : i16
{
  i
}

function {:inline} $sext.i8.i24(i: i8) : i24
{
  i
}

function {:inline} $sext.i8.i32(i: i8) : i32
{
  i
}

function {:inline} $sext.i8.i40(i: i8) : i40
{
  i
}

function {:inline} $sext.i8.i48(i: i8) : i48
{
  i
}

function {:inline} $sext.i8.i56(i: i8) : i56
{
  i
}

function {:inline} $sext.i8.i64(i: i8) : i64
{
  i
}

function {:inline} $sext.i8.i88(i: i8) : i88
{
  i
}

function {:inline} $sext.i8.i96(i: i8) : i96
{
  i
}

function {:inline} $sext.i8.i128(i: i8) : i128
{
  i
}

function {:inline} $sext.i16.i24(i: i16) : i24
{
  i
}

function {:inline} $sext.i16.i32(i: i16) : i32
{
  i
}

function {:inline} $sext.i16.i40(i: i16) : i40
{
  i
}

function {:inline} $sext.i16.i48(i: i16) : i48
{
  i
}

function {:inline} $sext.i16.i56(i: i16) : i56
{
  i
}

function {:inline} $sext.i16.i64(i: i16) : i64
{
  i
}

function {:inline} $sext.i16.i88(i: i16) : i88
{
  i
}

function {:inline} $sext.i16.i96(i: i16) : i96
{
  i
}

function {:inline} $sext.i16.i128(i: i16) : i128
{
  i
}

function {:inline} $sext.i24.i32(i: i24) : i32
{
  i
}

function {:inline} $sext.i24.i40(i: i24) : i40
{
  i
}

function {:inline} $sext.i24.i48(i: i24) : i48
{
  i
}

function {:inline} $sext.i24.i56(i: i24) : i56
{
  i
}

function {:inline} $sext.i24.i64(i: i24) : i64
{
  i
}

function {:inline} $sext.i24.i88(i: i24) : i88
{
  i
}

function {:inline} $sext.i24.i96(i: i24) : i96
{
  i
}

function {:inline} $sext.i24.i128(i: i24) : i128
{
  i
}

function {:inline} $sext.i32.i40(i: i32) : i40
{
  i
}

function {:inline} $sext.i32.i48(i: i32) : i48
{
  i
}

function {:inline} $sext.i32.i56(i: i32) : i56
{
  i
}

function {:inline} $sext.i32.i64(i: i32) : i64
{
  i
}

function {:inline} $sext.i32.i88(i: i32) : i88
{
  i
}

function {:inline} $sext.i32.i96(i: i32) : i96
{
  i
}

function {:inline} $sext.i32.i128(i: i32) : i128
{
  i
}

function {:inline} $sext.i40.i48(i: i40) : i48
{
  i
}

function {:inline} $sext.i40.i56(i: i40) : i56
{
  i
}

function {:inline} $sext.i40.i64(i: i40) : i64
{
  i
}

function {:inline} $sext.i40.i88(i: i40) : i88
{
  i
}

function {:inline} $sext.i40.i96(i: i40) : i96
{
  i
}

function {:inline} $sext.i40.i128(i: i40) : i128
{
  i
}

function {:inline} $sext.i48.i56(i: i48) : i56
{
  i
}

function {:inline} $sext.i48.i64(i: i48) : i64
{
  i
}

function {:inline} $sext.i48.i88(i: i48) : i88
{
  i
}

function {:inline} $sext.i48.i96(i: i48) : i96
{
  i
}

function {:inline} $sext.i48.i128(i: i48) : i128
{
  i
}

function {:inline} $sext.i56.i64(i: i56) : i64
{
  i
}

function {:inline} $sext.i56.i88(i: i56) : i88
{
  i
}

function {:inline} $sext.i56.i96(i: i56) : i96
{
  i
}

function {:inline} $sext.i56.i128(i: i56) : i128
{
  i
}

function {:inline} $sext.i64.i88(i: i64) : i88
{
  i
}

function {:inline} $sext.i64.i96(i: i64) : i96
{
  i
}

function {:inline} $sext.i64.i128(i: i64) : i128
{
  i
}

function {:inline} $sext.i88.i96(i: i88) : i96
{
  i
}

function {:inline} $sext.i88.i128(i: i88) : i128
{
  i
}

function {:inline} $sext.i96.i128(i: i96) : i128
{
  i
}

function $fp(ipart: int, fpart: int, epart: int) : float;

function $fadd.float(f1: float, f2: float) : float;

function $fsub.float(f1: float, f2: float) : float;

function $fmul.float(f1: float, f2: float) : float;

function $fdiv.float(f1: float, f2: float) : float;

function $frem.float(f1: float, f2: float) : float;

function $ffalse.float(f1: float, f2: float) : i1;

function $ftrue.float(f1: float, f2: float) : i1;

function {:inline} $foeq.float(f1: float, f2: float) : i1
{
  (if $foeq.bool(f1, f2) then 1 else 0)
}

function $foeq.bool(f1: float, f2: float) : bool;

function $foge.float(f1: float, f2: float) : i1;

function $fogt.float(f1: float, f2: float) : i1;

function $fole.float(f1: float, f2: float) : i1;

function $folt.float(f1: float, f2: float) : i1;

function $fone.float(f1: float, f2: float) : i1;

function $ford.float(f1: float, f2: float) : i1;

function $fueq.float(f1: float, f2: float) : i1;

function $fuge.float(f1: float, f2: float) : i1;

function $fugt.float(f1: float, f2: float) : i1;

function $fule.float(f1: float, f2: float) : i1;

function $fult.float(f1: float, f2: float) : i1;

function $fune.float(f1: float, f2: float) : i1;

function $funo.float(f1: float, f2: float) : i1;

function $fp2si.float.i128(f: float) : i128;

function $fp2ui.float.i128(f: float) : i128;

function $si2fp.i128.float(i: i128) : float;

function $ui2fp.i128.float(i: i128) : float;

function $fp2si.float.i96(f: float) : i96;

function $fp2ui.float.i96(f: float) : i96;

function $si2fp.i96.float(i: i96) : float;

function $ui2fp.i96.float(i: i96) : float;

function $fp2si.float.i88(f: float) : i88;

function $fp2ui.float.i88(f: float) : i88;

function $si2fp.i88.float(i: i88) : float;

function $ui2fp.i88.float(i: i88) : float;

function $fp2si.float.i64(f: float) : i64;

function $fp2ui.float.i64(f: float) : i64;

function $si2fp.i64.float(i: i64) : float;

function $ui2fp.i64.float(i: i64) : float;

function $fp2si.float.i56(f: float) : i56;

function $fp2ui.float.i56(f: float) : i56;

function $si2fp.i56.float(i: i56) : float;

function $ui2fp.i56.float(i: i56) : float;

function $fp2si.float.i48(f: float) : i48;

function $fp2ui.float.i48(f: float) : i48;

function $si2fp.i48.float(i: i48) : float;

function $ui2fp.i48.float(i: i48) : float;

function $fp2si.float.i40(f: float) : i40;

function $fp2ui.float.i40(f: float) : i40;

function $si2fp.i40.float(i: i40) : float;

function $ui2fp.i40.float(i: i40) : float;

function $fp2si.float.i32(f: float) : i32;

function $fp2ui.float.i32(f: float) : i32;

function $si2fp.i32.float(i: i32) : float;

function $ui2fp.i32.float(i: i32) : float;

function $fp2si.float.i24(f: float) : i24;

function $fp2ui.float.i24(f: float) : i24;

function $si2fp.i24.float(i: i24) : float;

function $ui2fp.i24.float(i: i24) : float;

function $fp2si.float.i16(f: float) : i16;

function $fp2ui.float.i16(f: float) : i16;

function $si2fp.i16.float(i: i16) : float;

function $ui2fp.i16.float(i: i16) : float;

function $fp2si.float.i8(f: float) : i8;

function $fp2ui.float.i8(f: float) : i8;

function $si2fp.i8.float(i: i8) : float;

function $ui2fp.i8.float(i: i8) : float;

function $fptrunc.float.float(f: float) : float;

function $fpext.float.float(f: float) : float;

function $fp2si.float.bv128(f: float) : bv128;

function $fp2ui.float.bv128(f: float) : bv128;

function $si2fp.bv128.float(i: bv128) : float;

function $ui2fp.bv128.float(i: bv128) : float;

function $fp2si.float.bv96(f: float) : bv96;

function $fp2ui.float.bv96(f: float) : bv96;

function $si2fp.bv96.float(i: bv96) : float;

function $ui2fp.bv96.float(i: bv96) : float;

function $fp2si.float.bv88(f: float) : bv88;

function $fp2ui.float.bv88(f: float) : bv88;

function $si2fp.bv88.float(i: bv88) : float;

function $ui2fp.bv88.float(i: bv88) : float;

function $fp2si.float.bv64(f: float) : bv64;

function $fp2ui.float.bv64(f: float) : bv64;

function $si2fp.bv64.float(i: bv64) : float;

function $ui2fp.bv64.float(i: bv64) : float;

function $fp2si.float.bv56(f: float) : bv56;

function $fp2ui.float.bv56(f: float) : bv56;

function $si2fp.bv56.float(i: bv56) : float;

function $ui2fp.bv56.float(i: bv56) : float;

function $fp2si.float.bv48(f: float) : bv48;

function $fp2ui.float.bv48(f: float) : bv48;

function $si2fp.bv48.float(i: bv48) : float;

function $ui2fp.bv48.float(i: bv48) : float;

function $fp2si.float.bv40(f: float) : bv40;

function $fp2ui.float.bv40(f: float) : bv40;

function $si2fp.bv40.float(i: bv40) : float;

function $ui2fp.bv40.float(i: bv40) : float;

function $fp2si.float.bv32(f: float) : bv32;

function $fp2ui.float.bv32(f: float) : bv32;

function $si2fp.bv32.float(i: bv32) : float;

function $ui2fp.bv32.float(i: bv32) : float;

function $fp2si.float.bv24(f: float) : bv24;

function $fp2ui.float.bv24(f: float) : bv24;

function $si2fp.bv24.float(i: bv24) : float;

function $ui2fp.bv24.float(i: bv24) : float;

function $fp2si.float.bv16(f: float) : bv16;

function $fp2ui.float.bv16(f: float) : bv16;

function $si2fp.bv16.float(i: bv16) : float;

function $ui2fp.bv16.float(i: bv16) : float;

function $fp2si.float.bv8(f: float) : bv8;

function $fp2ui.float.bv8(f: float) : bv8;

function $si2fp.bv8.float(i: bv8) : float;

function $ui2fp.bv8.float(i: bv8) : float;

const $GLOBALS_BOTTOM: ref;

const $EXTERNS_BOTTOM: ref;

const $MALLOC_TOP: ref;

function {:inline} $isExternal(p: ref) : bool
{
  $slt.ref.bool(p, $EXTERNS_BOTTOM)
}

function {:inline} $load.i128(M: [ref]i128, p: ref) : i128
{
  M[p]
}

function {:inline} $load.i96(M: [ref]i96, p: ref) : i96
{
  M[p]
}

function {:inline} $load.i88(M: [ref]i88, p: ref) : i88
{
  M[p]
}

function {:inline} $load.i64(M: [ref]i64, p: ref) : i64
{
  M[p]
}

function {:inline} $load.i56(M: [ref]i56, p: ref) : i56
{
  M[p]
}

function {:inline} $load.i48(M: [ref]i48, p: ref) : i48
{
  M[p]
}

function {:inline} $load.i40(M: [ref]i40, p: ref) : i40
{
  M[p]
}

function {:inline} $load.i32(M: [ref]i32, p: ref) : i32
{
  M[p]
}

function {:inline} $load.i24(M: [ref]i24, p: ref) : i24
{
  M[p]
}

function {:inline} $load.i16(M: [ref]i16, p: ref) : i16
{
  M[p]
}

function {:inline} $load.i8(M: [ref]i8, p: ref) : i8
{
  M[p]
}

function {:inline} $load.bv128(M: [ref]bv128, p: ref) : bv128
{
  M[p]
}

function {:inline} $load.bv96(M: [ref]bv96, p: ref) : bv96
{
  M[p]
}

function {:inline} $load.bv88(M: [ref]bv88, p: ref) : bv88
{
  M[p]
}

function {:inline} $load.bv64(M: [ref]bv64, p: ref) : bv64
{
  M[p]
}

function {:inline} $load.bv56(M: [ref]bv56, p: ref) : bv56
{
  M[p]
}

function {:inline} $load.bv48(M: [ref]bv48, p: ref) : bv48
{
  M[p]
}

function {:inline} $load.bv40(M: [ref]bv40, p: ref) : bv40
{
  M[p]
}

function {:inline} $load.bv32(M: [ref]bv32, p: ref) : bv32
{
  M[p]
}

function {:inline} $load.bv24(M: [ref]bv24, p: ref) : bv24
{
  M[p]
}

function {:inline} $load.bv16(M: [ref]bv16, p: ref) : bv16
{
  M[p]
}

function {:inline} $load.bv8(M: [ref]bv8, p: ref) : bv8
{
  M[p]
}

function {:inline} $load.bytes.bv128(M: [ref]bv8, p: ref) : bv128
{
  $load.bytes.bv64(M, $add.ref(p, $8.ref)) ++ $load.bytes.bv64(M, p)
}

function {:inline} $load.bytes.bv96(M: [ref]bv8, p: ref) : bv96
{
  $load.bytes.bv64(M, $add.ref(p, $4.ref)) ++ $load.bytes.bv32(M, p)
}

function {:inline} $load.bytes.bv88(M: [ref]bv8, p: ref) : bv88
{
  $load.bytes.bv56(M, $add.ref(p, $4.ref)) ++ $load.bytes.bv32(M, p)
}

function {:inline} $load.bytes.bv64(M: [ref]bv8, p: ref) : bv64
{
  $load.bytes.bv32(M, $add.ref(p, $4.ref)) ++ $load.bytes.bv32(M, p)
}

function {:inline} $load.bytes.bv56(M: [ref]bv8, p: ref) : bv56
{
  $load.bytes.bv24(M, $add.ref(p, $4.ref)) ++ $load.bytes.bv32(M, p)
}

function {:inline} $load.bytes.bv48(M: [ref]bv8, p: ref) : bv48
{
  $load.bytes.bv16(M, $add.ref(p, $4.ref)) ++ $load.bytes.bv32(M, p)
}

function {:inline} $load.bytes.bv40(M: [ref]bv8, p: ref) : bv40
{
  M[$add.ref(p, $4.ref)] ++ $load.bytes.bv32(M, p)
}

function {:inline} $load.bytes.bv32(M: [ref]bv8, p: ref) : bv32
{
  M[$add.ref(p, $3.ref)] ++ M[$add.ref(p, $2.ref)] ++ M[$add.ref(p, $1.ref)] ++ M[p]
}

function {:inline} $load.bytes.bv24(M: [ref]bv8, p: ref) : bv24
{
  M[$add.ref(p, $2.ref)] ++ M[$add.ref(p, $1.ref)] ++ M[p]
}

function {:inline} $load.bytes.bv16(M: [ref]bv8, p: ref) : bv16
{
  M[$add.ref(p, $1.ref)] ++ M[p]
}

function {:inline} $load.bytes.bv8(M: [ref]bv8, p: ref) : bv8
{
  M[p]
}

function {:inline} $store.i128(M: [ref]i128, p: ref, v: i128) : [ref]i128
{
  M[p := v]
}

function {:inline} $store.i96(M: [ref]i96, p: ref, v: i96) : [ref]i96
{
  M[p := v]
}

function {:inline} $store.i88(M: [ref]i88, p: ref, v: i88) : [ref]i88
{
  M[p := v]
}

function {:inline} $store.i64(M: [ref]i64, p: ref, v: i64) : [ref]i64
{
  M[p := v]
}

function {:inline} $store.i56(M: [ref]i56, p: ref, v: i56) : [ref]i56
{
  M[p := v]
}

function {:inline} $store.i48(M: [ref]i48, p: ref, v: i48) : [ref]i48
{
  M[p := v]
}

function {:inline} $store.i40(M: [ref]i40, p: ref, v: i40) : [ref]i40
{
  M[p := v]
}

function {:inline} $store.i32(M: [ref]i32, p: ref, v: i32) : [ref]i32
{
  M[p := v]
}

function {:inline} $store.i24(M: [ref]i24, p: ref, v: i24) : [ref]i24
{
  M[p := v]
}

function {:inline} $store.i16(M: [ref]i16, p: ref, v: i16) : [ref]i16
{
  M[p := v]
}

function {:inline} $store.i8(M: [ref]i8, p: ref, v: i8) : [ref]i8
{
  M[p := v]
}

function {:inline} $store.bv128(M: [ref]bv128, p: ref, v: bv128) : [ref]bv128
{
  M[p := v]
}

function {:inline} $store.bv96(M: [ref]bv96, p: ref, v: bv96) : [ref]bv96
{
  M[p := v]
}

function {:inline} $store.bv88(M: [ref]bv88, p: ref, v: bv88) : [ref]bv88
{
  M[p := v]
}

function {:inline} $store.bv64(M: [ref]bv64, p: ref, v: bv64) : [ref]bv64
{
  M[p := v]
}

function {:inline} $store.bv56(M: [ref]bv56, p: ref, v: bv56) : [ref]bv56
{
  M[p := v]
}

function {:inline} $store.bv48(M: [ref]bv48, p: ref, v: bv48) : [ref]bv48
{
  M[p := v]
}

function {:inline} $store.bv40(M: [ref]bv40, p: ref, v: bv40) : [ref]bv40
{
  M[p := v]
}

function {:inline} $store.bv32(M: [ref]bv32, p: ref, v: bv32) : [ref]bv32
{
  M[p := v]
}

function {:inline} $store.bv24(M: [ref]bv24, p: ref, v: bv24) : [ref]bv24
{
  M[p := v]
}

function {:inline} $store.bv16(M: [ref]bv16, p: ref, v: bv16) : [ref]bv16
{
  M[p := v]
}

function {:inline} $store.bv8(M: [ref]bv8, p: ref, v: bv8) : [ref]bv8
{
  M[p := v]
}

function {:inline} $store.bytes.bv128(M: [ref]bv8, p: ref, v: bv128) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]][$add.ref(p, $2.ref) := v[24:16]][$add.ref(p, $3.ref) := v[32:24]][$add.ref(p, $4.ref) := v[40:32]][$add.ref(p, $5.ref) := v[48:40]][$add.ref(p, $6.ref) := v[56:48]][$add.ref(p, $7.ref) := v[64:56]][$add.ref(p, $7.ref) := v[72:64]][$add.ref(p, $8.ref) := v[80:72]][$add.ref(p, $9.ref) := v[88:80]][$add.ref(p, $10.ref) := v[96:88]][$add.ref(p, $11.ref) := v[104:96]][$add.ref(p, $12.ref) := v[112:104]][$add.ref(p, $13.ref) := v[120:112]][$add.ref(p, $14.ref) := v[128:120]]
}

function {:inline} $store.bytes.bv96(M: [ref]bv8, p: ref, v: bv96) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]][$add.ref(p, $2.ref) := v[24:16]][$add.ref(p, $3.ref) := v[32:24]][$add.ref(p, $4.ref) := v[40:32]][$add.ref(p, $5.ref) := v[48:40]][$add.ref(p, $6.ref) := v[56:48]][$add.ref(p, $7.ref) := v[64:56]][$add.ref(p, $7.ref) := v[72:64]][$add.ref(p, $8.ref) := v[80:72]][$add.ref(p, $9.ref) := v[88:80]][$add.ref(p, $10.ref) := v[96:88]]
}

function {:inline} $store.bytes.bv88(M: [ref]bv8, p: ref, v: bv88) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]][$add.ref(p, $2.ref) := v[24:16]][$add.ref(p, $3.ref) := v[32:24]][$add.ref(p, $4.ref) := v[40:32]][$add.ref(p, $5.ref) := v[48:40]][$add.ref(p, $6.ref) := v[56:48]][$add.ref(p, $7.ref) := v[64:56]][$add.ref(p, $7.ref) := v[72:64]][$add.ref(p, $8.ref) := v[80:72]][$add.ref(p, $9.ref) := v[88:80]]
}

function {:inline} $store.bytes.bv64(M: [ref]bv8, p: ref, v: bv64) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]][$add.ref(p, $2.ref) := v[24:16]][$add.ref(p, $3.ref) := v[32:24]][$add.ref(p, $4.ref) := v[40:32]][$add.ref(p, $5.ref) := v[48:40]][$add.ref(p, $6.ref) := v[56:48]][$add.ref(p, $7.ref) := v[64:56]]
}

function {:inline} $store.bytes.bv56(M: [ref]bv8, p: ref, v: bv56) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]][$add.ref(p, $2.ref) := v[24:16]][$add.ref(p, $3.ref) := v[32:24]][$add.ref(p, $4.ref) := v[40:32]][$add.ref(p, $5.ref) := v[48:40]][$add.ref(p, $6.ref) := v[56:48]]
}

function {:inline} $store.bytes.bv48(M: [ref]bv8, p: ref, v: bv48) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]][$add.ref(p, $2.ref) := v[24:16]][$add.ref(p, $3.ref) := v[32:24]][$add.ref(p, $4.ref) := v[40:32]][$add.ref(p, $5.ref) := v[48:40]]
}

function {:inline} $store.bytes.bv40(M: [ref]bv8, p: ref, v: bv40) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]][$add.ref(p, $2.ref) := v[24:16]][$add.ref(p, $3.ref) := v[32:24]][$add.ref(p, $4.ref) := v[40:32]]
}

function {:inline} $store.bytes.bv32(M: [ref]bv8, p: ref, v: bv32) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]][$add.ref(p, $2.ref) := v[24:16]][$add.ref(p, $3.ref) := v[32:24]]
}

function {:inline} $store.bytes.bv24(M: [ref]bv8, p: ref, v: bv24) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]][$add.ref(p, $2.ref) := v[24:16]]
}

function {:inline} $store.bytes.bv16(M: [ref]bv8, p: ref, v: bv16) : [ref]bv8
{
  M[p := v[8:0]][$add.ref(p, $1.ref) := v[16:8]]
}

function {:inline} $store.bytes.bv8(M: [ref]bv8, p: ref, v: bv8) : [ref]bv8
{
  M[p := v]
}

function {:inline} $load.ref(M: [ref]ref, p: ref) : ref
{
  M[p]
}

function {:inline} $store.ref(M: [ref]ref, p: ref, v: ref) : [ref]ref
{
  M[p := v]
}

function {:inline} $load.float(M: [ref]float, p: ref) : float
{
  M[p]
}

function {:inline} $store.float(M: [ref]float, p: ref, v: float) : [ref]float
{
  M[p := v]
}

type $mop;

const $MOP: $mop;

var $exn: bool;

var $exnv: int;

function $extractvalue(p: int, i: int) : int;

var $CurrAddr: ref;

const __SMACK_top_decl: ref;

axiom __SMACK_top_decl == $sub.ref(0, 34062);

const __SMACK_init_func_memory_model: ref;

axiom __SMACK_init_func_memory_model == $sub.ref(0, 35094);

const __VERIFIER_assert: ref;

axiom __VERIFIER_assert == $sub.ref(0, 36126);

const main: ref;

axiom main == $sub.ref(0, 37158);

const llvm.dbg.value: ref;

axiom llvm.dbg.value == $sub.ref(0, 38190);

const __SMACK_static_init: ref;

axiom __SMACK_static_init == $sub.ref(0, 39222);

procedure __SMACK_nondet_unsigned_short() returns ($r: i16);



procedure boogie_si_record_i16(i: i16);



procedure boogie_si_record_i32(i: i32);



procedure corral_fix_context_0();


