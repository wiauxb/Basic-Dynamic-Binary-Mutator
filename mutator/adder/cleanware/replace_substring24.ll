; Mutation 24
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
@str.22 = constant [4 x i8] c"the\00"
@str.23 = constant [5 x i8] c"that\00"

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
declare i32 @strlen(i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare i32 @malloc(i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare i32 @strcpy(i32, i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare void @free(i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare i32 @strstr(i32, i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @replace_substring24(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
.exit:
  %tmp2_v.i28.i = add i32 %arg_esp, 4
  %tmp0_v.i29.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i31.i = add i32 %tmp0_v.i29.i, -4
  %2 = inttoptr i32 %tmp2_v3.i31.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i32.i = add i32 %tmp0_v.i29.i, -8
  %3 = inttoptr i32 %tmp2_v4.i32.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i34.i = add i32 %tmp0_v.i29.i, -12
  %4 = inttoptr i32 %tmp2_v5.i34.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i36.i = add i32 %tmp0_v.i29.i, -16
  %5 = inttoptr i32 %tmp2_v6.i36.i to i32*
  store i32 %tmp2_v.i28.i, i32* %5, align 16
  %tmp2_v8.i37.i = add i32 %tmp0_v.i29.i, -68
  %6 = inttoptr i32 %tmp2_v8.i37.i to i32*
  store i32 134517361, i32* %6, align 4
  %tmp4_v.i2.i.b = load i1, i1* @segs.0, align 1
  %7 = inttoptr i32 %arg_esp to i32*
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i6.i = add i32 %tmp0_v.i29.i, -20
  %9 = inttoptr i32 %tmp2_v2.i6.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i29.i, -50
  %10 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 1702125896, i32* %10, align 4
  %tmp2_v4.i.i = add i32 %tmp0_v.i29.i, -46
  %11 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 1701344288, i32* %11, align 4
  %tmp2_v5.i.i = add i32 %tmp0_v.i29.i, -42
  %12 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 1852404512, i32* %12, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i29.i, -38
  %13 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 1869357100, i32* %13, align 4
  %tmp2_v7.i.i = add i32 %tmp0_v.i29.i, -34
  %14 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 1948280182, i32* %14, align 4
  %tmp2_v8.i.i = add i32 %tmp0_v.i29.i, -30
  %15 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 1931502952, i32* %15, align 4
  %tmp2_v9.i.i = add i32 %tmp0_v.i29.i, -26
  %16 = inttoptr i32 %tmp2_v9.i.i to i32*
  store i32 1701736041, i32* %16, align 4
  %tmp2_v10.i.i = add i32 %tmp0_v.i29.i, -22
  %17 = inttoptr i32 %tmp2_v10.i.i to i16*
  store i16 114, i16* %17, align 2
  %tmp2_v13.i.i = add i32 %tmp0_v.i29.i, -72
  %18 = inttoptr i32 %tmp2_v13.i.i to i32*
  %spi23 = ptrtoint[5 x i8]* @str.23 to i32
  store i32 %spi23, i32* %18, align 8
  %tmp2_v15.i.i = add i32 %tmp0_v.i29.i, -76
  %19 = inttoptr i32 %tmp2_v15.i.i to i32*
  %spi22 = ptrtoint[4 x i8]* @str.22 to i32
  store i32 %spi22, i32* %19, align 4
  %tmp2_v17.i.i = add i32 %tmp0_v.i29.i, -80
  %20 = inttoptr i32 %tmp2_v17.i.i to i32*
  store i32 %tmp2_v3.i.i, i32* %20, align 16
  %tmp2_v18.i.i = add i32 %tmp0_v.i29.i, -84
  %21 = inttoptr i32 %tmp2_v18.i.i to i32*
  store i32 134517459, i32* %21, align 4
  %tmp2_v.i21.i.i = add i32 %tmp0_v.i29.i, -88
  %22 = inttoptr i32 %tmp2_v.i21.i.i to i32*
  store i32 %tmp2_v4.i32.i, i32* %22, align 8
  %tmp2_v1.i23.i.i = add i32 %tmp0_v.i29.i, -92
  %23 = inttoptr i32 %tmp2_v1.i23.i.i to i32*
  store i32 134529024, i32* %23, align 4
  %tmp2_v2.i25.i.i = add i32 %tmp0_v.i29.i, -148
  %24 = inttoptr i32 %tmp2_v2.i25.i.i to i32*
  store i32 134517570, i32* %24, align 4
  %25 = load i32, i32* %19, align 4
  %tmp2_v3.i78.i.i = add i32 %tmp0_v.i29.i, -160
  %26 = inttoptr i32 %tmp2_v3.i78.i.i to i32*
  store i32 %25, i32* %26, align 16
  %tmp2_v4.i79.i.i = add i32 %tmp0_v.i29.i, -164
  %27 = inttoptr i32 %tmp2_v4.i79.i.i to i32*
  store i32 134517587, i32* %27, align 4
  %arg.i.i.i = load i32, i32* %26, align 16
  %28 = tail call i32 @strlen(i32 %arg.i.i.i)
  %mrv.i60.i = insertvalue { i32, i32 } undef, i32 %tmp2_v3.i78.i.i, 0
  %tmp2_v.i38.i.i = add i32 %tmp0_v.i29.i, -116
  %29 = inttoptr i32 %tmp2_v.i38.i.i to i32*
  store i32 %28, i32* %29, align 4
  %30 = load i32, i32* %18, align 8
  store i32 %30, i32* %26, align 16
  store i32 134517604, i32* %27, align 4
  %arg.i.i62.i = load i32, i32* %26, align 16
  %31 = tail call i32 @strlen(i32 %arg.i.i62.i)
  %tmp2_v.i8.i.i = add i32 %tmp0_v.i29.i, -112
  %32 = inttoptr i32 %tmp2_v.i8.i.i to i32*
  store i32 %31, i32* %32, align 16
  %33 = load i32, i32* %20, align 16
  store i32 %33, i32* %26, align 16
  store i32 134517621, i32* %27, align 4
  %arg.i.i64.i = load i32, i32* %26, align 16
  %34 = tail call i32 @strlen(i32 %arg.i.i64.i)
  %tmp2_v.i29.i.i = add i32 %tmp0_v.i29.i, -108
  %35 = inttoptr i32 %tmp2_v.i29.i.i to i32*
  store i32 %34, i32* %35, align 4
  %tmp2_v.i69.i.i = add i32 %tmp0_v.i29.i, -132
  %36 = inttoptr i32 %tmp2_v.i69.i.i to i32*
  store i32 0, i32* %36, align 4
  %tmp2_v1.i70.i.i = add i32 %tmp0_v.i29.i, -128
  %37 = inttoptr i32 %tmp2_v1.i70.i.i to i32*
  store i32 0, i32* %37, align 16
  %38 = load i32, i32* %35, align 4
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %BB_80493AA.i.i, label %BB_80493E5.i.i

BB_80493AA.i.i:                                   ; preds = %BB_80493DD.i.backedge.i, %.exit
  %40 = phi i32 [ %storemerge88.i, %BB_80493DD.i.backedge.i ], [ 0, %.exit ]
  %r_esp.0.in82.i = phi i32 [ %r_esp.0.in.i, %BB_80493DD.i.backedge.i ], [ %tmp2_v3.i78.i.i, %.exit ]
  %.pn81.pn.i = phi { i32, i32 } [ %.pn81.i, %BB_80493DD.i.backedge.i ], [ %mrv.i60.i, %.exit ]
  %.pn87.i = phi i32 [ %46, %BB_80493DD.i.backedge.i ], [ %34, %.exit ]
  %.pn81.i = insertvalue { i32, i32 } %.pn81.pn.i, i32 %.pn87.i, 1
  %41 = load i32, i32* %20, align 16
  %tmp0_v3.i.i.i = add i32 %41, %40
  %42 = load i32, i32* %19, align 4
  %tmp2_v7.i.i.i = add i32 %r_esp.0.in82.i, 4
  %43 = inttoptr i32 %tmp2_v7.i.i.i to i32*
  store i32 %42, i32* %43, align 4
  %44 = inttoptr i32 %r_esp.0.in82.i to i32*
  store i32 %tmp0_v3.i.i.i, i32* %44, align 4
  %tmp2_v9.i.i.i = add i32 %r_esp.0.in82.i, -4
  %45 = inttoptr i32 %tmp2_v9.i.i.i to i32*
  store i32 134517694, i32* %45, align 4
  %arg.i.i66.i = load i32, i32* %44, align 4
  %arg2.i.i.i = load i32, i32* %43, align 4
  %46 = tail call i32 @strstr(i32 %arg.i.i66.i, i32 %arg2.i.i.i)
  %47 = load i32, i32* %37, align 16
  %48 = load i32, i32* %20, align 16
  %tmp0_v4.i107.i.i = add i32 %48, %47
  %.not.i110.i.i = icmp eq i32 %46, %tmp0_v4.i107.i.i
  br i1 %.not.i110.i.i, label %BB_80493CD.i.i, label %BB_80493D9.i.i

BB_80493CD.i.i:                                   ; preds = %BB_80493AA.i.i
  %49 = load i32, i32* %36, align 4
  %tmp0_v1.i16.i.i = add i32 %49, 1
  store i32 %tmp0_v1.i16.i.i, i32* %36, align 4
  %50 = load i32, i32* %29, align 4
  %51 = load i32, i32* %37, align 16
  %tmp0_v6.i19.i.i = add i32 %51, %50
  br label %BB_80493DD.i.backedge.i

BB_80493DD.i.backedge.i:                          ; preds = %BB_80493D9.i.i, %BB_80493CD.i.i
  %storemerge88.i = phi i32 [ %tmp0_v1.i159.i.i, %BB_80493D9.i.i ], [ %tmp0_v6.i19.i.i, %BB_80493CD.i.i ]
  store i32 %storemerge88.i, i32* %37, align 16
  %r_esp.0.in.i = extractvalue { i32, i32 } %.pn81.pn.i, 0
  %52 = load i32, i32* %35, align 4
  %53 = icmp slt i32 %storemerge88.i, %52
  br i1 %53, label %BB_80493AA.i.i, label %BB_80493E5.i.i

BB_80493E5.i.i:                                   ; preds = %BB_80493DD.i.backedge.i, %.exit
  %mrv.i60.pn.lcssa79.i = phi { i32, i32 } [ %mrv.i60.i, %.exit ], [ %.pn81.i, %BB_80493DD.i.backedge.i ]
  %r_ecx.0.lcssa.i = phi i32 [ %tmp2_v.i28.i, %.exit ], [ %47, %BB_80493DD.i.backedge.i ]
  %r_esp.0.in.le.i = extractvalue { i32, i32 } %mrv.i60.pn.lcssa79.i, 0
  %54 = load i32, i32* %32, align 16
  %55 = load i32, i32* %29, align 4
  %tmp0_v2.i49.i.i = sub i32 %54, %55
  %tmp2_v3.i50.i.i = add i32 %tmp0_v.i29.i, -104
  %56 = inttoptr i32 %tmp2_v3.i50.i.i to i32*
  store i32 %tmp0_v2.i49.i.i, i32* %56, align 8
  %57 = load i32, i32* %35, align 4
  %tmp2_v6.i.i.i = add i32 %tmp0_v.i29.i, -100
  %58 = inttoptr i32 %tmp2_v6.i.i.i to i32*
  store i32 %57, i32* %58, align 4
  %59 = load i32, i32* %36, align 4
  %60 = load i32, i32* %56, align 8
  %tmp15_v11.i.i.i = mul i32 %60, %59
  %tmp0_v17.i.i.i = add i32 %tmp15_v11.i.i.i, %57
  store i32 %tmp0_v17.i.i.i, i32* %58, align 4
  %tmp0_v20.i.i.i = add i32 %tmp0_v17.i.i.i, 1
  %61 = inttoptr i32 %r_esp.0.in.le.i to i32*
  store i32 %tmp0_v20.i.i.i, i32* %61, align 4
  %tmp2_v23.i.i.i = add i32 %r_esp.0.in.le.i, -4
  %62 = inttoptr i32 %tmp2_v23.i.i.i to i32*
  store i32 134517773, i32* %62, align 4
  %arg.i.i68.i = load i32, i32* %61, align 4
  %63 = tail call i32 @malloc(i32 %arg.i.i68.i)
  %tmp2_v.i83.i.i = add i32 %tmp0_v.i29.i, -136
  %64 = inttoptr i32 %tmp2_v.i83.i.i to i32*
  store i32 %63, i32* %64, align 8
  %tmp2_v1.i85.i.i = add i32 %tmp0_v.i29.i, -124
  %65 = inttoptr i32 %tmp2_v1.i85.i.i to i32*
  store i32 0, i32* %65, align 4
  %tmp2_v2.i86.i.i = add i32 %tmp0_v.i29.i, -120
  %66 = inttoptr i32 %tmp2_v2.i86.i.i to i32*
  store i32 0, i32* %66, align 8
  %67 = load i32, i32* %20, align 16
  store i32 %67, i32* %61, align 4
  store i32 134517907, i32* %62, align 4
  %arg.i.i7585.i = load i32, i32* %61, align 4
  %68 = tail call i32 @strlen(i32 %arg.i.i7585.i)
  %69 = load i32, i32* %65, align 4
  %70 = icmp ugt i32 %68, %69
  br i1 %70, label %BB_8049423.i.lr.ph.i, label %Func_replace.exit

BB_8049423.i.lr.ph.i:                             ; preds = %BB_80493E5.i.i
  %tmp2_v7.i122.i.i = add i32 %r_esp.0.in.le.i, 4
  %71 = inttoptr i32 %tmp2_v7.i122.i.i to i32*
  br label %BB_8049423.i.i

BB_804946B.i.i:                                   ; preds = %BB_8049423.i.i
  %72 = inttoptr i32 %tmp0_v4.i139.i.i to i8*
  %73 = load i8, i8* %72, align 1
  %74 = inttoptr i32 %tmp0_v3.i92.i.i to i8*
  store i8 %73, i8* %74, align 1
  %75 = load i32, i32* %65, align 4
  %tmp0_v12.i.i.i = add i32 %75, 1
  store i32 %tmp0_v12.i.i.i, i32* %65, align 4
  br label %BB_8049488.i.backedge.i

BB_8049488.i.backedge.i:                          ; preds = %BB_8049446.i.i, %BB_804946B.i.i
  %.sink89.i = phi i32 [ 1, %BB_804946B.i.i ], [ %85, %BB_8049446.i.i ]
  %r_ecx.1.be.i = phi i32 [ %92, %BB_804946B.i.i ], [ %90, %BB_8049446.i.i ]
  %76 = load i32, i32* %66, align 8
  %tmp0_v15.i.i.i = add i32 %76, %.sink89.i
  store i32 %tmp0_v15.i.i.i, i32* %66, align 8
  %77 = load i32, i32* %20, align 16
  store i32 %77, i32* %61, align 4
  store i32 134517907, i32* %62, align 4
  %arg.i.i75.i = load i32, i32* %61, align 4
  %78 = tail call i32 @strlen(i32 %arg.i.i75.i)
  %79 = load i32, i32* %65, align 4
  %80 = icmp ugt i32 %78, %79
  br i1 %80, label %BB_8049423.i.i, label %Func_replace.exit

BB_8049446.i.i:                                   ; preds = %BB_8049423.i.i
  %81 = load i32, i32* %18, align 8
  store i32 %81, i32* %71, align 4
  store i32 %tmp0_v3.i92.i.i, i32* %61, align 4
  store i32 134517850, i32* %62, align 4
  %arg.i.i70.i = load i32, i32* %61, align 4
  %arg2.i.i71.i = load i32, i32* %71, align 4
  %82 = tail call i32 @strcpy(i32 %arg.i.i70.i, i32 %arg2.i.i71.i)
  %83 = load i32, i32* %29, align 4
  %84 = load i32, i32* %65, align 4
  %tmp0_v4.i180.i.i = add i32 %84, %83
  store i32 %tmp0_v4.i180.i.i, i32* %65, align 4
  %85 = load i32, i32* %32, align 16
  br label %BB_8049488.i.backedge.i

BB_8049423.i.i:                                   ; preds = %BB_8049488.i.backedge.i, %BB_8049423.i.lr.ph.i
  %86 = phi i32 [ %69, %BB_8049423.i.lr.ph.i ], [ %79, %BB_8049488.i.backedge.i ]
  %87 = load i32, i32* %20, align 16
  %tmp0_v3.i117.i.i = add i32 %87, %86
  %88 = load i32, i32* %19, align 4
  store i32 %88, i32* %71, align 4
  store i32 %tmp0_v3.i117.i.i, i32* %61, align 4
  store i32 134517815, i32* %62, align 4
  %arg.i.i72.i = load i32, i32* %61, align 4
  %arg2.i.i73.i = load i32, i32* %71, align 4
  %89 = tail call i32 @strstr(i32 %arg.i.i72.i, i32 %arg2.i.i73.i)
  %90 = load i32, i32* %65, align 4
  %91 = load i32, i32* %20, align 16
  %tmp0_v4.i139.i.i = add i32 %91, %90
  %.not.i142.i.i = icmp eq i32 %89, %tmp0_v4.i139.i.i
  %92 = load i32, i32* %66, align 8
  %93 = load i32, i32* %64, align 8
  %tmp0_v3.i92.i.i = add i32 %93, %92
  br i1 %.not.i142.i.i, label %BB_8049446.i.i, label %BB_804946B.i.i

BB_80493D9.i.i:                                   ; preds = %BB_80493AA.i.i
  %tmp0_v1.i159.i.i = add i32 %47, 1
  br label %BB_80493DD.i.backedge.i

Func_replace.exit:                                ; preds = %BB_8049488.i.backedge.i, %BB_80493E5.i.i
  %r_ecx.1.lcssa.i = phi i32 [ %r_ecx.0.lcssa.i, %BB_80493E5.i.i ], [ %r_ecx.1.be.i, %BB_8049488.i.backedge.i ]
  %94 = load i32, i32* %66, align 8
  %95 = load i32, i32* %64, align 8
  %tmp0_v3.i149.i.i = add i32 %95, %94
  %96 = inttoptr i32 %tmp0_v3.i149.i.i to i8*
  store i8 0, i8* %96, align 1
  %97 = load i32, i32* %64, align 8
  %98 = load i32, i32* %23, align 4
  %99 = load i32, i32* %22, align 8
  %tmp2_v.i11.i = add i32 %99, -48
  %100 = inttoptr i32 %tmp2_v.i11.i to i32*
  store i32 %97, i32* %100, align 4
  %tmp2_v2.i13.i = add i32 %99, -42
  store i32 %tmp2_v2.i13.i, i32* %19, align 4
  %tmp2_v4.i16.i = add i32 %98, -8175
  store i32 %tmp2_v4.i16.i, i32* %20, align 16
  store i32 134517484, i32* %21, align 4
  %101 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.1.lcssa.i, i32 inreg noundef %94, i32 noundef %tmp2_v17.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %102 = lshr i64 %101, 32
  %103 = trunc i64 %102 to i32
  %104 = load i32, i32* %100, align 4
  store i32 %104, i32* %19, align 4
  %tmp2_v4.i25.i = add i32 %98, -8163
  store i32 %tmp2_v4.i25.i, i32* %20, align 16
  store i32 134517505, i32* %21, align 4
  %105 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.1.lcssa.i, i32 inreg noundef %103, i32 noundef %tmp2_v17.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %106 = load i32, i32* %100, align 4
  store i32 %106, i32* %20, align 16
  store i32 134517519, i32* %21, align 4
  %arg.i.i = load i32, i32* %20, align 16
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
!12 = !{i32 0, i32 0, i32 0, i32 0}
!13 = !{!"printf"}

  tail call fastcc void @replace_substring24(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) nounwind
