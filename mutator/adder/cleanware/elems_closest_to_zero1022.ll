; Mutation 1022
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack1021 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.1017 = constant [33 x i8] c"\56\61\6c\75\65\32\3a\20\25\64\20\28\6f\63\63\75\72\73\20\61\74\20\69\6e\64\65\78\20\25\64\29\0a\00"
@str.bis.1018 = constant [33 x i8] c"\56\61\6c\75\65\31\3a\20\25\64\20\28\6f\63\63\75\72\73\20\61\74\20\69\6e\64\65\78\20\25\64\29\0a\00"
@str.bis.1019 = constant [13 x i8] c"\4d\69\6e\20\53\75\6d\3a\20\25\64\0a\00"
@str.bis.1020 = constant [4 x i8] c"\05\30\2e\00"

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
define internal fastcc void @elems_closest_to_zero1022(i32 %arg_esp) unnamed_addr  norecurse nounwind  !retregs !12 {
.exit:
  %tmp2_v.i15.i = add i32 %arg_esp, 4
  %tmp0_v.i16.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i17.i = add i32 %tmp0_v.i16.i, -4
  %2 = inttoptr i32 %tmp2_v3.i17.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i.i = add i32 %tmp0_v.i16.i, -8
  %3 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i19.i = add i32 %tmp0_v.i16.i, -12
  %4 = inttoptr i32 %tmp2_v5.i19.i to i32*
  store i32 %tmp2_v.i15.i, i32* %4, align 4
  %tmp2_v7.i20.i = add i32 %tmp0_v.i16.i, -84
  %5 = inttoptr i32 %tmp2_v7.i20.i to i32*
  %spi.bis.1020 = ptrtoint[4 x i8]* @str.bis.1020 to i32
  store i32 %spi.bis.1020, i32* %5, align 4
  %tmp2_v.i2.i = add i32 %arg_esp, 8
  %6 = inttoptr i32 %tmp2_v.i2.i to i32*
  %7 = load i32, i32* %6, align 4
  %tmp2_v2.i5.i = add i32 %tmp0_v.i16.i, -68
  %8 = inttoptr i32 %tmp2_v2.i5.i to i32*
  store i32 %7, i32* %8, align 4
  %tmp4_v.i.i.b = load i1, i1* @segs.0, align 1
  %9 = inttoptr i32 %arg_esp to i32*
  %10 = load i32, i32* %9, align 4
  %tmp2_v5.i.i = add i32 %tmp0_v.i16.i, -20
  %11 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 %10, i32* %11, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i16.i, -60
  %12 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 25, i32* %12, align 4
  %tmp2_v7.i.i = add i32 %tmp0_v.i16.i, -56
  %13 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 42, i32* %13, align 8
  %tmp2_v8.i.i = add i32 %tmp0_v.i16.i, -52
  %14 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 -31, i32* %14, align 4
  %tmp2_v9.i.i = add i32 %tmp0_v.i16.i, -48
  %15 = inttoptr i32 %tmp2_v9.i.i to i32*
  store i32 12, i32* %15, align 16
  %tmp2_v10.i.i = add i32 %tmp0_v.i16.i, -44
  %16 = inttoptr i32 %tmp2_v10.i.i to i32*
  store i32 55, i32* %16, align 4
  %tmp2_v11.i.i = add i32 %tmp0_v.i16.i, -40
  %17 = inttoptr i32 %tmp2_v11.i.i to i32*
  store i32 -20, i32* %17, align 8
  %tmp2_v12.i.i = add i32 %tmp0_v.i16.i, -36
  %18 = inttoptr i32 %tmp2_v12.i.i to i32*
  store i32 -18, i32* %18, align 4
  %tmp2_v13.i.i = add i32 %tmp0_v.i16.i, -32
  %19 = inttoptr i32 %tmp2_v13.i.i to i32*
  store i32 -48, i32* %19, align 16
  %tmp2_v14.i.i = add i32 %tmp0_v.i16.i, -28
  %20 = inttoptr i32 %tmp2_v14.i.i to i32*
  store i32 16, i32* %20, align 4
  %tmp2_v15.i.i = add i32 %tmp0_v.i16.i, -24
  %21 = inttoptr i32 %tmp2_v15.i.i to i32*
  store i32 34, i32* %21, align 8
  %tmp2_v17.i.i = add i32 %tmp0_v.i16.i, -92
  %22 = inttoptr i32 %tmp2_v17.i.i to i32*
  store i32 10, i32* %22, align 4
  %tmp2_v19.i.i = add i32 %tmp0_v.i16.i, -96
  %23 = inttoptr i32 %tmp2_v19.i.i to i32*
  store i32 %tmp2_v6.i.i, i32* %23, align 16
  %tmp2_v20.i.i = add i32 %tmp0_v.i16.i, -100
  %24 = inttoptr i32 %tmp2_v20.i.i to i32*
  store i32 134517308, i32* %24, align 4
  %tmp2_v.i30.i.i = add i32 %tmp0_v.i16.i, -104
  %25 = inttoptr i32 %tmp2_v.i30.i.i to i32*
  store i32 %tmp2_v4.i.i, i32* %25, align 8
  %tmp2_v1.i.i.i = add i32 %tmp0_v.i16.i, -108
  %26 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 0, i32* %26, align 4
  %tmp2_v2.i34.i.i = add i32 %tmp0_v.i16.i, -148
  %27 = inttoptr i32 %tmp2_v2.i34.i.i to i32*
  store i32 134517357, i32* %27, align 4
  %28 = load i32, i32* %23, align 16
  %29 = inttoptr i32 %28 to i32*
  %30 = load i32, i32* %29, align 4
  %tmp0_v4.i77.i.i = add i32 %28, 4
  %31 = inttoptr i32 %tmp0_v4.i77.i.i to i32*
  %32 = load i32, i32* %31, align 4
  %tmp0_v6.i79.i.i = add i32 %32, %30
  %tmp2_v7.i80.i.i = add i32 %tmp0_v.i16.i, -136
  %33 = inttoptr i32 %tmp2_v7.i80.i.i to i32*
  store i32 %tmp0_v6.i79.i.i, i32* %33, align 8
  %tmp2_v8.i.i.i = add i32 %tmp0_v.i16.i, -132
  %34 = inttoptr i32 %tmp2_v8.i.i.i to i32*
  store i32 0, i32* %34, align 4
  %tmp2_v9.i81.i.i = add i32 %tmp0_v.i16.i, -128
  %35 = inttoptr i32 %tmp2_v9.i81.i.i to i32*
  store i32 1, i32* %35, align 16
  %tmp2_v10.i82.i.i = add i32 %tmp0_v.i16.i, -124
  %36 = inttoptr i32 %tmp2_v10.i82.i.i to i32*
  store i32 0, i32* %36, align 4
  %37 = load i32, i32* %22, align 4
  %tmp0_v1.i125.i9.i = add i32 %37, -1
  %38 = icmp sgt i32 %tmp0_v1.i125.i9.i, 0
  br i1 %38, label %BB_80492A6.i.lr.ph.i, label %Func_find_min_sum_pair.exit

BB_80492A6.i.lr.ph.i:                             ; preds = %.exit
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i16.i, -120
  %39 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  %tmp2_v13.i118.i.i = add i32 %tmp0_v.i16.i, -116
  %40 = inttoptr i32 %tmp2_v13.i118.i.i to i32*
  br label %BB_80492A6.i.i

BB_80492A6.i.i:                                   ; preds = %BB_8049316.i.i, %BB_80492A6.i.lr.ph.i
  %storemerge2.in5.i = phi i32 [ 0, %BB_80492A6.i.lr.ph.i ], [ %tmp0_v1.i15.i.i, %BB_8049316.i.i ]
  %r_edx.111.i = phi i32 [ %30, %BB_80492A6.i.lr.ph.i ], [ %r_edx.0.lcssa.i, %BB_8049316.i.i ]
  %r_ecx.110.i = phi i32 [ %tmp2_v.i15.i, %BB_80492A6.i.lr.ph.i ], [ %r_ecx.0.lcssa.i, %BB_8049316.i.i ]
  %storemerge26.i = add nsw i32 %storemerge2.in5.i, 1
  store i32 %storemerge26.i, i32* %39, align 8
  %41 = load i32, i32* %22, align 4
  %42 = icmp slt i32 %storemerge26.i, %41
  br i1 %42, label %BB_80492B1.i.i, label %BB_8049316.i.i

BB_804930A.i.i:                                   ; preds = %BB_80492B1.i.i, %BB_80492F8.i.i
  %storemerge2.in.i = load i32, i32* %39, align 8
  %storemerge2.i = add i32 %storemerge2.in.i, 1
  store i32 %storemerge2.i, i32* %39, align 8
  %43 = load i32, i32* %22, align 4
  %44 = icmp slt i32 %storemerge2.i, %43
  br i1 %44, label %BB_80492B1.i.i, label %BB_8049316.i.i

BB_8049316.i.i:                                   ; preds = %BB_804930A.i.i, %BB_80492A6.i.i
  %r_ecx.0.lcssa.i = phi i32 [ %r_ecx.110.i, %BB_80492A6.i.i ], [ %tmp0_v23.i.i.i, %BB_804930A.i.i ]
  %r_edx.0.lcssa.i = phi i32 [ %r_edx.111.i, %BB_80492A6.i.i ], [ %56, %BB_804930A.i.i ]
  %45 = load i32, i32* %36, align 4
  %tmp0_v1.i15.i.i = add i32 %45, 1
  store i32 %tmp0_v1.i15.i.i, i32* %36, align 4
  %46 = load i32, i32* %22, align 4
  %tmp0_v1.i125.i.i = add i32 %46, -1
  %47 = icmp slt i32 %tmp0_v1.i15.i.i, %tmp0_v1.i125.i.i
  br i1 %47, label %BB_80492A6.i.i, label %Func_find_min_sum_pair.exit

BB_80492F8.i.i:                                   ; preds = %BB_80492B1.i.i
  store i32 %tmp0_v12.i117.i.i, i32* %33, align 8
  %48 = load i32, i32* %36, align 4
  store i32 %48, i32* %34, align 4
  %49 = load i32, i32* %39, align 8
  store i32 %49, i32* %35, align 16
  br label %BB_804930A.i.i

BB_80492B1.i.i:                                   ; preds = %BB_804930A.i.i, %BB_80492A6.i.i
  %storemerge27.i = phi i32 [ %storemerge2.i, %BB_804930A.i.i ], [ %storemerge26.i, %BB_80492A6.i.i ]
  %50 = load i32, i32* %36, align 4
  %tmp4_v.i107.i.i = shl i32 %50, 2
  %51 = load i32, i32* %23, align 16
  %tmp0_v3.i110.i.i = add i32 %51, %tmp4_v.i107.i.i
  %52 = inttoptr i32 %tmp0_v3.i110.i.i to i32*
  %53 = load i32, i32* %52, align 4
  %tmp4_v7.i.i.i = shl i32 %storemerge27.i, 2
  %tmp0_v10.i116.i.i = add i32 %51, %tmp4_v7.i.i.i
  %54 = inttoptr i32 %tmp0_v10.i116.i.i to i32*
  %55 = load i32, i32* %54, align 4
  %tmp0_v12.i117.i.i = add i32 %55, %53
  store i32 %tmp0_v12.i117.i.i, i32* %40, align 4
  %56 = tail call i32 @llvm.abs.i32(i32 %tmp0_v12.i117.i.i, i1 false)  nounwind 
  %57 = load i32, i32* %33, align 8
  %tmp0_v23.i.i.i = ashr i32 %57, 31
  %tmp0_v26.i.i.i = xor i32 %tmp0_v23.i.i.i, %57
  %tmp0_v27.i.i.i = sub i32 %tmp0_v26.i.i.i, %tmp0_v23.i.i.i
  %.not.i.i.i = icmp slt i32 %56, %tmp0_v27.i.i.i
  br i1 %.not.i.i.i, label %BB_80492F8.i.i, label %BB_804930A.i.i

Func_find_min_sum_pair.exit:                      ; preds = %BB_8049316.i.i, %.exit
  %r_ecx.1.lcssa.i = phi i32 [ %tmp2_v.i15.i, %.exit ], [ %r_ecx.0.lcssa.i, %BB_8049316.i.i ]
  %r_edx.1.lcssa.i = phi i32 [ %30, %.exit ], [ %r_edx.0.lcssa.i, %BB_8049316.i.i ]
  %58 = load i32, i32* %33, align 8
  %tmp2_v2.i40.i.i = add i32 %tmp0_v.i16.i, -156
  %59 = inttoptr i32 %tmp2_v2.i40.i.i to i32*
  store i32 %58, i32* %59, align 4
  %tmp2_v4.i42.i.i = add i32 %tmp0_v.i16.i, -160
  %60 = inttoptr i32 %tmp2_v4.i42.i.i to i32*
  %spi.bis.1019 = ptrtoint[13 x i8]* @str.bis.1019 to i32
  store i32 %spi.bis.1019, i32* %60, align 16
  %tmp2_v5.i43.i.i = add i32 %tmp0_v.i16.i, -164
  %61 = inttoptr i32 %tmp2_v5.i43.i.i to i32*
  store i32 134517559, i32* %61, align 4
  %62 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.1.lcssa.i, i32 inreg noundef %r_edx.1.lcssa.i, i32 noundef %tmp2_v4.i42.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %63 = load i32, i32* %34, align 4
  %tmp4_v.i.i.i2 = shl i32 %63, 2
  %64 = load i32, i32* %23, align 16
  %tmp0_v4.i26.i.i = add i32 %64, %tmp4_v.i.i.i2
  %65 = inttoptr i32 %tmp0_v4.i26.i.i to i32*
  %66 = load i32, i32* %65, align 4
  %tmp2_v9.i.i.i = add i32 %tmp0_v.i16.i, -152
  %67 = inttoptr i32 %tmp2_v9.i.i.i to i32*
  store i32 %63, i32* %67, align 8
  store i32 %66, i32* %59, align 4
  %spi.bis.1018 = ptrtoint[33 x i8]* @str.bis.1018 to i32
  store i32 %spi.bis.1018, i32* %60, align 16
  store i32 134517598, i32* %61, align 4
  %68 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.1.lcssa.i, i32 inreg noundef %tmp4_v.i.i.i2, i32 noundef %tmp2_v4.i42.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %69 = load i32, i32* %35, align 16
  %tmp4_v.i49.i.i = shl i32 %69, 2
  %70 = load i32, i32* %23, align 16
  %tmp0_v4.i52.i.i = add i32 %70, %tmp4_v.i49.i.i
  %71 = inttoptr i32 %tmp0_v4.i52.i.i to i32*
  %72 = load i32, i32* %71, align 4
  store i32 %69, i32* %67, align 8
  store i32 %72, i32* %59, align 4
  %spi.bis.1017 = ptrtoint[33 x i8]* @str.bis.1017 to i32
  store i32 %spi.bis.1017, i32* %60, align 16
  store i32 134517637, i32* %61, align 4
  %73 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.1.lcssa.i, i32 inreg noundef %tmp4_v.i49.i.i, i32 noundef %tmp2_v4.i42.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  ret void
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg)  nofree nosync nounwind readnone speculatable willreturn 


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

  tail call fastcc void @elems_closest_to_zero1022 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack1021, i32 0, i32 8092) to i32)) nounwind
