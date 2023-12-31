; Mutation 939
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack938 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.936 = constant [4 x i8] c"\25\64\20\00"
@str.bis.937 = constant [4 x i8] c"\05\34\2d\00"

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

; Function Attrs: norecurse nounwind
define internal fastcc void @move_zeros939(i32 %arg_esp) unnamed_addr  norecurse nounwind  !retregs !12 {
  %tmp2_v.i.i = add i32 %arg_esp, 4
  %tmp0_v.i.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i.i, -4
  %3 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i.i = add i32 %tmp0_v.i.i, -8
  %4 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i.i = add i32 %tmp0_v.i.i, -12
  %5 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i.i, -16
  %6 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i.i, i32* %6, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i.i, -84
  %7 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517233, i32* %7, align 4
  %tmp4_v.i.i.b = load i1, i1* @segs.0, align 1
  %8 = inttoptr i32 %arg_esp to i32*
  %9 = load i32, i32* %8, align 4
  %tmp2_v2.i.i = add i32 %tmp0_v.i.i, -20
  %10 = inttoptr i32 %tmp2_v2.i.i to i32*
  store i32 %9, i32* %10, align 4
  %tmp2_v3.i12.i = add i32 %tmp0_v.i.i, -60
  %11 = inttoptr i32 %tmp2_v3.i12.i to i32*
  store i32 2, i32* %11, align 4
  %tmp2_v4.i13.i = add i32 %tmp0_v.i.i, -56
  %12 = inttoptr i32 %tmp2_v4.i13.i to i32*
  store i32 0, i32* %12, align 8
  %tmp2_v5.i14.i = add i32 %tmp0_v.i.i, -52
  %13 = inttoptr i32 %tmp2_v5.i14.i to i32*
  store i32 5, i32* %13, align 4
  %tmp2_v6.i15.i = add i32 %tmp0_v.i.i, -48
  %14 = inttoptr i32 %tmp2_v6.i15.i to i32*
  store i32 6, i32* %14, align 16
  %tmp2_v7.i.i = add i32 %tmp0_v.i.i, -44
  %15 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 0, i32* %15, align 4
  %tmp2_v8.i16.i = add i32 %tmp0_v.i.i, -40
  %16 = inttoptr i32 %tmp2_v8.i16.i to i32*
  store i32 0, i32* %16, align 8
  %tmp2_v9.i.i = add i32 %tmp0_v.i.i, -36
  %17 = inttoptr i32 %tmp2_v9.i.i to i32*
  store i32 7, i32* %17, align 4
  %tmp2_v10.i.i = add i32 %tmp0_v.i.i, -32
  %18 = inttoptr i32 %tmp2_v10.i.i to i32*
  store i32 0, i32* %18, align 16
  %tmp2_v11.i.i = add i32 %tmp0_v.i.i, -28
  %19 = inttoptr i32 %tmp2_v11.i.i to i32*
  store i32 4, i32* %19, align 4
  %tmp2_v12.i.i = add i32 %tmp0_v.i.i, -24
  %20 = inttoptr i32 %tmp2_v12.i.i to i32*
  store i32 7, i32* %20, align 8
  %tmp2_v13.i.i = add i32 %tmp0_v.i.i, -64
  %21 = inttoptr i32 %tmp2_v13.i.i to i32*
  store i32 10, i32* %21, align 16
  %tmp2_v17.i.i = add i32 %tmp0_v.i.i, -92
  %22 = inttoptr i32 %tmp2_v17.i.i to i32*
  store i32 10, i32* %22, align 4
  %tmp2_v19.i.i = add i32 %tmp0_v.i.i, -96
  %23 = inttoptr i32 %tmp2_v19.i.i to i32*
  store i32 %tmp2_v3.i12.i, i32* %23, align 16
  %tmp2_v20.i.i = add i32 %tmp0_v.i.i, -100
  %24 = inttoptr i32 %tmp2_v20.i.i to i32*
  store i32 134517342, i32* %24, align 4
  %tmp2_v.i10.i.i = add i32 %tmp0_v.i.i, -104
  %25 = inttoptr i32 %tmp2_v.i10.i.i to i32*
  store i32 %tmp2_v4.i.i, i32* %25, align 8
  %tmp2_v1.i13.i.i = add i32 %tmp0_v.i.i, -124
  %26 = inttoptr i32 %tmp2_v1.i13.i.i to i32*
  %spi.bis.937 = ptrtoint[4 x i8]* @str.bis.937 to i32
  store i32 %spi.bis.937, i32* %26, align 4
  %tmp2_v.i52.i.i = add i32 %tmp0_v.i.i, -116
  %27 = inttoptr i32 %tmp2_v.i52.i.i to i32*
  store i32 0, i32* %27, align 4
  %tmp2_v1.i53.i.i = add i32 %tmp0_v.i.i, -112
  %28 = inttoptr i32 %tmp2_v1.i53.i.i to i32*
  store i32 0, i32* %28, align 16
  %29 = load i32, i32* %22, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %BB_80492E1.i.i, label %BB_8049328.i.i

BB_8049328.i.i:                                   ; preds = %BB_804931C.i.i, %0
  %r_edx.1.lcssa.i = phi i32 [ 0, %0 ], [ %r_edx.0.i, %BB_804931C.i.i ]
  %r_ecx.1.lcssa.i = phi i32 [ %tmp2_v.i.i, %0 ], [ %r_ecx.0.i, %BB_804931C.i.i ]
  %31 = load i32, i32* %27, align 4
  %tmp2_v1.i.i.i = add i32 %tmp0_v.i.i, -108
  %32 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 %31, i32* %32, align 4
  %33 = load i32, i32* %22, align 4
  %34 = icmp slt i32 %31, %33
  br i1 %34, label %BB_8049330.i.i, label %Func_shift_zeros.exit

BB_804931C.i.i:                                   ; preds = %BB_80492F6.i.i, %BB_80492E1.i.i
  %35 = phi i32 [ %storemerge4.i, %BB_80492E1.i.i ], [ %.pre.i, %BB_80492F6.i.i ]
  %r_edx.0.i = phi i32 [ %tmp4_v.i.i.i1, %BB_80492E1.i.i ], [ %tmp0_v9.i.i.i, %BB_80492F6.i.i ]
  %r_ecx.0.i = phi i32 [ %r_ecx.15.i, %BB_80492E1.i.i ], [ %tmp4_v6.i.i.i, %BB_80492F6.i.i ]
  %tmp0_v1.i.i.i = add i32 %35, 1
  store i32 %tmp0_v1.i.i.i, i32* %28, align 16
  %36 = load i32, i32* %22, align 4
  %37 = icmp slt i32 %tmp0_v1.i.i.i, %36
  br i1 %37, label %BB_80492E1.i.i, label %BB_8049328.i.i

BB_80492E1.i.i:                                   ; preds = %BB_804931C.i.i, %0
  %r_ecx.15.i = phi i32 [ %r_ecx.0.i, %BB_804931C.i.i ], [ %tmp2_v.i.i, %0 ]
  %storemerge4.i = phi i32 [ %tmp0_v1.i.i.i, %BB_804931C.i.i ], [ 0, %0 ]
  %tmp4_v.i.i.i1 = shl i32 %storemerge4.i, 2
  %38 = load i32, i32* %23, align 16
  %tmp0_v3.i8.i.i = add i32 %38, %tmp4_v.i.i.i1
  %39 = inttoptr i32 %tmp0_v3.i8.i.i to i32*
  %40 = load i32, i32* %39, align 4
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %BB_804931C.i.i, label %BB_80492F6.i.i

BB_80492F6.i.i:                                   ; preds = %BB_80492E1.i.i
  %42 = load i32, i32* %27, align 4
  %tmp4_v6.i.i.i = shl i32 %42, 2
  %tmp0_v9.i.i.i = add i32 %tmp4_v6.i.i.i, %38
  %43 = inttoptr i32 %tmp0_v9.i.i.i to i32*
  store i32 %40, i32* %43, align 4
  %44 = load i32, i32* %27, align 4
  %tmp0_v13.i.i.i = add i32 %44, 1
  store i32 %tmp0_v13.i.i.i, i32* %27, align 4
  %.pre.i = load i32, i32* %28, align 16
  br label %BB_804931C.i.i

BB_8049330.i.i:                                   ; preds = %BB_8049330.i.i, %BB_8049328.i.i
  %storemerge18.i = phi i32 [ %tmp0_v6.i.i.i, %BB_8049330.i.i ], [ %31, %BB_8049328.i.i ]
  %tmp4_v.i39.i.i = shl i32 %storemerge18.i, 2
  %45 = load i32, i32* %23, align 16
  %tmp0_v3.i42.i.i = add i32 %45, %tmp4_v.i39.i.i
  %46 = inttoptr i32 %tmp0_v3.i42.i.i to i32*
  store i32 0, i32* %46, align 4
  %47 = load i32, i32* %32, align 4
  %tmp0_v6.i.i.i = add i32 %47, 1
  store i32 %tmp0_v6.i.i.i, i32* %32, align 4
  %48 = load i32, i32* %22, align 4
  %49 = icmp slt i32 %tmp0_v6.i.i.i, %48
  br i1 %49, label %BB_8049330.i.i, label %Func_shift_zeros.exit

Func_shift_zeros.exit:                            ; preds = %BB_8049330.i.i, %BB_8049328.i.i
  %r_edx.2.lcssa.i = phi i32 [ %r_edx.1.lcssa.i, %BB_8049328.i.i ], [ %tmp4_v.i39.i.i, %BB_8049330.i.i ]
  %50 = load i32, i32* %25, align 8
  %tmp2_v.i4.i = add i32 %50, -60
  %51 = inttoptr i32 %tmp2_v.i4.i to i32*
  %tmp2_v1.i.i = add i32 %50, -56
  %52 = inttoptr i32 %tmp2_v1.i.i to i32*
  store i32 0, i32* %51, align 4
  %53 = load i32, i32* %52, align 4
  %54 = icmp sgt i32 %53, 0
  br i1 %54, label %BB_804926A.i.lr.ph, label %BB_8049290.i

BB_804926A.i.lr.ph:                               ; preds = %Func_shift_zeros.exit
  %tmp2_v1.i27.i = add i32 %50, -52
  br label %BB_804926A.i

BB_804926A.i:                                     ; preds = %BB_804926A.i, %BB_804926A.i.lr.ph
  %r_edx.07 = phi i32 [ %r_edx.2.lcssa.i, %BB_804926A.i.lr.ph ], [ %59, %BB_804926A.i ]
  %storemerge6 = phi i32 [ 0, %BB_804926A.i.lr.ph ], [ %tmp0_v2.i46.i, %BB_804926A.i ]
  %tmp4_v.i28.i = shl i32 %storemerge6, 2
  %tmp2_v2.i29.i = add i32 %tmp2_v1.i27.i, %tmp4_v.i28.i
  %55 = inttoptr i32 %tmp2_v2.i29.i to i32*
  %56 = load i32, i32* %55, align 4
  store i32 %56, i32* %22, align 4
  %spi.bis.936 = ptrtoint[4 x i8]* @str.bis.936 to i32
  store i32 %spi.bis.936, i32* %23, align 16
  store i32 134517377, i32* %24, align 4
  %57 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.1.lcssa.i, i32 inreg noundef %r_edx.07, i32 noundef %tmp2_v19.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %58 = lshr i64 %57, 32
  %59 = trunc i64 %58 to i32
  %60 = load i32, i32* %51, align 4
  %tmp0_v2.i46.i = add i32 %60, 1
  store i32 %tmp0_v2.i46.i, i32* %51, align 4
  %61 = load i32, i32* %52, align 4
  %62 = icmp slt i32 %tmp0_v2.i46.i, %61
  br i1 %62, label %BB_804926A.i, label %BB_8049290.i

BB_8049290.i:                                     ; preds = %BB_804926A.i, %Func_shift_zeros.exit
  store i32 10, i32* %23, align 16
  store i32 134517402, i32* %24, align 4
  %arg.i.i = load i32, i32* %23, align 16
  %63 = tail call i32 @putchar(i32 %arg.i.i)  nounwind 
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

  tail call fastcc void @move_zeros939 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack938, i32 0, i32 8092) to i32)) nounwind
