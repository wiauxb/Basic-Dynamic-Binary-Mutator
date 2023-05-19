; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack = internal global [4194304 x i32] zeroinitializer, align 16
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
define dso_local noundef i32 @main(i32 noundef %0, i8** noundef %1, i8** noundef %2) local_unnamed_addr  norecurse nounwind uwtable "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic"  {
  %4 = tail call i32 asm "pushf\0A\09popl $0", "=r,~{dirflag},~{fpsr},~{flags}"()  nounwind readnone 
  store i1 true, i1* @segs.0, align 1
  tail call fastcc void @helper_fninit()  nobuiltin nounwind "no-builtins" 
  %5 = ptrtoint i8** %2 to i32
  store i32 %5, i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194303), align 4, !tbaa !10
  %6 = ptrtoint i8** %1 to i32
  store i32 %6, i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194302), align 8, !tbaa !10
  store i32 %0, i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194301), align 4, !tbaa !10
  %7 = tail call i8* @llvm.returnaddress(i32 0)
  %8 = ptrtoint i8* %7 to i32
  store i32 %8, i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300), align 16, !tbaa !10
  tail call fastcc void @Func_main(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32))  nounwind 
  ret i32 0
}

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i8* @llvm.returnaddress(i32 immarg)  nofree nosync nounwind readnone willreturn 

