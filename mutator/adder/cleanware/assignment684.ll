; Mutation 684
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack683 = internal global [8092 x i32] zeroinitializer, align 16
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.677 = constant [7 x i8] c"\61\3a\20\25\64\0a\00"
@str.bis.678 = constant [7 x i8] c"\61\3a\20\25\64\0a\00"
@str.bis.679 = constant [7 x i8] c"\61\3a\20\25\64\0a\00"
@str.bis.680 = constant [7 x i8] c"\61\3a\20\25\64\0a\00"
@str.bis.681 = constant [7 x i8] c"\61\3a\20\25\64\0a\00"
@str.bis.682 = constant [7 x i8] c"\61\3a\20\25\64\0a\00"

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
define internal fastcc void @assignment684(i32 %arg_esp) unnamed_addr  norecurse nounwind  !retregs !12 {
  %tmp2_v.i58.i = add i32 %arg_esp, 4
  %tmp0_v.i59.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i59.i, -4
  %3 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i61.i = add i32 %tmp0_v.i59.i, -8
  %4 = inttoptr i32 %tmp2_v4.i61.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i63.i = add i32 %tmp0_v.i59.i, -12
  %5 = inttoptr i32 %tmp2_v5.i63.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i65.i = add i32 %tmp0_v.i59.i, -16
  %6 = inttoptr i32 %tmp2_v6.i65.i to i32*
  store i32 %tmp2_v.i58.i, i32* %6, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i59.i, -36
  %7 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517169, i32* %7, align 4
  %tmp2_v.i36.i = add i32 %tmp0_v.i59.i, -20
  %8 = inttoptr i32 %tmp2_v.i36.i to i32*
  store i32 5, i32* %8, align 4
  %tmp2_v4.i40.i = add i32 %tmp0_v.i59.i, -44
  %9 = inttoptr i32 %tmp2_v4.i40.i to i32*
  store i32 5, i32* %9, align 4
  %tmp2_v6.i42.i = add i32 %tmp0_v.i59.i, -48
  %10 = inttoptr i32 %tmp2_v6.i42.i to i32*
  %spi.bis.682 = ptrtoint[7 x i8]* @str.bis.682 to i32
  store i32 %spi.bis.682, i32* %10, align 16
  %tmp2_v7.i43.i = add i32 %tmp0_v.i59.i, -52
  %11 = inttoptr i32 %tmp2_v7.i43.i to i32*
  store i32 134517200, i32* %11, align 4
  %12 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i58.i, i32 inreg noundef 0, i32 noundef %tmp2_v6.i42.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %13 = lshr i64 %12, 32
  %14 = trunc i64 %13 to i32
  %15 = load i32, i32* %8, align 4
  %tmp0_v2.i.i = add i32 %15, 2
  store i32 %tmp0_v2.i.i, i32* %8, align 4
  store i32 %tmp0_v2.i.i, i32* %9, align 4
  %spi.bis.681 = ptrtoint[7 x i8]* @str.bis.681 to i32
  store i32 %spi.bis.681, i32* %10, align 16
  store i32 134517225, i32* %11, align 4
  %16 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i58.i, i32 inreg noundef %14, i32 noundef %tmp2_v6.i42.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %17 = lshr i64 %16, 32
  %18 = trunc i64 %17 to i32
  %19 = load i32, i32* %8, align 4
  %tmp0_v2.i12.i = add i32 %19, -2
  store i32 %tmp0_v2.i12.i, i32* %8, align 4
  store i32 %tmp0_v2.i12.i, i32* %9, align 4
  %spi.bis.680 = ptrtoint[7 x i8]* @str.bis.680 to i32
  store i32 %spi.bis.680, i32* %10, align 16
  store i32 134517250, i32* %11, align 4
  %20 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i58.i, i32 inreg noundef %18, i32 noundef %tmp2_v6.i42.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %21 = lshr i64 %20, 32
  %22 = trunc i64 %21 to i32
  %23 = load i32, i32* %8, align 4
  %tmp0_v2.i49.i = shl i32 %23, 1
  store i32 %tmp0_v2.i49.i, i32* %8, align 4
  store i32 %tmp0_v2.i49.i, i32* %9, align 4
  %spi.bis.679 = ptrtoint[7 x i8]* @str.bis.679 to i32
  store i32 %spi.bis.679, i32* %10, align 16
  store i32 134517274, i32* %11, align 4
  %24 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i58.i, i32 inreg noundef %22, i32 noundef %tmp2_v6.i42.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %25 = load i32, i32* %8, align 4
  %tmp0_v2.i71.i = lshr i32 %25, 31
  %tmp0_v3.i72.i = add i32 %tmp0_v2.i71.i, %25
  %tmp0_v4.i73.i = ashr i32 %tmp0_v3.i72.i, 1
  store i32 %tmp0_v4.i73.i, i32* %8, align 4
  store i32 %tmp0_v4.i73.i, i32* %9, align 4
  %spi.bis.678 = ptrtoint[7 x i8]* @str.bis.678 to i32
  store i32 %spi.bis.678, i32* %10, align 16
  store i32 134517310, i32* %11, align 4
  %26 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i58.i, i32 inreg noundef %tmp0_v2.i71.i, i32 noundef %tmp2_v6.i42.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %27 = load i32, i32* %8, align 4
  %tmp0_v3.i26.i = lshr i32 %27, 31
  %tmp0_v4.i27.i = add i32 %tmp0_v3.i26.i, %27
  %tmp0_v5.i28.i = and i32 %tmp0_v4.i27.i, 1
  %tmp0_v6.i29.i = sub nsw i32 %tmp0_v5.i28.i, %tmp0_v3.i26.i
  store i32 %tmp0_v6.i29.i, i32* %8, align 4
  store i32 %tmp0_v6.i29.i, i32* %9, align 4
  %spi.bis.677 = ptrtoint[7 x i8]* @str.bis.677 to i32
  store i32 %spi.bis.677, i32* %10, align 16
  store i32 134517348, i32* %11, align 4
  %28 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i58.i, i32 inreg noundef %tmp0_v3.i26.i, i32 noundef %tmp2_v6.i42.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
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

  tail call fastcc void @assignment684 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack683, i32 0, i32 8092) to i32)) nounwind
