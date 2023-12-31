; Mutation 390
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack389 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.381 = constant [9 x i8] c"\72\65\74\3a\20\25\73\0a\00"
@str.bis.382 = constant [4 x i8] c"\05\18\2c\00"
@str.bis.383 = constant [10 x i8] c"\73\74\72\32\3a\20\25\73\0a\00"
@str.bis.384 = constant [4 x i8] c"\05\53\2c\00"
@str.bis.385 = constant [10 x i8] c"\73\74\72\31\3a\20\25\73\0a\00"
@str.bis.386 = constant [7 x i8] c"\73\74\72\69\6e\67\00"
@str.bis.387 = constant [7 x i8] c"\73\74\72\69\6e\67\00"
@str.bis.388 = constant [4 x i8] c"\05\6f\2c\00"

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
define internal fastcc void @return_a_string390(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
.exit:
  %tmp2_v.i.i = add i32 %arg_esp, 4
  %tmp0_v.i.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i.i, -4
  %2 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i.i = add i32 %tmp0_v.i.i, -8
  %3 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i.i = add i32 %tmp0_v.i.i, -12
  %4 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i.i, -16
  %5 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i.i, i32* %5, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i.i, -308
  %6 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517412, i32* %6, align 4
  %tmp2_v.i66.i = add i32 %arg_esp, 8
  %7 = inttoptr i32 %tmp2_v.i66.i to i32*
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i69.i = add i32 %tmp0_v.i.i, -292
  %9 = inttoptr i32 %tmp2_v2.i69.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp4_v.i70.i.b = load i1, i1* @segs.0, align 1
  %10 = inttoptr i32 %arg_esp to i32*
  %11 = load i32, i32* %10, align 4
  %tmp2_v5.i72.i = add i32 %tmp0_v.i.i, -20
  %12 = inttoptr i32 %tmp2_v5.i72.i to i32*
  store i32 %11, i32* %12, align 4
  store i32 134517445, i32* %6, align 4
  %tmp2_v.i2.i.i = add i32 %tmp0_v.i.i, -312
  %13 = inttoptr i32 %tmp2_v.i2.i.i to i32*
  store i32 %tmp2_v4.i.i, i32* %13, align 8
  %tmp2_v1.i.i.i = add i32 %tmp0_v.i.i, -316
  %14 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  %spi.bis.388 = ptrtoint[4 x i8]* @str.bis.388 to i32
  store i32 %spi.bis.388, i32* %14, align 4
  %15 = load i32, i32* %13, align 8
  %tmp2_v.i24.i = add i32 %15, -280
  %16 = inttoptr i32 %tmp2_v.i24.i to i32*
  %spi.bis.387 = ptrtoint[7 x i8]* @str.bis.387 to i32
  store i32 %spi.bis.387, i32* %16, align 4
  %spi.bis.386 = ptrtoint[7 x i8]* @str.bis.386 to i32
  store i32 %spi.bis.386, i32* %14, align 4
  %tmp2_v5.i33.i = add i32 %tmp0_v.i.i, -320
  %17 = inttoptr i32 %tmp2_v5.i33.i to i32*
  %spi.bis.385 = ptrtoint[10 x i8]* @str.bis.385 to i32
  store i32 %spi.bis.385, i32* %17, align 16
  %tmp2_v6.i34.i = add i32 %tmp0_v.i.i, -324
  %18 = inttoptr i32 %tmp2_v6.i34.i to i32*
  store i32 134517472, i32* %18, align 4
  %19 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i.i, i32 inreg noundef 0, i32 noundef %tmp2_v5.i33.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  store i32 134517480, i32* %6, align 4
  store i32 %15, i32* %13, align 8
  %tmp2_v1.i.i.i5 = add i32 %tmp0_v.i.i, -340
  %20 = inttoptr i32 %tmp2_v1.i.i.i5 to i32*
  %spi.bis.384 = ptrtoint[4 x i8]* @str.bis.384 to i32
  store i32 %spi.bis.384, i32* %20, align 4
  %tmp4_v.i4.i.b.i = load i1, i1* @segs.0, align 1
  %21 = inttoptr i32 %arg_esp to i32*
  %22 = load i32, i32* %21, align 4
  store i32 %22, i32* %18, align 4
  %tmp2_v3.i.i.i = add i32 %tmp0_v.i.i, -328
  %23 = inttoptr i32 %tmp2_v3.i.i.i to i32*
  store i32 7959156, i32* %23, align 8
  %24 = load i32, i32* %18, align 4
  %25 = load i32, i32* %21, align 4
  %tmp0_v8.i.i.i = xor i32 %25, %24
  %26 = load i32, i32* %13, align 8
  %tmp2_v.i8.i = add i32 %26, -276
  %27 = inttoptr i32 %tmp2_v.i8.i to i32*
  store i32 0, i32* %27, align 4
  store i32 0, i32* %14, align 4
  %spi.bis.383 = ptrtoint[10 x i8]* @str.bis.383 to i32
  store i32 %spi.bis.383, i32* %17, align 16
  store i32 134517507, i32* %18, align 4
  %28 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i.i, i32 inreg noundef %tmp0_v8.i.i.i, i32 noundef %tmp2_v5.i33.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %29 = lshr i64 %28, 32
  %30 = trunc i64 %29 to i32
  %tmp2_v.i21.i = add i32 %26, -268
  store i32 %tmp2_v.i21.i, i32* %17, align 16
  store i32 134517525, i32* %18, align 4
  store i32 %26, i32* %23, align 8
  %tmp2_v1.i.i.i9 = add i32 %tmp0_v.i.i, -332
  %31 = inttoptr i32 %tmp2_v1.i.i.i9 to i32*
  %spi.bis.382 = ptrtoint[4 x i8]* @str.bis.382 to i32
  store i32 %spi.bis.382, i32* %31, align 4
  %32 = load i32, i32* %17, align 16
  %33 = inttoptr i32 %32 to i32*
  store i32 1752458605, i32* %33, align 4
  %tmp2_v2.i.i.i10 = add i32 %32, 4
  %34 = inttoptr i32 %tmp2_v2.i.i.i10 to i32*
  store i32 540238959, i32* %34, align 4
  %tmp2_v3.i.i.i11 = add i32 %32, 8
  %35 = inttoptr i32 %tmp2_v3.i.i.i11 to i32*
  store i32 1769108595, i32* %35, align 4
  %tmp2_v4.i.i.i = add i32 %32, 12
  %36 = inttoptr i32 %tmp2_v4.i.i.i to i16*
  store i16 26478, i16* %36, align 2
  %tmp2_v5.i.i.i = add i32 %32, 14
  %37 = inttoptr i32 %tmp2_v5.i.i.i to i8*
  store i8 0, i8* %37, align 1
  %38 = load i32, i32* %23, align 8
  %tmp2_v.i59.i = add i32 %38, -268
  store i32 %tmp2_v.i59.i, i32* %14, align 4
  %spi.bis.381 = ptrtoint[9 x i8]* @str.bis.381 to i32
  store i32 %spi.bis.381, i32* %17, align 16
  store i32 134517550, i32* %18, align 4
  %39 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i.i, i32 inreg noundef %30, i32 noundef %tmp2_v5.i33.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %40 = lshr i64 %39, 32
  %41 = trunc i64 %40 to i32
  store i32 134517558, i32* %6, align 4
  store i32 %38, i32* %13, align 8
  store i32 134529024, i32* %14, align 4
  store i32 134517793, i32* %20, align 4
  %tmp2_v.i4.i.i = add i32 %tmp0_v.i.i, -352
  %42 = inttoptr i32 %tmp2_v.i4.i.i to i32*
  store i32 8, i32* %42, align 16
  %tmp2_v2.i.i.i14 = add i32 %tmp0_v.i.i, -356
  %43 = inttoptr i32 %tmp2_v2.i.i.i14 to i32*
  store i32 134517810, i32* %43, align 4
  %arg.i.i.i = load i32, i32* %42, align 16
  %44 = tail call i32 @malloc(i32 %arg.i.i.i)
  store i32 %44, i32* %18, align 4
  %45 = inttoptr i32 %44 to i32*
  store i32 1634629988, i32* %45, align 4
  %tmp2_v3.i.i.i16 = add i32 %44, 4
  %46 = inttoptr i32 %tmp2_v3.i.i.i16 to i32*
  store i32 6515053, i32* %46, align 4
  %47 = load i32, i32* %18, align 4
  %48 = load i32, i32* %14, align 4
  %49 = load i32, i32* %13, align 8
  %tmp2_v.i44.i = add i32 %49, -272
  %50 = inttoptr i32 %tmp2_v.i44.i to i32*
  store i32 %47, i32* %50, align 4
  store i32 %47, i32* %14, align 4
  %tmp2_v4.i52.i = add i32 %48, -8155
  store i32 %tmp2_v4.i52.i, i32* %17, align 16
  store i32 134517585, i32* %18, align 4
  %51 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i.i, i32 inreg noundef %41, i32 noundef %tmp2_v5.i33.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %52 = load i32, i32* %50, align 4
  store i32 %52, i32* %17, align 16
  store i32 134517602, i32* %18, align 4
  %arg.i.i = load i32, i32* %17, align 16
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

  tail call fastcc void @return_a_string390 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack389, i32 0, i32 8092) to i32)) nounwind
