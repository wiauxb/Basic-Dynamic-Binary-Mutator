; Mutation 409
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack408 = internal global [8092 x i32] zeroinitializer, align 16
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

; Function Attrs: nofree noinline nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr  nofree noinline nounwind 

; Function Attrs: noinline
declare void @free(i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare i32 @malloc(i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @array_concat409(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
  %tmp2_v.i22.i = add i32 %arg_esp, 4
  %tmp0_v.i23.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i25.i = add i32 %tmp0_v.i23.i, -4
  %3 = inttoptr i32 %tmp2_v3.i25.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i26.i = add i32 %tmp0_v.i23.i, -8
  %4 = inttoptr i32 %tmp2_v4.i26.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i.i = add i32 %tmp0_v.i23.i, -12
  %5 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i23.i, -16
  %6 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i22.i, i32* %6, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i23.i, -100
  %7 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517329, i32* %7, align 4
  %tmp2_v.i30.i = add i32 %arg_esp, 8
  %8 = inttoptr i32 %tmp2_v.i30.i to i32*
  %9 = load i32, i32* %8, align 4
  %tmp2_v2.i33.i = add i32 %tmp0_v.i23.i, -84
  %10 = inttoptr i32 %tmp2_v2.i33.i to i32*
  store i32 %9, i32* %10, align 4
  %tmp4_v.i34.i.b = load i1, i1* @segs.0, align 1
  %11 = inttoptr i32 %arg_esp to i32*
  %12 = load i32, i32* %11, align 4
  %tmp2_v5.i37.i = add i32 %tmp0_v.i23.i, -20
  %13 = inttoptr i32 %tmp2_v5.i37.i to i32*
  store i32 %12, i32* %13, align 4
  %tmp2_v6.i38.i = add i32 %tmp0_v.i23.i, -60
  %14 = inttoptr i32 %tmp2_v6.i38.i to i32*
  store i32 0, i32* %14, align 4
  %tmp2_v7.i.i = add i32 %tmp0_v.i23.i, -56
  %15 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 1, i32* %15, align 8
  %tmp2_v8.i39.i = add i32 %tmp0_v.i23.i, -52
  %16 = inttoptr i32 %tmp2_v8.i39.i to i32*
  store i32 2, i32* %16, align 4
  %tmp2_v9.i.i = add i32 %tmp0_v.i23.i, -48
  %17 = inttoptr i32 %tmp2_v9.i.i to i32*
  store i32 3, i32* %17, align 16
  %tmp2_v10.i.i = add i32 %tmp0_v.i23.i, -44
  %18 = inttoptr i32 %tmp2_v10.i.i to i32*
  store i32 4, i32* %18, align 4
  %tmp2_v11.i.i = add i32 %tmp0_v.i23.i, -40
  %19 = inttoptr i32 %tmp2_v11.i.i to i32*
  store i32 5, i32* %19, align 8
  %tmp2_v12.i.i = add i32 %tmp0_v.i23.i, -36
  %20 = inttoptr i32 %tmp2_v12.i.i to i32*
  store i32 6, i32* %20, align 4
  %tmp2_v13.i.i = add i32 %tmp0_v.i23.i, -32
  %21 = inttoptr i32 %tmp2_v13.i.i to i32*
  store i32 7, i32* %21, align 16
  %tmp2_v14.i.i = add i32 %tmp0_v.i23.i, -28
  %22 = inttoptr i32 %tmp2_v14.i.i to i32*
  store i32 8, i32* %22, align 4
  %tmp2_v15.i.i = add i32 %tmp0_v.i23.i, -24
  %23 = inttoptr i32 %tmp2_v15.i.i to i32*
  store i32 9, i32* %23, align 8
  store i32 5, i32* %7, align 4
  %tmp2_v18.i.i = add i32 %tmp0_v.i23.i, -104
  %24 = inttoptr i32 %tmp2_v18.i.i to i32*
  store i32 %tmp2_v11.i.i, i32* %24, align 8
  %tmp2_v19.i.i = add i32 %tmp0_v.i23.i, -108
  %25 = inttoptr i32 %tmp2_v19.i.i to i32*
  store i32 5, i32* %25, align 4
  %tmp2_v21.i.i = add i32 %tmp0_v.i23.i, -112
  %26 = inttoptr i32 %tmp2_v21.i.i to i32*
  store i32 %tmp2_v6.i38.i, i32* %26, align 16
  %tmp2_v22.i.i = add i32 %tmp0_v.i23.i, -116
  %27 = inttoptr i32 %tmp2_v22.i.i to i32*
  store i32 134517441, i32* %27, align 4
  %tmp2_v.i11.i.i = add i32 %tmp0_v.i23.i, -120
  %28 = inttoptr i32 %tmp2_v.i11.i.i to i32*
  store i32 %tmp2_v4.i26.i, i32* %28, align 8
  %tmp2_v1.i.i.i = add i32 %tmp0_v.i23.i, -124
  %29 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 134529024, i32* %29, align 4
  %tmp2_v2.i15.i.i = add i32 %tmp0_v.i23.i, -148
  %30 = inttoptr i32 %tmp2_v2.i15.i.i to i32*
  store i32 134517580, i32* %30, align 4
  %31 = load i32, i32* %25, align 4
  %32 = load i32, i32* %7, align 4
  %tmp0_v4.i.i.i = add i32 %32, %31
  %tmp0_v5.i.i.i = shl i32 %tmp0_v4.i.i.i, 2
  %tmp2_v7.i.i.i = add i32 %tmp0_v.i23.i, -160
  %33 = inttoptr i32 %tmp2_v7.i.i.i to i32*
  store i32 %tmp0_v5.i.i.i, i32* %33, align 16
  %tmp2_v8.i.i.i = add i32 %tmp0_v.i23.i, -164
  %34 = inttoptr i32 %tmp2_v8.i.i.i to i32*
  store i32 134517606, i32* %34, align 4
  %arg.i.i.i = load i32, i32* %33, align 16
  %35 = tail call i32 @malloc(i32 %arg.i.i.i)
  %tmp2_v.i19.i.i = add i32 %tmp0_v.i23.i, -132
  %36 = inttoptr i32 %tmp2_v.i19.i.i to i32*
  store i32 %35, i32* %36, align 4
  %37 = load i32, i32* %25, align 4
  %tmp0_v3.i21.i.i = shl i32 %37, 2
  %tmp2_v5.i.i.i = add i32 %tmp0_v.i23.i, -152
  %38 = inttoptr i32 %tmp2_v5.i.i.i to i32*
  store i32 %tmp0_v3.i21.i.i, i32* %38, align 8
  %39 = load i32, i32* %26, align 16
  %tmp2_v8.i23.i.i = add i32 %tmp0_v.i23.i, -156
  %40 = inttoptr i32 %tmp2_v8.i23.i.i to i32*
  store i32 %39, i32* %40, align 4
  %41 = load i32, i32* %36, align 4
  store i32 %41, i32* %33, align 16
  store i32 134517633, i32* %34, align 4
  %arg.i.i21.i = load i32, i32* %33, align 16
  %arg2.i.i.i = load i32, i32* %40, align 4
  %arg4.i.i.i = load i32, i32* %38, align 8
  %42 = inttoptr i32 %arg.i.i21.i to i8*
  %43 = inttoptr i32 %arg2.i.i.i to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %42, i8* align 1 %43, i32 %arg4.i.i.i, i1 false)  nounwind 
  %44 = load i32, i32* %7, align 4
  %tmp4_v.i29.i.i = shl i32 %44, 2
  %45 = load i32, i32* %25, align 4
  %tmp4_v4.i.i.i = shl i32 %45, 2
  %46 = load i32, i32* %36, align 4
  %tmp0_v7.i34.i.i = add i32 %46, %tmp4_v4.i.i.i
  store i32 %tmp4_v.i29.i.i, i32* %38, align 8
  %47 = load i32, i32* %24, align 8
  store i32 %47, i32* %40, align 4
  store i32 %tmp0_v7.i34.i.i, i32* %33, align 16
  store i32 134517674, i32* %34, align 4
  %arg.i.i22.i = load i32, i32* %33, align 16
  %arg2.i.i23.i = load i32, i32* %40, align 4
  %arg4.i.i24.i = load i32, i32* %38, align 8
  %48 = inttoptr i32 %arg.i.i22.i to i8*
  %49 = inttoptr i32 %arg2.i.i23.i to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %48, i8* align 1 %49, i32 %arg4.i.i24.i, i1 false)  nounwind 
  %50 = load i32, i32* %36, align 4
  %51 = load i32, i32* %29, align 4
  %52 = load i32, i32* %28, align 8
  %tmp2_v.i4.i = add i32 %52, -56
  %53 = inttoptr i32 %tmp2_v.i4.i to i32*
  store i32 %50, i32* %53, align 4
  %tmp2_v1.i.i = add i32 %52, -60
  %54 = inttoptr i32 %tmp2_v1.i.i to i32*
  %tmp2_v10.i62.i = add i32 %51, -8184
  store i32 0, i32* %54, align 4
  br label %BB_80492D0.i

BB_8049301.i:                                     ; preds = %BB_80492D0.i
  store i32 10, i32* %26, align 16
  store i32 134517515, i32* %27, align 4
  %arg.i.i = load i32, i32* %26, align 16
  %55 = tail call i32 @putchar(i32 %arg.i.i)  nounwind 
  %56 = load i32, i32* %53, align 4
  store i32 %56, i32* %26, align 16
  store i32 134517529, i32* %27, align 4
  %arg.i.i4 = load i32, i32* %26, align 16
  tail call void @free(i32 %arg.i.i4)
  ret void

BB_80492D0.i:                                     ; preds = %BB_80492D0.i, %0
  %storemerge5 = phi i32 [ 0, %0 ], [ %tmp0_v2.i.i, %BB_80492D0.i ]
  %tmp4_v.i51.i = shl i32 %storemerge5, 2
  %57 = load i32, i32* %53, align 4
  %tmp0_v3.i54.i = add i32 %57, %tmp4_v.i51.i
  %58 = inttoptr i32 %tmp0_v3.i54.i to i32*
  %59 = load i32, i32* %58, align 4
  store i32 %59, i32* %24, align 8
  %60 = load i32, i32* %54, align 4
  store i32 %60, i32* %25, align 4
  store i32 %tmp2_v10.i62.i, i32* %26, align 16
  store i32 134517492, i32* %27, align 4
  %61 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp4_v4.i.i.i, i32 inreg noundef %tmp4_v.i51.i, i32 noundef %tmp2_v21.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %62 = load i32, i32* %54, align 4
  %tmp0_v2.i.i = add i32 %62, 1
  store i32 %tmp0_v2.i.i, i32* %54, align 4
  %63 = icmp slt i32 %tmp0_v2.i.i, 10
  br i1 %63, label %BB_80492D0.i, label %BB_8049301.i
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg)  argmemonly nofree nounwind willreturn 


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

  tail call fastcc void @array_concat409 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack408, i32 0, i32 8092) to i32)) nounwind
