; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv64 -mattr=+d -mattr=+xtheadc -mattr=+m -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=THEADC

declare i32 @llvm.fshr.i32(i32, i32, i32)

define i32 @ror_i32(i32 %a, i32 %b) {
; THEADC-LABEL: ror_i32:
; THEADC:       # %bb.0:
; THEADC-NEXT:    andi a2, a1, 31
; THEADC-NEXT:    srl a2, a0, a2
; THEADC-NEXT:    neg a1, a1
; THEADC-NEXT:    andi a1, a1, 31
; THEADC-NEXT:    sll a0, a0, a1
; THEADC-NEXT:    or a0, a2, a0
; THEADC-NEXT:    sext.w a0, a0
; THEADC-NEXT:    ret
  %or = tail call i32 @llvm.fshr.i32(i32 %a, i32 %a, i32 %b)
  ret i32 %or
}

define i32 @rori_i32(i32 %a) {
; THEADC-LABEL: rori_i32:
; THEADC:       # %bb.0:
; THEADC-NEXT:    srriw a0, a0, 5
; THEADC-NEXT:    ret
  %or = tail call i32 @llvm.fshr.i32(i32 %a, i32 %a, i32 5)
  ret i32 %or
}

declare i64 @llvm.fshr.i64(i64, i64, i64)

define i64 @ror_i64(i64 %a, i64 %b) {
; THEADC-LABEL: ror_i64:
; THEADC:       # %bb.0:
; THEADC-NEXT:    andi a2, a1, 63
; THEADC-NEXT:    srl a2, a0, a2
; THEADC-NEXT:    neg a1, a1
; THEADC-NEXT:    andi a1, a1, 63
; THEADC-NEXT:    sll a0, a0, a1
; THEADC-NEXT:    or a0, a2, a0
; THEADC-NEXT:    ret
  %or = tail call i64 @llvm.fshr.i64(i64 %a, i64 %a, i64 %b)
  ret i64 %or
}

define i64 @rori_i64(i64 %a) {
; THEADC-LABEL: rori_i64:
; THEADC:       # %bb.0:
; THEADC-NEXT:    srri a0, a0, 3
; THEADC-NEXT:    ret
  %or = tail call i64 @llvm.fshr.i64(i64 %a, i64 %a, i64 3)
  ret i64 %or
}

define i64 @addsl_i64(i64 %a, i64 %b) {
; THEADC-LABEL: addsl_i64:
; THEADC:       # %bb.0:
; THEADC-NEXT:    addsl a0, a1, a0, 3
; THEADC-NEXT:    ret
  %c = shl i64 %a, 3
  %or = add i64 %b, %c
  ret i64 %or
}

define i64 @mula_i64(i64 %a, i64 %b, i64 %c) {
; THEADC-LABEL: mula_i64:
; THEADC:       # %bb.0:
; THEADC-NEXT:    mula a0, a1, a2
; THEADC-NEXT:    ret
  %d = mul i64 %b, %c
  %or = add i64 %a, %d
  ret i64 %or
}

define i64 @mulah_i64(i32 %a, i16 %b, i16 %c) {
; THEADC-LABEL: mulah_i64:
; THEADC:       # %bb.0:
; THEADC-NEXT:    mulah a0, a1, a2
; THEADC-NEXT:    ret
  %d = sext i16 %b to i32
  %e = sext i16 %c to i32
  %f = mul i32 %d, %e
  %g = add i32 %a, %f
  %or = sext i32 %g to i64
  ret i64 %or
}

define i64 @mulaw_i64(i32 %a, i32 %b, i32 %c) {
; THEADC-LABEL: mulaw_i64:
; THEADC:       # %bb.0:
; THEADC-NEXT:    mulaw a0, a1, a2
; THEADC-NEXT:    ret
  %d = mul i32 %b, %c
  %e = add i32 %a, %d
  %or = sext i32 %e to i64
  ret i64 %or
}

define i64 @muls_i64(i64 %a, i64 %b, i64 %c) {
; THEADC-LABEL: muls_i64:
; THEADC:       # %bb.0:
; THEADC-NEXT:    muls a0, a1, a2
; THEADC-NEXT:    ret
  %d = mul i64 %b, %c
  %or = sub i64 %a, %d
  ret i64 %or
}

define i64 @mulsh_i64(i32 %a, i16 %b, i16 %c) {
; THEADC-LABEL: mulsh_i64:
; THEADC:       # %bb.0:
; THEADC-NEXT:    mulsh a0, a1, a2
; THEADC-NEXT:    ret
  %d = sext i16 %b to i32
  %e = sext i16 %c to i32
  %f = mul i32 %d, %e
  %g = sub i32 %a, %f
  %or = sext i32 %g to i64
  ret i64 %or
}

define i64 @mulsw_i64(i32 %a, i32 %b, i32 %c) {
; THEADC-LABEL: mulsw_i64:
; THEADC:       # %bb.0:
; THEADC-NEXT:    mulsw a0, a1, a2
; THEADC-NEXT:    ret
  %d = mul i32 %b, %c
  %e = sub i32 %a, %d
  %or = sext i32 %e to i64
  ret i64 %or
}

define i64 @mveqz_i64(i64 %a, i64 %b, i64 %c) {
; THEADC-LABEL: mveqz_i64:
; THEADC:       # %bb.0:
; THEADC-NEXT:    mveqz a0, a1, a2
; THEADC-NEXT:    ret
  %cre = icmp eq i64 %c, 0
  %or = select i1 %cre, i64 %b, i64 %a
  ret i64 %or
}

