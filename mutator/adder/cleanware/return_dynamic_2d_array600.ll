; Mutation 600
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack = internal global [4194304 x i32] zeroinitializer, align 16
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

; Function Attrs: nofree noinline nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr  nofree noinline nounwind 

; Function Attrs: noinline
declare void @free(i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @return_dynamic_2d_array600(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
  %tmp2_v.i56.i = add i32 %arg_esp, 4
  %tmp0_v.i57.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i59.i = add i32 %tmp0_v.i57.i, -4
  %3 = inttoptr i32 %tmp2_v3.i59.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i.i = add i32 %tmp0_v.i57.i, -8
  %4 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i61.i = add i32 %tmp0_v.i57.i, -12
  %5 = inttoptr i32 %tmp2_v5.i61.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i62.i = add i32 %tmp0_v.i57.i, -16
  %6 = inttoptr i32 %tmp2_v6.i62.i to i32*
  store i32 %tmp2_v.i56.i, i32* %6, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i57.i, -52
  %7 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517448, i32* %7, align 4
  %tmp2_v.i75.i = add i32 %tmp0_v.i57.i, -28
  %8 = inttoptr i32 %tmp2_v.i75.i to i32*
  store i32 5, i32* %8, align 4
  %tmp2_v1.i76.i = add i32 %tmp0_v.i57.i, -24
  %9 = inttoptr i32 %tmp2_v1.i76.i to i32*
  store i32 4, i32* %9, align 8
  %tmp2_v3.i79.i = add i32 %tmp0_v.i57.i, -56
  %10 = inttoptr i32 %tmp2_v3.i79.i to i32*
  store i32 2, i32* %10, align 8
  %11 = load i32, i32* %9, align 8
  %tmp2_v6.i82.i = add i32 %tmp0_v.i57.i, -60
  %12 = inttoptr i32 %tmp2_v6.i82.i to i32*
  store i32 %11, i32* %12, align 4
  %13 = load i32, i32* %8, align 4
  %tmp2_v9.i.i = add i32 %tmp0_v.i57.i, -64
  %14 = inttoptr i32 %tmp2_v9.i.i to i32*
  store i32 %13, i32* %14, align 16
  %tmp2_v10.i.i = add i32 %tmp0_v.i57.i, -68
  %15 = inttoptr i32 %tmp2_v10.i.i to i32*
  store i32 134517484, i32* %15, align 4
  %tmp2_v.i8.i.i = add i32 %tmp0_v.i57.i, -72
  %16 = inttoptr i32 %tmp2_v.i8.i.i to i32*
  store i32 %tmp2_v4.i.i, i32* %16, align 8
  %tmp2_v1.i10.i.i = add i32 %tmp0_v.i57.i, -76
  %17 = inttoptr i32 %tmp2_v1.i10.i.i to i32*
  store i32 0, i32* %17, align 4
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i57.i, -80
  %18 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  store i32 134529024, i32* %18, align 16
  %tmp2_v3.i.i.i = add i32 %tmp0_v.i57.i, -100
  %19 = inttoptr i32 %tmp2_v3.i.i.i to i32*
  store i32 134517255, i32* %19, align 4
  %20 = load i32, i32* %14, align 16
  %tmp0_v2.i.i.i = shl i32 %20, 2
  %tmp2_v4.i.i.i = add i32 %tmp0_v.i57.i, -112
  %21 = inttoptr i32 %tmp2_v4.i.i.i to i32*
  store i32 %tmp0_v2.i.i.i, i32* %21, align 16
  %tmp2_v5.i.i.i = add i32 %tmp0_v.i57.i, -116
  %22 = inttoptr i32 %tmp2_v5.i.i.i to i32*
  store i32 134517276, i32* %22, align 4
  %arg.i.i.i = load i32, i32* %21, align 16
  %23 = tail call i32 @malloc(i32 %arg.i.i.i)
  %tmp2_v.i.i.i = add i32 %tmp0_v.i57.i, -84
  %24 = inttoptr i32 %tmp2_v.i.i.i to i32*
  store i32 %23, i32* %24, align 4
  %tmp2_v1.i.i.i = add i32 %tmp0_v.i57.i, -96
  %25 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 0, i32* %25, align 16
  %26 = load i32, i32* %14, align 16
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %BB_804922B.i.lr.ph.i, label %BB_804925B.i.i

BB_804922B.i.lr.ph.i:                             ; preds = %0
  %mrv.i5.i = insertvalue { i32, i32 } undef, i32 %tmp2_v4.i.i.i, 0
  br label %BB_804922B.i.i

BB_8049264.i.i:                                   ; preds = %BB_8049297.i.i, %BB_8049264.i.lr.ph.i
  store i32 0, i32* %42, align 8
  %28 = load i32, i32* %12, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %BB_804926D.i.i, label %BB_8049297.i.i

BB_804922B.i.i:                                   ; preds = %BB_804922B.i.i, %BB_804922B.i.lr.ph.i
  %r_esp.0.in13.i = phi i32 [ %tmp2_v4.i.i.i, %BB_804922B.i.lr.ph.i ], [ %r_esp.0.in.i, %BB_804922B.i.i ]
  %.pn912.i = phi i32 [ %23, %BB_804922B.i.lr.ph.i ], [ %34, %BB_804922B.i.i ]
  %mrv.i5.pn11.i = phi { i32, i32 } [ %mrv.i5.i, %BB_804922B.i.lr.ph.i ], [ %.pn.i, %BB_804922B.i.i ]
  %storemerge10.i = phi i32 [ 0, %BB_804922B.i.lr.ph.i ], [ %tmp0_v2.i66.i.i, %BB_804922B.i.i ]
  %.pn.i = insertvalue { i32, i32 } %mrv.i5.pn11.i, i32 %.pn912.i, 1
  %30 = load i32, i32* %12, align 4
  %tmp0_v1.i26.i.i = shl i32 %30, 2
  %tmp4_v.i29.i.i = shl i32 %storemerge10.i, 2
  %31 = load i32, i32* %24, align 4
  %tmp2_v6.i.i.i = add i32 %31, %tmp4_v.i29.i.i
  %32 = inttoptr i32 %r_esp.0.in13.i to i32*
  store i32 %tmp0_v1.i26.i.i, i32* %32, align 4
  %tmp2_v9.i.i.i = add i32 %r_esp.0.in13.i, -4
  %33 = inttoptr i32 %tmp2_v9.i.i.i to i32*
  store i32 134517322, i32* %33, align 4
  %arg.i.i7.i = load i32, i32* %32, align 4
  %34 = tail call i32 @malloc(i32 %arg.i.i7.i)
  %35 = inttoptr i32 %tmp2_v6.i.i.i to i32*
  store i32 %34, i32* %35, align 4
  %36 = load i32, i32* %25, align 16
  %tmp0_v2.i66.i.i = add i32 %36, 1
  %r_esp.0.in.i = extractvalue { i32, i32 } %mrv.i5.pn11.i, 0
  store i32 %tmp0_v2.i66.i.i, i32* %25, align 16
  %37 = load i32, i32* %14, align 16
  %38 = icmp slt i32 %tmp0_v2.i66.i.i, %37
  br i1 %38, label %BB_804922B.i.i, label %BB_804925B.i.i

BB_804925B.i.i:                                   ; preds = %BB_804922B.i.i, %0
  %r_ecx.0.lcssa.i = phi i32 [ %tmp2_v.i56.i, %0 ], [ %tmp4_v.i29.i.i, %BB_804922B.i.i ]
  %tmp2_v.i35.i.i = add i32 %tmp0_v.i57.i, -92
  %39 = inttoptr i32 %tmp2_v.i35.i.i to i32*
  store i32 0, i32* %39, align 4
  %40 = load i32, i32* %14, align 16
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %BB_8049264.i.lr.ph.i, label %Func_create_matrix.exit

BB_8049264.i.lr.ph.i:                             ; preds = %BB_804925B.i.i
  %tmp2_v.i2.i.i = add i32 %tmp0_v.i57.i, -88
  %42 = inttoptr i32 %tmp2_v.i2.i.i to i32*
  br label %BB_8049264.i.i

BB_8049297.i.i:                                   ; preds = %BB_804926D.i.i, %BB_8049264.i.i
  %43 = load i32, i32* %39, align 4
  %tmp0_v1.i39.i.i = add i32 %43, 1
  store i32 %tmp0_v1.i39.i.i, i32* %39, align 4
  %44 = load i32, i32* %14, align 16
  %45 = icmp slt i32 %tmp0_v1.i39.i.i, %44
  br i1 %45, label %BB_8049264.i.i, label %Func_create_matrix.exit

BB_804926D.i.i:                                   ; preds = %BB_804926D.i.i, %BB_8049264.i.i
  %storemerge214.i = phi i32 [ %tmp0_v13.i.i.i, %BB_804926D.i.i ], [ 0, %BB_8049264.i.i ]
  %46 = load i32, i32* %39, align 4
  %tmp4_v.i49.i.i = shl i32 %46, 2
  %47 = load i32, i32* %24, align 4
  %tmp0_v3.i52.i.i = add i32 %47, %tmp4_v.i49.i.i
  %48 = inttoptr i32 %tmp0_v3.i52.i.i to i32*
  %49 = load i32, i32* %48, align 4
  %tmp0_v7.i54.i.i = shl i32 %storemerge214.i, 2
  %tmp0_v8.i.i.i = add i32 %49, %tmp0_v7.i54.i.i
  %50 = load i32, i32* %10, align 8
  %51 = inttoptr i32 %tmp0_v8.i.i.i to i32*
  store i32 %50, i32* %51, align 4
  %52 = load i32, i32* %42, align 8
  %tmp0_v13.i.i.i = add i32 %52, 1
  store i32 %tmp0_v13.i.i.i, i32* %42, align 8
  %53 = load i32, i32* %12, align 4
  %54 = icmp slt i32 %tmp0_v13.i.i.i, %53
  br i1 %54, label %BB_804926D.i.i, label %BB_8049297.i.i

Func_create_matrix.exit:                          ; preds = %BB_8049297.i.i, %BB_804925B.i.i
  %55 = load i32, i32* %24, align 4
  %56 = load i32, i32* %18, align 16
  %57 = load i32, i32* %16, align 8
  %tmp2_v.i4.i = add i32 %57, -12
  %58 = inttoptr i32 %tmp2_v.i4.i to i32*
  store i32 %55, i32* %58, align 4
  %tmp2_v1.i.i = add i32 %57, -32
  %59 = inttoptr i32 %tmp2_v1.i.i to i32*
  %tmp2_v1.i66.i = add i32 %57, -20
  %60 = inttoptr i32 %tmp2_v1.i66.i to i32*
  store i32 0, i32* %59, align 4
  %61 = load i32, i32* %60, align 4
  %62 = icmp sgt i32 %61, 0
  br i1 %62, label %BB_80492FB.i.lr.ph, label %BB_8049357.i

BB_80492FB.i.lr.ph:                               ; preds = %Func_create_matrix.exit
  %tmp2_v.i47.i = add i32 %57, -28
  %63 = inttoptr i32 %tmp2_v.i47.i to i32*
  %tmp2_v1.i26.i = add i32 %57, -16
  %64 = inttoptr i32 %tmp2_v1.i26.i to i32*
  %tmp2_v12.i.i = add i32 %56, -8184
  br label %BB_80492FB.i

BB_8049360.i:                                     ; preds = %BB_8049357.i, %BB_8049360.i
  %storemerge110 = phi i32 [ %tmp0_v2.i89.i, %BB_8049360.i ], [ 0, %BB_8049357.i ]
  %tmp4_v.i.i = shl i32 %storemerge110, 2
  %65 = load i32, i32* %58, align 4
  %tmp0_v3.i.i = add i32 %65, %tmp4_v.i.i
  %66 = inttoptr i32 %tmp0_v3.i.i to i32*
  %67 = load i32, i32* %66, align 4
  store i32 %67, i32* %14, align 16
  store i32 134517626, i32* %15, align 4
  %arg.i.i = load i32, i32* %14, align 16
  tail call void @free(i32 %arg.i.i)
  %68 = load i32, i32* %73, align 4
  %tmp0_v2.i89.i = add i32 %68, 1
  store i32 %tmp0_v2.i89.i, i32* %73, align 4
  %69 = load i32, i32* %60, align 4
  %70 = icmp slt i32 %tmp0_v2.i89.i, %69
  br i1 %70, label %BB_8049360.i, label %.exit

BB_80492FB.i:                                     ; preds = %BB_804933E.i, %BB_80492FB.i.lr.ph
  store i32 0, i32* %63, align 4
  %71 = load i32, i32* %64, align 4
  %72 = icmp sgt i32 %71, 0
  br i1 %72, label %BB_8049304.i, label %BB_804933E.i

BB_8049357.i:                                     ; preds = %BB_804933E.i, %Func_create_matrix.exit
  %tmp2_v.i71.i = add i32 %57, -24
  %73 = inttoptr i32 %tmp2_v.i71.i to i32*
  store i32 0, i32* %73, align 4
  %74 = load i32, i32* %60, align 4
  %75 = icmp sgt i32 %74, 0
  br i1 %75, label %BB_8049360.i, label %.exit

BB_804933E.i:                                     ; preds = %BB_8049304.i, %BB_80492FB.i
  store i32 10, i32* %14, align 16
  store i32 134517576, i32* %15, align 4
  %arg.i.i7 = load i32, i32* %14, align 16
  %76 = tail call i32 @putchar(i32 %arg.i.i7)  nounwind 
  %77 = load i32, i32* %59, align 4
  %tmp0_v2.i.i = add i32 %77, 1
  store i32 %tmp0_v2.i.i, i32* %59, align 4
  %78 = load i32, i32* %60, align 4
  %79 = icmp slt i32 %tmp0_v2.i.i, %78
  br i1 %79, label %BB_80492FB.i, label %BB_8049357.i

BB_8049304.i:                                     ; preds = %BB_8049304.i, %BB_80492FB.i
  %storemerge29 = phi i32 [ %tmp0_v2.i10.i, %BB_8049304.i ], [ 0, %BB_80492FB.i ]
  %80 = load i32, i32* %59, align 4
  %tmp4_v.i103.i = shl i32 %80, 2
  %81 = load i32, i32* %58, align 4
  %tmp0_v3.i106.i = add i32 %81, %tmp4_v.i103.i
  %82 = inttoptr i32 %tmp0_v3.i106.i to i32*
  %83 = load i32, i32* %82, align 4
  %tmp0_v7.i110.i = shl i32 %storemerge29, 2
  %tmp0_v8.i111.i = add i32 %83, %tmp0_v7.i110.i
  %84 = inttoptr i32 %tmp0_v8.i111.i to i32*
  %85 = load i32, i32* %84, align 4
  store i32 %85, i32* %12, align 4
  store i32 %tmp2_v12.i.i, i32* %14, align 16
  store i32 134517551, i32* %15, align 4
  %86 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.0.lcssa.i, i32 inreg noundef %tmp0_v7.i110.i, i32 noundef %tmp2_v9.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %87 = load i32, i32* %63, align 4
  %tmp0_v2.i10.i = add i32 %87, 1
  store i32 %tmp0_v2.i10.i, i32* %63, align 4
  %88 = load i32, i32* %64, align 4
  %89 = icmp slt i32 %tmp0_v2.i10.i, %88
  br i1 %89, label %BB_8049304.i, label %BB_804933E.i

.exit:                                            ; preds = %BB_8049357.i, %BB_8049360.i
  %90 = load i32, i32* %58, align 4
  store i32 %90, i32* %14, align 16
  store i32 134517652, i32* %15, align 4
  %arg.i.i8 = load i32, i32* %14, align 16
  tail call void @free(i32 %arg.i.i8)
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
!12 = !{i32 0, i32 0, i32 0, i32 0, i32 0}
!13 = !{!"printf"}

  tail call fastcc void @return_dynamic_2d_array600(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) nounwind
