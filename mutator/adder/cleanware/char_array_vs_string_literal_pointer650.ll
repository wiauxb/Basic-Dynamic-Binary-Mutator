; Mutation 650
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack649 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.640 = constant [16 x i8] c"\73\69\7a\65\6f\66\28\73\32\29\3a\20\25\64\0a\00"
@str.bis.641 = constant [16 x i8] c"\73\69\7a\65\6f\66\28\73\31\29\3a\20\25\64\0a\00"
@str.bis.642 = constant [8 x i8] c"\73\32\3a\20\25\73\0a\00"
@str.bis.643 = constant [11 x i8] c"\6e\65\77\20\73\74\72\69\6e\67\00"
@str.bis.644 = constant [11 x i8] c"\6e\65\77\20\73\74\72\69\6e\67\00"
@str.bis.645 = constant [8 x i8] c"\73\32\3a\20\25\73\0a\00"
@str.bis.646 = constant [6 x i8] c"\62\63\64\65\66\00"
@str.bis.647 = constant [6 x i8] c"\62\63\64\65\66\00"
@str.bis.648 = constant [8 x i8] c"\73\31\3a\20\25\73\0a\00"

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define internal fastcc void @helper_fldl_ST0(i64 noundef %0) unnamed_addr  mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87"  {
._crit_edge:
  %1 = load i32, i32* @fpstt, align 16
  %.pre = and i64 %0, 4503599627370495
  %.pre1 = and i64 %0, 9218868437227405312
  %phi.cmp = icmp ne i64 %.pre1, 9218868437227405312
  %phi.cmp3 = icmp eq i64 %.pre, 0
  %2 = or i1 %phi.cmp, %phi.cmp3
  br i1 %2, label %float64_to_floatx80.exit, label %3

3:                                                ; preds = %._crit_edge
  %4 = and i64 %0, 9221120237041090560
  %5 = icmp ne i64 %4, 9218868437227405312
  %6 = and i64 %0, 2251799813685247
  %7 = icmp eq i64 %6, 0
  %8 = or i1 %5, %7
  br i1 %8, label %float64_to_floatx80.exit, label %.sink.split.i

.sink.split.i:                                    ; preds = %3
  %9 = load i8, i8* @fp_status.0, align 1
  %10 = or i8 %9, 1
  store i8 %10, i8* @fp_status.0, align 1
  br label %float64_to_floatx80.exit

float64_to_floatx80.exit:                         ; preds = %.sink.split.i, %3, %._crit_edge
  %11 = add i32 %1, 7
  %12 = and i32 %11, 7
  store i32 %12, i32* @fpstt, align 16
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly
define internal fastcc void @helper_fninit() unnamed_addr  mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87"  {
  store i32 0, i32* @fpstt, align 16
  ret void
}

; Function Attrs: naked noinline
declare dso_local i32 @printf(i8* noundef, ...) local_unnamed_addr  naked noinline "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" 

; Function Attrs: mustprogress nounwind uwtable
define internal x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %0, i32 inreg noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr  mustprogress nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic"  {
  %5 = alloca double, align 8
  %6 = tail call { i32, i32 } asm "movl    %esp, %ebx\0A\09movl    $2, %esp\0A\09calll   *$3\0A\09movl    %ebx, %esp", "={ax},={dx},r,r,{cx},{dx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %2, i32 %3, i32 %0, i32 %1)  nounwind readnone 
  %7 = extractvalue { i32, i32 } %6, 0
  %8 = extractvalue { i32, i32 } %6, 1
  %9 = bitcast double* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9)  nounwind 
  call void asm "fstpl   $0", "=*m,~{dirflag},~{fpsr},~{flags}"(double* nonnull elementtype(double) %5)  nounwind 
  %10 = load double, double* %5, align 8, !tbaa !6
  %11 = fptoui double %10 to i64
  call fastcc void @helper_fldl_ST0(i64 noundef %11)  nobuiltin nounwind "no-builtins" 
  %12 = zext i32 %8 to i64
  %13 = shl nuw i64 %12, 32
  %14 = zext i32 %7 to i64
  %15 = or i64 %13, %14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9)  nounwind 
  ret i64 %15
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)  argmemonly nofree nosync nounwind willreturn 

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)  argmemonly nofree nosync nounwind willreturn 

; Function Attrs: norecurse nounwind uwtable

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i8* @llvm.returnaddress(i32 immarg)  nofree nosync nounwind readnone willreturn 

