; Mutation 392
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack391 = internal global [8092 x i32] zeroinitializer, align 16
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
declare i32 @strlen(i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @palindrome392(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
Func_804926F.exit.i:
  %tmp2_v.i33.i = add i32 %arg_esp, 4
  %tmp0_v.i34.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i36.i = add i32 %tmp0_v.i34.i, -4
  %2 = inttoptr i32 %tmp2_v3.i36.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i37.i = add i32 %tmp0_v.i34.i, -8
  %3 = inttoptr i32 %tmp2_v4.i37.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i39.i = add i32 %tmp0_v.i34.i, -12
  %4 = inttoptr i32 %tmp2_v5.i39.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i41.i = add i32 %tmp0_v.i34.i, -16
  %5 = inttoptr i32 %tmp2_v6.i41.i to i32*
  store i32 %tmp2_v.i33.i, i32* %5, align 16
  %tmp2_v8.i42.i = add i32 %tmp0_v.i34.i, -68
  %6 = inttoptr i32 %tmp2_v8.i42.i to i32*
  store i32 134517265, i32* %6, align 4
  %tmp4_v.i.i.b = load i1, i1* @segs.0, align 1
  %7 = inttoptr i32 %arg_esp to i32*
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i7.i = add i32 %tmp0_v.i34.i, -20
  %9 = inttoptr i32 %tmp2_v2.i7.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp2_v3.i8.i = add i32 %tmp0_v.i34.i, -38
  %10 = inttoptr i32 %tmp2_v3.i8.i to i32*
  store i32 544501614, i32* %10, align 4
  %tmp2_v4.i9.i = add i32 %tmp0_v.i34.i, -34
  %11 = inttoptr i32 %tmp2_v4.i9.i to i32*
  store i32 1634738273, i32* %11, align 4
  %tmp2_v5.i.i = add i32 %tmp0_v.i34.i, -30
  %12 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 1684957548, i32* %12, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i34.i, -26
  %13 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 1701670770, i32* %13, align 4
  %tmp2_v7.i.i = add i32 %tmp0_v.i34.i, -22
  %14 = inttoptr i32 %tmp2_v7.i.i to i16*
  store i16 33, i16* %14, align 2
  %tmp2_v8.i.i = add i32 %tmp0_v.i34.i, -53
  %15 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 1667457633, i32* %15, align 4
  %tmp2_v9.i.i = add i32 %tmp0_v.i34.i, -49
  %16 = inttoptr i32 %tmp2_v9.i.i to i16*
  store i16 24930, i16* %16, align 2
  %tmp2_v10.i.i = add i32 %tmp0_v.i34.i, -47
  %17 = inttoptr i32 %tmp2_v10.i.i to i8*
  store i8 0, i8* %17, align 1
  %tmp2_v11.i.i = add i32 %tmp0_v.i34.i, -46
  %18 = inttoptr i32 %tmp2_v11.i.i to i32*
  store i32 1684234849, i32* %18, align 4
  %tmp2_v12.i.i = add i32 %tmp0_v.i34.i, -42
  %19 = inttoptr i32 %tmp2_v12.i.i to i32*
  store i32 6382179, i32* %19, align 4
  %tmp2_v15.i.i = add i32 %tmp0_v.i34.i, -80
  %20 = inttoptr i32 %tmp2_v15.i.i to i32*
  store i32 %tmp2_v3.i8.i, i32* %20, align 16
  %tmp2_v16.i.i = add i32 %tmp0_v.i34.i, -84
  %21 = inttoptr i32 %tmp2_v16.i.i to i32*
  store i32 134517359, i32* %21, align 4
  %tmp2_v.i13.i.i = add i32 %tmp0_v.i34.i, -88
  %22 = inttoptr i32 %tmp2_v.i13.i.i to i32*
  store i32 %tmp2_v4.i37.i, i32* %22, align 8
  %tmp2_v1.i15.i.i = add i32 %tmp0_v.i34.i, -92
  %23 = inttoptr i32 %tmp2_v1.i15.i.i to i32*
  store i32 134529024, i32* %23, align 4
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i34.i, -116
  %24 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  store i32 134517616, i32* %24, align 4
  %25 = load i32, i32* %20, align 16
  %tmp2_v3.i.i.i = add i32 %tmp0_v.i34.i, -128
  %26 = inttoptr i32 %tmp2_v3.i.i.i to i32*
  store i32 %25, i32* %26, align 16
  %tmp2_v4.i.i.i = add i32 %tmp0_v.i34.i, -132
  %27 = inttoptr i32 %tmp2_v4.i.i.i to i32*
  store i32 134517634, i32* %27, align 4
  %arg.i.i.i = load i32, i32* %26, align 16
  %28 = tail call i32 @strlen(i32 %arg.i.i.i)
  %tmp2_v.i4.i.i = add i32 %tmp0_v.i34.i, -104
  %29 = inttoptr i32 %tmp2_v.i4.i.i to i32*
  store i32 %28, i32* %29, align 8
  %tmp0_v3.i.i.i = lshr i32 %28, 31
  %tmp0_v4.i.i.i = add i32 %tmp0_v3.i.i.i, %28
  %tmp0_v5.i.i.i = ashr i32 %tmp0_v4.i.i.i, 1
  %tmp2_v6.i.i.i = add i32 %tmp0_v.i34.i, -100
  %30 = inttoptr i32 %tmp2_v6.i.i.i to i32*
  store i32 %tmp0_v5.i.i.i, i32* %30, align 4
  %tmp2_v7.i.i.i = add i32 %tmp0_v.i34.i, -108
  %31 = inttoptr i32 %tmp2_v7.i.i.i to i32*
  store i32 0, i32* %31, align 4
  %32 = load i32, i32* %30, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %BB_80493A0.i.i, label %Func_is_palindrome.exit

BB_80493CB.i.i:                                   ; preds = %BB_80493A0.i.i
  store i32 %tmp0_v1.i24.i.i, i32* %31, align 4
  %34 = load i32, i32* %30, align 4
  %35 = icmp slt i32 %tmp0_v1.i24.i.i, %34
  br i1 %35, label %BB_80493A0.i.i, label %Func_is_palindrome.exit

BB_80493A0.i.i:                                   ; preds = %BB_80493CB.i.i, %Func_804926F.exit.i
  %storemerge19.i = phi i32 [ %tmp0_v1.i24.i.i, %BB_80493CB.i.i ], [ 0, %Func_804926F.exit.i ]
  %36 = load i32, i32* %20, align 16
  %tmp0_v3.i36.i.i = add i32 %36, %storemerge19.i
  %37 = inttoptr i32 %tmp0_v3.i36.i.i to i8*
  %38 = load i8, i8* %37, align 1
  %tmp0_v4.i37.i.i = zext i8 %38 to i32
  %39 = load i32, i32* %29, align 8
  %40 = xor i32 %storemerge19.i, -1
  %tmp2_v9.i.i.i = add i32 %39, %40
  %tmp0_v12.i.i.i = add i32 %tmp2_v9.i.i.i, %36
  %41 = inttoptr i32 %tmp0_v12.i.i.i to i8*
  %42 = load i8, i8* %41, align 1
  %tmp0_v13.i.i.i = zext i8 %42 to i32
  %cc_dst_v.i40.i.i = sub nsw i32 %tmp0_v4.i37.i.i, %tmp0_v13.i.i.i
  %tmp4_v.i41.i.i = and i32 %cc_dst_v.i40.i.i, 255
  %43 = icmp eq i32 %tmp4_v.i41.i.i, 0
  %tmp0_v1.i24.i.i = add nuw nsw i32 %storemerge19.i, 1
  br i1 %43, label %BB_80493CB.i.i, label %Func_is_palindrome.exit

Func_is_palindrome.exit:                          ; preds = %BB_80493A0.i.i, %BB_80493CB.i.i, %Func_804926F.exit.i
  %r_ecx.1.i = phi i32 [ %tmp2_v.i33.i, %Func_804926F.exit.i ], [ %tmp2_v9.i.i.i, %BB_80493A0.i.i ], [ %tmp2_v9.i.i.i, %BB_80493CB.i.i ]
  %r_edx.1.i = phi i32 [ %tmp0_v3.i.i.i, %Func_804926F.exit.i ], [ %tmp0_v4.i37.i.i, %BB_80493A0.i.i ], [ %tmp0_v4.i37.i.i, %BB_80493CB.i.i ]
  %44 = load i32, i32* %23, align 4
  %45 = load i32, i32* %22, align 8
  %tmp2_v.i59.i = add i32 %45, -30
  %tmp2_v1.i60.i = add i32 %tmp0_v.i34.i, -76
  %46 = inttoptr i32 %tmp2_v1.i60.i to i32*
  store i32 %tmp2_v.i59.i, i32* %46, align 4
  %tmp2_v2.i62.i = add i32 %44, -8162
  store i32 %tmp2_v2.i62.i, i32* %20, align 16
  store i32 134517409, i32* %21, align 4
  %47 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.1.i, i32 inreg noundef %r_edx.1.i, i32 noundef %tmp2_v15.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  store i32 10, i32* %20, align 16
  store i32 134517422, i32* %21, align 4
  %arg.i.i = load i32, i32* %20, align 16
  %48 = tail call i32 @putchar(i32 %arg.i.i)  nounwind 
  %tmp2_v.i85.i = add i32 %45, -45
  store i32 %tmp2_v.i85.i, i32* %20, align 16
  store i32 134517437, i32* %21, align 4
  store i32 %45, i32* %22, align 8
  store i32 %44, i32* %23, align 4
  store i32 134517616, i32* %24, align 4
  %49 = load i32, i32* %20, align 16
  store i32 %49, i32* %26, align 16
  store i32 134517634, i32* %27, align 4
  %arg.i.i.i10 = load i32, i32* %26, align 16
  %50 = tail call i32 @strlen(i32 %arg.i.i.i10)
  store i32 %50, i32* %29, align 8
  %tmp0_v3.i.i.i12 = lshr i32 %50, 31
  %tmp0_v4.i.i.i13 = add i32 %tmp0_v3.i.i.i12, %50
  %tmp0_v5.i.i.i14 = ashr i32 %tmp0_v4.i.i.i13, 1
  store i32 %tmp0_v5.i.i.i14, i32* %30, align 4
  store i32 0, i32* %31, align 4
  %51 = load i32, i32* %30, align 4
  %52 = icmp sgt i32 %51, 0
  br i1 %52, label %BB_80493A0.i.i27, label %Func_is_palindrome.exit36

BB_80493CB.i.i17:                                 ; preds = %BB_80493A0.i.i27
  store i32 %tmp0_v1.i24.i.i26, i32* %31, align 4
  %53 = load i32, i32* %30, align 4
  %54 = icmp slt i32 %tmp0_v1.i24.i.i26, %53
  br i1 %54, label %BB_80493A0.i.i27, label %Func_is_palindrome.exit36

BB_80493A0.i.i27:                                 ; preds = %BB_80493CB.i.i17, %Func_is_palindrome.exit
  %storemerge19.i18 = phi i32 [ %tmp0_v1.i24.i.i26, %BB_80493CB.i.i17 ], [ 0, %Func_is_palindrome.exit ]
  %55 = load i32, i32* %20, align 16
  %tmp0_v3.i36.i.i19 = add i32 %55, %storemerge19.i18
  %56 = inttoptr i32 %tmp0_v3.i36.i.i19 to i8*
  %57 = load i8, i8* %56, align 1
  %tmp0_v4.i37.i.i20 = zext i8 %57 to i32
  %58 = load i32, i32* %29, align 8
  %59 = xor i32 %storemerge19.i18, -1
  %tmp2_v9.i.i.i21 = add i32 %58, %59
  %tmp0_v12.i.i.i22 = add i32 %tmp2_v9.i.i.i21, %55
  %60 = inttoptr i32 %tmp0_v12.i.i.i22 to i8*
  %61 = load i8, i8* %60, align 1
  %tmp0_v13.i.i.i23 = zext i8 %61 to i32
  %cc_dst_v.i40.i.i24 = sub nsw i32 %tmp0_v4.i37.i.i20, %tmp0_v13.i.i.i23
  %tmp4_v.i41.i.i25 = and i32 %cc_dst_v.i40.i.i24, 255
  %62 = icmp eq i32 %tmp4_v.i41.i.i25, 0
  %tmp0_v1.i24.i.i26 = add nuw nsw i32 %storemerge19.i18, 1
  br i1 %62, label %BB_80493CB.i.i17, label %Func_is_palindrome.exit36

Func_is_palindrome.exit36:                        ; preds = %BB_80493A0.i.i27, %BB_80493CB.i.i17, %Func_is_palindrome.exit
  %r_ecx.1.i28 = phi i32 [ %r_ecx.1.i, %Func_is_palindrome.exit ], [ %tmp2_v9.i.i.i21, %BB_80493A0.i.i27 ], [ %tmp2_v9.i.i.i21, %BB_80493CB.i.i17 ]
  %r_edx.1.i30 = phi i32 [ %tmp0_v3.i.i.i12, %Func_is_palindrome.exit ], [ %tmp0_v4.i37.i.i20, %BB_80493A0.i.i27 ], [ %tmp0_v4.i37.i.i20, %BB_80493CB.i.i17 ]
  %63 = load i32, i32* %23, align 4
  %64 = load i32, i32* %22, align 8
  %tmp2_v.i.i = add i32 %64, -45
  store i32 %tmp2_v.i.i, i32* %46, align 4
  %tmp2_v2.i.i = add i32 %63, -8184
  store i32 %tmp2_v2.i.i, i32* %20, align 16
  store i32 134517463, i32* %21, align 4
  %65 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.1.i28, i32 inreg noundef %r_edx.1.i30, i32 noundef %tmp2_v15.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  store i32 10, i32* %20, align 16
  store i32 134517500, i32* %21, align 4
  %arg.i.i37 = load i32, i32* %20, align 16
  %66 = tail call i32 @putchar(i32 %arg.i.i37)  nounwind 
  %tmp2_v.i17.i = add i32 %64, -38
  store i32 %tmp2_v.i17.i, i32* %20, align 16
  store i32 134517515, i32* %21, align 4
  store i32 %64, i32* %22, align 8
  store i32 %63, i32* %23, align 4
  store i32 134517616, i32* %24, align 4
  %67 = load i32, i32* %20, align 16
  store i32 %67, i32* %26, align 16
  store i32 134517634, i32* %27, align 4
  %arg.i.i.i43 = load i32, i32* %26, align 16
  %68 = tail call i32 @strlen(i32 %arg.i.i.i43)
  store i32 %68, i32* %29, align 8
  %tmp0_v3.i.i.i45 = lshr i32 %68, 31
  %tmp0_v4.i.i.i46 = add i32 %tmp0_v3.i.i.i45, %68
  %tmp0_v5.i.i.i47 = ashr i32 %tmp0_v4.i.i.i46, 1
  store i32 %tmp0_v5.i.i.i47, i32* %30, align 4
  store i32 0, i32* %31, align 4
  %69 = load i32, i32* %30, align 4
  %70 = icmp sgt i32 %69, 0
  br i1 %70, label %BB_80493A0.i.i60, label %Func_is_palindrome.exit69

BB_80493CB.i.i50:                                 ; preds = %BB_80493A0.i.i60
  store i32 %tmp0_v1.i24.i.i59, i32* %31, align 4
  %71 = load i32, i32* %30, align 4
  %72 = icmp slt i32 %tmp0_v1.i24.i.i59, %71
  br i1 %72, label %BB_80493A0.i.i60, label %Func_is_palindrome.exit69

BB_80493A0.i.i60:                                 ; preds = %BB_80493CB.i.i50, %Func_is_palindrome.exit36
  %storemerge19.i51 = phi i32 [ %tmp0_v1.i24.i.i59, %BB_80493CB.i.i50 ], [ 0, %Func_is_palindrome.exit36 ]
  %73 = load i32, i32* %20, align 16
  %tmp0_v3.i36.i.i52 = add i32 %73, %storemerge19.i51
  %74 = inttoptr i32 %tmp0_v3.i36.i.i52 to i8*
  %75 = load i8, i8* %74, align 1
  %tmp0_v4.i37.i.i53 = zext i8 %75 to i32
  %76 = load i32, i32* %29, align 8
  %77 = xor i32 %storemerge19.i51, -1
  %tmp2_v9.i.i.i54 = add i32 %76, %77
  %tmp0_v12.i.i.i55 = add i32 %tmp2_v9.i.i.i54, %73
  %78 = inttoptr i32 %tmp0_v12.i.i.i55 to i8*
  %79 = load i8, i8* %78, align 1
  %tmp0_v13.i.i.i56 = zext i8 %79 to i32
  %cc_dst_v.i40.i.i57 = sub nsw i32 %tmp0_v4.i37.i.i53, %tmp0_v13.i.i.i56
  %tmp4_v.i41.i.i58 = and i32 %cc_dst_v.i40.i.i57, 255
  %80 = icmp eq i32 %tmp4_v.i41.i.i58, 0
  %tmp0_v1.i24.i.i59 = add nuw nsw i32 %storemerge19.i51, 1
  br i1 %80, label %BB_80493CB.i.i50, label %Func_is_palindrome.exit69

Func_is_palindrome.exit69:                        ; preds = %BB_80493A0.i.i60, %BB_80493CB.i.i50, %Func_is_palindrome.exit36
  %r_ecx.1.i61 = phi i32 [ %r_ecx.1.i28, %Func_is_palindrome.exit36 ], [ %tmp2_v9.i.i.i54, %BB_80493A0.i.i60 ], [ %tmp2_v9.i.i.i54, %BB_80493CB.i.i50 ]
  %r_edx.1.i63 = phi i32 [ %tmp0_v3.i.i.i45, %Func_is_palindrome.exit36 ], [ %tmp0_v4.i37.i.i53, %BB_80493A0.i.i60 ], [ %tmp0_v4.i37.i.i53, %BB_80493CB.i.i50 ]
  %81 = load i32, i32* %23, align 4
  %82 = load i32, i32* %22, align 8
  %tmp2_v.i50.i = add i32 %82, -38
  store i32 %tmp2_v.i50.i, i32* %46, align 4
  %tmp2_v2.i53.i = add i32 %81, -8184
  store i32 %tmp2_v2.i53.i, i32* %20, align 16
  store i32 134517541, i32* %21, align 4
  %83 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.1.i61, i32 inreg noundef %r_edx.1.i63, i32 noundef %tmp2_v15.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
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

  tail call fastcc void @palindrome392 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack391, i32 0, i32 8092) to i32)) nounwind
