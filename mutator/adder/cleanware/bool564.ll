; Mutation 564
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack563 = internal global [8092 x i32] zeroinitializer, align 16
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.556 = constant [7 x i8] c"\7a\3a\20\25\64\0a\00"
@str.bis.557 = constant [7 x i8] c"\79\3a\20\25\64\0a\00"
@str.bis.558 = constant [7 x i8] c"\78\3a\20\25\64\0a\00"
@str.bis.559 = constant [6 x i8] c"\66\61\6c\73\65\00"
@str.bis.560 = constant [5 x i8] c"\74\72\75\65\00"
@str.bis.561 = constant [6 x i8] c"\66\61\6c\73\65\00"
@str.bis.562 = constant [5 x i8] c"\74\72\75\65\00"

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

declare dso_local i32 @puts(i8* noundef) local_unnamed_addr  "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" 

; Function Attrs: norecurse
define internal fastcc void @bool564(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
Func_80491F8.exit.i:
  %tmp2_v.i46.i = add i32 %arg_esp, 4
  %tmp0_v.i47.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i49.i = add i32 %tmp0_v.i47.i, -4
  %2 = inttoptr i32 %tmp2_v3.i49.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i50.i = add i32 %tmp0_v.i47.i, -8
  %3 = inttoptr i32 %tmp2_v4.i50.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i52.i = add i32 %tmp0_v.i47.i, -12
  %4 = inttoptr i32 %tmp2_v5.i52.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i54.i = add i32 %tmp0_v.i47.i, -16
  %5 = inttoptr i32 %tmp2_v6.i54.i to i32*
  store i32 %tmp2_v.i46.i, i32* %5, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i47.i, -36
  %6 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517201, i32* %6, align 4
  %tmp2_v2.i70.i = add i32 %tmp0_v.i47.i, -48
  %7 = inttoptr i32 %tmp2_v2.i70.i to i32*
  %spi.bis.562 = ptrtoint[5 x i8]* @str.bis.562 to i32
  store i32 %spi.bis.562, i32* %7, align 16
  %tmp2_v3.i71.i = add i32 %tmp0_v.i47.i, -52
  %8 = inttoptr i32 %tmp2_v3.i71.i to i32*
  store i32 134517222, i32* %8, align 4
  %arg.i.i = load i32, i32* %7, align 16
  %9 = inttoptr i32 %arg.i.i to i8*
  %10 = tail call i32 @puts(i8* nonnull dereferenceable(1) %9)
  %spi.bis.561 = ptrtoint[6 x i8]* @str.bis.561 to i32
  store i32 %spi.bis.561, i32* %7, align 16
  store i32 134517240, i32* %8, align 4
  %arg.i.i1 = load i32, i32* %7, align 16
  %11 = inttoptr i32 %arg.i.i1 to i8*
  %12 = tail call i32 @puts(i8* nonnull dereferenceable(1) %11)
  %tmp2_v.i40.i = add i32 %tmp0_v.i47.i, -19
  %13 = inttoptr i32 %tmp2_v.i40.i to i8*
  store i8 1, i8* %13, align 1
  %tmp2_v1.i41.i = add i32 %tmp0_v.i47.i, -18
  %14 = inttoptr i32 %tmp2_v1.i41.i to i8*
  store i8 0, i8* %14, align 2
  %spi.bis.560 = ptrtoint[5 x i8]* @str.bis.560 to i32
  store i32 %spi.bis.560, i32* %7, align 16
  store i32 134517272, i32* %8, align 4
  %arg.i.i2 = load i32, i32* %7, align 16
  %15 = inttoptr i32 %arg.i.i2 to i8*
  %16 = tail call i32 @puts(i8* nonnull dereferenceable(1) %15)
  %spi.bis.559 = ptrtoint[6 x i8]* @str.bis.559 to i32
  store i32 %spi.bis.559, i32* %7, align 16
  store i32 134517336, i32* %8, align 4
  %arg.i.i3 = load i32, i32* %7, align 16
  %17 = inttoptr i32 %arg.i.i3 to i8*
  %18 = tail call i32 @puts(i8* nonnull dereferenceable(1) %17)
  %19 = load i8, i8* %13, align 1
  %tmp0_v1.i29.i = zext i8 %19 to i32
  %tmp2_v3.i31.i = add i32 %tmp0_v.i47.i, -44
  %20 = inttoptr i32 %tmp2_v3.i31.i to i32*
  store i32 %tmp0_v1.i29.i, i32* %20, align 4
  %spi.bis.558 = ptrtoint[7 x i8]* @str.bis.558 to i32
  store i32 %spi.bis.558, i32* %7, align 16
  store i32 134517359, i32* %8, align 4
  %21 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i46.i, i32 inreg noundef 0, i32 noundef %tmp2_v2.i70.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %22 = lshr i64 %21, 32
  %23 = trunc i64 %22 to i32
  %24 = load i8, i8* %14, align 2
  %tmp0_v1.i59.i = zext i8 %24 to i32
  store i32 %tmp0_v1.i59.i, i32* %20, align 4
  %spi.bis.557 = ptrtoint[7 x i8]* @str.bis.557 to i32
  store i32 %spi.bis.557, i32* %7, align 16
  store i32 134517382, i32* %8, align 4
  %25 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i46.i, i32 inreg noundef %23, i32 noundef %tmp2_v2.i70.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %26 = lshr i64 %25, 32
  %27 = trunc i64 %26 to i32
  %tmp2_v.i20.i = add i32 %tmp0_v.i47.i, -17
  %28 = inttoptr i32 %tmp2_v.i20.i to i8*
  store i8 1, i8* %28, align 1
  store i32 1, i32* %20, align 4
  %spi.bis.556 = ptrtoint[7 x i8]* @str.bis.556 to i32
  store i32 %spi.bis.556, i32* %7, align 16
  store i32 134517409, i32* %8, align 4
  %29 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i46.i, i32 inreg noundef %27, i32 noundef %tmp2_v2.i70.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
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

  tail call fastcc void @bool564 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack563, i32 0, i32 8092) to i32)) nounwind
