; Mutation 230
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack = internal global [4194304 x i32] zeroinitializer, align 16
@onUnfallback = common local_unnamed_addr global i1 false
@str.223 = constant [12 x i8] c"some string\00"
@str.224 = constant [12 x i8] c"some string\00"
@str.225 = constant [34 x i8] c"a string to print from the middle\00"
@str.226 = constant [34 x i8] c"a string to print from the middle\00"
@str.227 = constant [15 x i8] c"r1: %d\0ar2: %d\0a\00"
@str.228 = constant [13 x i8] c"m: %d\0an: %d\0a\00"
@str.229 = constant [7 x i8] c"c: %d\0a\00"

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

declare dso_local i32 @puts(i8* noundef) local_unnamed_addr  "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" 

; Function Attrs: noinline
declare i32 @__errno_location() local_unnamed_addr  noinline 

; Function Attrs: noinline
declare i32 @strlen(i32) local_unnamed_addr  noinline 

; Function Attrs: nofree noinline nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr  nofree noinline nounwind 

; Function Attrs: norecurse
define internal fastcc void @comma_operator230(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
Func_80492E5.exit.i:
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
  %tmp2_v6.i.i = add i32 %tmp0_v.i29.i, -16
  %5 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i28.i, i32* %5, align 16
  %tmp2_v8.i36.i = add i32 %tmp0_v.i29.i, -84
  %6 = inttoptr i32 %tmp2_v8.i36.i to i32*
  store i32 134517390, i32* %6, align 4
  %tmp2_v.i81.i = add i32 %tmp0_v.i29.i, -60
  %7 = inttoptr i32 %tmp2_v.i81.i to i32*
  store i32 1, i32* %7, align 4
  %tmp2_v1.i82.i = add i32 %tmp0_v.i29.i, -56
  %8 = inttoptr i32 %tmp2_v1.i82.i to i32*
  store i32 2, i32* %8, align 8
  %tmp2_v4.i84.i = add i32 %tmp0_v.i29.i, -52
  %9 = inttoptr i32 %tmp2_v4.i84.i to i32*
  store i32 2, i32* %9, align 4
  %tmp2_v8.i89.i = add i32 %tmp0_v.i29.i, -92
  %10 = inttoptr i32 %tmp2_v8.i89.i to i32*
  store i32 2, i32* %10, align 4
  %tmp2_v10.i.i = add i32 %tmp0_v.i29.i, -96
  %11 = inttoptr i32 %tmp2_v10.i.i to i32*
  %spi229 = ptrtoint[7 x i8]* @str.229 to i32
  store i32 %spi229, i32* %11, align 16
  %tmp2_v11.i91.i = add i32 %tmp0_v.i29.i, -100
  %12 = inttoptr i32 %tmp2_v11.i91.i to i32*
  store i32 134517434, i32* %12, align 4
  %13 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i28.i, i32 inreg noundef 0, i32 noundef %tmp2_v10.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %14 = lshr i64 %13, 32
  %15 = trunc i64 %14 to i32
  %tmp2_v.i7.i = add i32 %tmp0_v.i29.i, -48
  %16 = inttoptr i32 %tmp2_v.i7.i to i32*
  store i32 5, i32* %16, align 16
  %tmp2_v7.i13.i = add i32 %tmp0_v.i29.i, -44
  %17 = inttoptr i32 %tmp2_v7.i13.i to i32*
  store i32 10, i32* %17, align 4
  %tmp2_v11.i.i = add i32 %tmp0_v.i29.i, -88
  %18 = inttoptr i32 %tmp2_v11.i.i to i32*
  store i32 10, i32* %18, align 8
  %19 = load i32, i32* %16, align 16
  store i32 %19, i32* %10, align 4
  %spi228 = ptrtoint[13 x i8]* @str.228 to i32
  store i32 %spi228, i32* %11, align 16
  store i32 134517477, i32* %12, align 4
  %20 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i28.i, i32 inreg noundef %15, i32 noundef %tmp2_v10.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %21 = lshr i64 %20, 32
  %22 = trunc i64 %21 to i32
  %tmp2_v.i163.i = add i32 %tmp0_v.i29.i, -40
  %23 = inttoptr i32 %tmp2_v.i163.i to i32*
  store i32 5, i32* %23, align 8
  %tmp2_v1.i164.i = add i32 %tmp0_v.i29.i, -36
  %24 = inttoptr i32 %tmp2_v1.i164.i to i32*
  store i32 10, i32* %24, align 4
  %tmp2_v.i128.i = add i32 %tmp0_v.i29.i, -76
  %25 = inttoptr i32 %tmp2_v.i128.i to i32*
  store i32 1, i32* %25, align 4
  %tmp2_v1.i129.i = add i32 %tmp0_v.i29.i, -72
  %26 = inttoptr i32 %tmp2_v1.i129.i to i32*
  store i32 2, i32* %26, align 8
  store i32 2, i32* %18, align 8
  %27 = load i32, i32* %25, align 4
  store i32 %27, i32* %10, align 4
  %spi227 = ptrtoint[15 x i8]* @str.227 to i32
  store i32 %spi227, i32* %11, align 16
  store i32 134517553, i32* %12, align 4
  %28 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i28.i, i32 inreg noundef %22, i32 noundef %tmp2_v10.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %tmp2_v1.i42.i = add i32 %tmp0_v.i29.i, -32
  %29 = inttoptr i32 %tmp2_v1.i42.i to i32*
  %spi226 = ptrtoint[34 x i8]* @str.226 to i32
  store i32 %spi226, i32* %29, align 16
  %spi225 = ptrtoint[34 x i8]* @str.225 to i32
  store i32 %spi225, i32* %11, align 16
  store i32 134517576, i32* %12, align 4
  %arg.i.i = load i32, i32* %11, align 16
  %30 = tail call i32 @strlen(i32 %arg.i.i)
  %tmp2_v.i95.i = add i32 %tmp0_v.i29.i, -28
  %31 = inttoptr i32 %tmp2_v.i95.i to i32*
  store i32 %30, i32* %31, align 4
  %tmp0_v3.i98.i = lshr i32 %30, 31
  %tmp0_v4.i99.i = add i32 %tmp0_v3.i98.i, %30
  %tmp0_v5.i100.i = ashr i32 %tmp0_v4.i99.i, 1
  %tmp2_v6.i101.i = add i32 %tmp0_v.i29.i, -68
  %32 = inttoptr i32 %tmp2_v6.i101.i to i32*
  store i32 %tmp0_v5.i100.i, i32* %32, align 4
  %33 = load i32, i32* %31, align 4
  %34 = icmp slt i32 %tmp0_v5.i100.i, %33
  br i1 %34, label %BB_804935F.i, label %BB_8049385.i

BB_804935F.i:                                     ; preds = %BB_804935F.i, %Func_80492E5.exit.i
  %storemerge28 = phi i32 [ %tmp0_v2.i135.i, %BB_804935F.i ], [ %tmp0_v5.i100.i, %Func_80492E5.exit.i ]
  %35 = load i32, i32* %29, align 16
  %tmp0_v3.i.i = add i32 %35, %storemerge28
  %36 = inttoptr i32 %tmp0_v3.i.i to i8*
  %37 = load i8, i8* %36, align 1
  %tmp0_v5.i.i = sext i8 %37 to i32
  store i32 %tmp0_v5.i.i, i32* %11, align 16
  store i32 134517622, i32* %12, align 4
  %arg.i.i16 = load i32, i32* %11, align 16
  %38 = tail call i32 @putchar(i32 %arg.i.i16)  nounwind 
  %39 = load i32, i32* %32, align 4
  %tmp0_v2.i135.i = add i32 %39, 1
  store i32 %tmp0_v2.i135.i, i32* %32, align 4
  %40 = load i32, i32* %31, align 4
  %41 = icmp slt i32 %tmp0_v2.i135.i, %40
  br i1 %41, label %BB_804935F.i, label %BB_8049385.i

BB_80493BB.i:                                     ; preds = %BB_8049385.i, %BB_80493BB.i
  %storemerge929 = phi i32 [ %tmp0_v2.i22.i, %BB_80493BB.i ], [ 0, %BB_8049385.i ]
  %42 = load i32, i32* %50, align 8
  %tmp0_v3.i62.i = add i32 %42, %storemerge929
  %43 = inttoptr i32 %tmp0_v3.i62.i to i8*
  %44 = load i8, i8* %43, align 1
  %tmp0_v5.i64.i = sext i8 %44 to i32
  store i32 %tmp0_v5.i64.i, i32* %11, align 16
  store i32 134517714, i32* %12, align 4
  %arg.i.i17 = load i32, i32* %11, align 16
  %45 = tail call i32 @putchar(i32 %arg.i.i17)  nounwind 
  %46 = load i32, i32* %52, align 16
  %tmp0_v2.i22.i = add i32 %46, 1
  store i32 %tmp0_v2.i22.i, i32* %52, align 16
  %47 = load i32, i32* %31, align 4
  %48 = icmp slt i32 %tmp0_v2.i22.i, %47
  br i1 %48, label %BB_80493BB.i, label %BB_80493E1.i

BB_8049385.i:                                     ; preds = %BB_804935F.i, %Func_80492E5.exit.i
  %r_edx.0.lcssa = phi i32 [ %tmp0_v3.i98.i, %Func_80492E5.exit.i ], [ %storemerge28, %BB_804935F.i ]
  store i32 10, i32* %11, align 16
  store i32 134517647, i32* %12, align 4
  %arg.i.i18 = load i32, i32* %11, align 16
  %49 = tail call i32 @putchar(i32 %arg.i.i18)  nounwind 
  %tmp2_v1.i52.i = add i32 %tmp0_v.i29.i, -24
  %50 = inttoptr i32 %tmp2_v1.i52.i to i32*
  %spi224 = ptrtoint[12 x i8]* @str.224 to i32
  store i32 %spi224, i32* %50, align 8
  %spi223 = ptrtoint[12 x i8]* @str.223 to i32
  store i32 %spi223, i32* %11, align 16
  store i32 134517670, i32* %12, align 4
  %arg.i.i19 = load i32, i32* %11, align 16
  %51 = tail call i32 @strlen(i32 %arg.i.i19)
  store i32 %51, i32* %31, align 4
  %tmp2_v.i143.i = add i32 %tmp0_v.i29.i, -64
  %52 = inttoptr i32 %tmp2_v.i143.i to i32*
  store i32 0, i32* %52, align 16
  %53 = load i32, i32* %31, align 4
  %54 = icmp sgt i32 %53, 0
  br i1 %54, label %BB_80493BB.i, label %BB_80493E1.i

BB_80493E1.i:                                     ; preds = %BB_8049385.i, %BB_80493BB.i
  %r_edx.1.lcssa = phi i32 [ %r_edx.0.lcssa, %BB_8049385.i ], [ %storemerge929, %BB_80493BB.i ]
  store i32 10, i32* %11, align 16
  store i32 134517739, i32* %12, align 4
  %arg.i.i22 = load i32, i32* %11, align 16
  %55 = tail call i32 @putchar(i32 %arg.i.i22)  nounwind 
  store i32 1001, i32* %11, align 16
  store i32 134517755, i32* %12, align 4
  %tmp2_v.i2.i.i = add i32 %tmp0_v.i29.i, -104
  %56 = inttoptr i32 %tmp2_v.i2.i.i to i32*
  store i32 %tmp2_v4.i32.i, i32* %56, align 8
  %tmp2_v1.i.i.i = add i32 %tmp0_v.i29.i, -108
  %57 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 134529024, i32* %57, align 4
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i29.i, -116
  %58 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  store i32 134517339, i32* %58, align 4
  %59 = tail call i32 @__errno_location()
  %60 = inttoptr i32 %59 to i32*
  store i32 22, i32* %60, align 4
  %61 = load i32, i32* %57, align 4
  %62 = load i32, i32* %56, align 8
  %tmp2_v.i147.i = add i32 %62, -12
  %63 = inttoptr i32 %tmp2_v.i147.i to i32*
  store i32 -1, i32* %63, align 4
  store i32 -1, i32* %10, align 4
  %tmp2_v5.i154.i = add i32 %61, -8102
  store i32 %tmp2_v5.i154.i, i32* %11, align 16
  store i32 134517779, i32* %12, align 4
  %64 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i28.i, i32 inreg noundef %r_edx.1.lcssa, i32 noundef %tmp2_v10.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  store i32 134517787, i32* %6, align 4
  %65 = tail call i32 @__errno_location()
  %tmp2_v.i124.i = add i32 %61, -8084
  store i32 %tmp2_v.i124.i, i32* %11, align 16
  store i32 134517809, i32* %12, align 4
  %arg.i.i27 = load i32, i32* %11, align 16
  %66 = inttoptr i32 %arg.i.i27 to i8*
  %67 = tail call i32 @puts(i8* nonnull dereferenceable(1) %66)
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

  tail call fastcc void @comma_operator230(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) nounwind