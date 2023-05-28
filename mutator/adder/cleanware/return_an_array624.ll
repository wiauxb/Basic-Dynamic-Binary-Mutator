; Mutation 624
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack623 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.621 = constant [4 x i8] c"\05\66\2d\00"
@str.bis.622 = constant [16 x i8] c"\61\72\72\61\79\5b\25\64\5d\20\3d\20\25\64\0a\00"

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

; Function Attrs: noinline
declare i32 @malloc(i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare void @free(i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @return_an_array624(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
  %tmp2_v.i37.i = add i32 %arg_esp, 4
  %tmp0_v.i38.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i40.i = add i32 %tmp0_v.i38.i, -4
  %3 = inttoptr i32 %tmp2_v3.i40.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i.i = add i32 %tmp0_v.i38.i, -8
  %4 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i.i = add i32 %tmp0_v.i38.i, -12
  %5 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i38.i, -16
  %6 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i37.i, i32* %6, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i38.i, -68
  %7 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517474, i32* %7, align 4
  %tmp4_v.i92.i.b = load i1, i1* @segs.0, align 1
  %8 = inttoptr i32 %arg_esp to i32*
  %9 = load i32, i32* %8, align 4
  %tmp2_v2.i96.i = add i32 %tmp0_v.i38.i, -20
  %10 = inttoptr i32 %tmp2_v2.i96.i to i32*
  store i32 %9, i32* %10, align 4
  %tmp2_v3.i97.i = add i32 %tmp0_v.i38.i, -40
  %11 = inttoptr i32 %tmp2_v3.i97.i to i32*
  store i32 1, i32* %11, align 8
  %tmp2_v4.i98.i = add i32 %tmp0_v.i38.i, -36
  %12 = inttoptr i32 %tmp2_v4.i98.i to i32*
  store i32 2, i32* %12, align 4
  %tmp2_v5.i99.i = add i32 %tmp0_v.i38.i, -32
  %13 = inttoptr i32 %tmp2_v5.i99.i to i32*
  store i32 3, i32* %13, align 16
  %tmp2_v6.i100.i = add i32 %tmp0_v.i38.i, -28
  %14 = inttoptr i32 %tmp2_v6.i100.i to i32*
  store i32 4, i32* %14, align 4
  %tmp2_v7.i101.i = add i32 %tmp0_v.i38.i, -24
  %15 = inttoptr i32 %tmp2_v7.i101.i to i32*
  store i32 5, i32* %15, align 8
  store i32 %tmp2_v3.i97.i, i32* %7, align 4
  %tmp2_v10.i105.i = add i32 %tmp0_v.i38.i, -72
  %16 = inttoptr i32 %tmp2_v10.i105.i to i32*
  store i32 4, i32* %16, align 8
  %tmp2_v11.i106.i = add i32 %tmp0_v.i38.i, -76
  %17 = inttoptr i32 %tmp2_v11.i106.i to i32*
  store i32 134517537, i32* %17, align 4
  %tmp2_v.i6.i.i = add i32 %tmp0_v.i38.i, -80
  %18 = inttoptr i32 %tmp2_v.i6.i.i to i32*
  store i32 %tmp2_v4.i.i, i32* %18, align 16
  %tmp2_v1.i.i.i = add i32 %tmp0_v.i38.i, -100
  %19 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 134517253, i32* %19, align 4
  %tmp2_v.i.i.i = add i32 %tmp0_v.i38.i, -84
  %20 = inttoptr i32 %tmp2_v.i.i.i to i32*
  store i32 0, i32* %20, align 4
  br label %BB_8049213.i.i

BB_8049213.i.i:                                   ; preds = %BB_8049213.i.i, %0
  %storemerge5.i = phi i32 [ 0, %0 ], [ %tmp0_v8.i.i.i, %BB_8049213.i.i ]
  %tmp4_v.i12.i.i = shl i32 %storemerge5.i, 2
  %21 = load i32, i32* %7, align 4
  %tmp0_v3.i.i.i = add i32 %21, %tmp4_v.i12.i.i
  %22 = load i32, i32* %16, align 8
  %23 = inttoptr i32 %tmp0_v3.i.i.i to i32*
  store i32 %22, i32* %23, align 4
  %24 = load i32, i32* %20, align 4
  %tmp0_v8.i.i.i = add i32 %24, 1
  store i32 %tmp0_v8.i.i.i, i32* %20, align 4
  %25 = icmp slt i32 %tmp0_v8.i.i.i, 5
  br i1 %25, label %BB_8049213.i.i, label %Func_set_array1.exit

Func_set_array1.exit:                             ; preds = %BB_8049213.i.i
  %26 = load i32, i32* %18, align 16
  %tmp2_v.i7.i = add i32 %26, -52
  %27 = inttoptr i32 %tmp2_v.i7.i to i32*
  %tmp2_v1.i49.i = add i32 %26, -32
  store i32 0, i32* %27, align 4
  br label %BB_804932D.i

BB_8049354.i:                                     ; preds = %BB_804932D.i
  store i32 4, i32* %18, align 16
  store i32 134517598, i32* %20, align 4
  %tmp2_v.i4.i.i = add i32 %tmp0_v.i38.i, -88
  %28 = inttoptr i32 %tmp2_v.i4.i.i to i32*
  store i32 %26, i32* %28, align 8
  %tmp2_v1.i.i.i12 = add i32 %tmp0_v.i38.i, -92
  %29 = inttoptr i32 %tmp2_v1.i.i.i12 to i32*
  store i32 134529024, i32* %29, align 4
  %tmp2_v2.i7.i.i = add i32 %tmp0_v.i38.i, -116
  %30 = inttoptr i32 %tmp2_v2.i7.i.i to i32*
  store i32 134517317, i32* %30, align 4
  %tmp2_v.i2.i.i = add i32 %tmp0_v.i38.i, -128
  %31 = inttoptr i32 %tmp2_v.i2.i.i to i32*
  store i32 20, i32* %31, align 16
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i38.i, -132
  %32 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  store i32 134517334, i32* %32, align 4
  %arg.i.i.i = load i32, i32* %31, align 16
  %33 = tail call i32 @malloc(i32 %arg.i.i.i)
  store i32 %33, i32* %19, align 4
  %tmp2_v1.i13.i.i13 = add i32 %tmp0_v.i38.i, -104
  %34 = inttoptr i32 %tmp2_v1.i13.i.i13 to i32*
  store i32 0, i32* %34, align 8
  br label %BB_8049265.i.i

BB_8049265.i.i:                                   ; preds = %BB_8049265.i.i, %BB_8049354.i
  %storemerge14.i = phi i32 [ 0, %BB_8049354.i ], [ %tmp0_v8.i.i.i15, %BB_8049265.i.i ]
  %tmp4_v.i21.i.i = shl i32 %storemerge14.i, 2
  %35 = load i32, i32* %19, align 4
  %tmp0_v3.i24.i.i = add i32 %35, %tmp4_v.i21.i.i
  %36 = load i32, i32* %18, align 16
  %37 = inttoptr i32 %tmp0_v3.i24.i.i to i32*
  store i32 %36, i32* %37, align 4
  %38 = load i32, i32* %34, align 8
  %tmp0_v8.i.i.i15 = add i32 %38, 1
  store i32 %tmp0_v8.i.i.i15, i32* %34, align 8
  %39 = icmp slt i32 %tmp0_v8.i.i.i15, 5
  br i1 %39, label %BB_8049265.i.i, label %Func_set_array2.exit

Func_set_array2.exit:                             ; preds = %BB_8049265.i.i
  %40 = load i32, i32* %19, align 4
  %41 = load i32, i32* %29, align 4
  %42 = load i32, i32* %28, align 8
  %tmp2_v.i28.i = add i32 %42, -40
  %43 = inttoptr i32 %tmp2_v.i28.i to i32*
  store i32 %40, i32* %43, align 4
  %tmp2_v1.i30.i = add i32 %42, -48
  %44 = inttoptr i32 %tmp2_v1.i30.i to i32*
  %tmp2_v10.i122.i = add i32 %41, -8168
  store i32 0, i32* %44, align 4
  br label %BB_804936D.i

BB_804932D.i:                                     ; preds = %BB_804932D.i, %Func_set_array1.exit
  %r_edx.033 = phi i32 [ %tmp0_v3.i.i.i, %Func_set_array1.exit ], [ %50, %BB_804932D.i ]
  %storemerge32 = phi i32 [ 0, %Func_set_array1.exit ], [ %tmp0_v2.i85.i, %BB_804932D.i ]
  %tmp4_v.i50.i = shl i32 %storemerge32, 2
  %tmp2_v2.i.i = add i32 %tmp2_v1.i49.i, %tmp4_v.i50.i
  %45 = inttoptr i32 %tmp2_v2.i.i to i32*
  %46 = load i32, i32* %45, align 4
  store i32 %46, i32* %16, align 8
  %47 = load i32, i32* %27, align 4
  store i32 %47, i32* %17, align 4
  %spi.bis.622 = ptrtoint[16 x i8]* @str.bis.622 to i32
  store i32 %spi.bis.622, i32* %18, align 16
  store i32 134517575, i32* %20, align 4
  %48 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i37.i, i32 inreg noundef %r_edx.033, i32 noundef %tmp2_v.i6.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %49 = lshr i64 %48, 32
  %50 = trunc i64 %49 to i32
  %51 = load i32, i32* %27, align 4
  %tmp0_v2.i85.i = add i32 %51, 1
  store i32 %tmp0_v2.i85.i, i32* %27, align 4
  %52 = icmp slt i32 %tmp0_v2.i85.i, 5
  br i1 %52, label %BB_804932D.i, label %BB_8049354.i

BB_80493C5.i:                                     ; preds = %Func_set_array3.exit, %BB_80493C5.i
  %storemerge935 = phi i32 [ 0, %Func_set_array3.exit ], [ %tmp0_v2.i134.i, %BB_80493C5.i ]
  %tmp4_v.i68.i = shl i32 %storemerge935, 2
  %53 = load i32, i32* %74, align 4
  %tmp0_v3.i71.i = add i32 %53, %tmp4_v.i68.i
  %54 = inttoptr i32 %tmp0_v3.i71.i to i32*
  %55 = load i32, i32* %54, align 4
  store i32 %55, i32* %16, align 8
  %56 = load i32, i32* %75, align 4
  store i32 %56, i32* %17, align 4
  store i32 %tmp2_v10.i78.i, i32* %18, align 16
  store i32 134517737, i32* %20, align 4
  %57 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %69, i32 inreg noundef %tmp4_v.i68.i, i32 noundef %tmp2_v.i6.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %58 = load i32, i32* %75, align 4
  %tmp0_v2.i134.i = add i32 %58, 1
  store i32 %tmp0_v2.i134.i, i32* %75, align 4
  %59 = icmp slt i32 %tmp0_v2.i134.i, 5
  br i1 %59, label %BB_80493C5.i, label %.exit

BB_804936D.i:                                     ; preds = %BB_804936D.i, %Func_set_array2.exit
  %storemerge834 = phi i32 [ 0, %Func_set_array2.exit ], [ %tmp0_v2.i12.i, %BB_804936D.i ]
  %tmp4_v.i110.i = shl i32 %storemerge834, 2
  %60 = load i32, i32* %43, align 4
  %tmp0_v3.i113.i = add i32 %60, %tmp4_v.i110.i
  %61 = inttoptr i32 %tmp0_v3.i113.i to i32*
  %62 = load i32, i32* %61, align 4
  store i32 %62, i32* %16, align 8
  %63 = load i32, i32* %44, align 4
  store i32 %63, i32* %17, align 4
  store i32 %tmp2_v10.i122.i, i32* %18, align 16
  store i32 134517649, i32* %20, align 4
  %64 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i37.i, i32 inreg noundef %tmp4_v.i110.i, i32 noundef %tmp2_v.i6.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %65 = load i32, i32* %44, align 4
  %tmp0_v2.i12.i = add i32 %65, 1
  store i32 %tmp0_v2.i12.i, i32* %44, align 4
  %66 = icmp slt i32 %tmp0_v2.i12.i, 5
  br i1 %66, label %BB_804936D.i, label %BB_804939E.i

BB_804939E.i:                                     ; preds = %BB_804936D.i
  %67 = load i32, i32* %43, align 4
  store i32 %67, i32* %18, align 16
  store i32 134517673, i32* %20, align 4
  %arg.i.i = load i32, i32* %18, align 16
  tail call void @free(i32 %arg.i.i)
  store i32 4, i32* %18, align 16
  store i32 134517686, i32* %20, align 4
  store i32 %42, i32* %28, align 8
  %tmp2_v1.i13.i.i24 = add i32 %tmp0_v.i38.i, -108
  %68 = inttoptr i32 %tmp2_v1.i13.i.i24 to i32*
  %spi.bis.621 = ptrtoint[4 x i8]* @str.bis.621 to i32
  store i32 %spi.bis.621, i32* %68, align 4
  store i32 0, i32* %29, align 4
  br label %BB_80492A8.i.i

BB_80492A8.i.i:                                   ; preds = %BB_80492A8.i.i, %BB_804939E.i
  %storemerge11.i = phi i32 [ 0, %BB_804939E.i ], [ %tmp0_v7.i.i.i, %BB_80492A8.i.i ]
  %69 = load i32, i32* %18, align 16
  %tmp4_v.i.i.i26 = shl i32 %storemerge11.i, 2
  %tmp2_v4.i.i.i27 = add i32 %tmp4_v.i.i.i26, 134529068
  %70 = inttoptr i32 %tmp2_v4.i.i.i27 to i32*
  store i32 %69, i32* %70, align 4
  %71 = load i32, i32* %29, align 4
  %tmp0_v7.i.i.i = add i32 %71, 1
  store i32 %tmp0_v7.i.i.i, i32* %29, align 4
  %72 = icmp slt i32 %tmp0_v7.i.i.i, 5
  br i1 %72, label %BB_80492A8.i.i, label %Func_set_array3.exit

Func_set_array3.exit:                             ; preds = %BB_80492A8.i.i
  %73 = load i32, i32* %28, align 8
  %tmp2_v.i18.i = add i32 %73, -36
  %74 = inttoptr i32 %tmp2_v.i18.i to i32*
  store i32 134529068, i32* %74, align 4
  %tmp2_v1.i19.i = add i32 %73, -44
  %75 = inttoptr i32 %tmp2_v1.i19.i to i32*
  %tmp2_v10.i78.i = add i32 %41, -8150
  store i32 0, i32* %75, align 4
  br label %BB_80493C5.i

.exit:                                            ; preds = %BB_80493C5.i
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

  tail call fastcc void @return_an_array624 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack623, i32 0, i32 8092) to i32)) nounwind
