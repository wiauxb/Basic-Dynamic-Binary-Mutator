; Mutation 806
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
declare i32 @malloc(i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare void @free(i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare i32 @realloc(i32, i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @remove_duplicates806(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
  %tmp2_v.i59.i = add i32 %arg_esp, 4
  %tmp0_v.i60.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i62.i = add i32 %tmp0_v.i60.i, -4
  %3 = inttoptr i32 %tmp2_v3.i62.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i63.i = add i32 %tmp0_v.i60.i, -8
  %4 = inttoptr i32 %tmp2_v4.i63.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i65.i = add i32 %tmp0_v.i60.i, -12
  %5 = inttoptr i32 %tmp2_v5.i65.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i67.i = add i32 %tmp0_v.i60.i, -16
  %6 = inttoptr i32 %tmp2_v6.i67.i to i32*
  store i32 %tmp2_v.i59.i, i32* %6, align 16
  %tmp2_v8.i68.i = add i32 %tmp0_v.i60.i, -84
  %7 = inttoptr i32 %tmp2_v8.i68.i to i32*
  store i32 134517297, i32* %7, align 4
  %tmp4_v.i31.i.b = load i1, i1* @segs.0, align 1
  %8 = inttoptr i32 %arg_esp to i32*
  %9 = load i32, i32* %8, align 4
  %tmp2_v2.i35.i = add i32 %tmp0_v.i60.i, -20
  %10 = inttoptr i32 %tmp2_v2.i35.i to i32*
  store i32 %9, i32* %10, align 4
  %tmp2_v3.i36.i = add i32 %tmp0_v.i60.i, -60
  %11 = inttoptr i32 %tmp2_v3.i36.i to i32*
  store i32 1, i32* %11, align 4
  %tmp2_v4.i37.i = add i32 %tmp0_v.i60.i, -56
  %12 = inttoptr i32 %tmp2_v4.i37.i to i32*
  store i32 2, i32* %12, align 8
  %tmp2_v5.i38.i = add i32 %tmp0_v.i60.i, -52
  %13 = inttoptr i32 %tmp2_v5.i38.i to i32*
  store i32 3, i32* %13, align 4
  %tmp2_v6.i39.i = add i32 %tmp0_v.i60.i, -48
  %14 = inttoptr i32 %tmp2_v6.i39.i to i32*
  store i32 4, i32* %14, align 16
  %tmp2_v7.i40.i = add i32 %tmp0_v.i60.i, -44
  %15 = inttoptr i32 %tmp2_v7.i40.i to i32*
  store i32 1, i32* %15, align 4
  %tmp2_v8.i.i = add i32 %tmp0_v.i60.i, -40
  %16 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 2, i32* %16, align 8
  %tmp2_v9.i41.i = add i32 %tmp0_v.i60.i, -36
  %17 = inttoptr i32 %tmp2_v9.i41.i to i32*
  store i32 5, i32* %17, align 4
  %tmp2_v10.i42.i = add i32 %tmp0_v.i60.i, -32
  %18 = inttoptr i32 %tmp2_v10.i42.i to i32*
  store i32 6, i32* %18, align 16
  %tmp2_v11.i43.i = add i32 %tmp0_v.i60.i, -28
  %19 = inttoptr i32 %tmp2_v11.i43.i to i32*
  store i32 7, i32* %19, align 4
  %tmp2_v12.i44.i = add i32 %tmp0_v.i60.i, -24
  %20 = inttoptr i32 %tmp2_v12.i44.i to i32*
  store i32 8, i32* %20, align 8
  %tmp2_v13.i.i = add i32 %tmp0_v.i60.i, -72
  %21 = inttoptr i32 %tmp2_v13.i.i to i32*
  store i32 0, i32* %21, align 8
  %tmp2_v16.i.i = add i32 %tmp0_v.i60.i, -88
  %22 = inttoptr i32 %tmp2_v16.i.i to i32*
  store i32 %tmp2_v13.i.i, i32* %22, align 8
  %tmp2_v17.i.i = add i32 %tmp0_v.i60.i, -92
  %23 = inttoptr i32 %tmp2_v17.i.i to i32*
  store i32 10, i32* %23, align 4
  %tmp2_v19.i.i = add i32 %tmp0_v.i60.i, -96
  %24 = inttoptr i32 %tmp2_v19.i.i to i32*
  store i32 %tmp2_v3.i36.i, i32* %24, align 16
  %tmp2_v20.i.i = add i32 %tmp0_v.i60.i, -100
  %25 = inttoptr i32 %tmp2_v20.i.i to i32*
  store i32 134517409, i32* %25, align 4
  %tmp2_v.i32.i.i = add i32 %tmp0_v.i60.i, -104
  %26 = inttoptr i32 %tmp2_v.i32.i.i to i32*
  store i32 %tmp2_v4.i63.i, i32* %26, align 8
  %tmp2_v1.i34.i.i = add i32 %tmp0_v.i60.i, -108
  %27 = inttoptr i32 %tmp2_v1.i34.i.i to i32*
  store i32 134529024, i32* %27, align 4
  %tmp2_v2.i37.i.i = add i32 %tmp0_v.i60.i, -148
  %28 = inttoptr i32 %tmp2_v2.i37.i.i to i32*
  store i32 134517537, i32* %28, align 4
  %29 = load i32, i32* %23, align 4
  %tmp0_v2.i.i.i = shl i32 %29, 2
  %tmp2_v4.i.i.i = add i32 %tmp0_v.i60.i, -160
  %30 = inttoptr i32 %tmp2_v4.i.i.i to i32*
  store i32 %tmp0_v2.i.i.i, i32* %30, align 16
  %tmp2_v5.i.i.i = add i32 %tmp0_v.i60.i, -164
  %31 = inttoptr i32 %tmp2_v5.i.i.i to i32*
  store i32 134517558, i32* %31, align 4
  %arg.i.i.i = load i32, i32* %30, align 16
  %32 = tail call i32 @malloc(i32 %arg.i.i.i)
  %tmp2_v.i13.i.i = add i32 %tmp0_v.i60.i, -128
  %33 = inttoptr i32 %tmp2_v.i13.i.i to i32*
  store i32 %32, i32* %33, align 16
  %tmp2_v1.i14.i.i = add i32 %tmp0_v.i60.i, -124
  %34 = inttoptr i32 %tmp2_v1.i14.i.i to i32*
  store i32 0, i32* %34, align 4
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i60.i, -120
  %35 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  store i32 0, i32* %35, align 8
  %36 = load i32, i32* %23, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %BB_804934C.i.lr.ph.i, label %Func_remove_duplicates.exit

BB_804934C.i.lr.ph.i:                             ; preds = %0
  %tmp2_v.i2.i.i = add i32 %tmp0_v.i60.i, -129
  %38 = inttoptr i32 %tmp2_v.i2.i.i to i8*
  %tmp2_v1.i.i.i = add i32 %tmp0_v.i60.i, -116
  %39 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  br label %BB_804934C.i.i

BB_804934C.i.i:                                   ; preds = %BB_80493BD.i.i, %BB_804934C.i.lr.ph.i
  %r_ecx.041.i = phi i32 [ %tmp2_v.i59.i, %BB_804934C.i.lr.ph.i ], [ %r_ecx.1.i, %BB_80493BD.i.i ]
  store i8 1, i8* %38, align 1
  store i32 0, i32* %39, align 4
  %40 = load i32, i32* %34, align 4
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %BB_8049359.i.i, label %BB_8049391.i.i

BB_8049397.i.i:                                   ; preds = %BB_8049391.i.i
  %42 = load i32, i32* %35, align 8
  %tmp4_v.i.i.i1 = shl i32 %42, 2
  %43 = load i32, i32* %24, align 16
  %tmp0_v3.i20.i.i = add i32 %43, %tmp4_v.i.i.i1
  %tmp4_v6.i.i.i = shl i32 %54, 2
  %44 = load i32, i32* %33, align 16
  %tmp0_v9.i.i.i = add i32 %44, %tmp4_v6.i.i.i
  %45 = inttoptr i32 %tmp0_v3.i20.i.i to i32*
  %46 = load i32, i32* %45, align 4
  %47 = inttoptr i32 %tmp0_v9.i.i.i to i32*
  store i32 %46, i32* %47, align 4
  %48 = load i32, i32* %34, align 4
  %tmp0_v13.i.i.i = add i32 %48, 1
  store i32 %tmp0_v13.i.i.i, i32* %34, align 4
  br label %BB_80493BD.i.i

BB_80493BD.i.i:                                   ; preds = %BB_8049391.i.i, %BB_8049391.i.thread.i, %BB_8049397.i.i
  %r_ecx.1.i = phi i32 [ %r_ecx.2.lcssa.i, %BB_8049391.i.i ], [ %tmp4_v6.i.i.i, %BB_8049397.i.i ], [ %tmp4_v7.i.i.i, %BB_8049391.i.thread.i ]
  %49 = load i32, i32* %35, align 8
  %tmp0_v1.i62.i.i = add i32 %49, 1
  store i32 %tmp0_v1.i62.i.i, i32* %35, align 8
  %50 = load i32, i32* %23, align 4
  %51 = icmp slt i32 %tmp0_v1.i62.i.i, %50
  br i1 %51, label %BB_804934C.i.i, label %Func_remove_duplicates.exit

BB_8049389.i.i:                                   ; preds = %BB_8049359.i.i
  store i32 %tmp0_v1.i72.i.i, i32* %39, align 4
  %52 = load i32, i32* %34, align 4
  %53 = icmp slt i32 %tmp0_v1.i72.i.i, %52
  br i1 %53, label %BB_8049359.i.i, label %BB_8049391.i.i

BB_8049391.i.thread.i:                            ; preds = %BB_8049359.i.i
  store i8 0, i8* %38, align 1
  br label %BB_80493BD.i.i

BB_8049391.i.i:                                   ; preds = %BB_8049389.i.i, %BB_804934C.i.i
  %54 = phi i32 [ %40, %BB_804934C.i.i ], [ %52, %BB_8049389.i.i ]
  %r_ecx.2.lcssa.i = phi i32 [ %r_ecx.041.i, %BB_804934C.i.i ], [ %tmp4_v7.i.i.i, %BB_8049389.i.i ]
  %.pr.i = load i8, i8* %38, align 1
  %55 = icmp eq i8 %.pr.i, 0
  br i1 %55, label %BB_80493BD.i.i, label %BB_8049397.i.i

BB_8049359.i.i:                                   ; preds = %BB_8049389.i.i, %BB_804934C.i.i
  %storemerge3140.i = phi i32 [ %tmp0_v1.i72.i.i, %BB_8049389.i.i ], [ 0, %BB_804934C.i.i ]
  %tmp4_v.i95.i.i = shl i32 %storemerge3140.i, 2
  %56 = load i32, i32* %33, align 16
  %tmp0_v3.i98.i.i = add i32 %56, %tmp4_v.i95.i.i
  %57 = inttoptr i32 %tmp0_v3.i98.i.i to i32*
  %58 = load i32, i32* %57, align 4
  %59 = load i32, i32* %35, align 8
  %tmp4_v7.i.i.i = shl i32 %59, 2
  %60 = load i32, i32* %24, align 16
  %tmp0_v10.i103.i.i = add i32 %60, %tmp4_v7.i.i.i
  %61 = inttoptr i32 %tmp0_v10.i103.i.i to i32*
  %62 = load i32, i32* %61, align 4
  %.not.i.i.i = icmp eq i32 %58, %62
  %tmp0_v1.i72.i.i = add nuw nsw i32 %storemerge3140.i, 1
  br i1 %.not.i.i.i, label %BB_8049391.i.thread.i, label %BB_8049389.i.i

Func_remove_duplicates.exit:                      ; preds = %BB_80493BD.i.i, %0
  %r_ecx.0.lcssa.i = phi i32 [ %tmp2_v.i59.i, %0 ], [ %r_ecx.1.i, %BB_80493BD.i.i ]
  %63 = load i32, i32* %34, align 4
  %tmp0_v1.i6.i.i = shl i32 %63, 2
  %tmp2_v3.i.i.i = add i32 %tmp0_v.i60.i, -156
  %64 = inttoptr i32 %tmp2_v3.i.i.i to i32*
  store i32 %tmp0_v1.i6.i.i, i32* %64, align 4
  %65 = load i32, i32* %33, align 16
  store i32 %65, i32* %30, align 16
  store i32 134517731, i32* %31, align 4
  %arg.i.i37.i = load i32, i32* %30, align 16
  %arg2.i.i.i = load i32, i32* %64, align 4
  %66 = tail call i32 @realloc(i32 %arg.i.i37.i, i32 %arg2.i.i.i)
  store i32 %66, i32* %33, align 16
  %67 = load i32, i32* %22, align 8
  %68 = load i32, i32* %34, align 4
  %69 = inttoptr i32 %67 to i32*
  store i32 %68, i32* %69, align 4
  %70 = load i32, i32* %33, align 16
  %71 = load i32, i32* %27, align 4
  %72 = load i32, i32* %26, align 8
  %tmp2_v.i56.i = add i32 %72, -56
  %73 = inttoptr i32 %tmp2_v.i56.i to i32*
  store i32 %70, i32* %73, align 4
  %tmp2_v1.i57.i = add i32 %72, -60
  %74 = inttoptr i32 %tmp2_v1.i57.i to i32*
  %tmp2_v.i23.i = add i32 %72, -64
  %75 = inttoptr i32 %tmp2_v.i23.i to i32*
  store i32 0, i32* %74, align 4
  %76 = load i32, i32* %75, align 4
  %77 = icmp sgt i32 %76, 0
  br i1 %77, label %BB_80492B0.i.lr.ph, label %Func_remove_duplicates.exit.BB_80492E3.i_crit_edge

Func_remove_duplicates.exit.BB_80492E3.i_crit_edge: ; preds = %Func_remove_duplicates.exit
  %.pre = add i32 %tmp0_v.i60.i, -100
  %.pre7 = inttoptr i32 %.pre to i32*
  br label %BB_80492E3.i

BB_80492B0.i.lr.ph:                               ; preds = %Func_remove_duplicates.exit
  %tmp2_v6.i.i = add i32 %tmp0_v.i60.i, -88
  %78 = inttoptr i32 %tmp2_v6.i.i to i32*
  %tmp2_v9.i.i = add i32 %tmp0_v.i60.i, -92
  %79 = inttoptr i32 %tmp2_v9.i.i to i32*
  %tmp2_v10.i.i = add i32 %71, -8184
  %tmp2_v12.i.i = add i32 %tmp0_v.i60.i, -100
  %80 = inttoptr i32 %tmp2_v12.i.i to i32*
  br label %BB_80492B0.i

BB_80492B0.i:                                     ; preds = %BB_80492B0.i, %BB_80492B0.i.lr.ph
  %storemerge5 = phi i32 [ 0, %BB_80492B0.i.lr.ph ], [ %tmp0_v2.i.i, %BB_80492B0.i ]
  %tmp4_v.i16.i = shl i32 %storemerge5, 2
  %81 = load i32, i32* %73, align 4
  %tmp0_v3.i18.i = add i32 %81, %tmp4_v.i16.i
  %82 = inttoptr i32 %tmp0_v3.i18.i to i32*
  %83 = load i32, i32* %82, align 4
  store i32 %83, i32* %78, align 8
  %84 = load i32, i32* %74, align 4
  store i32 %84, i32* %79, align 4
  store i32 %tmp2_v10.i.i, i32* %24, align 16
  store i32 134517460, i32* %80, align 4
  %85 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.0.lcssa.i, i32 inreg noundef %tmp4_v.i16.i, i32 noundef %tmp2_v19.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %86 = load i32, i32* %74, align 4
  %tmp0_v2.i.i = add i32 %86, 1
  store i32 %tmp0_v2.i.i, i32* %74, align 4
  %87 = load i32, i32* %75, align 4
  %88 = icmp slt i32 %tmp0_v2.i.i, %87
  br i1 %88, label %BB_80492B0.i, label %BB_80492E3.i

BB_80492E3.i:                                     ; preds = %BB_80492B0.i, %Func_remove_duplicates.exit.BB_80492E3.i_crit_edge
  %.pre-phi = phi i32* [ %.pre7, %Func_remove_duplicates.exit.BB_80492E3.i_crit_edge ], [ %80, %BB_80492B0.i ]
  %89 = load i32, i32* %73, align 4
  store i32 %89, i32* %24, align 16
  store i32 134517486, i32* %.pre-phi, align 4
  %arg.i.i = load i32, i32* %24, align 16
  tail call void @free(i32 %arg.i.i)
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
!12 = !{i32 0, i32 0, i32 0}
!13 = !{!"printf"}

  tail call fastcc void @remove_duplicates806(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) nounwind
