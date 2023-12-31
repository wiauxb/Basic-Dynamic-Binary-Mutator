; Mutation 39
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack38 = internal global [8092 x i32] zeroinitializer, align 16
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
declare i32 @malloc(i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare void @free(i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @split_array_at_index39(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
  %tmp2_v.i38.i = add i32 %arg_esp, 4
  %tmp0_v.i39.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i39.i, -4
  %3 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i41.i = add i32 %tmp0_v.i39.i, -8
  %4 = inttoptr i32 %tmp2_v4.i41.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i.i = add i32 %tmp0_v.i39.i, -12
  %5 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i39.i, -16
  %6 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i38.i, i32* %6, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i39.i, -116
  %7 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517297, i32* %7, align 4
  %tmp2_v.i89.i = add i32 %arg_esp, 8
  %8 = inttoptr i32 %tmp2_v.i89.i to i32*
  %9 = load i32, i32* %8, align 4
  %tmp2_v2.i92.i = add i32 %tmp0_v.i39.i, -100
  %10 = inttoptr i32 %tmp2_v2.i92.i to i32*
  store i32 %9, i32* %10, align 4
  %tmp4_v.i93.i.b = load i1, i1* @segs.0, align 1
  %11 = inttoptr i32 %arg_esp to i32*
  %12 = load i32, i32* %11, align 4
  %tmp2_v5.i96.i = add i32 %tmp0_v.i39.i, -20
  %13 = inttoptr i32 %tmp2_v5.i96.i to i32*
  store i32 %12, i32* %13, align 4
  %tmp2_v6.i97.i = add i32 %tmp0_v.i39.i, -60
  %14 = inttoptr i32 %tmp2_v6.i97.i to i32*
  store i32 1, i32* %14, align 4
  %tmp2_v7.i98.i = add i32 %tmp0_v.i39.i, -56
  %15 = inttoptr i32 %tmp2_v7.i98.i to i32*
  store i32 2, i32* %15, align 8
  %tmp2_v8.i99.i = add i32 %tmp0_v.i39.i, -52
  %16 = inttoptr i32 %tmp2_v8.i99.i to i32*
  store i32 3, i32* %16, align 4
  %tmp2_v9.i.i = add i32 %tmp0_v.i39.i, -48
  %17 = inttoptr i32 %tmp2_v9.i.i to i32*
  store i32 4, i32* %17, align 16
  %tmp2_v10.i100.i = add i32 %tmp0_v.i39.i, -44
  %18 = inttoptr i32 %tmp2_v10.i100.i to i32*
  store i32 5, i32* %18, align 4
  %tmp2_v11.i101.i = add i32 %tmp0_v.i39.i, -40
  %19 = inttoptr i32 %tmp2_v11.i101.i to i32*
  store i32 6, i32* %19, align 8
  %tmp2_v12.i102.i = add i32 %tmp0_v.i39.i, -36
  %20 = inttoptr i32 %tmp2_v12.i102.i to i32*
  store i32 7, i32* %20, align 4
  %tmp2_v13.i103.i = add i32 %tmp0_v.i39.i, -32
  %21 = inttoptr i32 %tmp2_v13.i103.i to i32*
  store i32 8, i32* %21, align 16
  %tmp2_v14.i.i = add i32 %tmp0_v.i39.i, -28
  %22 = inttoptr i32 %tmp2_v14.i.i to i32*
  store i32 9, i32* %22, align 4
  %tmp2_v15.i.i = add i32 %tmp0_v.i39.i, -24
  %23 = inttoptr i32 %tmp2_v15.i.i to i32*
  store i32 10, i32* %23, align 8
  %tmp2_v16.i.i = add i32 %tmp0_v.i39.i, -64
  %24 = inttoptr i32 %tmp2_v16.i.i to i32*
  store i32 10, i32* %24, align 16
  %tmp2_v17.i.i = add i32 %tmp0_v.i39.i, -88
  %25 = inttoptr i32 %tmp2_v17.i.i to i32*
  store i32 0, i32* %25, align 8
  %tmp2_v18.i.i = add i32 %tmp0_v.i39.i, -84
  %26 = inttoptr i32 %tmp2_v18.i.i to i32*
  store i32 0, i32* %26, align 4
  %tmp2_v19.i.i = add i32 %tmp0_v.i39.i, -80
  %27 = inttoptr i32 %tmp2_v19.i.i to i32*
  store i32 0, i32* %27, align 16
  %tmp2_v20.i.i = add i32 %tmp0_v.i39.i, -76
  %28 = inttoptr i32 %tmp2_v20.i.i to i32*
  store i32 0, i32* %28, align 4
  %tmp2_v23.i.i = add i32 %tmp0_v.i39.i, -120
  %29 = inttoptr i32 %tmp2_v23.i.i to i32*
  store i32 %tmp2_v18.i.i, i32* %29, align 8
  %tmp2_v25.i.i = add i32 %tmp0_v.i39.i, -124
  %30 = inttoptr i32 %tmp2_v25.i.i to i32*
  store i32 %tmp2_v20.i.i, i32* %30, align 4
  %tmp2_v27.i.i = add i32 %tmp0_v.i39.i, -128
  %31 = inttoptr i32 %tmp2_v27.i.i to i32*
  store i32 %tmp2_v17.i.i, i32* %31, align 16
  %tmp2_v29.i.i = add i32 %tmp0_v.i39.i, -132
  %32 = inttoptr i32 %tmp2_v29.i.i to i32*
  store i32 %tmp2_v19.i.i, i32* %32, align 4
  %tmp2_v30.i.i = add i32 %tmp0_v.i39.i, -136
  %33 = inttoptr i32 %tmp2_v30.i.i to i32*
  store i32 3, i32* %33, align 8
  %34 = load i32, i32* %24, align 16
  %tmp2_v33.i.i = add i32 %tmp0_v.i39.i, -140
  %35 = inttoptr i32 %tmp2_v33.i.i to i32*
  store i32 %34, i32* %35, align 4
  %tmp2_v35.i.i = add i32 %tmp0_v.i39.i, -144
  %36 = inttoptr i32 %tmp2_v35.i.i to i32*
  store i32 %tmp2_v6.i97.i, i32* %36, align 16
  %tmp2_v36.i.i = add i32 %tmp0_v.i39.i, -148
  %37 = inttoptr i32 %tmp2_v36.i.i to i32*
  store i32 134517460, i32* %37, align 4
  %tmp2_v.i.i.i = add i32 %tmp0_v.i39.i, -152
  %38 = inttoptr i32 %tmp2_v.i.i.i to i32*
  store i32 %tmp2_v4.i41.i, i32* %38, align 8
  %tmp2_v1.i.i.i = add i32 %tmp0_v.i39.i, -156
  %39 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 134529024, i32* %39, align 4
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i39.i, -180
  %40 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  store i32 134517723, i32* %40, align 4
  %41 = load i32, i32* %31, align 16
  %42 = load i32, i32* %33, align 8
  %43 = inttoptr i32 %41 to i32*
  store i32 %42, i32* %43, align 4
  %44 = load i32, i32* %35, align 4
  %45 = load i32, i32* %33, align 8
  %tmp0_v7.i.i.i = sub i32 %44, %45
  %46 = load i32, i32* %29, align 8
  %47 = inttoptr i32 %46 to i32*
  store i32 %tmp0_v7.i.i.i, i32* %47, align 4
  %48 = load i32, i32* %31, align 16
  %49 = inttoptr i32 %48 to i32*
  %50 = load i32, i32* %49, align 4
  %tmp0_v13.i.i.i = shl i32 %50, 2
  %tmp2_v15.i.i.i = add i32 %tmp0_v.i39.i, -192
  %51 = inttoptr i32 %tmp2_v15.i.i.i to i32*
  store i32 %tmp0_v13.i.i.i, i32* %51, align 16
  %tmp2_v16.i.i.i = add i32 %tmp0_v.i39.i, -196
  %52 = inttoptr i32 %tmp2_v16.i.i.i to i32*
  store i32 134517767, i32* %52, align 4
  %arg.i.i.i = load i32, i32* %51, align 16
  %53 = tail call i32 @malloc(i32 %arg.i.i.i)
  %54 = load i32, i32* %32, align 4
  %55 = inttoptr i32 %54 to i32*
  store i32 %53, i32* %55, align 4
  %56 = load i32, i32* %29, align 8
  %57 = inttoptr i32 %56 to i32*
  %58 = load i32, i32* %57, align 4
  %tmp0_v5.i56.i.i = shl i32 %58, 2
  store i32 %tmp0_v5.i56.i.i, i32* %51, align 16
  store i32 134517794, i32* %52, align 4
  %arg.i.i26.i = load i32, i32* %51, align 16
  %59 = tail call i32 @malloc(i32 %arg.i.i26.i)
  %60 = load i32, i32* %30, align 4
  %61 = inttoptr i32 %60 to i32*
  store i32 %59, i32* %61, align 4
  %tmp2_v2.i20.i.i = add i32 %tmp0_v.i39.i, -168
  %62 = inttoptr i32 %tmp2_v2.i20.i.i to i32*
  store i32 0, i32* %62, align 8
  %63 = load i32, i32* %31, align 16
  %64 = inttoptr i32 %63 to i32*
  %65 = load i32, i32* %64, align 4
  %66 = icmp sgt i32 %65, 0
  br i1 %66, label %BB_8049435.i.i, label %BB_8049464.i.i

BB_8049464.i.i:                                   ; preds = %BB_8049435.i.i, %0
  %r_ecx.0.lcssa.i = phi i32 [ %tmp2_v.i38.i, %0 ], [ %tmp2_v3.i.i.i, %BB_8049435.i.i ]
  %r_edx.0.lcssa.i = phi i32 [ %59, %0 ], [ %tmp0_v10.i.i.i, %BB_8049435.i.i ]
  %tmp2_v.i6.i.i = add i32 %tmp0_v.i39.i, -164
  %67 = inttoptr i32 %tmp2_v.i6.i.i to i32*
  store i32 0, i32* %67, align 4
  %68 = load i32, i32* %29, align 8
  %69 = inttoptr i32 %68 to i32*
  %70 = load i32, i32* %69, align 4
  %71 = icmp sgt i32 %70, 0
  br i1 %71, label %BB_804946D.i.i, label %Func_split.exit

BB_8049435.i.i:                                   ; preds = %BB_8049435.i.i, %0
  %storemerge28.i = phi i32 [ %tmp0_v14.i30.i.i, %BB_8049435.i.i ], [ 0, %0 ]
  %tmp4_v.i.i.i7 = shl i32 %storemerge28.i, 2
  %72 = load i32, i32* %36, align 16
  %tmp2_v3.i.i.i = add i32 %72, %tmp4_v.i.i.i7
  %73 = load i32, i32* %32, align 4
  %74 = inttoptr i32 %73 to i32*
  %75 = load i32, i32* %74, align 4
  %tmp0_v10.i.i.i = add i32 %75, %tmp4_v.i.i.i7
  %76 = inttoptr i32 %tmp2_v3.i.i.i to i32*
  %77 = load i32, i32* %76, align 4
  %78 = inttoptr i32 %tmp0_v10.i.i.i to i32*
  store i32 %77, i32* %78, align 4
  %79 = load i32, i32* %62, align 8
  %tmp0_v14.i30.i.i = add i32 %79, 1
  store i32 %tmp0_v14.i30.i.i, i32* %62, align 8
  %80 = load i32, i32* %31, align 16
  %81 = inttoptr i32 %80 to i32*
  %82 = load i32, i32* %81, align 4
  %83 = icmp slt i32 %tmp0_v14.i30.i.i, %82
  br i1 %83, label %BB_8049435.i.i, label %BB_8049464.i.i

BB_804946D.i.i:                                   ; preds = %BB_804946D.i.i, %BB_8049464.i.i
  %storemerge2230.i = phi i32 [ %tmp0_v17.i79.i.i, %BB_804946D.i.i ], [ 0, %BB_8049464.i.i ]
  %84 = load i32, i32* %33, align 8
  %tmp0_v3.i64.i.i = add i32 %84, %storemerge2230.i
  %tmp4_v.i65.i.i = shl i32 %tmp0_v3.i64.i.i, 2
  %85 = load i32, i32* %36, align 16
  %tmp2_v6.i68.i.i = add i32 %tmp4_v.i65.i.i, %85
  %86 = load i32, i32* %30, align 4
  %87 = inttoptr i32 %86 to i32*
  %88 = load i32, i32* %87, align 4
  %tmp0_v12.i74.i.i = shl i32 %storemerge2230.i, 2
  %tmp0_v13.i75.i.i = add i32 %88, %tmp0_v12.i74.i.i
  %89 = inttoptr i32 %tmp2_v6.i68.i.i to i32*
  %90 = load i32, i32* %89, align 4
  %91 = inttoptr i32 %tmp0_v13.i75.i.i to i32*
  store i32 %90, i32* %91, align 4
  %92 = load i32, i32* %67, align 4
  %tmp0_v17.i79.i.i = add i32 %92, 1
  store i32 %tmp0_v17.i79.i.i, i32* %67, align 4
  %93 = load i32, i32* %29, align 8
  %94 = inttoptr i32 %93 to i32*
  %95 = load i32, i32* %94, align 4
  %96 = icmp slt i32 %tmp0_v17.i79.i.i, %95
  br i1 %96, label %BB_804946D.i.i, label %Func_split.exit

Func_split.exit:                                  ; preds = %BB_804946D.i.i, %BB_8049464.i.i
  %r_ecx.1.lcssa.i = phi i32 [ %r_ecx.0.lcssa.i, %BB_8049464.i.i ], [ %tmp2_v6.i68.i.i, %BB_804946D.i.i ]
  %r_edx.1.lcssa.i = phi i32 [ %r_edx.0.lcssa.i, %BB_8049464.i.i ], [ %tmp0_v13.i75.i.i, %BB_804946D.i.i ]
  %97 = load i32, i32* %39, align 4
  %98 = load i32, i32* %38, align 8
  %tmp2_v.i46.i = add i32 %98, -80
  %99 = inttoptr i32 %tmp2_v.i46.i to i32*
  %100 = load i32, i32* %99, align 4
  store i32 %100, i32* %30, align 4
  %tmp2_v4.i51.i = add i32 %97, -8184
  store i32 %tmp2_v4.i51.i, i32* %31, align 16
  store i32 134517482, i32* %32, align 4
  %101 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.1.lcssa.i, i32 inreg noundef %r_edx.1.lcssa.i, i32 noundef %tmp2_v27.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %102 = lshr i64 %101, 32
  %103 = trunc i64 %102 to i32
  %mrv.i10 = insertvalue { i32, i32 } undef, i32 %tmp2_v27.i.i, 0
  %tmp2_v.i3.i = add i32 %98, -64
  %104 = inttoptr i32 %tmp2_v.i3.i to i32*
  %.pn20 = insertvalue { i32, i32 } %mrv.i10, i32 %103, 1
  store i32 0, i32* %104, align 4
  %105 = load i32, i32* %99, align 4
  %106 = icmp sgt i32 %105, 0
  br i1 %106, label %BB_80492F6.i.lr.ph, label %BB_8049325.i

BB_80492F6.i.lr.ph:                               ; preds = %Func_split.exit
  %tmp2_v.i55.i = add i32 %98, -72
  %107 = inttoptr i32 %tmp2_v.i55.i to i32*
  %tmp2_v11.i.i = add i32 %97, -8168
  br label %BB_80492F6.i

BB_8049380.i:                                     ; preds = %BB_8049351.i, %BB_8049325.i.BB_8049380.i_crit_edge
  %.pre-phi = phi i32* [ %.pre34, %BB_8049325.i.BB_8049380.i_crit_edge ], [ %141, %BB_8049351.i ]
  %.pn.pn.lcssa = phi { i32, i32 } [ %.pn.lcssa, %BB_8049325.i.BB_8049380.i_crit_edge ], [ %.pn5, %BB_8049351.i ]
  %r_esp.0.in.le = extractvalue { i32, i32 } %.pn.pn.lcssa, 0
  %108 = inttoptr i32 %r_esp.0.in.le to i32*
  store i32 10, i32* %108, align 4
  %tmp2_v1.i.i = add i32 %r_esp.0.in.le, -4
  %109 = inttoptr i32 %tmp2_v1.i.i to i32*
  store i32 134517642, i32* %109, align 4
  %arg.i.i = load i32, i32* %108, align 4
  %110 = tail call i32 @putchar(i32 %arg.i.i)  nounwind 
  %tmp2_v.i16.i = add i32 %98, -72
  %111 = inttoptr i32 %tmp2_v.i16.i to i32*
  %112 = load i32, i32* %111, align 4
  store i32 %112, i32* %108, align 4
  store i32 134517657, i32* %109, align 4
  %arg.i.i12 = load i32, i32* %108, align 4
  tail call void @free(i32 %arg.i.i12)
  %113 = load i32, i32* %.pre-phi, align 4
  store i32 %113, i32* %108, align 4
  store i32 134517672, i32* %109, align 4
  %arg.i.i13 = load i32, i32* %108, align 4
  tail call void @free(i32 %arg.i.i13)
  ret void

BB_80492F6.i:                                     ; preds = %BB_80492F6.i, %BB_80492F6.i.lr.ph
  %r_esp.1.in23 = phi i32 [ %tmp2_v27.i.i, %BB_80492F6.i.lr.ph ], [ %r_esp.1.in, %BB_80492F6.i ]
  %.pn22 = phi { i32, i32 } [ %.pn20, %BB_80492F6.i.lr.ph ], [ %.pn, %BB_80492F6.i ]
  %storemerge21 = phi i32 [ 0, %BB_80492F6.i.lr.ph ], [ %tmp0_v2.i138.i, %BB_80492F6.i ]
  %114 = load i32, i32* %107, align 4
  %tmp0_v3.i59.i = shl i32 %storemerge21, 2
  %tmp0_v4.i.i = add i32 %114, %tmp0_v3.i59.i
  %115 = inttoptr i32 %tmp0_v4.i.i to i32*
  %116 = load i32, i32* %115, align 4
  %tmp2_v7.i.i = add i32 %r_esp.1.in23, 8
  %117 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 %116, i32* %117, align 4
  %118 = load i32, i32* %104, align 4
  %tmp2_v10.i.i = add i32 %r_esp.1.in23, 4
  %119 = inttoptr i32 %tmp2_v10.i.i to i32*
  store i32 %118, i32* %119, align 4
  %120 = inttoptr i32 %r_esp.1.in23 to i32*
  store i32 %tmp2_v11.i.i, i32* %120, align 4
  %tmp2_v13.i.i = add i32 %r_esp.1.in23, -4
  %121 = inttoptr i32 %tmp2_v13.i.i to i32*
  store i32 134517526, i32* %121, align 4
  %122 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.1.lcssa.i, i32 inreg noundef %tmp0_v3.i59.i, i32 noundef %r_esp.1.in23, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %123 = lshr i64 %122, 32
  %124 = trunc i64 %123 to i32
  %125 = load i32, i32* %104, align 4
  %tmp0_v2.i138.i = add i32 %125, 1
  %.pn = insertvalue { i32, i32 } %.pn22, i32 %124, 1
  %r_esp.1.in = extractvalue { i32, i32 } %.pn22, 0
  store i32 %tmp0_v2.i138.i, i32* %104, align 4
  %126 = load i32, i32* %99, align 4
  %127 = icmp slt i32 %tmp0_v2.i138.i, %126
  br i1 %127, label %BB_80492F6.i, label %BB_8049325.i.loopexit

BB_8049325.i.loopexit:                            ; preds = %BB_80492F6.i
  %128 = trunc i64 %123 to i32
  %r_esp.1.in.le = extractvalue { i32, i32 } %.pn22, 0
  br label %BB_8049325.i

BB_8049325.i:                                     ; preds = %BB_8049325.i.loopexit, %Func_split.exit
  %r_esp.1.in.le.pre-phi = phi i32 [ %tmp2_v27.i.i, %Func_split.exit ], [ %r_esp.1.in.le, %BB_8049325.i.loopexit ]
  %.pn18.lcssa = phi i32 [ %103, %Func_split.exit ], [ %128, %BB_8049325.i.loopexit ]
  %.pn.lcssa = phi { i32, i32 } [ %.pn20, %Func_split.exit ], [ %.pn, %BB_8049325.i.loopexit ]
  %129 = inttoptr i32 %r_esp.1.in.le.pre-phi to i32*
  store i32 10, i32* %129, align 4
  %tmp2_v1.i67.i = add i32 %r_esp.1.in.le.pre-phi, -4
  %130 = inttoptr i32 %tmp2_v1.i67.i to i32*
  store i32 134517551, i32* %130, align 4
  %arg.i.i15 = load i32, i32* %129, align 4
  %131 = tail call i32 @putchar(i32 %arg.i.i15)  nounwind 
  %tmp2_v.i108.i = add i32 %98, -76
  %132 = inttoptr i32 %tmp2_v.i108.i to i32*
  %133 = load i32, i32* %132, align 4
  %tmp2_v3.i111.i = add i32 %r_esp.1.in.le.pre-phi, 4
  %134 = inttoptr i32 %tmp2_v3.i111.i to i32*
  store i32 %133, i32* %134, align 4
  %tmp2_v4.i113.i = add i32 %97, -8148
  store i32 %tmp2_v4.i113.i, i32* %129, align 4
  store i32 134517573, i32* %130, align 4
  %135 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.1.lcssa.i, i32 inreg noundef %.pn18.lcssa, i32 noundef %r_esp.1.in.le.pre-phi, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %tmp2_v.i29.i = add i32 %98, -60
  %136 = inttoptr i32 %tmp2_v.i29.i to i32*
  store i32 0, i32* %136, align 4
  %137 = load i32, i32* %132, align 4
  %138 = icmp sgt i32 %137, 0
  br i1 %138, label %BB_8049351.i.lr.ph, label %BB_8049325.i.BB_8049380.i_crit_edge

BB_8049325.i.BB_8049380.i_crit_edge:              ; preds = %BB_8049325.i
  %.pre33 = add i32 %98, -68
  %.pre34 = inttoptr i32 %.pre33 to i32*
  br label %BB_8049380.i

BB_8049351.i.lr.ph:                               ; preds = %BB_8049325.i
  %139 = lshr i64 %135, 32
  %140 = trunc i64 %139 to i32
  %tmp2_v.i116.i = add i32 %98, -68
  %141 = inttoptr i32 %tmp2_v.i116.i to i32*
  %tmp2_v11.i130.i = add i32 %97, -8132
  br label %BB_8049351.i

BB_8049351.i:                                     ; preds = %BB_8049351.i, %BB_8049351.i.lr.ph
  %.pn1929 = phi i32 [ %140, %BB_8049351.i.lr.ph ], [ %152, %BB_8049351.i ]
  %.pn.pn28 = phi { i32, i32 } [ %.pn.lcssa, %BB_8049351.i.lr.ph ], [ %.pn5, %BB_8049351.i ]
  %storemerge427 = phi i32 [ 0, %BB_8049351.i.lr.ph ], [ %tmp0_v2.i73.i, %BB_8049351.i ]
  %r_esp.0.in30 = extractvalue { i32, i32 } %.pn.pn28, 0
  %.pn5 = insertvalue { i32, i32 } %.pn.pn28, i32 %.pn1929, 1
  %142 = load i32, i32* %141, align 4
  %tmp0_v3.i120.i = shl i32 %storemerge427, 2
  %tmp0_v4.i121.i = add i32 %142, %tmp0_v3.i120.i
  %143 = inttoptr i32 %tmp0_v4.i121.i to i32*
  %144 = load i32, i32* %143, align 4
  %tmp2_v7.i125.i = add i32 %r_esp.0.in30, 8
  %145 = inttoptr i32 %tmp2_v7.i125.i to i32*
  store i32 %144, i32* %145, align 4
  %146 = load i32, i32* %136, align 4
  %tmp2_v10.i128.i = add i32 %r_esp.0.in30, 4
  %147 = inttoptr i32 %tmp2_v10.i128.i to i32*
  store i32 %146, i32* %147, align 4
  %148 = inttoptr i32 %r_esp.0.in30 to i32*
  store i32 %tmp2_v11.i130.i, i32* %148, align 4
  %tmp2_v13.i132.i = add i32 %r_esp.0.in30, -4
  %149 = inttoptr i32 %tmp2_v13.i132.i to i32*
  store i32 134517617, i32* %149, align 4
  %150 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.1.lcssa.i, i32 inreg noundef %tmp0_v3.i120.i, i32 noundef %r_esp.0.in30, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %151 = lshr i64 %150, 32
  %152 = trunc i64 %151 to i32
  %153 = load i32, i32* %136, align 4
  %tmp0_v2.i73.i = add i32 %153, 1
  store i32 %tmp0_v2.i73.i, i32* %136, align 4
  %154 = load i32, i32* %132, align 4
  %155 = icmp slt i32 %tmp0_v2.i73.i, %154
  br i1 %155, label %BB_8049351.i, label %BB_8049380.i
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

  tail call fastcc void @split_array_at_index39 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack38, i32 0, i32 8092) to i32)) nounwind
