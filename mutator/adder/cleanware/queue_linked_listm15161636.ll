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

declare dso_local i32 @puts(i8* noundef) local_unnamed_addr  "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" 

; Function Attrs: noinline
declare void @free(i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare i32 @malloc(i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc { i32, i32, i32, i32 } @Func_enqueue(i32 %arg_esp, i32 %arg_ebp, i32 %arg_ebx) unnamed_addr  norecurse  !retregs !12 {
Func_80495B2.exit.i:
  %tmp2_v.i4.i = add i32 %arg_esp, -4
  %0 = inttoptr i32 %tmp2_v.i4.i to i32*
  store i32 %arg_ebp, i32* %0, align 4
  %tmp2_v1.i6.i = add i32 %arg_esp, -8
  %1 = inttoptr i32 %tmp2_v1.i6.i to i32*
  store i32 %arg_ebx, i32* %1, align 4
  %tmp2_v2.i8.i = add i32 %arg_esp, -32
  %2 = inttoptr i32 %tmp2_v2.i8.i to i32*
  store i32 134518142, i32* %2, align 4
  %tmp2_v.i.i = add i32 %arg_esp, -44
  %3 = inttoptr i32 %tmp2_v.i.i to i32*
  store i32 8, i32* %3, align 4
  %tmp2_v2.i.i = add i32 %arg_esp, -48
  %4 = inttoptr i32 %tmp2_v2.i.i to i32*
  store i32 134518159, i32* %4, align 4
  %arg.i.i = load i32, i32* %3, align 4
  %5 = tail call i32 @malloc(i32 %arg.i.i)
  %tmp2_v.i34.i = add i32 %arg_esp, -16
  %6 = inttoptr i32 %tmp2_v.i34.i to i32*
  store i32 %5, i32* %6, align 4
  %tmp2_v3.i38.i = add i32 %arg_esp, 8
  %7 = inttoptr i32 %tmp2_v3.i38.i to i32*
  %8 = load i32, i32* %7, align 4
  %9 = inttoptr i32 %5 to i32*
  store i32 %8, i32* %9, align 4
  %10 = load i32, i32* %6, align 4
  %tmp2_v7.i42.i = add i32 %10, 4
  %11 = inttoptr i32 %tmp2_v7.i42.i to i32*
  store i32 0, i32* %11, align 4
  %tmp2_v9.i.i = add i32 %arg_esp, 4
  %12 = inttoptr i32 %tmp2_v9.i.i to i32*
  %13 = load i32, i32* %12, align 4
  store i32 %13, i32* %3, align 4
  store i32 134518194, i32* %4, align 4
  %tmp2_v.i.i.i = add i32 %arg_esp, -52
  %14 = inttoptr i32 %tmp2_v.i.i.i to i32*
  store i32 %tmp2_v.i4.i, i32* %14, align 4
  %tmp2_v1.i.i.i = add i32 %arg_esp, -56
  %15 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 134518048, i32* %15, align 4
  %16 = load i32, i32* %3, align 4
  %tmp2_v2.i.i.i = add i32 %16, 8
  %17 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  %18 = load i32, i32* %17, align 4
  %.not.i.i.i.not = icmp eq i32 %18, 0
  %19 = load i32, i32* %14, align 4
  %tmp2_v.i1.i = add i32 %19, 8
  %20 = inttoptr i32 %tmp2_v.i1.i to i32*
  %21 = load i32, i32* %20, align 4
  br i1 %.not.i.i.i.not, label %.exit, label %BB_80495CC.i

BB_80495CC.i:                                     ; preds = %Func_80495B2.exit.i
  %tmp2_v1.i15.i = add i32 %21, 4
  %22 = inttoptr i32 %tmp2_v1.i15.i to i32*
  %23 = load i32, i32* %22, align 4
  %tmp2_v5.i19.i = add i32 %23, 4
  br label %.exit

.exit:                                            ; preds = %BB_80495CC.i, %Func_80495B2.exit.i
  %tmp2_v5.i19.i.sink = phi i32 [ %tmp2_v5.i19.i, %BB_80495CC.i ], [ %21, %Func_80495B2.exit.i ]
  %.sink21.in = add i32 %19, -12
  %.sink21 = inttoptr i32 %.sink21.in to i32*
  %.sink = load i32, i32* %.sink21, align 4
  %24 = inttoptr i32 %tmp2_v5.i19.i.sink to i32*
  store i32 %.sink, i32* %24, align 4
  %25 = load i32, i32* %20, align 4
  %26 = load i32, i32* %.sink21, align 4
  %tmp2_v10.i.i = add i32 %25, 4
  %27 = inttoptr i32 %tmp2_v10.i.i to i32*
  store i32 %26, i32* %27, align 4
  %28 = load i32, i32* %20, align 4
  %tmp2_v1.i24.i = add i32 %28, 8
  %29 = inttoptr i32 %tmp2_v1.i24.i to i32*
  %30 = load i32, i32* %29, align 4
  %tmp2_v3.i26.i = add i32 %30, 1
  store i32 %tmp2_v3.i26.i, i32* %29, align 4
  %tmp2_v7.i28.i = add i32 %19, -4
  %31 = inttoptr i32 %tmp2_v7.i28.i to i32*
  %32 = load i32, i32* %31, align 4
  %33 = inttoptr i32 %19 to i32*
  %34 = load i32, i32* %33, align 4
  %mrv = insertvalue { i32, i32, i32, i32 } undef, i32 %tmp2_v.i1.i, 0
  %mrv1 = insertvalue { i32, i32, i32, i32 } %mrv, i32 %tmp2_v3.i26.i, 1
  %mrv2 = insertvalue { i32, i32, i32, i32 } %mrv1, i32 %34, 2
  %mrv3 = insertvalue { i32, i32, i32, i32 } %mrv2, i32 %32, 3
  ret { i32, i32, i32, i32 } %mrv3
}

; Function Attrs: norecurse
define internal fastcc { i32, i32, i32, i32, i32 } @Func_dequeue(i32 %arg_esp, i32 %arg_edx, i32 %arg_ebp, i32 %arg_ebx) unnamed_addr  norecurse  !retregs !13 {
Func_8049614.exit.i:
  %tmp2_v.i32.i = add i32 %arg_esp, -4
  %0 = inttoptr i32 %tmp2_v.i32.i to i32*
  store i32 %arg_ebp, i32* %0, align 4
  %tmp2_v1.i34.i = add i32 %arg_esp, -8
  %1 = inttoptr i32 %tmp2_v1.i34.i to i32*
  store i32 %arg_ebx, i32* %1, align 4
  %tmp2_v2.i36.i = add i32 %arg_esp, -32
  %2 = inttoptr i32 %tmp2_v2.i36.i to i32*
  store i32 134518278, i32* %2, align 4
  %tmp2_v.i53.i = add i32 %arg_esp, 4
  %3 = inttoptr i32 %tmp2_v.i53.i to i32*
  %4 = load i32, i32* %3, align 4
  store i32 %4, i32* %2, align 4
  %tmp2_v3.i57.i = add i32 %arg_esp, -36
  %5 = inttoptr i32 %tmp2_v3.i57.i to i32*
  store i32 134518292, i32* %5, align 4
  %tmp2_v.i.i.i = add i32 %arg_esp, -40
  %6 = inttoptr i32 %tmp2_v.i.i.i to i32*
  store i32 %tmp2_v.i32.i, i32* %6, align 4
  %tmp2_v1.i.i.i = add i32 %arg_esp, -44
  %7 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 134518048, i32* %7, align 4
  %8 = load i32, i32* %2, align 4
  %tmp2_v2.i.i.i = add i32 %8, 8
  %9 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  %10 = load i32, i32* %9, align 4
  %.not.i.i.i.not = icmp eq i32 %10, 0
  %11 = load i32, i32* %6, align 4
  %tmp2_v.i59.i = add i32 %11, 12
  %12 = inttoptr i32 %tmp2_v.i59.i to i32*
  %13 = load i32, i32* %12, align 4
  %14 = inttoptr i32 %13 to i8*
  br i1 %.not.i.i.i.not, label %BB_804961B.i, label %BB_8049628.i

BB_804966D.i:                                     ; preds = %BB_8049660.i, %BB_804964B.i
  %15 = load i32, i32* %33, align 4
  store i32 %15, i32* %7, align 4
  %tmp2_v3.i.i = add i32 %arg_esp, -48
  %16 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 134518392, i32* %16, align 4
  %arg.i.i = load i32, i32* %7, align 4
  tail call void @free(i32 %arg.i.i)
  %17 = load i32, i32* %23, align 4
  %tmp2_v2.i13.i = add i32 %17, 8
  %18 = inttoptr i32 %tmp2_v2.i13.i to i32*
  %19 = load i32, i32* %18, align 4
  %tmp2_v4.i.i = add i32 %19, -1
  store i32 %tmp2_v4.i.i, i32* %18, align 4
  %20 = load i32, i32* %29, align 4
  br label %.exit

BB_804964B.i:                                     ; preds = %BB_8049628.i
  store i32 0, i32* %37, align 4
  %21 = load i32, i32* %23, align 4
  %tmp2_v3.i19.i = add i32 %21, 4
  %22 = inttoptr i32 %tmp2_v3.i19.i to i32*
  store i32 0, i32* %22, align 4
  br label %BB_804966D.i

BB_8049628.i:                                     ; preds = %Func_8049614.exit.i
  store i8 1, i8* %14, align 1
  %tmp2_v1.i23.i = add i32 %11, 8
  %23 = inttoptr i32 %tmp2_v1.i23.i to i32*
  %24 = load i32, i32* %23, align 4
  %25 = inttoptr i32 %24 to i32*
  %26 = load i32, i32* %25, align 4
  %27 = inttoptr i32 %26 to i32*
  %28 = load i32, i32* %27, align 4
  %tmp2_v5.i26.i = add i32 %11, -16
  %29 = inttoptr i32 %tmp2_v5.i26.i to i32*
  store i32 %28, i32* %29, align 4
  %30 = load i32, i32* %23, align 4
  %31 = inttoptr i32 %30 to i32*
  %32 = load i32, i32* %31, align 4
  %tmp2_v9.i.i = add i32 %11, -12
  %33 = inttoptr i32 %tmp2_v9.i.i to i32*
  store i32 %32, i32* %33, align 4
  %34 = load i32, i32* %23, align 4
  %tmp2_v12.i.i = add i32 %34, 8
  %35 = inttoptr i32 %tmp2_v12.i.i to i32*
  %36 = load i32, i32* %35, align 4
  %.not.i.i = icmp eq i32 %36, 1
  %37 = inttoptr i32 %34 to i32*
  br i1 %.not.i.i, label %BB_804964B.i, label %BB_8049660.i

BB_8049660.i:                                     ; preds = %BB_8049628.i
  %38 = load i32, i32* %37, align 4
  %tmp2_v2.i41.i = add i32 %38, 4
  %39 = inttoptr i32 %tmp2_v2.i41.i to i32*
  %40 = load i32, i32* %39, align 4
  store i32 %40, i32* %37, align 4
  br label %BB_804966D.i

BB_804961B.i:                                     ; preds = %Func_8049614.exit.i
  store i8 0, i8* %14, align 1
  %.pre = add i32 %11, 8
  br label %.exit

.exit:                                            ; preds = %BB_804961B.i, %BB_804966D.i
  %tmp4_v3.i.i.pre-phi = phi i32 [ %.pre, %BB_804961B.i ], [ %tmp2_v1.i23.i, %BB_804966D.i ]
  %r_eax.0 = phi i32 [ 0, %BB_804961B.i ], [ %20, %BB_804966D.i ]
  %r_edx.0 = phi i32 [ %arg_edx, %BB_804961B.i ], [ %tmp2_v4.i.i, %BB_804966D.i ]
  %tmp2_v.i4.i = add i32 %11, -4
  %41 = inttoptr i32 %tmp2_v.i4.i to i32*
  %42 = load i32, i32* %41, align 4
  %43 = inttoptr i32 %11 to i32*
  %44 = load i32, i32* %43, align 4
  %mrv = insertvalue { i32, i32, i32, i32, i32 } undef, i32 %tmp4_v3.i.i.pre-phi, 0
  %mrv1 = insertvalue { i32, i32, i32, i32, i32 } %mrv, i32 %r_eax.0, 1
  %mrv2 = insertvalue { i32, i32, i32, i32, i32 } %mrv1, i32 %r_edx.0, 2
  %mrv3 = insertvalue { i32, i32, i32, i32, i32 } %mrv2, i32 %44, 3
  %mrv4 = insertvalue { i32, i32, i32, i32, i32 } %mrv3, i32 %42, 4
  ret { i32, i32, i32, i32, i32 } %mrv4
}

; Function Attrs: norecurse
define internal fastcc void @queue_linked_listm15161636(i32 %arg_esp) unnamed_addr  norecurse  !retregs !14 {
Func_8049255.exit.i:
  %tmp2_v.i22.i = add i32 %arg_esp, 4
  %tmp0_v.i23.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i25.i = add i32 %tmp0_v.i23.i, -4
  %2 = inttoptr i32 %tmp2_v3.i25.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i26.i = add i32 %tmp0_v.i23.i, -8
  %3 = inttoptr i32 %tmp2_v4.i26.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i28.i = add i32 %tmp0_v.i23.i, -12
  %4 = inttoptr i32 %tmp2_v5.i28.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i23.i, -16
  %5 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i22.i, i32* %5, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i23.i, -36
  %6 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517297, i32* %6, align 4
  %tmp4_v.i261.i.b = load i1, i1* @segs.0, align 1
  %7 = select i1 %tmp4_v.i261.i.b, i32* inttoptr (i32 add (i32 ptrtoint ([1024 x i8]* @_ZL6segmem to i32), i32 20) to i32*), i32* inttoptr (i32 20 to i32*)
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i265.i = add i32 %tmp0_v.i23.i, -20
  %9 = inttoptr i32 %tmp2_v2.i265.i to i32*
  store i32 %8, i32* %9, align 4
  store i32 134517319, i32* %6, align 4
  %tmp2_v.i2.i.i = add i32 %tmp0_v.i23.i, -40
  %10 = inttoptr i32 %tmp2_v.i2.i.i to i32*
  store i32 %tmp2_v4.i26.i, i32* %10, align 8
  %tmp2_v1.i.i.i = add i32 %tmp0_v.i23.i, -44
  %11 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 134529024, i32* %11, align 4
  %tmp2_v2.i4.i.i = add i32 %tmp0_v.i23.i, -68
  %12 = inttoptr i32 %tmp2_v2.i4.i.i to i32*
  store i32 134517951, i32* %12, align 4
  %tmp2_v.i.i.i = add i32 %tmp0_v.i23.i, -80
  %13 = inttoptr i32 %tmp2_v.i.i.i to i32*
  store i32 12, i32* %13, align 16
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i23.i, -84
  %14 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  store i32 134517968, i32* %14, align 4
  %arg.i.i.i = load i32, i32* %13, align 16
  %15 = tail call i32 @malloc(i32 %arg.i.i.i)
  %tmp2_v.i8.i.i = add i32 %tmp0_v.i23.i, -52
  %16 = inttoptr i32 %tmp2_v.i8.i.i to i32*
  store i32 %15, i32* %16, align 4
  %17 = inttoptr i32 %15 to i32*
  store i32 0, i32* %17, align 4
  %18 = load i32, i32* %16, align 4
  %tmp2_v5.i.i.i = add i32 %18, 4
  %19 = inttoptr i32 %tmp2_v5.i.i.i to i32*
  store i32 0, i32* %19, align 4
  %20 = load i32, i32* %16, align 4
  %tmp2_v8.i.i.i = add i32 %20, 8
  %21 = inttoptr i32 %tmp2_v8.i.i.i to i32*
  store i32 0, i32* %21, align 4
  %22 = load i32, i32* %16, align 4
  %23 = load i32, i32* %11, align 4
  %24 = load i32, i32* %10, align 8
  %tmp2_v.i133.i = add i32 %24, -20
  %25 = inttoptr i32 %tmp2_v.i133.i to i32*
  store i32 %22, i32* %25, align 4
  %tmp2_v3.i139.i = add i32 %tmp0_v.i23.i, -48
  %26 = inttoptr i32 %tmp2_v3.i139.i to i32*
  store i32 %22, i32* %26, align 16
  store i32 134517333, i32* %16, align 4
  %tmp2_v.i.i.i7 = add i32 %tmp0_v.i23.i, -56
  %27 = inttoptr i32 %tmp2_v.i.i.i7 to i32*
  store i32 %24, i32* %27, align 8
  %tmp2_v1.i.i.i8 = add i32 %tmp0_v.i23.i, -60
  %28 = inttoptr i32 %tmp2_v1.i.i.i8 to i32*
  store i32 134518048, i32* %28, align 4
  %29 = load i32, i32* %27, align 8
  %tmp2_v.i111.i = add i32 %23, -8184
  store i32 %tmp2_v.i111.i, i32* %26, align 16
  store i32 134517355, i32* %16, align 4
  %arg.i.i = load i32, i32* %26, align 16
  %30 = inttoptr i32 %arg.i.i to i8*
  %31 = tail call i32 @puts(i8* nonnull dereferenceable(1) %30)
  store i32 4, i32* %11, align 4
  %tmp2_v2.i200.i = add i32 %29, -20
  %32 = inttoptr i32 %tmp2_v2.i200.i to i32*
  %33 = load i32, i32* %32, align 4
  store i32 %33, i32* %26, align 16
  store i32 134517371, i32* %16, align 4
  %34 = tail call fastcc { i32, i32, i32, i32 } @Func_enqueue(i32 %tmp2_v.i8.i.i, i32 %29, i32 %23)
  %35 = extractvalue { i32, i32, i32, i32 } %34, 0
  %36 = extractvalue { i32, i32, i32, i32 } %34, 2
  %37 = extractvalue { i32, i32, i32, i32 } %34, 3
  %tmp2_v.i295.i = add i32 %36, -20
  %38 = inttoptr i32 %tmp2_v.i295.i to i32*
  %39 = load i32, i32* %38, align 4
  %40 = inttoptr i32 %35 to i32*
  store i32 %39, i32* %40, align 4
  %tmp2_v4.i297.i = add i32 %35, -4
  %41 = inttoptr i32 %tmp2_v4.i297.i to i32*
  store i32 134517385, i32* %41, align 4
  %tmp2_v.i.i.i14 = add i32 %35, -8
  %42 = inttoptr i32 %tmp2_v.i.i.i14 to i32*
  store i32 %36, i32* %42, align 4
  %tmp2_v1.i.i.i15 = add i32 %35, -12
  %43 = inttoptr i32 %tmp2_v1.i.i.i15 to i32*
  store i32 134518048, i32* %43, align 4
  %44 = load i32, i32* %42, align 4
  %tmp2_v.i144.i = add i32 %37, -8168
  store i32 %tmp2_v.i144.i, i32* %40, align 4
  store i32 134517410, i32* %41, align 4
  %arg.i.i23 = load i32, i32* %40, align 4
  %45 = inttoptr i32 %arg.i.i23 to i8*
  %46 = tail call i32 @puts(i8* nonnull dereferenceable(1) %45)
  %tmp2_v.i271.i = add i32 %35, 4
  %47 = inttoptr i32 %tmp2_v.i271.i to i32*
  store i32 5, i32* %47, align 4
  %tmp2_v2.i273.i = add i32 %44, -20
  %48 = inttoptr i32 %tmp2_v2.i273.i to i32*
  %49 = load i32, i32* %48, align 4
  store i32 %49, i32* %40, align 4
  store i32 134517426, i32* %41, align 4
  %50 = tail call fastcc { i32, i32, i32, i32 } @Func_enqueue(i32 %tmp2_v4.i297.i, i32 %44, i32 %37)
  %51 = extractvalue { i32, i32, i32, i32 } %50, 0
  %52 = extractvalue { i32, i32, i32, i32 } %50, 2
  %53 = extractvalue { i32, i32, i32, i32 } %50, 3
  %tmp2_v.i94.i = add i32 %51, 4
  %54 = inttoptr i32 %tmp2_v.i94.i to i32*
  store i32 6, i32* %54, align 4
  %tmp2_v2.i96.i = add i32 %52, -20
  %55 = inttoptr i32 %tmp2_v2.i96.i to i32*
  %56 = load i32, i32* %55, align 4
  %57 = inttoptr i32 %51 to i32*
  store i32 %56, i32* %57, align 4
  %tmp2_v5.i98.i = add i32 %51, -4
  %58 = inttoptr i32 %tmp2_v5.i98.i to i32*
  store i32 134517442, i32* %58, align 4
  %59 = tail call fastcc { i32, i32, i32, i32 } @Func_enqueue(i32 %tmp2_v5.i98.i, i32 %52, i32 %53)
  %60 = extractvalue { i32, i32, i32, i32 } %59, 0
  %61 = extractvalue { i32, i32, i32, i32 } %59, 1
  %62 = extractvalue { i32, i32, i32, i32 } %59, 2
  %63 = extractvalue { i32, i32, i32, i32 } %59, 3
  %tmp2_v.i288.i = add i32 %62, -20
  %64 = inttoptr i32 %tmp2_v.i288.i to i32*
  %65 = load i32, i32* %64, align 4
  %66 = inttoptr i32 %60 to i32*
  store i32 %65, i32* %66, align 4
  %tmp2_v4.i290.i = add i32 %60, -4
  %67 = inttoptr i32 %tmp2_v4.i290.i to i32*
  store i32 134517456, i32* %67, align 4
  %tmp2_v.i2.i.i24 = add i32 %60, -8
  %68 = inttoptr i32 %tmp2_v.i2.i.i24 to i32*
  store i32 %62, i32* %68, align 4
  %tmp2_v1.i.i.i25 = add i32 %60, -12
  %69 = inttoptr i32 %tmp2_v1.i.i.i25 to i32*
  store i32 134518023, i32* %69, align 4
  %70 = load i32, i32* %66, align 4
  %tmp2_v2.i.i.i26 = add i32 %70, 8
  %71 = inttoptr i32 %tmp2_v2.i.i.i26 to i32*
  %72 = load i32, i32* %71, align 4
  %73 = load i32, i32* %68, align 4
  %tmp2_v.i.i = add i32 %60, 4
  %74 = inttoptr i32 %tmp2_v.i.i to i32*
  store i32 %72, i32* %74, align 4
  %tmp2_v2.i.i = add i32 %63, -8148
  store i32 %tmp2_v2.i.i, i32* %66, align 4
  store i32 134517475, i32* %67, align 4
  %75 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i22.i, i32 inreg noundef %61, i32 noundef %60, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !15
  %76 = lshr i64 %75, 32
  %77 = trunc i64 %76 to i32
  %tmp2_v.i84.i = add i32 %73, -21
  %78 = inttoptr i32 %tmp2_v.i84.i to i8*
  store i8 0, i8* %78, align 1
  %tmp2_v1.i85.i = add i32 %73, -16
  %79 = inttoptr i32 %tmp2_v1.i85.i to i32*
  store i32 0, i32* %79, align 4
  store i32 %tmp2_v.i84.i, i32* %74, align 4
  %tmp2_v5.i89.i = add i32 %73, -20
  %80 = inttoptr i32 %tmp2_v5.i89.i to i32*
  %81 = load i32, i32* %80, align 4
  store i32 %81, i32* %66, align 4
  store i32 134517504, i32* %67, align 4
  store i32 %73, i32* %68, align 4
  store i32 134518078, i32* %69, align 4
  %82 = load i32, i32* %66, align 4
  store i32 %82, i32* %69, align 4
  %tmp2_v3.i.i.i = add i32 %60, -16
  %83 = inttoptr i32 %tmp2_v3.i.i.i to i32*
  store i32 134518091, i32* %83, align 4
  %tmp2_v.i.i.i.i = add i32 %60, -20
  %84 = inttoptr i32 %tmp2_v.i.i.i.i to i32*
  store i32 %tmp2_v.i2.i.i24, i32* %84, align 4
  %tmp2_v1.i.i.i.i = add i32 %60, -24
  %85 = inttoptr i32 %tmp2_v1.i.i.i.i to i32*
  store i32 134518048, i32* %85, align 4
  %86 = load i32, i32* %69, align 4
  %tmp2_v2.i.i.i.i = add i32 %86, 8
  %87 = inttoptr i32 %tmp2_v2.i.i.i.i to i32*
  %88 = load i32, i32* %87, align 4
  %.not.i.i.i.not.i = icmp eq i32 %88, 0
  %89 = load i32, i32* %84, align 4
  %tmp2_v.i7.i.i = add i32 %89, 12
  %90 = inttoptr i32 %tmp2_v.i7.i.i to i32*
  %91 = load i32, i32* %90, align 4
  %92 = inttoptr i32 %91 to i8*
  br i1 %.not.i.i.i.not.i, label %BB_8049552.i.i, label %BB_804955F.i.i

BB_804955F.i.i:                                   ; preds = %Func_8049255.exit.i
  store i8 1, i8* %92, align 1
  %tmp2_v1.i.i.i32 = add i32 %89, 8
  %93 = inttoptr i32 %tmp2_v1.i.i.i32 to i32*
  %94 = load i32, i32* %93, align 4
  %95 = inttoptr i32 %94 to i32*
  %96 = load i32, i32* %95, align 4
  %97 = inttoptr i32 %96 to i32*
  %98 = load i32, i32* %97, align 4
  br label %Func_peek.exit

BB_8049552.i.i:                                   ; preds = %Func_8049255.exit.i
  store i8 0, i8* %92, align 1
  %.pre.i = add i32 %89, 8
  %.pre = inttoptr i32 %.pre.i to i32*
  br label %Func_peek.exit

Func_peek.exit:                                   ; preds = %BB_8049552.i.i, %BB_804955F.i.i
  %.pre-phi = phi i32* [ %93, %BB_804955F.i.i ], [ %.pre, %BB_8049552.i.i ]
  %tmp4_v2.i.i.pre-phi.i = phi i32 [ %tmp2_v1.i.i.i32, %BB_804955F.i.i ], [ %.pre.i, %BB_8049552.i.i ]
  %r_eax.0.i = phi i32 [ %98, %BB_804955F.i.i ], [ 0, %BB_8049552.i.i ]
  %99 = inttoptr i32 %89 to i32*
  %100 = load i32, i32* %99, align 4
  %tmp2_v.i150.i = add i32 %100, -16
  %101 = inttoptr i32 %tmp2_v.i150.i to i32*
  store i32 %r_eax.0.i, i32* %101, align 4
  %tmp2_v1.i152.i = add i32 %100, -21
  %tmp2_v2.i35.i = add i32 %tmp4_v2.i.i.pre-phi.i, 4
  %102 = inttoptr i32 %tmp2_v2.i35.i to i32*
  store i32 %r_eax.0.i, i32* %102, align 4
  %tmp2_v3.i37.i = add i32 %63, -8132
  store i32 %tmp2_v3.i37.i, i32* %.pre-phi, align 4
  %tmp2_v5.i39.i = add i32 %tmp4_v2.i.i.pre-phi.i, -4
  %103 = inttoptr i32 %tmp2_v5.i39.i to i32*
  store i32 134517536, i32* %103, align 4
  %104 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i22.i, i32 inreg noundef %77, i32 noundef %tmp4_v2.i.i.pre-phi.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !15
  %105 = lshr i64 %104, 32
  %106 = trunc i64 %105 to i32
  store i32 %tmp2_v1.i152.i, i32* %102, align 4
  %tmp2_v3.i105.i = add i32 %100, -20
  %107 = inttoptr i32 %tmp2_v3.i105.i to i32*
  %108 = load i32, i32* %107, align 4
  store i32 %108, i32* %.pre-phi, align 4
  store i32 134517554, i32* %103, align 4
  %109 = tail call fastcc { i32, i32, i32, i32, i32 } @Func_dequeue(i32 %tmp2_v5.i39.i, i32 %106, i32 %100, i32 %63)
  %110 = extractvalue { i32, i32, i32, i32, i32 } %109, 0
  %111 = extractvalue { i32, i32, i32, i32, i32 } %109, 1
  %112 = extractvalue { i32, i32, i32, i32, i32 } %109, 2
  %113 = extractvalue { i32, i32, i32, i32, i32 } %109, 3
  %114 = extractvalue { i32, i32, i32, i32, i32 } %109, 4
  %tmp2_v.i3.i = add i32 %113, -16
  %115 = inttoptr i32 %tmp2_v.i3.i to i32*
  store i32 %111, i32* %115, align 4
  %tmp2_v1.i.i = add i32 %113, -21
  %tmp2_v2.i76.i = add i32 %110, 4
  %116 = inttoptr i32 %tmp2_v2.i76.i to i32*
  store i32 %111, i32* %116, align 4
  %tmp2_v3.i78.i = add i32 %114, -8111
  %117 = inttoptr i32 %110 to i32*
  store i32 %tmp2_v3.i78.i, i32* %117, align 4
  %tmp2_v5.i80.i = add i32 %110, -4
  %118 = inttoptr i32 %tmp2_v5.i80.i to i32*
  store i32 134517586, i32* %118, align 4
  %119 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i22.i, i32 inreg noundef %112, i32 noundef %110, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !15
  %120 = lshr i64 %119, 32
  %121 = trunc i64 %120 to i32
  store i32 %tmp2_v1.i.i, i32* %116, align 4
  %tmp2_v3.i120.i = add i32 %113, -20
  %122 = inttoptr i32 %tmp2_v3.i120.i to i32*
  %123 = load i32, i32* %122, align 4
  store i32 %123, i32* %117, align 4
  store i32 134517604, i32* %118, align 4
  %tmp2_v.i10.i.i40 = add i32 %110, -8
  %124 = inttoptr i32 %tmp2_v.i10.i.i40 to i32*
  store i32 %113, i32* %124, align 4
  %tmp2_v1.i12.i.i41 = add i32 %110, -12
  %125 = inttoptr i32 %tmp2_v1.i12.i.i41 to i32*
  store i32 134518078, i32* %125, align 4
  %126 = load i32, i32* %117, align 4
  store i32 %126, i32* %125, align 4
  %tmp2_v3.i.i.i42 = add i32 %110, -16
  %127 = inttoptr i32 %tmp2_v3.i.i.i42 to i32*
  store i32 134518091, i32* %127, align 4
  %tmp2_v.i.i.i.i43 = add i32 %110, -20
  %128 = inttoptr i32 %tmp2_v.i.i.i.i43 to i32*
  store i32 %tmp2_v.i10.i.i40, i32* %128, align 4
  %tmp2_v1.i.i.i.i44 = add i32 %110, -24
  %129 = inttoptr i32 %tmp2_v1.i.i.i.i44 to i32*
  store i32 134518048, i32* %129, align 4
  %130 = load i32, i32* %125, align 4
  %tmp2_v2.i.i.i.i45 = add i32 %130, 8
  %131 = inttoptr i32 %tmp2_v2.i.i.i.i45 to i32*
  %132 = load i32, i32* %131, align 4
  %.not.i.i.i.not.i46 = icmp eq i32 %132, 0
  %133 = load i32, i32* %128, align 4
  %tmp2_v.i7.i.i47 = add i32 %133, 12
  %134 = inttoptr i32 %tmp2_v.i7.i.i47 to i32*
  %135 = load i32, i32* %134, align 4
  %136 = inttoptr i32 %135 to i8*
  br i1 %.not.i.i.i.not.i46, label %BB_8049552.i.i51, label %BB_804955F.i.i49

BB_804955F.i.i49:                                 ; preds = %Func_peek.exit
  store i8 1, i8* %136, align 1
  %tmp2_v1.i.i.i48 = add i32 %133, 8
  %137 = inttoptr i32 %tmp2_v1.i.i.i48 to i32*
  %138 = load i32, i32* %137, align 4
  %139 = inttoptr i32 %138 to i32*
  %140 = load i32, i32* %139, align 4
  %141 = inttoptr i32 %140 to i32*
  %142 = load i32, i32* %141, align 4
  br label %Func_peek.exit57

BB_8049552.i.i51:                                 ; preds = %Func_peek.exit
  store i8 0, i8* %136, align 1
  %.pre.i50 = add i32 %133, 8
  %.pre109 = inttoptr i32 %.pre.i50 to i32*
  br label %Func_peek.exit57

Func_peek.exit57:                                 ; preds = %BB_8049552.i.i51, %BB_804955F.i.i49
  %.pre-phi110 = phi i32* [ %137, %BB_804955F.i.i49 ], [ %.pre109, %BB_8049552.i.i51 ]
  %tmp4_v2.i.i.pre-phi.i52 = phi i32 [ %tmp2_v1.i.i.i48, %BB_804955F.i.i49 ], [ %.pre.i50, %BB_8049552.i.i51 ]
  %r_eax.0.i53 = phi i32 [ %142, %BB_804955F.i.i49 ], [ 0, %BB_8049552.i.i51 ]
  %143 = inttoptr i32 %133 to i32*
  %144 = load i32, i32* %143, align 4
  %tmp2_v.i219.i = add i32 %144, -16
  %145 = inttoptr i32 %tmp2_v.i219.i to i32*
  store i32 %r_eax.0.i53, i32* %145, align 4
  %tmp2_v1.i221.i = add i32 %144, -21
  %tmp2_v2.i309.i = add i32 %tmp4_v2.i.i.pre-phi.i52, 4
  %146 = inttoptr i32 %tmp2_v2.i309.i to i32*
  store i32 %r_eax.0.i53, i32* %146, align 4
  %tmp2_v3.i311.i = add i32 %114, -8132
  store i32 %tmp2_v3.i311.i, i32* %.pre-phi110, align 4
  %tmp2_v5.i313.i = add i32 %tmp4_v2.i.i.pre-phi.i52, -4
  %147 = inttoptr i32 %tmp2_v5.i313.i to i32*
  store i32 134517636, i32* %147, align 4
  %148 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i22.i, i32 inreg noundef %121, i32 noundef %tmp4_v2.i.i.pre-phi.i52, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !15
  %149 = lshr i64 %148, 32
  %150 = trunc i64 %149 to i32
  store i32 %tmp2_v1.i221.i, i32* %146, align 4
  %tmp2_v3.i54.i = add i32 %144, -20
  %151 = inttoptr i32 %tmp2_v3.i54.i to i32*
  %152 = load i32, i32* %151, align 4
  store i32 %152, i32* %.pre-phi110, align 4
  store i32 134517654, i32* %147, align 4
  %153 = tail call fastcc { i32, i32, i32, i32, i32 } @Func_dequeue(i32 %tmp2_v5.i313.i, i32 %150, i32 %144, i32 %114)
  %154 = extractvalue { i32, i32, i32, i32, i32 } %153, 0
  %155 = extractvalue { i32, i32, i32, i32, i32 } %153, 1
  %156 = extractvalue { i32, i32, i32, i32, i32 } %153, 2
  %157 = extractvalue { i32, i32, i32, i32, i32 } %153, 3
  %158 = extractvalue { i32, i32, i32, i32, i32 } %153, 4
  %tmp2_v.i279.i = add i32 %157, -16
  %159 = inttoptr i32 %tmp2_v.i279.i to i32*
  store i32 %155, i32* %159, align 4
  %tmp2_v1.i281.i = add i32 %157, -21
  %tmp2_v2.i238.i = add i32 %154, 4
  %160 = inttoptr i32 %tmp2_v2.i238.i to i32*
  store i32 %155, i32* %160, align 4
  %tmp2_v3.i240.i = add i32 %158, -8111
  %161 = inttoptr i32 %154 to i32*
  store i32 %tmp2_v3.i240.i, i32* %161, align 4
  %tmp2_v5.i242.i = add i32 %154, -4
  %162 = inttoptr i32 %tmp2_v5.i242.i to i32*
  store i32 134517686, i32* %162, align 4
  %163 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i22.i, i32 inreg noundef %156, i32 noundef %154, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !15
  %164 = lshr i64 %163, 32
  %165 = trunc i64 %164 to i32
  store i32 %tmp2_v1.i281.i, i32* %160, align 4
  %tmp2_v3.i129.i = add i32 %157, -20
  %166 = inttoptr i32 %tmp2_v3.i129.i to i32*
  %167 = load i32, i32* %166, align 4
  store i32 %167, i32* %161, align 4
  store i32 134517704, i32* %162, align 4
  %tmp2_v.i10.i.i62 = add i32 %154, -8
  %168 = inttoptr i32 %tmp2_v.i10.i.i62 to i32*
  store i32 %157, i32* %168, align 4
  %tmp2_v1.i12.i.i63 = add i32 %154, -12
  %169 = inttoptr i32 %tmp2_v1.i12.i.i63 to i32*
  store i32 134518078, i32* %169, align 4
  %170 = load i32, i32* %161, align 4
  store i32 %170, i32* %169, align 4
  %tmp2_v3.i.i.i64 = add i32 %154, -16
  %171 = inttoptr i32 %tmp2_v3.i.i.i64 to i32*
  store i32 134518091, i32* %171, align 4
  %tmp2_v.i.i.i.i65 = add i32 %154, -20
  %172 = inttoptr i32 %tmp2_v.i.i.i.i65 to i32*
  store i32 %tmp2_v.i10.i.i62, i32* %172, align 4
  %tmp2_v1.i.i.i.i66 = add i32 %154, -24
  %173 = inttoptr i32 %tmp2_v1.i.i.i.i66 to i32*
  store i32 134518048, i32* %173, align 4
  %174 = load i32, i32* %169, align 4
  %tmp2_v2.i.i.i.i67 = add i32 %174, 8
  %175 = inttoptr i32 %tmp2_v2.i.i.i.i67 to i32*
  %176 = load i32, i32* %175, align 4
  %.not.i.i.i.not.i68 = icmp eq i32 %176, 0
  %177 = load i32, i32* %172, align 4
  %tmp2_v.i7.i.i69 = add i32 %177, 12
  %178 = inttoptr i32 %tmp2_v.i7.i.i69 to i32*
  %179 = load i32, i32* %178, align 4
  %180 = inttoptr i32 %179 to i8*
  br i1 %.not.i.i.i.not.i68, label %BB_8049552.i.i73, label %BB_804955F.i.i71

BB_804955F.i.i71:                                 ; preds = %Func_peek.exit57
  store i8 1, i8* %180, align 1
  %tmp2_v1.i.i.i70 = add i32 %177, 8
  %181 = inttoptr i32 %tmp2_v1.i.i.i70 to i32*
  %182 = load i32, i32* %181, align 4
  %183 = inttoptr i32 %182 to i32*
  %184 = load i32, i32* %183, align 4
  %185 = inttoptr i32 %184 to i32*
  %186 = load i32, i32* %185, align 4
  br label %Func_peek.exit79

BB_8049552.i.i73:                                 ; preds = %Func_peek.exit57
  store i8 0, i8* %180, align 1
  %.pre.i72 = add i32 %177, 8
  %.pre111 = inttoptr i32 %.pre.i72 to i32*
  br label %Func_peek.exit79

Func_peek.exit79:                                 ; preds = %BB_8049552.i.i73, %BB_804955F.i.i71
  %.pre-phi112 = phi i32* [ %181, %BB_804955F.i.i71 ], [ %.pre111, %BB_8049552.i.i73 ]
  %tmp4_v2.i.i.pre-phi.i74 = phi i32 [ %tmp2_v1.i.i.i70, %BB_804955F.i.i71 ], [ %.pre.i72, %BB_8049552.i.i73 ]
  %r_eax.0.i75 = phi i32 [ %186, %BB_804955F.i.i71 ], [ 0, %BB_8049552.i.i73 ]
  %187 = inttoptr i32 %177 to i32*
  %188 = load i32, i32* %187, align 4
  %tmp2_v.i8.i = add i32 %188, -16
  %189 = inttoptr i32 %tmp2_v.i8.i to i32*
  store i32 %r_eax.0.i75, i32* %189, align 4
  %tmp2_v1.i10.i = add i32 %188, -21
  %tmp2_v2.i248.i = add i32 %tmp4_v2.i.i.pre-phi.i74, 4
  %190 = inttoptr i32 %tmp2_v2.i248.i to i32*
  store i32 %r_eax.0.i75, i32* %190, align 4
  %tmp2_v3.i250.i = add i32 %158, -8132
  store i32 %tmp2_v3.i250.i, i32* %.pre-phi112, align 4
  %tmp2_v5.i252.i = add i32 %tmp4_v2.i.i.pre-phi.i74, -4
  %191 = inttoptr i32 %tmp2_v5.i252.i to i32*
  store i32 134517736, i32* %191, align 4
  %192 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i22.i, i32 inreg noundef %165, i32 noundef %tmp4_v2.i.i.pre-phi.i74, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !15
  %193 = lshr i64 %192, 32
  %194 = trunc i64 %193 to i32
  store i32 %tmp2_v1.i10.i, i32* %190, align 4
  %tmp2_v3.i170.i = add i32 %188, -20
  %195 = inttoptr i32 %tmp2_v3.i170.i to i32*
  %196 = load i32, i32* %195, align 4
  store i32 %196, i32* %.pre-phi112, align 4
  store i32 134517754, i32* %191, align 4
  %197 = tail call fastcc { i32, i32, i32, i32, i32 } @Func_dequeue(i32 %tmp2_v5.i252.i, i32 %194, i32 %188, i32 %158)
  %198 = extractvalue { i32, i32, i32, i32, i32 } %197, 0
  %199 = extractvalue { i32, i32, i32, i32, i32 } %197, 1
  %200 = extractvalue { i32, i32, i32, i32, i32 } %197, 2
  %201 = extractvalue { i32, i32, i32, i32, i32 } %197, 3
  %202 = extractvalue { i32, i32, i32, i32, i32 } %197, 4
  %tmp2_v.i206.i = add i32 %201, -16
  %203 = inttoptr i32 %tmp2_v.i206.i to i32*
  store i32 %199, i32* %203, align 4
  %tmp2_v1.i208.i = add i32 %201, -21
  %tmp2_v2.i18.i = add i32 %198, 4
  %204 = inttoptr i32 %tmp2_v2.i18.i to i32*
  store i32 %199, i32* %204, align 4
  %tmp2_v3.i.i = add i32 %202, -8111
  %205 = inttoptr i32 %198 to i32*
  store i32 %tmp2_v3.i.i, i32* %205, align 4
  %tmp2_v5.i.i = add i32 %198, -4
  %206 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 134517786, i32* %206, align 4
  %207 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i22.i, i32 inreg noundef %200, i32 noundef %198, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !15
  store i32 %tmp2_v1.i208.i, i32* %204, align 4
  %tmp2_v3.i186.i = add i32 %201, -20
  %208 = inttoptr i32 %tmp2_v3.i186.i to i32*
  %209 = load i32, i32* %208, align 4
  store i32 %209, i32* %205, align 4
  store i32 134517804, i32* %206, align 4
  %tmp2_v.i10.i.i84 = add i32 %198, -8
  %210 = inttoptr i32 %tmp2_v.i10.i.i84 to i32*
  store i32 %201, i32* %210, align 4
  %tmp2_v1.i12.i.i85 = add i32 %198, -12
  %211 = inttoptr i32 %tmp2_v1.i12.i.i85 to i32*
  store i32 134518078, i32* %211, align 4
  %212 = load i32, i32* %205, align 4
  store i32 %212, i32* %211, align 4
  %tmp2_v3.i.i.i86 = add i32 %198, -16
  %213 = inttoptr i32 %tmp2_v3.i.i.i86 to i32*
  store i32 134518091, i32* %213, align 4
  %tmp2_v.i.i.i.i87 = add i32 %198, -20
  %214 = inttoptr i32 %tmp2_v.i.i.i.i87 to i32*
  store i32 %tmp2_v.i10.i.i84, i32* %214, align 4
  %tmp2_v1.i.i.i.i88 = add i32 %198, -24
  %215 = inttoptr i32 %tmp2_v1.i.i.i.i88 to i32*
  store i32 134518048, i32* %215, align 4
  %216 = load i32, i32* %211, align 4
  %tmp2_v2.i.i.i.i89 = add i32 %216, 8
  %217 = inttoptr i32 %tmp2_v2.i.i.i.i89 to i32*
  %218 = load i32, i32* %217, align 4
  %.not.i.i.i.not.i90 = icmp eq i32 %218, 0
  %219 = load i32, i32* %214, align 4
  %tmp2_v.i7.i.i91 = add i32 %219, 12
  %220 = inttoptr i32 %tmp2_v.i7.i.i91 to i32*
  %221 = load i32, i32* %220, align 4
  %222 = inttoptr i32 %221 to i8*
  br i1 %.not.i.i.i.not.i90, label %BB_8049552.i.i95, label %BB_804955F.i.i93

BB_804955F.i.i93:                                 ; preds = %Func_peek.exit79
  store i8 1, i8* %222, align 1
  %tmp2_v1.i.i.i92 = add i32 %219, 8
  %223 = inttoptr i32 %tmp2_v1.i.i.i92 to i32*
  %224 = load i32, i32* %223, align 4
  %225 = inttoptr i32 %224 to i32*
  %226 = load i32, i32* %225, align 4
  %227 = inttoptr i32 %226 to i32*
  %228 = load i32, i32* %227, align 4
  br label %Func_peek.exit101

BB_8049552.i.i95:                                 ; preds = %Func_peek.exit79
  store i8 0, i8* %222, align 1
  %.pre.i94 = add i32 %219, 8
  %.pre113 = inttoptr i32 %.pre.i94 to i32*
  br label %Func_peek.exit101

Func_peek.exit101:                                ; preds = %BB_8049552.i.i95, %BB_804955F.i.i93
  %.pre-phi114 = phi i32* [ %223, %BB_804955F.i.i93 ], [ %.pre113, %BB_8049552.i.i95 ]
  %tmp4_v2.i.i.pre-phi.i96 = phi i32 [ %tmp2_v1.i.i.i92, %BB_804955F.i.i93 ], [ %.pre.i94, %BB_8049552.i.i95 ]
  %r_eax.0.i97 = phi i32 [ %228, %BB_804955F.i.i93 ], [ 0, %BB_8049552.i.i95 ]
  %229 = lshr i64 %207, 32
  %230 = trunc i64 %229 to i32
  %231 = inttoptr i32 %219 to i32*
  %232 = load i32, i32* %231, align 4
  %tmp2_v.i43.i = add i32 %232, -16
  %233 = inttoptr i32 %tmp2_v.i43.i to i32*
  store i32 %r_eax.0.i97, i32* %233, align 4
  %tmp2_v1.i45.i = add i32 %232, -21
  %tmp2_v.i192.i = add i32 %202, -8088
  store i32 %tmp2_v.i192.i, i32* %.pre-phi114, align 4
  %tmp2_v2.i194.i = add i32 %tmp4_v2.i.i.pre-phi.i96, -4
  %234 = inttoptr i32 %tmp2_v2.i194.i to i32*
  store i32 134517836, i32* %234, align 4
  %arg.i.i102 = load i32, i32* %.pre-phi114, align 4
  %235 = inttoptr i32 %arg.i.i102 to i8*
  %236 = tail call i32 @puts(i8* nonnull dereferenceable(1) %235)
  %tmp2_v2.i229.i = add i32 %tmp4_v2.i.i.pre-phi.i96, 4
  %237 = inttoptr i32 %tmp2_v2.i229.i to i32*
  store i32 %tmp2_v1.i45.i, i32* %237, align 4
  %tmp2_v3.i230.i = add i32 %232, -20
  %238 = inttoptr i32 %tmp2_v3.i230.i to i32*
  %239 = load i32, i32* %238, align 4
  store i32 %239, i32* %.pre-phi114, align 4
  store i32 134517854, i32* %234, align 4
  %240 = tail call fastcc { i32, i32, i32, i32, i32 } @Func_dequeue(i32 %tmp2_v2.i194.i, i32 %230, i32 %232, i32 %202)
  %241 = extractvalue { i32, i32, i32, i32, i32 } %240, 0
  %242 = extractvalue { i32, i32, i32, i32, i32 } %240, 1
  %243 = extractvalue { i32, i32, i32, i32, i32 } %240, 3
  %244 = extractvalue { i32, i32, i32, i32, i32 } %240, 4
  %tmp2_v.i158.i = add i32 %243, -16
  %245 = inttoptr i32 %tmp2_v.i158.i to i32*
  store i32 %242, i32* %245, align 4
  %tmp2_v.i301.i = add i32 %244, -8069
  %246 = inttoptr i32 %241 to i32*
  store i32 %tmp2_v.i301.i, i32* %246, align 4
  %tmp2_v2.i303.i = add i32 %241, -4
  %247 = inttoptr i32 %tmp2_v2.i303.i to i32*
  store i32 134517886, i32* %247, align 4
  %arg.i.i103 = load i32, i32* %246, align 4
  %248 = inttoptr i32 %arg.i.i103 to i8*
  %249 = tail call i32 @puts(i8* nonnull dereferenceable(1) %248)
  %tmp2_v.i60.i = add i32 %243, -20
  %250 = inttoptr i32 %tmp2_v.i60.i to i32*
  %251 = load i32, i32* %250, align 4
  store i32 %251, i32* %246, align 4
  store i32 134517900, i32* %247, align 4
  %tmp2_v.i.i.i104 = add i32 %241, -8
  %252 = inttoptr i32 %tmp2_v.i.i.i104 to i32*
  store i32 %243, i32* %252, align 4
  %tmp2_v1.i.i.i105 = add i32 %241, -12
  %253 = inttoptr i32 %tmp2_v1.i.i.i105 to i32*
  store i32 %244, i32* %253, align 4
  %tmp2_v2.i.i.i106 = add i32 %241, -36
  %254 = inttoptr i32 %tmp2_v2.i.i.i106 to i32*
  store i32 134518434, i32* %254, align 4
  %255 = load i32, i32* %246, align 4
  %256 = inttoptr i32 %255 to i32*
  %257 = load i32, i32* %256, align 4
  %tmp2_v3.i11.i.i = add i32 %241, -24
  %258 = inttoptr i32 %tmp2_v3.i11.i.i to i32*
  store i32 %257, i32* %258, align 4
  %259 = load i32, i32* %246, align 4
  %tmp2_v2.i5.i.i = add i32 %241, -48
  %260 = inttoptr i32 %tmp2_v2.i5.i.i to i32*
  store i32 %259, i32* %260, align 4
  %tmp2_v3.i.i.i107 = add i32 %241, -52
  %261 = inttoptr i32 %tmp2_v3.i.i.i107 to i32*
  store i32 134518496, i32* %261, align 4
  %arg.i.i.i108 = load i32, i32* %260, align 4
  tail call void @free(i32 %arg.i.i.i108)
  ret void
}

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
!12 = !{i32 0, i32 2, i32 3}
!13 = !{i32 0, i32 2, i32 3, i32 4}
!14 = !{i32 0, i32 0, i32 0}
!15 = !{!"printf"}

  tail call fastcc void @queue_linked_listm15161636(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) nounwind