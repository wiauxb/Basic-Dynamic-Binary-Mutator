; Mutation 755
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack754 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.751 = constant [4 x i8] c"\05\1e\2d\00"
@str.bis.752 = constant [4 x i8] c"\25\64\20\00"
@str.bis.753 = constant [4 x i8] c"\25\64\20\00"

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
define internal fastcc void @rotate_array_right755(i32 %arg_esp) unnamed_addr  norecurse nounwind  !retregs !12 {
  %tmp2_v.i67.i = add i32 %arg_esp, 4
  %tmp0_v.i68.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i70.i = add i32 %tmp0_v.i68.i, -4
  %3 = inttoptr i32 %tmp2_v3.i70.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i71.i = add i32 %tmp0_v.i68.i, -8
  %4 = inttoptr i32 %tmp2_v4.i71.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i73.i = add i32 %tmp0_v.i68.i, -12
  %5 = inttoptr i32 %tmp2_v5.i73.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i75.i = add i32 %tmp0_v.i68.i, -16
  %6 = inttoptr i32 %tmp2_v6.i75.i to i32*
  store i32 %tmp2_v.i67.i, i32* %6, align 16
  %tmp2_v8.i76.i = add i32 %tmp0_v.i68.i, -68
  %7 = inttoptr i32 %tmp2_v8.i76.i to i32*
  store i32 134517233, i32* %7, align 4
  %tmp4_v.i84.i.b = load i1, i1* @segs.0, align 1
  %8 = inttoptr i32 %arg_esp to i32*
  %9 = load i32, i32* %8, align 4
  %tmp2_v2.i88.i = add i32 %tmp0_v.i68.i, -20
  %10 = inttoptr i32 %tmp2_v2.i88.i to i32*
  store i32 %9, i32* %10, align 4
  %tmp2_v3.i89.i = add i32 %tmp0_v.i68.i, -44
  %11 = inttoptr i32 %tmp2_v3.i89.i to i32*
  store i32 1, i32* %11, align 4
  %tmp2_v4.i90.i = add i32 %tmp0_v.i68.i, -40
  %12 = inttoptr i32 %tmp2_v4.i90.i to i32*
  store i32 2, i32* %12, align 8
  %tmp2_v5.i91.i = add i32 %tmp0_v.i68.i, -36
  %13 = inttoptr i32 %tmp2_v5.i91.i to i32*
  store i32 3, i32* %13, align 4
  %tmp2_v6.i92.i = add i32 %tmp0_v.i68.i, -32
  %14 = inttoptr i32 %tmp2_v6.i92.i to i32*
  store i32 4, i32* %14, align 16
  %tmp2_v7.i93.i = add i32 %tmp0_v.i68.i, -28
  %15 = inttoptr i32 %tmp2_v7.i93.i to i32*
  store i32 5, i32* %15, align 4
  %tmp2_v8.i94.i = add i32 %tmp0_v.i68.i, -24
  %16 = inttoptr i32 %tmp2_v8.i94.i to i32*
  store i32 6, i32* %16, align 8
  %tmp2_v9.i.i = add i32 %tmp0_v.i68.i, -52
  %17 = inttoptr i32 %tmp2_v9.i.i to i32*
  %tmp2_v5.i.i = add i32 %tmp0_v.i68.i, -76
  %18 = inttoptr i32 %tmp2_v5.i.i to i32*
  %tmp2_v7.i.i = add i32 %tmp0_v.i68.i, -80
  %19 = inttoptr i32 %tmp2_v7.i.i to i32*
  %tmp2_v8.i.i = add i32 %tmp0_v.i68.i, -84
  %20 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 0, i32* %17, align 4
  br label %BB_8049235.i

BB_80492A6.i:                                     ; preds = %BB_8049282.i
  store i32 10, i32* %79, align 4
  store i32 134517424, i32* %80, align 4
  %arg.i.i = load i32, i32* %79, align 4
  %21 = tail call i32 @putchar(i32 %arg.i.i)  nounwind 
  ret void

BB_8049235.i:                                     ; preds = %BB_8049235.i, %0
  %r_edx.013 = phi i32 [ 0, %0 ], [ %26, %BB_8049235.i ]
  %storemerge12 = phi i32 [ 0, %0 ], [ %tmp0_v2.i20.i, %BB_8049235.i ]
  %tmp4_v.i.i = shl i32 %storemerge12, 2
  %tmp2_v2.i.i = add i32 %tmp4_v.i.i, %tmp2_v3.i89.i
  %22 = inttoptr i32 %tmp2_v2.i.i to i32*
  %23 = load i32, i32* %22, align 4
  store i32 %23, i32* %18, align 4
  %spi.bis.753 = ptrtoint[4 x i8]* @str.bis.753 to i32
  store i32 %spi.bis.753, i32* %19, align 16
  store i32 134517324, i32* %20, align 4
  %24 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i67.i, i32 inreg noundef %r_edx.013, i32 noundef %tmp2_v7.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %25 = lshr i64 %24, 32
  %26 = trunc i64 %25 to i32
  %27 = load i32, i32* %17, align 4
  %tmp0_v2.i20.i = add i32 %27, 1
  store i32 %tmp0_v2.i20.i, i32* %17, align 4
  %28 = icmp slt i32 %tmp0_v2.i20.i, 6
  br i1 %28, label %BB_8049235.i, label %BB_8049259.i

BB_8049282.i:                                     ; preds = %Func_rotate_right.exit, %BB_8049282.i
  %r_edx.116 = phi i32 [ %r_edx.0.lcssa.i, %Func_rotate_right.exit ], [ %33, %BB_8049282.i ]
  %storemerge215 = phi i32 [ 0, %Func_rotate_right.exit ], [ %tmp0_v2.i.i, %BB_8049282.i ]
  %tmp4_v.i41.i = shl i32 %storemerge215, 2
  %tmp2_v2.i42.i = add i32 %tmp2_v1.i40.i, %tmp4_v.i41.i
  %29 = inttoptr i32 %tmp2_v2.i42.i to i32*
  %30 = load i32, i32* %29, align 4
  store i32 %30, i32* %78, align 4
  %spi.bis.752 = ptrtoint[4 x i8]* @str.bis.752 to i32
  store i32 %spi.bis.752, i32* %79, align 4
  store i32 134517401, i32* %80, align 4
  %31 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.0.lcssa.i, i32 inreg noundef %r_edx.116, i32 noundef %tmp4_v2.i.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %32 = lshr i64 %31, 32
  %33 = trunc i64 %32 to i32
  %34 = load i32, i32* %77, align 4
  %tmp0_v2.i.i = add i32 %34, 1
  store i32 %tmp0_v2.i.i, i32* %77, align 4
  %35 = icmp slt i32 %tmp0_v2.i.i, 6
  br i1 %35, label %BB_8049282.i, label %BB_80492A6.i

BB_8049259.i:                                     ; preds = %BB_8049235.i
  %36 = trunc i64 %25 to i32
  store i32 10, i32* %19, align 16
  store i32 134517347, i32* %20, align 4
  %arg.i.i8 = load i32, i32* %19, align 16
  %37 = tail call i32 @putchar(i32 %arg.i.i8)  nounwind 
  %tmp2_v.i28.i = add i32 %tmp0_v.i68.i, -72
  %38 = inttoptr i32 %tmp2_v.i28.i to i32*
  store i32 2, i32* %38, align 8
  store i32 6, i32* %18, align 4
  store i32 %tmp2_v3.i89.i, i32* %19, align 16
  store i32 134517366, i32* %20, align 4
  %tmp2_v.i8.i.i = add i32 %tmp0_v.i68.i, -88
  %39 = inttoptr i32 %tmp2_v.i8.i.i to i32*
  store i32 %tmp2_v4.i71.i, i32* %39, align 8
  %tmp2_v1.i.i.i = add i32 %tmp0_v.i68.i, -116
  %40 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  %spi.bis.751 = ptrtoint[4 x i8]* @str.bis.751 to i32
  store i32 %spi.bis.751, i32* %40, align 4
  %tmp2_v.i3.i.i = add i32 %tmp0_v.i68.i, -100
  %41 = inttoptr i32 %tmp2_v.i3.i.i to i32*
  store i32 0, i32* %41, align 4
  %42 = load i32, i32* %38, align 8
  %43 = icmp sgt i32 %42, 0
  br i1 %43, label %BB_80492F0.i.lr.ph.i, label %Func_rotate_right.exit

BB_80492F0.i.lr.ph.i:                             ; preds = %BB_8049259.i
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i68.i, -124
  %44 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  %tmp2_v5.i.i.i = add i32 %tmp0_v.i68.i, -128
  %45 = inttoptr i32 %tmp2_v5.i.i.i to i32*
  %tmp2_v6.i.i.i = add i32 %tmp0_v.i68.i, -132
  %46 = inttoptr i32 %tmp2_v6.i.i.i to i32*
  %tmp2_v.i1.i.i.i = add i32 %tmp0_v.i68.i, -136
  %47 = inttoptr i32 %tmp2_v.i1.i.i.i to i32*
  %tmp2_v1.i4.i.i.i = add i32 %tmp0_v.i68.i, -156
  %48 = inttoptr i32 %tmp2_v1.i4.i.i.i to i32*
  %tmp2_v7.i.i.i.i = add i32 %tmp0_v.i68.i, -140
  %49 = inttoptr i32 %tmp2_v7.i.i.i.i to i32*
  %tmp2_v11.i.i.i.i = add i32 %tmp0_v.i68.i, -144
  %50 = inttoptr i32 %tmp2_v11.i.i.i.i to i32*
  br label %BB_80492F0.i.i

BB_80492F0.i.i:                                   ; preds = %Func_rotate_once_right.exit.i, %BB_80492F0.i.lr.ph.i
  %r_ecx.018.i = phi i32 [ %tmp2_v.i67.i, %BB_80492F0.i.lr.ph.i ], [ %r_ecx.0.lcssa.i.i, %Func_rotate_once_right.exit.i ]
  %r_ebp.017.i = phi i32 [ %tmp2_v.i8.i.i, %BB_80492F0.i.lr.ph.i ], [ %70, %Func_rotate_once_right.exit.i ]
  %tmp2_v.i.i.i = add i32 %r_ebp.017.i, 12
  %51 = inttoptr i32 %tmp2_v.i.i.i to i32*
  %52 = load i32, i32* %51, align 4
  store i32 %52, i32* %44, align 4
  %tmp2_v3.i.i.i = add i32 %r_ebp.017.i, 8
  %53 = inttoptr i32 %tmp2_v3.i.i.i to i32*
  %54 = load i32, i32* %53, align 4
  store i32 %54, i32* %45, align 16
  store i32 134517502, i32* %46, align 4
  store i32 %r_ebp.017.i, i32* %47, align 8
  store i32 134517536, i32* %48, align 4
  %55 = load i32, i32* %44, align 4
  %tmp0_v2.i15.i.i.i = shl i32 %55, 2
  %tmp4_v.i16.i.i.i = add i32 %tmp0_v2.i15.i.i.i, -4
  %56 = load i32, i32* %45, align 16
  %tmp0_v5.i18.i.i.i = add i32 %tmp4_v.i16.i.i.i, %56
  %57 = inttoptr i32 %tmp0_v5.i18.i.i.i to i32*
  %58 = load i32, i32* %57, align 4
  store i32 %58, i32* %49, align 4
  %59 = load i32, i32* %44, align 4
  %tmp0_v10.i22.i.i.i = add i32 %59, -2
  store i32 %tmp0_v10.i22.i.i.i, i32* %50, align 16
  %60 = icmp sgt i32 %tmp0_v10.i22.i.i.i, -1
  br i1 %60, label %BB_8049349.i.i.i, label %Func_rotate_once_right.exit.i

BB_8049349.i.i.i:                                 ; preds = %BB_8049349.i.i.i, %BB_80492F0.i.i
  %storemerge8.i.i = phi i32 [ %tmp0_v14.i.i.i.i, %BB_8049349.i.i.i ], [ %tmp0_v10.i22.i.i.i, %BB_80492F0.i.i ]
  %tmp4_v.i.i.i14.i = shl i32 %storemerge8.i.i, 2
  %61 = load i32, i32* %45, align 16
  %tmp0_v3.i.i.i.i = add i32 %61, %tmp4_v.i.i.i14.i
  %tmp4_v7.i.i.i.i = add i32 %tmp4_v.i.i.i14.i, 4
  %tmp0_v10.i.i.i.i = add i32 %tmp4_v7.i.i.i.i, %61
  %62 = inttoptr i32 %tmp0_v3.i.i.i.i to i32*
  %63 = load i32, i32* %62, align 4
  %64 = inttoptr i32 %tmp0_v10.i.i.i.i to i32*
  store i32 %63, i32* %64, align 4
  %65 = load i32, i32* %50, align 16
  %tmp0_v14.i.i.i.i = add i32 %65, -1
  store i32 %tmp0_v14.i.i.i.i, i32* %50, align 16
  %66 = icmp sgt i32 %tmp0_v14.i.i.i.i, -1
  br i1 %66, label %BB_8049349.i.i.i, label %Func_rotate_once_right.exit.i

Func_rotate_once_right.exit.i:                    ; preds = %BB_8049349.i.i.i, %BB_80492F0.i.i
  %r_ecx.0.lcssa.i.i = phi i32 [ %r_ecx.018.i, %BB_80492F0.i.i ], [ %tmp4_v7.i.i.i.i, %BB_8049349.i.i.i ]
  %67 = load i32, i32* %45, align 16
  %68 = load i32, i32* %49, align 4
  %69 = inttoptr i32 %67 to i32*
  store i32 %68, i32* %69, align 4
  %70 = load i32, i32* %47, align 8
  %tmp2_v.i14.i.i = add i32 %70, -12
  %71 = inttoptr i32 %tmp2_v.i14.i.i to i32*
  %72 = load i32, i32* %71, align 4
  %tmp0_v2.i.i.i = add i32 %72, 1
  store i32 %tmp0_v2.i.i.i, i32* %71, align 4
  %tmp2_v1.i22.i.i = add i32 %70, 16
  %73 = inttoptr i32 %tmp2_v1.i22.i.i to i32*
  %74 = load i32, i32* %73, align 4
  %75 = icmp slt i32 %tmp0_v2.i.i.i, %74
  br i1 %75, label %BB_80492F0.i.i, label %.exit.loopexit.i

.exit.loopexit.i:                                 ; preds = %Func_rotate_once_right.exit.i
  %.pre.i = inttoptr i32 %70 to i32*
  br label %Func_rotate_right.exit

Func_rotate_right.exit:                           ; preds = %.exit.loopexit.i, %BB_8049259.i
  %.pre-phi.i = phi i32* [ %.pre.i, %.exit.loopexit.i ], [ %39, %BB_8049259.i ]
  %r_ebp.0.lcssa.i = phi i32 [ %70, %.exit.loopexit.i ], [ %tmp2_v.i8.i.i, %BB_8049259.i ]
  %r_edx.0.lcssa.i = phi i32 [ %68, %.exit.loopexit.i ], [ %36, %BB_8049259.i ]
  %r_ecx.0.lcssa.i = phi i32 [ %r_ecx.0.lcssa.i.i, %.exit.loopexit.i ], [ %tmp2_v.i67.i, %BB_8049259.i ]
  %76 = load i32, i32* %.pre-phi.i, align 4
  %tmp4_v2.i.i.i = add i32 %r_ebp.0.lcssa.i, 8
  %tmp2_v.i36.i = add i32 %76, -40
  %77 = inttoptr i32 %tmp2_v.i36.i to i32*
  %tmp2_v1.i40.i = add i32 %76, -36
  %tmp2_v5.i46.i = add i32 %r_ebp.0.lcssa.i, 12
  %78 = inttoptr i32 %tmp2_v5.i46.i to i32*
  %79 = inttoptr i32 %tmp4_v2.i.i.i to i32*
  %tmp2_v8.i50.i = add i32 %r_ebp.0.lcssa.i, 4
  %80 = inttoptr i32 %tmp2_v8.i50.i to i32*
  store i32 0, i32* %77, align 4
  br label %BB_8049282.i
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

  tail call fastcc void @rotate_array_right755 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack754, i32 0, i32 8092) to i32)) nounwind