; Function Attrs: noinline
declare i32 @tolower(i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @count_vowels_recursionm15161636(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
.exit:
  %tmp2_v.i8.i = add i32 %arg_esp, 4
  %tmp0_v.i9.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i10.i = add i32 %tmp0_v.i9.i, -4
  %2 = inttoptr i32 %tmp2_v3.i10.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i11.i = add i32 %tmp0_v.i9.i, -8
  %3 = inttoptr i32 %tmp2_v4.i11.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i13.i = add i32 %tmp0_v.i9.i, -12
  %4 = inttoptr i32 %tmp2_v5.i13.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i15.i = add i32 %tmp0_v.i9.i, -16
  %5 = inttoptr i32 %tmp2_v6.i15.i to i32*
  store i32 %tmp2_v.i8.i, i32* %5, align 16
  %tmp2_v8.i16.i = add i32 %tmp0_v.i9.i, -68
  %6 = inttoptr i32 %tmp2_v8.i16.i to i32*
  store i32 134517233, i32* %6, align 4
  %tmp4_v.i2.i.b = load i1, i1* @segs.0, align 1
  %7 = select i1 %tmp4_v.i2.i.b, i32* inttoptr (i32 add (i32 ptrtoint ([1024 x i8]* @_ZL6segmem to i32), i32 20) to i32*), i32* inttoptr (i32 20 to i32*)
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i.i = add i32 %tmp0_v.i9.i, -20
  %9 = inttoptr i32 %tmp2_v2.i.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i9.i, -53
  %10 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 1652121933, i32* %10, align 4
  %tmp2_v4.i6.i = add i32 %tmp0_v.i9.i, -49
  %11 = inttoptr i32 %tmp2_v4.i6.i to i32*
  store i32 1701584997, i32* %11, align 4
  %tmp2_v5.i.i = add i32 %tmp0_v.i9.i, -45
  %12 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 544417652, i32* %12, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i9.i, -41
  %13 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 544830068, i32* %13, align 4
  %tmp2_v7.i.i = add i32 %tmp0_v.i9.i, -37
  %14 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 1936287860, i32* %14, align 4
  %tmp2_v8.i.i = add i32 %tmp0_v.i9.i, -33
  %15 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 1920234272, i32* %15, align 4
  %tmp2_v9.i.i = add i32 %tmp0_v.i9.i, -29
  %16 = inttoptr i32 %tmp2_v9.i.i to i32*
  store i32 543649385, i32* %16, align 4
  %tmp2_v10.i.i = add i32 %tmp0_v.i9.i, -25
  %17 = inttoptr i32 %tmp2_v10.i.i to i32*
  store i32 561280367, i32* %17, align 4
  %tmp2_v11.i.i = add i32 %tmp0_v.i9.i, -21
  %18 = inttoptr i32 %tmp2_v11.i.i to i8*
  store i8 0, i8* %18, align 1
  %tmp2_v14.i.i = add i32 %tmp0_v.i9.i, -80
  %19 = inttoptr i32 %tmp2_v14.i.i to i32*
  store i32 %tmp2_v3.i.i, i32* %19, align 16
  %tmp2_v15.i.i = add i32 %tmp0_v.i9.i, -84
  %20 = inttoptr i32 %tmp2_v15.i.i to i32*
  store i32 134517322, i32* %20, align 4
  %21 = tail call fastcc { i32, i32, i32, i32, i32 } @Func_count_vowels(i32 %tmp2_v15.i.i, i32 %tmp2_v4.i11.i, i32 134529024)
  %22 = extractvalue { i32, i32, i32, i32, i32 } %21, 0
  %23 = extractvalue { i32, i32, i32, i32, i32 } %21, 1
  %24 = extractvalue { i32, i32, i32, i32, i32 } %21, 2
  %25 = extractvalue { i32, i32, i32, i32, i32 } %21, 3
  %26 = extractvalue { i32, i32, i32, i32, i32 } %21, 4
  %tmp2_v.i28.i = add i32 %25, -52
  %27 = inttoptr i32 %tmp2_v.i28.i to i32*
  store i32 %23, i32* %27, align 4
  %tmp2_v4.i32.i = add i32 %22, 4
  %28 = inttoptr i32 %tmp2_v4.i32.i to i32*
  store i32 %23, i32* %28, align 4
  %tmp2_v5.i34.i = add i32 %26, -8184
  %29 = inttoptr i32 %22 to i32*
  store i32 %tmp2_v5.i34.i, i32* %29, align 4
  %tmp2_v7.i35.i = add i32 %22, -4
  %30 = inttoptr i32 %tmp2_v7.i35.i to i32*
  store i32 134517346, i32* %30, align 4
  %31 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i8.i, i32 inreg noundef %24, i32 noundef %22, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  ret void
}

define internal fastcc { i32, i32, i32, i32, i32 } @Func_count_vowels(i32 %arg_esp, i32 %arg_ebp, i32 %arg_ebx) unnamed_addr !retregs !14 {
Func_8049295.exit.i:
  %tmp2_v.i9.i = add i32 %arg_esp, -4
  %0 = inttoptr i32 %tmp2_v.i9.i to i32*
  store i32 %arg_ebp, i32* %0, align 4
  %tmp2_v1.i.i = add i32 %arg_esp, -8
  %1 = inttoptr i32 %tmp2_v1.i.i to i32*
  store i32 %arg_ebx, i32* %1, align 4
  %tmp2_v2.i.i = add i32 %arg_esp, -32
  %2 = inttoptr i32 %tmp2_v2.i.i to i32*
  store i32 134517397, i32* %2, align 4
  %tmp2_v.i33.i = add i32 %arg_esp, 4
  %3 = inttoptr i32 %tmp2_v.i33.i to i32*
  %4 = load i32, i32* %3, align 4
  %5 = inttoptr i32 %4 to i8*
  %6 = load i8, i8* %5, align 1
  %.not.i.i = icmp eq i8 %6, 0
  br i1 %.not.i.i, label %.exit, label %BB_80492AB.i

BB_80492E3.i:                                     ; preds = %BB_80492AB.i, %BB_80492D1.i, %BB_80492D1.i, %BB_80492D1.i
  %7 = load i32, i32* %3, align 4
  %tmp0_v1.i15.i = add i32 %7, 1
  store i32 %tmp0_v1.i15.i, i32* %12, align 4
  store i32 134517490, i32* %13, align 4
  %8 = tail call fastcc { i32, i32, i32, i32, i32 } @Func_count_vowels(i32 %tmp2_v5.i.i, i32 %tmp2_v.i9.i, i32 134529024)
  %9 = extractvalue { i32, i32, i32, i32, i32 } %8, 1
  %10 = extractvalue { i32, i32, i32, i32, i32 } %8, 2
  %11 = extractvalue { i32, i32, i32, i32, i32 } %8, 3
  %tmp0_v1.i.i = add i32 %9, 1
  br label %.exit

BB_80492D1.i:                                     ; preds = %BB_80492AB.i
  switch i8 %15, label %BB_80492FA.i [
    i8 105, label %BB_80492E3.i
    i8 111, label %BB_80492E3.i
    i8 117, label %BB_80492E3.i
  ]

BB_80492AB.i:                                     ; preds = %Func_8049295.exit.i
  %tmp0_v2.i41.i = sext i8 %6 to i32
  %tmp2_v4.i44.i = add i32 %arg_esp, -44
  %12 = inttoptr i32 %tmp2_v4.i44.i to i32*
  store i32 %tmp0_v2.i41.i, i32* %12, align 4
  %tmp2_v5.i.i = add i32 %arg_esp, -48
  %13 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 134517439, i32* %13, align 4
  %arg.i.i = load i32, i32* %12, align 4
  %14 = tail call i32 @tolower(i32 %arg.i.i)
  %tmp2_v.i57.i = add i32 %arg_esp, -13
  %15 = trunc i32 %14 to i8
  %16 = inttoptr i32 %tmp2_v.i57.i to i8*
  store i8 %15, i8* %16, align 1
  %cc_dst_v.i61.i = add i32 %14, 159
  %tmp4_v.i62.i = and i32 %cc_dst_v.i61.i, 255
  %17 = icmp eq i32 %tmp4_v.i62.i, 0
  %18 = icmp eq i8 %15, 101
  %or.cond = select i1 %17, i1 true, i1 %18
  br i1 %or.cond, label %BB_80492E3.i, label %BB_80492D1.i

BB_80492FA.i:                                     ; preds = %BB_80492D1.i
  %19 = load i32, i32* %3, align 4
  %tmp0_v1.i49.i = add i32 %19, 1
  store i32 %tmp0_v1.i49.i, i32* %12, align 4
  store i32 134517513, i32* %13, align 4
  %20 = tail call fastcc { i32, i32, i32, i32, i32 } @Func_count_vowels(i32 %tmp2_v5.i.i, i32 %tmp2_v.i9.i, i32 134529024)
  %21 = extractvalue { i32, i32, i32, i32, i32 } %20, 1
  %22 = extractvalue { i32, i32, i32, i32, i32 } %20, 2
  %23 = extractvalue { i32, i32, i32, i32, i32 } %20, 3
  br label %.exit

.exit:                                            ; preds = %BB_80492FA.i, %BB_80492E3.i, %Func_8049295.exit.i
  %r_edx.0 = phi i32 [ %10, %BB_80492E3.i ], [ %22, %BB_80492FA.i ], [ 0, %Func_8049295.exit.i ]
  %r_ebp.0 = phi i32 [ %11, %BB_80492E3.i ], [ %23, %BB_80492FA.i ], [ %tmp2_v.i9.i, %Func_8049295.exit.i ]
  %r_eax.0 = phi i32 [ %tmp0_v1.i.i, %BB_80492E3.i ], [ %21, %BB_80492FA.i ], [ 0, %Func_8049295.exit.i ]
  %tmp2_v.i72.i = add i32 %r_ebp.0, -4
  %24 = inttoptr i32 %tmp2_v.i72.i to i32*
  %25 = load i32, i32* %24, align 4
  %26 = inttoptr i32 %r_ebp.0 to i32*
  %27 = load i32, i32* %26, align 4
  %tmp4_v3.i.i = add i32 %r_ebp.0, 8
  %mrv = insertvalue { i32, i32, i32, i32, i32 } undef, i32 %tmp4_v3.i.i, 0
  %mrv1 = insertvalue { i32, i32, i32, i32, i32 } %mrv, i32 %r_eax.0, 1
  %mrv2 = insertvalue { i32, i32, i32, i32, i32 } %mrv1, i32 %r_edx.0, 2
  %mrv3 = insertvalue { i32, i32, i32, i32, i32 } %mrv2, i32 %27, 3
  %mrv4 = insertvalue { i32, i32, i32, i32, i32 } %mrv3, i32 %25, 4
  ret { i32, i32, i32, i32, i32 } %mrv4
}

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

  tail call fastcc void @count_vowels_recursionm15161636(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) nounwind