; Function Attrs: norecurse nounwind
define internal fastcc void @char_array_vs_string_literal_pointer650(i32 %arg_esp) unnamed_addr  norecurse nounwind  !retregs !12 {
.exit:
  %tmp2_v.i54.i = add i32 %arg_esp, 4
  %tmp0_v.i55.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i57.i = add i32 %tmp0_v.i55.i, -4
  %2 = inttoptr i32 %tmp2_v3.i57.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i58.i = add i32 %tmp0_v.i55.i, -8
  %3 = inttoptr i32 %tmp2_v4.i58.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i60.i = add i32 %tmp0_v.i55.i, -12
  %4 = inttoptr i32 %tmp2_v5.i60.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i62.i = add i32 %tmp0_v.i55.i, -16
  %5 = inttoptr i32 %tmp2_v6.i62.i to i32*
  store i32 %tmp2_v.i54.i, i32* %5, align 16
  %tmp2_v8.i64.i = add i32 %tmp0_v.i55.i, -36
  %6 = inttoptr i32 %tmp2_v8.i64.i to i32*
  store i32 134517201, i32* %6, align 4
  %tmp4_v.i31.i.b = load i1, i1* @segs.0, align 1
  %7 = inttoptr i32 %arg_esp to i32*
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i35.i = add i32 %tmp0_v.i55.i, -20
  %9 = inttoptr i32 %tmp2_v2.i35.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp2_v3.i36.i = add i32 %tmp0_v.i55.i, -27
  %10 = inttoptr i32 %tmp2_v3.i36.i to i32*
  store i32 1684234849, i32* %10, align 4
  %tmp2_v4.i37.i = add i32 %tmp0_v.i55.i, -23
  %11 = inttoptr i32 %tmp2_v4.i37.i to i16*
  store i16 26213, i16* %11, align 2
  %tmp2_v5.i38.i = add i32 %tmp0_v.i55.i, -21
  %12 = inttoptr i32 %tmp2_v5.i38.i to i8*
  store i8 0, i8* %12, align 1
  %13 = inttoptr i32 %tmp2_v3.i36.i to i8*
  store i8 88, i8* %13, align 1
  %tmp2_v9.i43.i = add i32 %tmp0_v.i55.i, -44
  %14 = inttoptr i32 %tmp2_v9.i43.i to i32*
  store i32 %tmp2_v3.i36.i, i32* %14, align 4
  %tmp2_v11.i44.i = add i32 %tmp0_v.i55.i, -48
  %15 = inttoptr i32 %tmp2_v11.i44.i to i32*
  %spi.bis.648 = ptrtoint[8 x i8]* @str.bis.648 to i32
  store i32 %spi.bis.648, i32* %15, align 16
  %tmp2_v12.i.i = add i32 %tmp0_v.i55.i, -52
  %16 = inttoptr i32 %tmp2_v12.i.i to i32*
  store i32 134517258, i32* %16, align 4
  %17 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i54.i, i32 inreg noundef 0, i32 noundef %tmp2_v11.i44.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %18 = lshr i64 %17, 32
  %19 = trunc i64 %18 to i32
  %tmp2_v1.i9.i = add i32 %tmp0_v.i55.i, -32
  %20 = inttoptr i32 %tmp2_v1.i9.i to i32*
  %spi.bis.647 = ptrtoint[6 x i8]* @str.bis.647 to i32
  store i32 %spi.bis.647, i32* %20, align 16
  %spi.bis.646 = ptrtoint[6 x i8]* @str.bis.646 to i32
  store i32 %spi.bis.646, i32* %14, align 4
  %spi.bis.645 = ptrtoint[8 x i8]* @str.bis.645 to i32
  store i32 %spi.bis.645, i32* %15, align 16
  store i32 134517292, i32* %16, align 4
  %21 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i54.i, i32 inreg noundef %19, i32 noundef %tmp2_v11.i44.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %22 = lshr i64 %21, 32
  %23 = trunc i64 %22 to i32
  %spi.bis.644 = ptrtoint[11 x i8]* @str.bis.644 to i32
  store i32 %spi.bis.644, i32* %20, align 16
  %spi.bis.643 = ptrtoint[11 x i8]* @str.bis.643 to i32
  store i32 %spi.bis.643, i32* %14, align 4
  %spi.bis.642 = ptrtoint[8 x i8]* @str.bis.642 to i32
  store i32 %spi.bis.642, i32* %15, align 16
  store i32 134517322, i32* %16, align 4
  %24 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i54.i, i32 inreg noundef %23, i32 noundef %tmp2_v11.i44.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %25 = lshr i64 %24, 32
  %26 = trunc i64 %25 to i32
  store i32 7, i32* %14, align 4
  %spi.bis.641 = ptrtoint[16 x i8]* @str.bis.641 to i32
  store i32 %spi.bis.641, i32* %15, align 16
  store i32 134517342, i32* %16, align 4
  %27 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i54.i, i32 inreg noundef %26, i32 noundef %tmp2_v11.i44.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %28 = lshr i64 %27, 32
  %29 = trunc i64 %28 to i32
  store i32 4, i32* %14, align 4
  %spi.bis.640 = ptrtoint[16 x i8]* @str.bis.640 to i32
  store i32 %spi.bis.640, i32* %15, align 16
  store i32 134517362, i32* %16, align 4
  %30 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i54.i, i32 inreg noundef %29, i32 noundef %tmp2_v11.i44.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  ret void
}


!llvm.ident = !{!0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 14.0.0"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 1, !"NumRegisterParameters", i32 0}
!6 = !{!7, !7, i64 0}
!7 = !{!"double", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = !{i32 0, i32 0, i32 0, i32 0}
!13 = !{!"printf"}

  tail call fastcc void @char_array_vs_string_literal_pointer650 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack649, i32 0, i32 8092) to i32)) nounwind