define i64 @mvnez_i64(i64 %a, i64 %b, i64 %c) {
; THEADC-LABEL: mvnez_i64:
; THEADC:       # %bb.0:
; THEADC-NEXT:    mvnez a0, a1, a2
; THEADC-NEXT:    ret
  %cre = icmp ne i64 %c, 0
  %or = select i1 %cre, i64 %b, i64 %a
  ret i64 %or
}

define i64 @mvnez2_i64(i64 %a, i64 %b, i1 %c) {
; THEADC-LABEL: mvnez2_i64:
; THEADC:       # %bb.0:
; THEADC-NEXT:    extu a2, a2, 0, 0
; THEADC-NEXT:    mvnez a0, a1, a2
; THEADC-NEXT:    ret
  %or = select i1 %c, i64 %b, i64 %a
  ret i64 %or
}

define i64 @ctlz(i64 %x) {
; THEADC-LABEL: ctlz:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    ff1 a0, a0
; THEADC-NEXT:    ret
entry:
  %nlz = call i64 @llvm.ctlz.i64(i64 %x, i1 1)
  ret i64 %nlz
}

define i64 @ctlz_xor(i64 %x) {
; THEADC-LABEL: ctlz_xor:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    ff0 a0, a0
; THEADC-NEXT:    ret
entry:
  %xor = xor i64 %x, -1
  %nlz = call i64 @llvm.ctlz.i64(i64 %xor, i1 1)
  ret i64 %nlz
}

define i64 @bswap(i64 %x) {
; THEADC-LABEL: bswap:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    rev a0, a0
; THEADC-NEXT:    ret
entry:
  %rev = call i64 @llvm.bswap.i64(i64 %x)
  ret i64 %rev
}

define i64 @bswap_i32(i32 %x) {
; THEADC-LABEL: bswap_i32:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    revw a0, a0
; THEADC-NEXT:    ret
entry:
  %rev = call i32 @llvm.bswap.i32(i32 %x)
  %sext = sext i32 %rev to i64
  ret i64 %sext
}

declare i64 @llvm.bswap.i64(i64)
declare i32 @llvm.bswap.i32(i32)
declare i64 @llvm.ctlz.i64 (i64, i1)

define i64 @sextR_i64_32(i32 %x) {
; THEADC-LABEL: sextR_i64_32:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    ext a0, a0, 31, 0
; THEADC-NEXT:    ret
entry:
  %sext = sext i32 %x to i64
  ret i64 %sext
}

define i64 @sextR_i64_16(i16 %x) {
; THEADC-LABEL: sextR_i64_16:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    ext a0, a0, 15, 0
; THEADC-NEXT:    ret
entry:
  %sext = sext i16 %x to i64
  ret i64 %sext
}

define i64 @sextR_i64_8(i8 %x) {
; THEADC-LABEL: sextR_i64_8:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    ext a0, a0, 7, 0
; THEADC-NEXT:    ret
entry:
  %sext = sext i8 %x to i64
  ret i64 %sext
}

define i64 @sextR_i64_1(i1 %x) {
; THEADC-LABEL: sextR_i64_1:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    ext a0, a0, 0, 0
; THEADC-NEXT:    ret
entry:
  %sext = sext i1 %x to i64
  ret i64 %sext
}

define i64 @tst_1(i64 %a) {
; THEADC-LABEL: tst_1:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    tst a0, a0, 5
; THEADC-NEXT:    ret
entry:
  %shr = lshr i64 %a, 5
  %and = and i64 %shr, 1
  ret i64 %and
}

define i64 @test_and_to_extu_32(i64 %a) {
; THEADC-LABEL: test_and_to_extu_32:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    extu a0, a0, 31, 0
; THEADC-NEXT:    ret
entry:
  %res = and i64 %a, 4294967295
  ret i64 %res
}

define i64 @test_zext_32(i32 %a) {
; THEADC-LABEL: test_zext_32:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    extu a0, a0, 31, 0
; THEADC-NEXT:    ret
entry:
  %res = zext i32 %a to i64
  ret i64 %res
}

define i64 @test_and_to_extu_16(i64 %a) {
; THEADC-LABEL: test_and_to_extu_16:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    extu a0, a0, 15, 0
; THEADC-NEXT:    ret
entry:
  %res = and i64 %a, 65535
  ret i64 %res
}

define i64 @test_zext_16(i16 %a) {
; THEADC-LABEL: test_zext_16:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    extu a0, a0, 15, 0
; THEADC-NEXT:    ret
entry:
  %res = zext i16 %a to i64
  ret i64 %res
}

define i64 @test_and_to_extu_8(i64 %a) {
; THEADC-LABEL: test_and_to_extu_8:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    extu a0, a0, 7, 0
; THEADC-NEXT:    ret
entry:
  %res = and i64 %a, 255
  ret i64 %res
}

define i64 @test_zext_8(i8 %a) {
; THEADC-LABEL: test_zext_8:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    extu a0, a0, 7, 0
; THEADC-NEXT:    ret
entry:
  %res = zext i8 %a to i64
  ret i64 %res
}

define i64 @test_and_to_extu_1(i64 %a) {
; THEADC-LABEL: test_and_to_extu_1:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    extu a0, a0, 0, 0
; THEADC-NEXT:    ret
entry:
  %res = and i64 %a, 1
  ret i64 %res
}

define i64 @test_zext_1(i1 %a) {
; THEADC-LABEL: test_zext_1:
; THEADC:       # %bb.0: # %entry
; THEADC-NEXT:    extu a0, a0, 0, 0
; THEADC-NEXT:    ret
entry:
  %res = zext i1 %a to i64
  ret i64 %res
}