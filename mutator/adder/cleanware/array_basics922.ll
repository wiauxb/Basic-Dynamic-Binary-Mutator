; Mutation 922
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack921 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.919 = constant [16 x i8] c"grade[%d] = %d\0a\00"
@str.920 = constant [13 x i8] c"average: %d\0a\00"

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
define internal fastcc void @array_basics922(i32 %arg_esp) unnamed_addr  norecurse nounwind  !retregs !12 {
  %tmp2_v.i2.i = add i32 %arg_esp, 4
  %tmp0_v.i3.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i3.i, -4
  %3 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i.i = add i32 %tmp0_v.i3.i, -8
  %4 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i.i = add i32 %tmp0_v.i3.i, -12
  %5 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i6.i = add i32 %tmp0_v.i3.i, -16
  %6 = inttoptr i32 %tmp2_v6.i6.i to i32*
  store i32 %tmp2_v.i2.i, i32* %6, align 16
  %tmp2_v8.i8.i = add i32 %tmp0_v.i3.i, -68
  %7 = inttoptr i32 %tmp2_v8.i8.i to i32*
  store i32 134517201, i32* %7, align 4
  %tmp4_v.i31.i.b = load i1, i1* @segs.0, align 1
  %8 = inttoptr i32 %arg_esp to i32*
  %9 = load i32, i32* %8, align 4
  %tmp2_v2.i35.i = add i32 %tmp0_v.i3.i, -20
  %10 = inttoptr i32 %tmp2_v2.i35.i to i32*
  store i32 %9, i32* %10, align 4
  %tmp2_v3.i36.i = add i32 %tmp0_v.i3.i, -40
  %11 = inttoptr i32 %tmp2_v3.i36.i to i32*
  store i32 91, i32* %11, align 8
  %tmp2_v4.i37.i = add i32 %tmp0_v.i3.i, -36
  %12 = inttoptr i32 %tmp2_v4.i37.i to i32*
  store i32 82, i32* %12, align 4
  %tmp2_v5.i38.i = add i32 %tmp0_v.i3.i, -32
  %13 = inttoptr i32 %tmp2_v5.i38.i to i32*
  store i32 73, i32* %13, align 16
  %tmp2_v6.i39.i = add i32 %tmp0_v.i3.i, -28
  %14 = inttoptr i32 %tmp2_v6.i39.i to i32*
  store i32 64, i32* %14, align 4
  %tmp2_v7.i40.i = add i32 %tmp0_v.i3.i, -24
  %15 = inttoptr i32 %tmp2_v7.i40.i to i32*
  store i32 55, i32* %15, align 8
  %tmp2_v8.i41.i = add i32 %tmp0_v.i3.i, -56
  %16 = inttoptr i32 %tmp2_v8.i41.i to i32*
  %tmp2_v5.i51.i = add i32 %tmp0_v.i3.i, -72
  %17 = inttoptr i32 %tmp2_v5.i51.i to i32*
  %tmp2_v8.i54.i = add i32 %tmp0_v.i3.i, -76
  %18 = inttoptr i32 %tmp2_v8.i54.i to i32*
  %tmp2_v10.i56.i = add i32 %tmp0_v.i3.i, -80
  %19 = inttoptr i32 %tmp2_v10.i56.i to i32*
  %tmp2_v11.i57.i = add i32 %tmp0_v.i3.i, -84
  %20 = inttoptr i32 %tmp2_v11.i57.i to i32*
  store i32 0, i32* %16, align 8
  br label %BB_804920E.i

BB_8049259.i:                                     ; preds = %BB_8049245.i
  %21 = load i32, i32* %30, align 4
  %tmp16_v.i.i = sext i32 %21 to i64
  %tmp15_v.i.i = mul nsw i64 %tmp16_v.i.i, 1717986919
  %tmp15_v1.i.i = lshr i64 %tmp15_v.i.i, 32
  %22 = trunc i64 %tmp15_v1.i.i to i32
  %tmp0_v3.i.i = ashr i32 %22, 1
  %tmp0_v4.i.i.neg = lshr i32 %21, 31
  %tmp0_v5.i.i = add nsw i32 %tmp0_v3.i.i, %tmp0_v4.i.i.neg
  %tmp2_v6.i.i = add i32 %tmp0_v.i3.i, -44
  %23 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp0_v5.i.i, i32* %23, align 4
  store i32 %tmp0_v5.i.i, i32* %18, align 4
  %spi.bis.920 = ptrtoint[13 x i8]* @str.920 to i32
  store i32 %spi.bis.920, i32* %19, align 16
  store i32 134517381, i32* %20, align 4
  %24 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %21, i32 inreg noundef %tmp0_v5.i.i, i32 noundef %tmp2_v10.i56.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  ret void

BB_8049245.i:                                     ; preds = %BB_8049235.i, %BB_8049245.i
  %storemerge9 = phi i32 [ 0, %BB_8049235.i ], [ %tmp0_v9.i22.i, %BB_8049245.i ]
  %tmp4_v.i.i = shl i32 %storemerge9, 2
  %tmp2_v2.i.i = add i32 %tmp4_v.i.i, %tmp2_v3.i36.i
  %25 = inttoptr i32 %tmp2_v2.i.i to i32*
  %26 = load i32, i32* %25, align 4
  %27 = load i32, i32* %30, align 4
  %tmp0_v6.i.i = add i32 %27, %26
  store i32 %tmp0_v6.i.i, i32* %30, align 4
  %28 = load i32, i32* %31, align 16
  %tmp0_v9.i22.i = add i32 %28, 1
  store i32 %tmp0_v9.i22.i, i32* %31, align 16
  %29 = icmp slt i32 %tmp0_v9.i22.i, 5
  br i1 %29, label %BB_8049245.i, label %BB_8049259.i

BB_8049235.i:                                     ; preds = %BB_804920E.i
  %tmp2_v.i27.i = add i32 %tmp0_v.i3.i, -52
  %30 = inttoptr i32 %tmp2_v.i27.i to i32*
  store i32 0, i32* %30, align 4
  %tmp2_v1.i28.i = add i32 %tmp0_v.i3.i, -48
  %31 = inttoptr i32 %tmp2_v1.i28.i to i32*
  store i32 0, i32* %31, align 16
  br label %BB_8049245.i

BB_804920E.i:                                     ; preds = %BB_804920E.i, %0
  %r_edx.08 = phi i32 [ 0, %0 ], [ %37, %BB_804920E.i ]
  %storemerge17 = phi i32 [ 0, %0 ], [ %tmp0_v2.i13.i, %BB_804920E.i ]
  %tmp4_v.i46.i = shl i32 %storemerge17, 2
  %tmp2_v2.i47.i = add i32 %tmp4_v.i46.i, %tmp2_v3.i36.i
  %32 = inttoptr i32 %tmp2_v2.i47.i to i32*
  %33 = load i32, i32* %32, align 4
  store i32 %33, i32* %17, align 8
  %34 = load i32, i32* %16, align 8
  store i32 %34, i32* %18, align 4
  %spi.bis.919 = ptrtoint[16 x i8]* @str.919 to i32
  store i32 %spi.bis.919, i32* %19, align 16
  store i32 134517288, i32* %20, align 4
  %35 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i2.i, i32 inreg noundef %r_edx.08, i32 noundef %tmp2_v10.i56.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %36 = lshr i64 %35, 32
  %37 = trunc i64 %36 to i32
  %38 = load i32, i32* %16, align 8
  %tmp0_v2.i13.i = add i32 %38, 1
  store i32 %tmp0_v2.i13.i, i32* %16, align 8
  %39 = icmp slt i32 %tmp0_v2.i13.i, 5
  br i1 %39, label %BB_804920E.i, label %BB_8049235.i
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

  tail call fastcc void @array_basics922 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack921, i32 0, i32 8092) to i32)) nounwind
