; Mutation 784
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack783 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.781 = constant [4 x i8] c"\05\50\2d\00"
@str.bis.782 = constant [14 x i8] c"\42\65\66\6f\72\65\3a\20\27\25\73\27\0a\00"

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

; Function Attrs: noinline
declare i32 @strlen(i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @remove_consecutive_spaces784(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
.exit:
  %tmp2_v.i.i = add i32 %arg_esp, 4
  %tmp0_v.i.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i.i, -4
  %2 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i.i = add i32 %tmp0_v.i.i, -8
  %3 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i.i = add i32 %tmp0_v.i.i, -12
  %4 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i.i, -16
  %5 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i.i, i32* %5, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i.i, -68
  %6 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517233, i32* %6, align 4
  %tmp4_v.i.i.b = load i1, i1* @segs.0, align 1
  %7 = inttoptr i32 %arg_esp to i32*
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i19.i = add i32 %tmp0_v.i.i, -20
  %9 = inttoptr i32 %tmp2_v2.i19.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp2_v3.i20.i = add i32 %tmp0_v.i.i, -57
  %10 = inttoptr i32 %tmp2_v3.i20.i to i32*
  store i32 1769108563, i32* %10, align 4
  %tmp2_v4.i21.i = add i32 %tmp0_v.i.i, -53
  %11 = inttoptr i32 %tmp2_v4.i21.i to i32*
  store i32 538994542, i32* %11, align 4
  %tmp2_v5.i22.i = add i32 %tmp0_v.i.i, -49
  %12 = inttoptr i32 %tmp2_v5.i22.i to i32*
  store i32 1953068832, i32* %12, align 4
  %tmp2_v6.i23.i = add i32 %tmp0_v.i.i, -45
  %13 = inttoptr i32 %tmp2_v6.i23.i to i32*
  store i32 538976360, i32* %13, align 4
  %tmp2_v7.i.i = add i32 %tmp0_v.i.i, -41
  %14 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 1936617315, i32* %14, align 4
  %tmp2_v8.i24.i = add i32 %tmp0_v.i.i, -37
  %15 = inttoptr i32 %tmp2_v8.i24.i to i32*
  store i32 1953850213, i32* %15, align 4
  %tmp2_v9.i.i = add i32 %tmp0_v.i.i, -33
  %16 = inttoptr i32 %tmp2_v9.i.i to i32*
  store i32 543520361, i32* %16, align 4
  %tmp2_v10.i.i = add i32 %tmp0_v.i.i, -29
  %17 = inttoptr i32 %tmp2_v10.i.i to i32*
  store i32 1634759456, i32* %17, align 4
  %tmp2_v11.i.i = add i32 %tmp0_v.i.i, -25
  %18 = inttoptr i32 %tmp2_v11.i.i to i32*
  store i32 779314531, i32* %18, align 4
  %tmp2_v12.i.i = add i32 %tmp0_v.i.i, -21
  %19 = inttoptr i32 %tmp2_v12.i.i to i8*
  store i8 0, i8* %19, align 1
  %tmp2_v15.i.i = add i32 %tmp0_v.i.i, -76
  %20 = inttoptr i32 %tmp2_v15.i.i to i32*
  store i32 %tmp2_v3.i20.i, i32* %20, align 4
  %tmp2_v17.i.i = add i32 %tmp0_v.i.i, -80
  %21 = inttoptr i32 %tmp2_v17.i.i to i32*
  %spi.bis.782 = ptrtoint[14 x i8]* @str.bis.782 to i32
  store i32 %spi.bis.782, i32* %21, align 16
  %tmp2_v18.i.i = add i32 %tmp0_v.i.i, -84
  %22 = inttoptr i32 %tmp2_v18.i.i to i32*
  store i32 134517336, i32* %22, align 4
  %23 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i.i, i32 inreg noundef 0, i32 noundef %tmp2_v17.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  store i32 %tmp2_v3.i20.i, i32* %21, align 16
  store i32 134517351, i32* %22, align 4
  %tmp2_v.i46.i.i = add i32 %tmp0_v.i.i, -88
  %24 = inttoptr i32 %tmp2_v.i46.i.i to i32*
  store i32 %tmp2_v4.i.i, i32* %24, align 8
  %tmp2_v1.i48.i.i = add i32 %tmp0_v.i.i, -92
  %25 = inttoptr i32 %tmp2_v1.i48.i.i to i32*
  store i32 134529024, i32* %25, align 4
  %tmp2_v2.i50.i.i = add i32 %tmp0_v.i.i, -116
  %26 = inttoptr i32 %tmp2_v2.i50.i.i to i32*
  %spi.bis.781 = ptrtoint[4 x i8]* @str.bis.781 to i32
  store i32 %spi.bis.781, i32* %26, align 4
  %27 = load i32, i32* %21, align 16
  %tmp2_v3.i28.i.i = add i32 %tmp0_v.i.i, -128
  %28 = inttoptr i32 %tmp2_v3.i28.i.i to i32*
  store i32 %27, i32* %28, align 16
  %tmp2_v4.i29.i.i = add i32 %tmp0_v.i.i, -132
  %29 = inttoptr i32 %tmp2_v4.i29.i.i to i32*
  store i32 134517442, i32* %29, align 4
  %arg.i.i.i = load i32, i32* %28, align 16
  %30 = tail call i32 @strlen(i32 %arg.i.i.i)
  %tmp2_v.i3.i.i = add i32 %tmp0_v.i.i, -100
  %31 = inttoptr i32 %tmp2_v.i3.i.i to i32*
  store i32 %30, i32* %31, align 4
  %tmp2_v1.i4.i.i = add i32 %tmp0_v.i.i, -108
  %32 = inttoptr i32 %tmp2_v1.i4.i.i to i32*
  store i32 0, i32* %32, align 4
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i.i, -109
  %33 = inttoptr i32 %tmp2_v2.i.i.i to i8*
  store i8 1, i8* %33, align 1
  %tmp2_v3.i.i.i = add i32 %tmp0_v.i.i, -104
  %34 = inttoptr i32 %tmp2_v3.i.i.i to i32*
  store i32 0, i32* %34, align 8
  %35 = load i32, i32* %31, align 4
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %BB_80492DC.i.i, label %Func_remove_consecutive_spaces.exit

BB_80492EB.i.i:                                   ; preds = %BB_80492DC.i.i
  %37 = load i8, i8* %33, align 1
  %38 = icmp eq i8 %37, 0
  br i1 %38, label %BB_804930A.i.i, label %BB_80492F1.i.i

BB_804930A.i.i:                                   ; preds = %BB_80492F1.i.i, %BB_80492EB.i.i
  %39 = phi i8 [ 32, %BB_80492EB.i.i ], [ %.pre, %BB_80492F1.i.i ]
  %r_ecx.1.i = phi i32 [ %r_ecx.029.i, %BB_80492EB.i.i ], [ %43, %BB_80492F1.i.i ]
  %.not.i.i.i = icmp ne i8 %39, 32
  %spec.select.i = zext i1 %.not.i.i.i to i8
  store i8 %spec.select.i, i8* %33, align 1
  %40 = load i32, i32* %34, align 8
  %tmp0_v1.i75.i.i = add i32 %40, 1
  store i32 %tmp0_v1.i75.i.i, i32* %34, align 8
  %41 = load i32, i32* %31, align 4
  %42 = icmp slt i32 %tmp0_v1.i75.i.i, %41
  br i1 %42, label %BB_80492DC.i.i, label %Func_remove_consecutive_spaces.exit

BB_80492F1.i.i:                                   ; preds = %BB_80492DC.i.i, %BB_80492EB.i.i
  %43 = load i32, i32* %32, align 4
  %tmp0_v8.i.i.i = add i32 %43, %46
  %44 = inttoptr i32 %tmp0_v8.i.i.i to i8*
  store i8 %48, i8* %44, align 1
  %45 = load i32, i32* %32, align 4
  %tmp0_v12.i.i.i = add i32 %45, 1
  store i32 %tmp0_v12.i.i.i, i32* %32, align 4
  %.pre.i = load i32, i32* %34, align 8
  %.pre30.i = load i32, i32* %21, align 16
  %.pre31.i = add i32 %.pre30.i, %.pre.i
  %.pre32.i = inttoptr i32 %.pre31.i to i8*
  %.pre = load i8, i8* %.pre32.i, align 1
  br label %BB_804930A.i.i

BB_80492DC.i.i:                                   ; preds = %BB_804930A.i.i, %.exit
  %r_ecx.029.i = phi i32 [ %r_ecx.1.i, %BB_804930A.i.i ], [ %tmp2_v.i.i, %.exit ]
  %storemerge28.i = phi i32 [ %tmp0_v1.i75.i.i, %BB_804930A.i.i ], [ 0, %.exit ]
  %46 = load i32, i32* %21, align 16
  %tmp0_v3.i56.i.i = add i32 %46, %storemerge28.i
  %47 = inttoptr i32 %tmp0_v3.i56.i.i to i8*
  %48 = load i8, i8* %47, align 1
  %.not.i60.i.i = icmp eq i8 %48, 32
  br i1 %.not.i60.i.i, label %BB_80492EB.i.i, label %BB_80492F1.i.i

Func_remove_consecutive_spaces.exit:              ; preds = %BB_804930A.i.i, %.exit
  %r_ecx.0.lcssa.i = phi i32 [ %tmp2_v.i.i, %.exit ], [ %r_ecx.1.i, %BB_804930A.i.i ]
  %49 = load i32, i32* %32, align 4
  %50 = load i32, i32* %21, align 16
  %tmp0_v3.i.i.i = add i32 %50, %49
  %51 = inttoptr i32 %tmp0_v3.i.i.i to i8*
  store i8 0, i8* %51, align 1
  %52 = load i32, i32* %25, align 4
  %53 = load i32, i32* %24, align 8
  %tmp2_v.i10.i = add i32 %53, -49
  store i32 %tmp2_v.i10.i, i32* %20, align 4
  %tmp2_v3.i12.i = add i32 %52, -8170
  store i32 %tmp2_v3.i12.i, i32* %21, align 16
  store i32 134517373, i32* %22, align 4
  %54 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.0.lcssa.i, i32 inreg noundef %49, i32 noundef %tmp2_v17.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
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

  tail call fastcc void @remove_consecutive_spaces784 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack783, i32 0, i32 8092) to i32)) nounwind
