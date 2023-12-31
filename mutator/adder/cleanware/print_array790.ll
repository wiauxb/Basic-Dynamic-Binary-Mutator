; Mutation 790
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack789 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.785 = constant [4 x i8] c"\25\64\20\00"
@str.bis.786 = constant [3 x i8] c"\25\64\00"
@str.bis.787 = constant [4 x i8] c"\25\64\0a\00"
@str.bis.788 = constant [16 x i8] c"\61\72\72\61\79\5b\25\64\5d\20\3d\20\25\64\0a\00"

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
define internal fastcc void @print_array790(i32 %arg_esp) unnamed_addr  norecurse nounwind  !retregs !12 {
  %tmp2_v.i25.i = add i32 %arg_esp, 4
  %tmp0_v.i26.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i28.i = add i32 %tmp0_v.i26.i, -4
  %3 = inttoptr i32 %tmp2_v3.i28.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i29.i = add i32 %tmp0_v.i26.i, -8
  %4 = inttoptr i32 %tmp2_v4.i29.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i31.i = add i32 %tmp0_v.i26.i, -12
  %5 = inttoptr i32 %tmp2_v5.i31.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i33.i = add i32 %tmp0_v.i26.i, -16
  %6 = inttoptr i32 %tmp2_v6.i33.i to i32*
  store i32 %tmp2_v.i25.i, i32* %6, align 16
  %tmp2_v8.i35.i = add i32 %tmp0_v.i26.i, -84
  %7 = inttoptr i32 %tmp2_v8.i35.i to i32*
  store i32 134517233, i32* %7, align 4
  %tmp4_v.i63.i.b = load i1, i1* @segs.0, align 1
  %8 = inttoptr i32 %arg_esp to i32*
  %9 = load i32, i32* %8, align 4
  %tmp2_v2.i67.i = add i32 %tmp0_v.i26.i, -20
  %10 = inttoptr i32 %tmp2_v2.i67.i to i32*
  store i32 %9, i32* %10, align 4
  %tmp2_v3.i68.i = add i32 %tmp0_v.i26.i, -52
  %11 = inttoptr i32 %tmp2_v3.i68.i to i32*
  store i32 1, i32* %11, align 4
  %tmp2_v4.i69.i = add i32 %tmp0_v.i26.i, -48
  %12 = inttoptr i32 %tmp2_v4.i69.i to i32*
  store i32 2, i32* %12, align 16
  %tmp2_v5.i70.i = add i32 %tmp0_v.i26.i, -44
  %13 = inttoptr i32 %tmp2_v5.i70.i to i32*
  store i32 3, i32* %13, align 4
  %tmp2_v6.i71.i = add i32 %tmp0_v.i26.i, -40
  %14 = inttoptr i32 %tmp2_v6.i71.i to i32*
  store i32 4, i32* %14, align 8
  %tmp2_v7.i.i = add i32 %tmp0_v.i26.i, -36
  %15 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 5, i32* %15, align 4
  %tmp2_v8.i72.i = add i32 %tmp0_v.i26.i, -32
  %16 = inttoptr i32 %tmp2_v8.i72.i to i32*
  store i32 6, i32* %16, align 16
  %tmp2_v9.i73.i = add i32 %tmp0_v.i26.i, -28
  %17 = inttoptr i32 %tmp2_v9.i73.i to i32*
  store i32 7, i32* %17, align 4
  %tmp2_v10.i74.i = add i32 %tmp0_v.i26.i, -24
  %18 = inttoptr i32 %tmp2_v10.i74.i to i32*
  store i32 8, i32* %18, align 8
  %tmp2_v11.i75.i = add i32 %tmp0_v.i26.i, -56
  %19 = inttoptr i32 %tmp2_v11.i75.i to i32*
  store i32 8, i32* %19, align 8
  %tmp2_v12.i.i = add i32 %tmp0_v.i26.i, -72
  %20 = inttoptr i32 %tmp2_v12.i.i to i32*
  store i32 0, i32* %20, align 8
  %21 = load i32, i32* %19, align 8
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %BB_804924A.i.lr.ph, label %.BB_8049270.i_crit_edge

.BB_8049270.i_crit_edge:                          ; preds = %0
  %.pre36 = add i32 %tmp0_v.i26.i, -96
  %.pre37 = inttoptr i32 %.pre36 to i32*
  %.pre38 = add i32 %tmp0_v.i26.i, -100
  %.pre39 = inttoptr i32 %.pre38 to i32*
  br label %BB_8049270.i

BB_804924A.i.lr.ph:                               ; preds = %0
  %tmp2_v5.i85.i = add i32 %tmp0_v.i26.i, -92
  %23 = inttoptr i32 %tmp2_v5.i85.i to i32*
  %tmp2_v7.i88.i = add i32 %tmp0_v.i26.i, -96
  %24 = inttoptr i32 %tmp2_v7.i88.i to i32*
  %tmp2_v8.i89.i = add i32 %tmp0_v.i26.i, -100
  %25 = inttoptr i32 %tmp2_v8.i89.i to i32*
  br label %BB_804924A.i

BB_80492C2.i:                                     ; preds = %BB_80492C2.i.lr.ph, %BB_80492C2.i
  %r_edx.130 = phi i32 [ %r_edx.2.lcssa, %BB_80492C2.i.lr.ph ], [ %31, %BB_80492C2.i ]
  %storemerge629 = phi i32 [ 0, %BB_80492C2.i.lr.ph ], [ %tmp0_v2.i185.i, %BB_80492C2.i ]
  %tmp4_v.i12.i = shl i32 %storemerge629, 2
  %tmp2_v2.i.i = add i32 %tmp4_v.i12.i, %tmp2_v3.i68.i
  %26 = inttoptr i32 %tmp2_v2.i.i to i32*
  %27 = load i32, i32* %26, align 4
  store i32 %27, i32* %40, align 8
  %28 = load i32, i32* %37, align 16
  store i32 %28, i32* %41, align 4
  %spi.bis.788 = ptrtoint[16 x i8]* @str.bis.788 to i32
  store i32 %spi.bis.788, i32* %.pre-phi, align 16
  store i32 134517468, i32* %.pre-phi40, align 4
  %29 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i25.i, i32 inreg noundef %r_edx.130, i32 noundef %tmp2_v.i154.i.pre-phi, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %30 = lshr i64 %29, 32
  %31 = trunc i64 %30 to i32
  %32 = load i32, i32* %37, align 16
  %tmp0_v2.i185.i = add i32 %32, 1
  store i32 %tmp0_v2.i185.i, i32* %37, align 16
  %33 = load i32, i32* %19, align 8
  %34 = icmp slt i32 %tmp0_v2.i185.i, %33
  br i1 %34, label %BB_80492C2.i, label %BB_80492EB.i.loopexit

BB_80492AC.i.loopexit:                            ; preds = %BB_8049286.i
  %35 = trunc i64 %77 to i32
  br label %BB_80492AC.i

BB_80492AC.i:                                     ; preds = %BB_8049270.i, %BB_80492AC.i.loopexit
  %r_edx.2.lcssa = phi i32 [ %r_edx.3.lcssa, %BB_8049270.i ], [ %35, %BB_80492AC.i.loopexit ]
  store i32 10, i32* %.pre-phi, align 16
  store i32 134517430, i32* %.pre-phi40, align 4
  %arg.i.i = load i32, i32* %.pre-phi, align 16
  %36 = tail call i32 @putchar(i32 %arg.i.i)  nounwind 
  %tmp2_v.i.i = add i32 %tmp0_v.i26.i, -64
  %37 = inttoptr i32 %tmp2_v.i.i to i32*
  store i32 0, i32* %37, align 16
  %38 = load i32, i32* %19, align 8
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %BB_80492C2.i.lr.ph, label %BB_80492EB.i

BB_80492C2.i.lr.ph:                               ; preds = %BB_80492AC.i
  %tmp2_v5.i16.i = add i32 %tmp0_v.i26.i, -88
  %40 = inttoptr i32 %tmp2_v5.i16.i to i32*
  %tmp2_v8.i.i = add i32 %tmp0_v.i26.i, -92
  %41 = inttoptr i32 %tmp2_v8.i.i to i32*
  br label %BB_80492C2.i

BB_8049333.i:                                     ; preds = %BB_8049326.i, %BB_8049301.i
  %42 = phi i32 [ %tmp0_v2.i140.i, %BB_8049301.i ], [ %.pre, %BB_8049326.i ]
  %tmp0_v1.i54.i = add i32 %42, 1
  store i32 %tmp0_v1.i54.i, i32* %63, align 4
  %43 = load i32, i32* %19, align 8
  %44 = icmp slt i32 %tmp0_v1.i54.i, %43
  br i1 %44, label %BB_8049301.i, label %BB_804933F.i

BB_804924A.i:                                     ; preds = %BB_804924A.i, %BB_804924A.i.lr.ph
  %r_edx.325 = phi i32 [ 0, %BB_804924A.i.lr.ph ], [ %49, %BB_804924A.i ]
  %storemerge724 = phi i32 [ 0, %BB_804924A.i.lr.ph ], [ %tmp0_v2.i197.i, %BB_804924A.i ]
  %tmp4_v.i80.i = shl i32 %storemerge724, 2
  %tmp2_v2.i81.i = add i32 %tmp4_v.i80.i, %tmp2_v3.i68.i
  %45 = inttoptr i32 %tmp2_v2.i81.i to i32*
  %46 = load i32, i32* %45, align 4
  store i32 %46, i32* %23, align 4
  %spi.bis.787 = ptrtoint[4 x i8]* @str.bis.787 to i32
  store i32 %spi.bis.787, i32* %24, align 16
  store i32 134517345, i32* %25, align 4
  %47 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i25.i, i32 inreg noundef %r_edx.325, i32 noundef %tmp2_v7.i88.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %48 = lshr i64 %47, 32
  %49 = trunc i64 %48 to i32
  %50 = load i32, i32* %20, align 8
  %tmp0_v2.i197.i = add i32 %50, 1
  store i32 %tmp0_v2.i197.i, i32* %20, align 8
  %51 = load i32, i32* %19, align 8
  %52 = icmp slt i32 %tmp0_v2.i197.i, %51
  br i1 %52, label %BB_804924A.i, label %BB_8049270.i.loopexit

BB_8049301.i:                                     ; preds = %BB_8049301.i.lr.ph, %BB_8049333.i
  %r_edx.033 = phi i32 [ %r_edx.1.lcssa, %BB_8049301.i.lr.ph ], [ %57, %BB_8049333.i ]
  %storemerge532 = phi i32 [ 0, %BB_8049301.i.lr.ph ], [ %tmp0_v1.i54.i, %BB_8049333.i ]
  %tmp4_v.i117.i = shl i32 %storemerge532, 2
  %tmp2_v2.i118.i = add i32 %tmp4_v.i117.i, %tmp2_v3.i68.i
  %53 = inttoptr i32 %tmp2_v2.i118.i to i32*
  %54 = load i32, i32* %53, align 4
  store i32 %54, i32* %66, align 4
  %spi.bis.786 = ptrtoint[3 x i8]* @str.bis.786 to i32
  store i32 %spi.bis.786, i32* %.pre-phi, align 16
  store i32 134517528, i32* %.pre-phi40, align 4
  %55 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i25.i, i32 inreg noundef %r_edx.033, i32 noundef %tmp2_v.i154.i.pre-phi, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %56 = lshr i64 %55, 32
  %57 = trunc i64 %56 to i32
  %58 = load i32, i32* %19, align 8
  %tmp0_v2.i140.i = add i32 %58, -1
  %59 = load i32, i32* %63, align 4
  %60 = icmp eq i32 %59, %tmp0_v2.i140.i
  br i1 %60, label %BB_8049333.i, label %BB_8049326.i

BB_80492EB.i.loopexit:                            ; preds = %BB_80492C2.i
  %61 = trunc i64 %30 to i32
  br label %BB_80492EB.i

BB_80492EB.i:                                     ; preds = %BB_80492EB.i.loopexit, %BB_80492AC.i
  %r_edx.1.lcssa = phi i32 [ %r_edx.2.lcssa, %BB_80492AC.i ], [ %61, %BB_80492EB.i.loopexit ]
  store i32 10, i32* %.pre-phi, align 16
  store i32 134517493, i32* %.pre-phi40, align 4
  %arg.i.i18 = load i32, i32* %.pre-phi, align 16
  %62 = tail call i32 @putchar(i32 %arg.i.i18)  nounwind 
  %tmp2_v.i93.i = add i32 %tmp0_v.i26.i, -60
  %63 = inttoptr i32 %tmp2_v.i93.i to i32*
  store i32 0, i32* %63, align 4
  %64 = load i32, i32* %19, align 8
  %65 = icmp sgt i32 %64, 0
  br i1 %65, label %BB_8049301.i.lr.ph, label %BB_804933F.i

BB_8049301.i.lr.ph:                               ; preds = %BB_80492EB.i
  %tmp2_v5.i122.i = add i32 %tmp0_v.i26.i, -92
  %66 = inttoptr i32 %tmp2_v5.i122.i to i32*
  br label %BB_8049301.i

BB_804933F.i:                                     ; preds = %BB_80492EB.i, %BB_8049333.i
  store i32 10, i32* %.pre-phi, align 16
  store i32 134517577, i32* %.pre-phi40, align 4
  %arg.i.i19 = load i32, i32* %.pre-phi, align 16
  %67 = tail call i32 @putchar(i32 %arg.i.i19)  nounwind 
  ret void

BB_8049270.i.loopexit:                            ; preds = %BB_804924A.i
  %68 = trunc i64 %48 to i32
  br label %BB_8049270.i

BB_8049270.i:                                     ; preds = %BB_8049270.i.loopexit, %.BB_8049270.i_crit_edge
  %.pre-phi40 = phi i32* [ %.pre39, %.BB_8049270.i_crit_edge ], [ %25, %BB_8049270.i.loopexit ]
  %.pre-phi = phi i32* [ %.pre37, %.BB_8049270.i_crit_edge ], [ %24, %BB_8049270.i.loopexit ]
  %tmp2_v.i154.i.pre-phi = phi i32 [ %.pre36, %.BB_8049270.i_crit_edge ], [ %tmp2_v7.i88.i, %BB_8049270.i.loopexit ]
  %r_edx.3.lcssa = phi i32 [ 0, %.BB_8049270.i_crit_edge ], [ %68, %BB_8049270.i.loopexit ]
  store i32 10, i32* %.pre-phi, align 16
  store i32 134517370, i32* %.pre-phi40, align 4
  %arg.i.i20 = load i32, i32* %.pre-phi, align 16
  %69 = tail call i32 @putchar(i32 %arg.i.i20)  nounwind 
  %tmp2_v.i43.i = add i32 %tmp0_v.i26.i, -68
  %70 = inttoptr i32 %tmp2_v.i43.i to i32*
  store i32 0, i32* %70, align 4
  %71 = load i32, i32* %19, align 8
  %72 = icmp sgt i32 %71, 0
  br i1 %72, label %BB_8049286.i.lr.ph, label %BB_80492AC.i

BB_8049286.i.lr.ph:                               ; preds = %BB_8049270.i
  %tmp2_v5.i175.i = add i32 %tmp0_v.i26.i, -92
  %73 = inttoptr i32 %tmp2_v5.i175.i to i32*
  br label %BB_8049286.i

BB_8049286.i:                                     ; preds = %BB_8049286.i, %BB_8049286.i.lr.ph
  %r_edx.227 = phi i32 [ %r_edx.3.lcssa, %BB_8049286.i.lr.ph ], [ %78, %BB_8049286.i ]
  %storemerge26 = phi i32 [ 0, %BB_8049286.i.lr.ph ], [ %tmp0_v2.i106.i, %BB_8049286.i ]
  %tmp4_v.i170.i = shl i32 %storemerge26, 2
  %tmp2_v2.i171.i = add i32 %tmp4_v.i170.i, %tmp2_v3.i68.i
  %74 = inttoptr i32 %tmp2_v2.i171.i to i32*
  %75 = load i32, i32* %74, align 4
  store i32 %75, i32* %73, align 4
  %spi.bis.785 = ptrtoint[4 x i8]* @str.bis.785 to i32
  store i32 %spi.bis.785, i32* %.pre-phi, align 16
  store i32 134517405, i32* %.pre-phi40, align 4
  %76 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i25.i, i32 inreg noundef %r_edx.227, i32 noundef %tmp2_v.i154.i.pre-phi, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %77 = lshr i64 %76, 32
  %78 = trunc i64 %77 to i32
  %79 = load i32, i32* %70, align 4
  %tmp0_v2.i106.i = add i32 %79, 1
  store i32 %tmp0_v2.i106.i, i32* %70, align 4
  %80 = load i32, i32* %19, align 8
  %81 = icmp slt i32 %tmp0_v2.i106.i, %80
  br i1 %81, label %BB_8049286.i, label %BB_80492AC.i.loopexit

BB_8049326.i:                                     ; preds = %BB_8049301.i
  store i32 44, i32* %.pre-phi, align 16
  store i32 134517552, i32* %.pre-phi40, align 4
  %arg.i.i23 = load i32, i32* %.pre-phi, align 16
  %82 = tail call i32 @putchar(i32 %arg.i.i23)  nounwind 
  %.pre = load i32, i32* %63, align 4
  br label %BB_8049333.i
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

  tail call fastcc void @print_array790 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack789, i32 0, i32 8092) to i32)) nounwind
