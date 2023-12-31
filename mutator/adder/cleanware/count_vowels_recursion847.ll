; Mutation 847
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack846 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false

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
declare i32 @tolower(i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @count_vowels_recursion847(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
.exit:
  %tmp2_v.i27.i = add i32 %arg_esp, 4
  %tmp0_v.i28.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i29.i = add i32 %tmp0_v.i28.i, -4
  %2 = inttoptr i32 %tmp2_v3.i29.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i30.i = add i32 %tmp0_v.i28.i, -8
  %3 = inttoptr i32 %tmp2_v4.i30.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i32.i = add i32 %tmp0_v.i28.i, -12
  %4 = inttoptr i32 %tmp2_v5.i32.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i34.i = add i32 %tmp0_v.i28.i, -16
  %5 = inttoptr i32 %tmp2_v6.i34.i to i32*
  store i32 %tmp2_v.i27.i, i32* %5, align 16
  %tmp2_v8.i35.i = add i32 %tmp0_v.i28.i, -68
  %6 = inttoptr i32 %tmp2_v8.i35.i to i32*
  store i32 134517233, i32* %6, align 4
  %tmp4_v.i17.i.b = load i1, i1* @segs.0, align 1
  %7 = inttoptr i32 %arg_esp to i32*
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i21.i = add i32 %tmp0_v.i28.i, -20
  %9 = inttoptr i32 %tmp2_v2.i21.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i28.i, -53
  %10 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 1652121933, i32* %10, align 4
  %tmp2_v4.i22.i = add i32 %tmp0_v.i28.i, -49
  %11 = inttoptr i32 %tmp2_v4.i22.i to i32*
  store i32 1701584997, i32* %11, align 4
  %tmp2_v5.i23.i = add i32 %tmp0_v.i28.i, -45
  %12 = inttoptr i32 %tmp2_v5.i23.i to i32*
  store i32 544417652, i32* %12, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i28.i, -41
  %13 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 544830068, i32* %13, align 4
  %tmp2_v7.i24.i = add i32 %tmp0_v.i28.i, -37
  %14 = inttoptr i32 %tmp2_v7.i24.i to i32*
  store i32 1936287860, i32* %14, align 4
  %tmp2_v8.i.i = add i32 %tmp0_v.i28.i, -33
  %15 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 1920234272, i32* %15, align 4
  %tmp2_v9.i.i = add i32 %tmp0_v.i28.i, -29
  %16 = inttoptr i32 %tmp2_v9.i.i to i32*
  store i32 543649385, i32* %16, align 4
  %tmp2_v10.i.i = add i32 %tmp0_v.i28.i, -25
  %17 = inttoptr i32 %tmp2_v10.i.i to i32*
  store i32 561280367, i32* %17, align 4
  %tmp2_v11.i.i = add i32 %tmp0_v.i28.i, -21
  %18 = inttoptr i32 %tmp2_v11.i.i to i8*
  store i8 0, i8* %18, align 1
  %tmp2_v14.i.i = add i32 %tmp0_v.i28.i, -80
  %19 = inttoptr i32 %tmp2_v14.i.i to i32*
  store i32 %tmp2_v3.i.i, i32* %19, align 16
  %tmp2_v15.i.i = add i32 %tmp0_v.i28.i, -84
  %20 = inttoptr i32 %tmp2_v15.i.i to i32*
  store i32 134517322, i32* %20, align 4
  %21 = tail call fastcc { i32, i32, i32, i32, i32 } @Func_count_vowels(i32 %tmp2_v15.i.i, i32 %tmp2_v4.i30.i, i32 134529024)
  %22 = extractvalue { i32, i32, i32, i32, i32 } %21, 0
  %23 = extractvalue { i32, i32, i32, i32, i32 } %21, 1
  %24 = extractvalue { i32, i32, i32, i32, i32 } %21, 2
  %25 = extractvalue { i32, i32, i32, i32, i32 } %21, 3
  %26 = extractvalue { i32, i32, i32, i32, i32 } %21, 4
  %tmp2_v.i10.i = add i32 %25, -52
  %27 = inttoptr i32 %tmp2_v.i10.i to i32*
  store i32 %23, i32* %27, align 4
  %tmp2_v4.i14.i = add i32 %22, 4
  %28 = inttoptr i32 %tmp2_v4.i14.i to i32*
  store i32 %23, i32* %28, align 4
  %tmp2_v5.i.i = add i32 %26, -8184
  %29 = inttoptr i32 %22 to i32*
  store i32 %tmp2_v5.i.i, i32* %29, align 4
  %tmp2_v7.i.i = add i32 %22, -4
  %30 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 134517346, i32* %30, align 4
  %31 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i27.i, i32 inreg noundef %24, i32 noundef %22, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  ret void
}

define internal fastcc { i32, i32, i32, i32, i32 } @Func_count_vowels(i32 %arg_esp, i32 %arg_ebp, i32 %arg_ebx) unnamed_addr !retregs !14 {
Func_8049295.exit.i:
  %tmp2_v.i31.i = add i32 %arg_esp, -4
  %0 = inttoptr i32 %tmp2_v.i31.i to i32*
  store i32 %arg_ebp, i32* %0, align 4
  %tmp2_v1.i.i = add i32 %arg_esp, -8
  %1 = inttoptr i32 %tmp2_v1.i.i to i32*
  store i32 %arg_ebx, i32* %1, align 4
  %tmp2_v2.i.i = add i32 %arg_esp, -32
  %2 = inttoptr i32 %tmp2_v2.i.i to i32*
  store i32 134517397, i32* %2, align 4
  %tmp2_v.i12.i = add i32 %arg_esp, 4
  %3 = inttoptr i32 %tmp2_v.i12.i to i32*
  %4 = load i32, i32* %3, align 4
  %5 = inttoptr i32 %4 to i8*
  %6 = load i8, i8* %5, align 1
  %.not.i.i = icmp eq i8 %6, 0
  br i1 %.not.i.i, label %.exit, label %BB_80492AB.i

BB_80492E3.i:                                     ; preds = %BB_80492D7.i, %BB_80492D7.i, %BB_80492AB.i
  %7 = load i32, i32* %3, align 4
  %tmp0_v1.i.i = add i32 %7, 1
  store i32 %tmp0_v1.i.i, i32* %17, align 4
  store i32 134517490, i32* %18, align 4
  %8 = tail call fastcc { i32, i32, i32, i32, i32 } @Func_count_vowels(i32 %tmp2_v5.i.i, i32 %tmp2_v.i31.i, i32 134529024)
  %9 = extractvalue { i32, i32, i32, i32, i32 } %8, 1
  %10 = extractvalue { i32, i32, i32, i32, i32 } %8, 2
  %11 = extractvalue { i32, i32, i32, i32, i32 } %8, 3
  %tmp0_v1.i37.i = add i32 %9, 1
  br label %.exit

BB_80492FA.i:                                     ; preds = %BB_80492D7.i
  %12 = load i32, i32* %3, align 4
  %tmp0_v1.i25.i = add i32 %12, 1
  store i32 %tmp0_v1.i25.i, i32* %17, align 4
  store i32 134517513, i32* %18, align 4
  %13 = tail call fastcc { i32, i32, i32, i32, i32 } @Func_count_vowels(i32 %tmp2_v5.i.i, i32 %tmp2_v.i31.i, i32 134529024)
  %14 = extractvalue { i32, i32, i32, i32, i32 } %13, 1
  %15 = extractvalue { i32, i32, i32, i32, i32 } %13, 2
  %16 = extractvalue { i32, i32, i32, i32, i32 } %13, 3
  br label %.exit

BB_80492AB.i:                                     ; preds = %Func_8049295.exit.i
  %tmp0_v2.i59.i = sext i8 %6 to i32
  %tmp2_v4.i61.i = add i32 %arg_esp, -44
  %17 = inttoptr i32 %tmp2_v4.i61.i to i32*
  store i32 %tmp0_v2.i59.i, i32* %17, align 4
  %tmp2_v5.i.i = add i32 %arg_esp, -48
  %18 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 134517439, i32* %18, align 4
  %arg.i.i = load i32, i32* %17, align 4
  %19 = tail call i32 @tolower(i32 %arg.i.i)
  %tmp2_v.i48.i = add i32 %arg_esp, -13
  %20 = trunc i32 %19 to i8
  %21 = inttoptr i32 %tmp2_v.i48.i to i8*
  store i8 %20, i8* %21, align 1
  %cc_dst_v.i52.i = add i32 %19, 159
  %tmp4_v.i53.i = and i32 %cc_dst_v.i52.i, 255
  %22 = icmp eq i32 %tmp4_v.i53.i, 0
  %23 = icmp eq i8 %20, 101
  %or.cond = select i1 %22, i1 true, i1 %23
  %24 = icmp eq i8 %20, 105
  %or.cond43 = select i1 %or.cond, i1 true, i1 %24
  br i1 %or.cond43, label %BB_80492E3.i, label %BB_80492D7.i

BB_80492D7.i:                                     ; preds = %BB_80492AB.i
  switch i8 %20, label %BB_80492FA.i [
    i8 111, label %BB_80492E3.i
    i8 117, label %BB_80492E3.i
  ]

.exit:                                            ; preds = %BB_80492FA.i, %BB_80492E3.i, %Func_8049295.exit.i
  %r_ebp.0 = phi i32 [ %11, %BB_80492E3.i ], [ %16, %BB_80492FA.i ], [ %tmp2_v.i31.i, %Func_8049295.exit.i ]
  %r_eax.0 = phi i32 [ %tmp0_v1.i37.i, %BB_80492E3.i ], [ %14, %BB_80492FA.i ], [ 0, %Func_8049295.exit.i ]
  %r_edx.0 = phi i32 [ %10, %BB_80492E3.i ], [ %15, %BB_80492FA.i ], [ 0, %Func_8049295.exit.i ]
  %tmp2_v.i5.i = add i32 %r_ebp.0, -4
  %25 = inttoptr i32 %tmp2_v.i5.i to i32*
  %26 = load i32, i32* %25, align 4
  %27 = inttoptr i32 %r_ebp.0 to i32*
  %28 = load i32, i32* %27, align 4
  %tmp4_v3.i.i = add i32 %r_ebp.0, 8
  %mrv = insertvalue { i32, i32, i32, i32, i32 } undef, i32 %tmp4_v3.i.i, 0
  %mrv1 = insertvalue { i32, i32, i32, i32, i32 } %mrv, i32 %r_eax.0, 1
  %mrv2 = insertvalue { i32, i32, i32, i32, i32 } %mrv1, i32 %r_edx.0, 2
  %mrv3 = insertvalue { i32, i32, i32, i32, i32 } %mrv2, i32 %28, 3
  %mrv4 = insertvalue { i32, i32, i32, i32, i32 } %mrv3, i32 %26, 4
  ret { i32, i32, i32, i32, i32 } %mrv4
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
!12 = !{i32 0, i32 0, i32 0}
!13 = !{!"printf"}
!14 = !{i32 0, i32 3, i32 4}

  tail call fastcc void @count_vowels_recursion847 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack846, i32 0, i32 8092) to i32)) nounwind
