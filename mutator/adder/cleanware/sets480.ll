; Mutation 480
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack = internal global [4194304 x i32] zeroinitializer, align 16
@onUnfallback = common local_unnamed_addr global i1 false
@str.466 = constant [4 x i8] c"%d\0a\00"
@str.467 = constant [4 x i8] c"%d,\00"
@str.468 = constant [4 x i8] c"%d\0a\00"
@str.469 = constant [4 x i8] c"%d,\00"
@str.470 = constant [4 x i8] c"%d\0a\00"
@str.471 = constant [4 x i8] c"%d,\00"
@str.472 = constant [4 x i8] c"%d\0a\00"
@str.473 = constant [4 x i8] c"%d,\00"
@str.474 = constant [4 x i8] c"%d\0a\00"
@str.475 = constant [4 x i8] c"%d,\00"
@str.476 = constant [4 x i8] c"%d\0a\00"
@str.477 = constant [4 x i8] c"%d,\00"
@str.478 = constant [4 x i8] c"%d\0a\00"
@str.479 = constant [4 x i8] c"%d,\00"

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define internal fastcc void @helper_fldl_ST0(i64 noundef %0) unnamed_addr  mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87"  {
._crit_edge:
  %1 = load i32, i32* @fpstt, align 16
  %.pre = and i64 %0, 4503599627370495
  %.pre1 = and i64 %0, 9218868437227405312
  %phi.cmp = icmp ne i64 %.pre1, 9218868437227405312
  %phi.cmp3 = icmp eq i64 %.pre, 0
  %2 = or i1 %phi.cmp, %phi.cmp3
  br i1 %2, label %float64_to_floatx80.18.exit, label %3

3:                                                ; preds = %._crit_edge
  %4 = and i64 %0, 9221120237041090560
  %5 = icmp ne i64 %4, 9218868437227405312
  %6 = and i64 %0, 2251799813685247
  %7 = icmp eq i64 %6, 0
  %8 = or i1 %5, %7
  br i1 %8, label %float64_to_floatx80.18.exit, label %.sink.split.i

.sink.split.i:                                    ; preds = %3
  %9 = load i8, i8* @fp_status.0, align 1
  %10 = or i8 %9, 1
  store i8 %10, i8* @fp_status.0, align 1
  br label %float64_to_floatx80.18.exit

float64_to_floatx80.18.exit:                      ; preds = %.sink.split.i, %3, %._crit_edge
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
declare i32 @realloc(i32, i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare i32 @malloc(i32) local_unnamed_addr  noinline 

; Function Attrs: nofree norecurse nosync nounwind
define internal fastcc { i32, i32, i32, i32 } @Func_is_subset(i32 %arg_esp, i32 %arg_edx, i32 %arg_ebp) unnamed_addr  nofree norecurse nosync nounwind  !retregs !12 {
  %tmp2_v.i32.i = add i32 %arg_esp, -4
  %1 = inttoptr i32 %tmp2_v.i32.i to i32*
  store i32 %arg_ebp, i32* %1, align 4
  %tmp2_v1.i35.i = add i32 %arg_esp, -24
  %2 = inttoptr i32 %tmp2_v1.i35.i to i32*
  store i32 134519044, i32* %2, align 4
  %tmp2_v.i25.i = add i32 %arg_esp, -8
  %3 = inttoptr i32 %tmp2_v.i25.i to i32*
  store i32 0, i32* %3, align 4
  %tmp2_v.i.i17 = add i32 %arg_esp, 4
  %4 = inttoptr i32 %tmp2_v.i.i17 to i32*
  %5 = load i32, i32* %4, align 4
  %tmp2_v1.i.i18 = add i32 %5, 4
  %6 = inttoptr i32 %tmp2_v1.i.i18 to i32*
  %7 = load i32, i32* %6, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %BB_8049912.i.lr.ph, label %.exit

BB_8049912.i.lr.ph:                               ; preds = %0
  %tmp2_v10.i.i = add i32 %arg_esp, -28
  %9 = inttoptr i32 %tmp2_v10.i.i to i32*
  %tmp2_v11.i.i = add i32 %arg_esp, -32
  %10 = inttoptr i32 %tmp2_v11.i.i to i32*
  %tmp2_v.i.i.i = add i32 %arg_esp, -36
  %11 = inttoptr i32 %tmp2_v.i.i.i to i32*
  %tmp2_v1.i.i.i = add i32 %arg_esp, -56
  %12 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  %tmp2_v.i9.i.i = add i32 %arg_esp, -40
  %13 = inttoptr i32 %tmp2_v.i9.i.i to i32*
  br label %BB_8049912.i

BB_8049912.i:                                     ; preds = %BB_804993B.i, %BB_8049912.i.lr.ph
  %14 = phi i32 [ 0, %BB_8049912.i.lr.ph ], [ %tmp0_v1.i12.i, %BB_804993B.i ]
  %15 = phi i32 [ %5, %BB_8049912.i.lr.ph ], [ %41, %BB_804993B.i ]
  %r_ebp.020 = phi i32 [ %tmp2_v.i32.i, %BB_8049912.i.lr.ph ], [ %37, %BB_804993B.i ]
  %16 = inttoptr i32 %15 to i32*
  %17 = load i32, i32* %16, align 4
  %tmp0_v4.i7.i = shl i32 %14, 2
  %tmp0_v5.i.i = add i32 %17, %tmp0_v4.i7.i
  %18 = inttoptr i32 %tmp0_v5.i.i to i32*
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %2, align 4
  %tmp2_v8.i.i = add i32 %r_ebp.020, 12
  %20 = inttoptr i32 %tmp2_v8.i.i to i32*
  %21 = load i32, i32* %20, align 4
  store i32 %21, i32* %9, align 4
  store i32 134519082, i32* %10, align 4
  store i32 %r_ebp.020, i32* %11, align 4
  store i32 134518319, i32* %12, align 4
  store i32 0, i32* %13, align 4
  %22 = load i32, i32* %9, align 4
  %tmp2_v1.i22.i12.i = add i32 %22, 4
  %23 = inttoptr i32 %tmp2_v1.i22.i12.i to i32*
  %24 = load i32, i32* %23, align 4
  %25 = icmp sgt i32 %24, 0
  br i1 %25, label %BB_804963D.i.i, label %Func_is_member.exit.thread

BB_804963D.i.i:                                   ; preds = %BB_804965C.i.i, %BB_8049912.i
  %26 = phi i32 [ %32, %BB_804965C.i.i ], [ %22, %BB_8049912.i ]
  %storemerge13.i = phi i32 [ %tmp0_v1.i13.i.i, %BB_804965C.i.i ], [ 0, %BB_8049912.i ]
  %27 = inttoptr i32 %26 to i32*
  %28 = load i32, i32* %27, align 4
  %tmp0_v4.i.i.i = shl i32 %storemerge13.i, 2
  %tmp0_v5.i.i.i = add i32 %28, %tmp0_v4.i.i.i
  %29 = inttoptr i32 %tmp0_v5.i.i.i to i32*
  %30 = load i32, i32* %29, align 4
  %31 = load i32, i32* %2, align 4
  %.not.i.i.i = icmp eq i32 %31, %30
  %tmp0_v1.i13.i.i = add nuw nsw i32 %storemerge13.i, 1
  br i1 %.not.i.i.i, label %BB_804993B.i, label %BB_804965C.i.i

BB_804965C.i.i:                                   ; preds = %BB_804963D.i.i
  store i32 %tmp0_v1.i13.i.i, i32* %13, align 4
  %32 = load i32, i32* %9, align 4
  %tmp2_v1.i22.i.i = add i32 %32, 4
  %33 = inttoptr i32 %tmp2_v1.i22.i.i to i32*
  %34 = load i32, i32* %33, align 4
  %35 = icmp slt i32 %tmp0_v1.i13.i.i, %34
  br i1 %35, label %BB_804963D.i.i, label %Func_is_member.exit.thread

Func_is_member.exit.thread:                       ; preds = %BB_804965C.i.i, %BB_8049912.i
  %r_edx.1.i.ph = phi i32 [ %tmp0_v4.i.i.i, %BB_804965C.i.i ], [ %tmp0_v4.i7.i, %BB_8049912.i ]
  %36 = load i32, i32* %11, align 4
  br label %.exit.loopexit

BB_804993B.i:                                     ; preds = %BB_804963D.i.i
  %37 = load i32, i32* %11, align 4
  %tmp2_v.i10.i = add i32 %37, -4
  %38 = inttoptr i32 %tmp2_v.i10.i to i32*
  %39 = load i32, i32* %38, align 4
  %tmp0_v1.i12.i = add i32 %39, 1
  store i32 %tmp0_v1.i12.i, i32* %38, align 4
  %tmp2_v.i.i = add i32 %37, 8
  %40 = inttoptr i32 %tmp2_v.i.i to i32*
  %41 = load i32, i32* %40, align 4
  %tmp2_v1.i.i = add i32 %41, 4
  %42 = inttoptr i32 %tmp2_v1.i.i to i32*
  %43 = load i32, i32* %42, align 4
  %44 = icmp slt i32 %tmp0_v1.i12.i, %43
  br i1 %44, label %BB_8049912.i, label %.exit.loopexit

.exit.loopexit:                                   ; preds = %BB_804993B.i, %Func_is_member.exit.thread
  %45 = phi i32 [ %36, %Func_is_member.exit.thread ], [ %37, %BB_804993B.i ]
  %r_edx.1.i27 = phi i32 [ %r_edx.1.i.ph, %Func_is_member.exit.thread ], [ %tmp0_v4.i.i.i, %BB_804993B.i ]
  %r_eax.0.ph = phi i32 [ 0, %Func_is_member.exit.thread ], [ 1, %BB_804993B.i ]
  %.pre = inttoptr i32 %45 to i32*
  br label %.exit

.exit:                                            ; preds = %.exit.loopexit, %0
  %.pre-phi = phi i32* [ %.pre, %.exit.loopexit ], [ %1, %0 ]
  %r_ebp.1 = phi i32 [ %45, %.exit.loopexit ], [ %tmp2_v.i32.i, %0 ]
  %r_eax.0 = phi i32 [ %r_eax.0.ph, %.exit.loopexit ], [ 1, %0 ]
  %r_edx.1 = phi i32 [ %r_edx.1.i27, %.exit.loopexit ], [ %arg_edx, %0 ]
  %46 = load i32, i32* %.pre-phi, align 4
  %tmp4_v2.i30.i = add i32 %r_ebp.1, 8
  %mrv = insertvalue { i32, i32, i32, i32 } undef, i32 %tmp4_v2.i30.i, 0
  %mrv1 = insertvalue { i32, i32, i32, i32 } %mrv, i32 %r_eax.0, 1
  %mrv2 = insertvalue { i32, i32, i32, i32 } %mrv1, i32 %r_edx.1, 2
  %mrv3 = insertvalue { i32, i32, i32, i32 } %mrv2, i32 %46, 3
  ret { i32, i32, i32, i32 } %mrv3
}

; Function Attrs: norecurse
define internal fastcc { i32, i32, i32, i32, i32 } @Func_set_difference(i32 %arg_esp, i32 %arg_ebp, i32 %arg_ebx) unnamed_addr  norecurse  !retregs !13 {
  %tmp2_v.i42.i = add i32 %arg_esp, -4
  %1 = inttoptr i32 %tmp2_v.i42.i to i32*
  store i32 %arg_ebp, i32* %1, align 4
  %tmp2_v1.i45.i = add i32 %arg_esp, -32
  %2 = inttoptr i32 %tmp2_v1.i45.i to i32*
  store i32 134518930, i32* %2, align 4
  %tmp2_v.i7.i.i = add i32 %arg_esp, -36
  %3 = inttoptr i32 %tmp2_v.i7.i.i to i32*
  store i32 %tmp2_v.i42.i, i32* %3, align 4
  %tmp2_v1.i.i.i = add i32 %arg_esp, -40
  %4 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 %arg_ebx, i32* %4, align 4
  %tmp2_v2.i11.i.i = add i32 %arg_esp, -64
  %5 = inttoptr i32 %tmp2_v2.i11.i.i to i32*
  store i32 134518214, i32* %5, align 4
  %tmp2_v.i.i.i = add i32 %arg_esp, -76
  %6 = inttoptr i32 %tmp2_v.i.i.i to i32*
  store i32 8, i32* %6, align 4
  %tmp2_v2.i.i.i = add i32 %arg_esp, -80
  %7 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  store i32 134518230, i32* %7, align 4
  %arg.i.i.i = load i32, i32* %6, align 4
  %8 = tail call i32 @malloc(i32 %arg.i.i.i)
  %tmp2_v.i15.i.i = add i32 %arg_esp, -48
  %9 = inttoptr i32 %tmp2_v.i15.i.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp2_v3.i.i.i = add i32 %8, 4
  %10 = inttoptr i32 %tmp2_v3.i.i.i to i32*
  store i32 0, i32* %10, align 4
  store i32 4, i32* %6, align 4
  store i32 134518256, i32* %7, align 4
  %arg.i.i17.i = load i32, i32* %6, align 4
  %11 = tail call i32 @malloc(i32 %arg.i.i17.i)
  %12 = load i32, i32* %9, align 4
  %13 = inttoptr i32 %12 to i32*
  store i32 %11, i32* %13, align 4
  %14 = load i32, i32* %9, align 4
  %15 = load i32, i32* %4, align 4
  %16 = load i32, i32* %3, align 4
  %tmp2_v.i.i = add i32 %16, -12
  %17 = inttoptr i32 %tmp2_v.i.i to i32*
  store i32 %14, i32* %17, align 4
  %tmp2_v1.i.i = add i32 %16, -16
  %18 = inttoptr i32 %tmp2_v1.i.i to i32*
  store i32 0, i32* %18, align 4
  %tmp2_v.i47.i43 = add i32 %16, 8
  %19 = inttoptr i32 %tmp2_v.i47.i43 to i32*
  %20 = load i32, i32* %19, align 4
  %tmp2_v1.i49.i44 = add i32 %20, 4
  %21 = inttoptr i32 %tmp2_v1.i49.i44 to i32*
  %22 = load i32, i32* %21, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %BB_804989E.i.preheader, label %.exit

BB_804989E.i.preheader:                           ; preds = %0
  %tmp4_v.i.i.i = add i32 %arg_esp, -28
  br label %BB_804989E.i

BB_80498C3.i:                                     ; preds = %BB_804965C.i.i, %BB_804989E.i
  %24 = load i32, i32* %47, align 4
  %tmp2_v.i12.i = add i32 %24, 8
  %25 = inttoptr i32 %tmp2_v.i12.i to i32*
  %26 = load i32, i32* %25, align 4
  %27 = inttoptr i32 %26 to i32*
  %28 = load i32, i32* %27, align 4
  %tmp2_v2.i.i = add i32 %24, -16
  %29 = inttoptr i32 %tmp2_v2.i.i to i32*
  %30 = load i32, i32* %29, align 4
  %tmp0_v4.i.i = shl i32 %30, 2
  %tmp0_v5.i.i = add i32 %tmp0_v4.i.i, %28
  %31 = inttoptr i32 %tmp0_v5.i.i to i32*
  %32 = load i32, i32* %31, align 4
  store i32 %32, i32* %42, align 4
  %tmp2_v9.i.i = add i32 %24, -12
  %33 = inttoptr i32 %tmp2_v9.i.i to i32*
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %45, align 4
  store i32 134519006, i32* %46, align 4
  %35 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v12.i31.i, i32 %tmp0_v4.i.i, i32 %24, i32 %r_ebx.048)
  %newret = extractvalue { i32, i32, i32, i32 } %35, 0
  %newret31 = extractvalue { i32, i32, i32, i32 } %35, 1
  %newret33 = extractvalue { i32, i32, i32, i32 } %35, 2
  %newret35 = extractvalue { i32, i32, i32, i32 } %35, 3
  br label %BB_80498E1.i

BB_804989E.i:                                     ; preds = %BB_80498E1.i, %BB_804989E.i.preheader
  %36 = phi i32 [ %tmp0_v1.i58.i, %BB_80498E1.i ], [ 0, %BB_804989E.i.preheader ]
  %37 = phi i32 [ %68, %BB_80498E1.i ], [ %20, %BB_804989E.i.preheader ]
  %r_ebp.049 = phi i32 [ %r_ebp.1, %BB_80498E1.i ], [ %16, %BB_804989E.i.preheader ]
  %r_ebx.048 = phi i32 [ %r_ebx.1, %BB_80498E1.i ], [ %15, %BB_804989E.i.preheader ]
  %r_esp.046 = phi i32 [ %r_esp.1, %BB_80498E1.i ], [ %tmp4_v.i.i.i, %BB_804989E.i.preheader ]
  %38 = inttoptr i32 %37 to i32*
  %39 = load i32, i32* %38, align 4
  %tmp0_v4.i22.i = shl i32 %36, 2
  %tmp0_v5.i23.i = add i32 %39, %tmp0_v4.i22.i
  %40 = inttoptr i32 %tmp0_v5.i23.i to i32*
  %41 = load i32, i32* %40, align 4
  %tmp2_v8.i27.i = add i32 %r_esp.046, -12
  %42 = inttoptr i32 %tmp2_v8.i27.i to i32*
  store i32 %41, i32* %42, align 4
  %tmp2_v9.i28.i = add i32 %r_ebp.049, 12
  %43 = inttoptr i32 %tmp2_v9.i28.i to i32*
  %44 = load i32, i32* %43, align 4
  %tmp2_v11.i30.i = add i32 %r_esp.046, -16
  %45 = inttoptr i32 %tmp2_v11.i30.i to i32*
  store i32 %44, i32* %45, align 4
  %tmp2_v12.i31.i = add i32 %r_esp.046, -20
  %46 = inttoptr i32 %tmp2_v12.i31.i to i32*
  store i32 134518969, i32* %46, align 4
  %tmp2_v.i.i.i37 = add i32 %r_esp.046, -24
  %47 = inttoptr i32 %tmp2_v.i.i.i37 to i32*
  store i32 %r_ebp.049, i32* %47, align 4
  %tmp2_v1.i.i.i38 = add i32 %r_esp.046, -44
  %48 = inttoptr i32 %tmp2_v1.i.i.i38 to i32*
  store i32 134518319, i32* %48, align 4
  %tmp2_v.i9.i.i = add i32 %r_esp.046, -28
  %49 = inttoptr i32 %tmp2_v.i9.i.i to i32*
  store i32 0, i32* %49, align 4
  %50 = load i32, i32* %45, align 4
  %tmp2_v1.i22.i12.i = add i32 %50, 4
  %51 = inttoptr i32 %tmp2_v1.i22.i12.i to i32*
  %52 = load i32, i32* %51, align 4
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %BB_804963D.i.i, label %BB_80498C3.i

BB_804963D.i.i:                                   ; preds = %BB_804965C.i.i, %BB_804989E.i
  %54 = phi i32 [ %60, %BB_804965C.i.i ], [ %50, %BB_804989E.i ]
  %storemerge13.i = phi i32 [ %tmp0_v1.i13.i.i, %BB_804965C.i.i ], [ 0, %BB_804989E.i ]
  %55 = inttoptr i32 %54 to i32*
  %56 = load i32, i32* %55, align 4
  %tmp0_v4.i.i.i = shl i32 %storemerge13.i, 2
  %tmp0_v5.i.i.i = add i32 %56, %tmp0_v4.i.i.i
  %57 = inttoptr i32 %tmp0_v5.i.i.i to i32*
  %58 = load i32, i32* %57, align 4
  %59 = load i32, i32* %42, align 4
  %.not.i.i.i = icmp eq i32 %59, %58
  %tmp0_v1.i13.i.i = add nuw nsw i32 %storemerge13.i, 1
  br i1 %.not.i.i.i, label %Func_is_member.exit, label %BB_804965C.i.i

BB_804965C.i.i:                                   ; preds = %BB_804963D.i.i
  store i32 %tmp0_v1.i13.i.i, i32* %49, align 4
  %60 = load i32, i32* %45, align 4
  %tmp2_v1.i22.i.i = add i32 %60, 4
  %61 = inttoptr i32 %tmp2_v1.i22.i.i to i32*
  %62 = load i32, i32* %61, align 4
  %63 = icmp slt i32 %tmp0_v1.i13.i.i, %62
  br i1 %63, label %BB_804963D.i.i, label %BB_80498C3.i

Func_is_member.exit:                              ; preds = %BB_804963D.i.i
  %64 = load i32, i32* %47, align 4
  br label %BB_80498E1.i

BB_80498E1.i:                                     ; preds = %Func_is_member.exit, %BB_80498C3.i
  %r_esp.1.in = phi i32 [ %tmp2_v11.i30.i, %Func_is_member.exit ], [ %newret, %BB_80498C3.i ]
  %r_ebx.1 = phi i32 [ %r_ebx.048, %Func_is_member.exit ], [ %newret35, %BB_80498C3.i ]
  %r_ebp.1 = phi i32 [ %64, %Func_is_member.exit ], [ %newret33, %BB_80498C3.i ]
  %r_edx.1 = phi i32 [ %tmp0_v4.i.i.i, %Func_is_member.exit ], [ %newret31, %BB_80498C3.i ]
  %r_esp.1 = add i32 %r_esp.1.in, 16
  %tmp2_v.i56.i = add i32 %r_ebp.1, -16
  %65 = inttoptr i32 %tmp2_v.i56.i to i32*
  %66 = load i32, i32* %65, align 4
  %tmp0_v1.i58.i = add i32 %66, 1
  store i32 %tmp0_v1.i58.i, i32* %65, align 4
  %tmp2_v.i47.i = add i32 %r_ebp.1, 8
  %67 = inttoptr i32 %tmp2_v.i47.i to i32*
  %68 = load i32, i32* %67, align 4
  %tmp2_v1.i49.i = add i32 %68, 4
  %69 = inttoptr i32 %tmp2_v1.i49.i to i32*
  %70 = load i32, i32* %69, align 4
  %71 = icmp slt i32 %tmp0_v1.i58.i, %70
  br i1 %71, label %BB_804989E.i, label %.exit.loopexit

.exit.loopexit:                                   ; preds = %BB_80498E1.i
  %.pre = add i32 %r_ebp.1, -12
  %.pre54 = inttoptr i32 %.pre to i32*
  br label %.exit

.exit:                                            ; preds = %.exit.loopexit, %0
  %.pre-phi = phi i32* [ %.pre54, %.exit.loopexit ], [ %17, %0 ]
  %r_ebx.0.lcssa = phi i32 [ %r_ebx.1, %.exit.loopexit ], [ %15, %0 ]
  %r_ebp.0.lcssa = phi i32 [ %r_ebp.1, %.exit.loopexit ], [ %16, %0 ]
  %r_edx.0.lcssa = phi i32 [ %r_edx.1, %.exit.loopexit ], [ %11, %0 ]
  %tmp2_v.i47.i.lcssa = phi i32 [ %tmp2_v.i47.i, %.exit.loopexit ], [ %tmp2_v.i47.i43, %0 ]
  %72 = load i32, i32* %.pre-phi, align 4
  %73 = inttoptr i32 %r_ebp.0.lcssa to i32*
  %74 = load i32, i32* %73, align 4
  %mrv = insertvalue { i32, i32, i32, i32, i32 } undef, i32 %tmp2_v.i47.i.lcssa, 0
  %mrv1 = insertvalue { i32, i32, i32, i32, i32 } %mrv, i32 %72, 1
  %mrv2 = insertvalue { i32, i32, i32, i32, i32 } %mrv1, i32 %r_edx.0.lcssa, 2
  %mrv3 = insertvalue { i32, i32, i32, i32, i32 } %mrv2, i32 %74, 3
  %mrv4 = insertvalue { i32, i32, i32, i32, i32 } %mrv3, i32 %r_ebx.0.lcssa, 4
  ret { i32, i32, i32, i32, i32 } %mrv4
}

; Function Attrs: norecurse
define internal fastcc { i32, i32, i32, i32 } @Func_insert(i32 %arg_esp, i32 %arg_edx, i32 %arg_ebp, i32 %arg_ebx) unnamed_addr  norecurse  !retregs !14 {
Func_804968F.exit.i:
  %tmp2_v.i.i = add i32 %arg_esp, -4
  %0 = inttoptr i32 %tmp2_v.i.i to i32*
  store i32 %arg_ebp, i32* %0, align 4
  %tmp2_v1.i.i = add i32 %arg_esp, -8
  %1 = inttoptr i32 %tmp2_v1.i.i to i32*
  store i32 %arg_ebx, i32* %1, align 4
  %tmp2_v2.i.i = add i32 %arg_esp, -16
  %2 = inttoptr i32 %tmp2_v2.i.i to i32*
  store i32 134518398, i32* %2, align 4
  %tmp2_v.i11.i = add i32 %arg_esp, 8
  %3 = inttoptr i32 %tmp2_v.i11.i to i32*
  %4 = load i32, i32* %3, align 4
  store i32 %4, i32* %2, align 4
  %tmp2_v3.i.i = add i32 %arg_esp, 4
  %5 = inttoptr i32 %tmp2_v3.i.i to i32*
  %6 = load i32, i32* %5, align 4
  %tmp2_v5.i.i = add i32 %arg_esp, -20
  %7 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 %6, i32* %7, align 4
  %tmp2_v6.i.i = add i32 %arg_esp, -24
  %8 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 134518415, i32* %8, align 4
  %tmp2_v.i.i.i = add i32 %arg_esp, -28
  %9 = inttoptr i32 %tmp2_v.i.i.i to i32*
  store i32 %tmp2_v.i.i, i32* %9, align 4
  %tmp2_v1.i.i.i = add i32 %arg_esp, -48
  %10 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 134518319, i32* %10, align 4
  %tmp2_v.i9.i.i = add i32 %arg_esp, -32
  %11 = inttoptr i32 %tmp2_v.i9.i.i to i32*
  store i32 0, i32* %11, align 4
  %12 = load i32, i32* %7, align 4
  %tmp2_v1.i22.i12.i = add i32 %12, 4
  %13 = inttoptr i32 %tmp2_v1.i22.i12.i to i32*
  %14 = load i32, i32* %13, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %BB_804963D.i.i, label %BB_8049699.i

BB_804963D.i.i:                                   ; preds = %BB_804965C.i.i, %Func_804968F.exit.i
  %16 = phi i32 [ %22, %BB_804965C.i.i ], [ %12, %Func_804968F.exit.i ]
  %storemerge13.i = phi i32 [ %tmp0_v1.i13.i.i, %BB_804965C.i.i ], [ 0, %Func_804968F.exit.i ]
  %17 = inttoptr i32 %16 to i32*
  %18 = load i32, i32* %17, align 4
  %tmp0_v4.i.i.i = shl i32 %storemerge13.i, 2
  %tmp0_v5.i.i.i = add i32 %18, %tmp0_v4.i.i.i
  %19 = inttoptr i32 %tmp0_v5.i.i.i to i32*
  %20 = load i32, i32* %19, align 4
  %21 = load i32, i32* %2, align 4
  %.not.i.i.i = icmp eq i32 %21, %20
  %tmp0_v1.i13.i.i = add nuw nsw i32 %storemerge13.i, 1
  br i1 %.not.i.i.i, label %Func_is_member.exit..exit_crit_edge, label %BB_804965C.i.i

BB_804965C.i.i:                                   ; preds = %BB_804963D.i.i
  store i32 %tmp0_v1.i13.i.i, i32* %11, align 4
  %22 = load i32, i32* %7, align 4
  %tmp2_v1.i22.i.i = add i32 %22, 4
  %23 = inttoptr i32 %tmp2_v1.i22.i.i to i32*
  %24 = load i32, i32* %23, align 4
  %25 = icmp slt i32 %tmp0_v1.i13.i.i, %24
  br i1 %25, label %BB_804963D.i.i, label %BB_8049699.i

Func_is_member.exit..exit_crit_edge:              ; preds = %BB_804963D.i.i
  %26 = load i32, i32* %9, align 4
  %.pre = add i32 %26, 8
  br label %.exit

BB_8049699.i:                                     ; preds = %BB_804965C.i.i, %Func_804968F.exit.i
  %27 = load i32, i32* %9, align 4
  %tmp2_v.i26.i = add i32 %27, 8
  %28 = inttoptr i32 %tmp2_v.i26.i to i32*
  %29 = load i32, i32* %28, align 4
  %tmp2_v1.i28.i = add i32 %29, 4
  %30 = inttoptr i32 %tmp2_v1.i28.i to i32*
  %31 = load i32, i32* %30, align 4
  %tmp0_v3.i30.i = shl i32 %31, 2
  %tmp4_v.i31.i = add i32 %tmp0_v3.i30.i, 4
  %32 = inttoptr i32 %29 to i32*
  %33 = load i32, i32* %32, align 4
  store i32 %tmp4_v.i31.i, i32* %8, align 4
  store i32 %33, i32* %9, align 4
  store i32 134518456, i32* %11, align 4
  %arg.i.i = load i32, i32* %9, align 4
  %arg2.i.i = load i32, i32* %8, align 4
  %34 = tail call i32 @realloc(i32 %arg.i.i, i32 %arg2.i.i)
  %35 = load i32, i32* %28, align 4
  %36 = inttoptr i32 %35 to i32*
  store i32 %34, i32* %36, align 4
  %37 = load i32, i32* %28, align 4
  %38 = inttoptr i32 %37 to i32*
  %39 = load i32, i32* %38, align 4
  %tmp2_v7.i.i = add i32 %37, 4
  %40 = inttoptr i32 %tmp2_v7.i.i to i32*
  %41 = load i32, i32* %40, align 4
  %tmp0_v9.i.i = shl i32 %41, 2
  %tmp0_v10.i.i = add i32 %tmp0_v9.i.i, %39
  %tmp2_v11.i.i = add i32 %27, 12
  %42 = inttoptr i32 %tmp2_v11.i.i to i32*
  %43 = load i32, i32* %42, align 4
  %44 = inttoptr i32 %tmp0_v10.i.i to i32*
  store i32 %43, i32* %44, align 4
  %45 = load i32, i32* %28, align 4
  %tmp2_v15.i.i = add i32 %45, 4
  %46 = inttoptr i32 %tmp2_v15.i.i to i32*
  %47 = load i32, i32* %46, align 4
  %tmp2_v17.i.i = add i32 %47, 1
  store i32 %tmp2_v17.i.i, i32* %46, align 4
  br label %.exit

.exit:                                            ; preds = %BB_8049699.i, %Func_is_member.exit..exit_crit_edge
  %48 = phi i32 [ %26, %Func_is_member.exit..exit_crit_edge ], [ %27, %BB_8049699.i ]
  %tmp4_v3.i.i.pre-phi = phi i32 [ %.pre, %Func_is_member.exit..exit_crit_edge ], [ %tmp2_v.i26.i, %BB_8049699.i ]
  %r_edx.0 = phi i32 [ %tmp0_v4.i.i.i, %Func_is_member.exit..exit_crit_edge ], [ %tmp2_v17.i.i, %BB_8049699.i ]
  %tmp2_v.i4.i = add i32 %48, -4
  %49 = inttoptr i32 %tmp2_v.i4.i to i32*
  %50 = load i32, i32* %49, align 4
  %51 = inttoptr i32 %48 to i32*
  %52 = load i32, i32* %51, align 4
  %newret = insertvalue { i32, i32, i32, i32 } undef, i32 %tmp4_v3.i.i.pre-phi, 0
  %newret2 = insertvalue { i32, i32, i32, i32 } %newret, i32 %r_edx.0, 1
  %newret4 = insertvalue { i32, i32, i32, i32 } %newret2, i32 %52, 2
  %newret6 = insertvalue { i32, i32, i32, i32 } %newret4, i32 %50, 3
  ret { i32, i32, i32, i32 } %newret6
}

; Function Attrs: norecurse
define internal fastcc void @sets480(i32 %arg_esp) unnamed_addr  norecurse  !retregs !15 {
Func_804922A.exit.i:
  %tmp2_v.i108.i = add i32 %arg_esp, 4
  %tmp0_v.i109.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i111.i = add i32 %tmp0_v.i109.i, -4
  %2 = inttoptr i32 %tmp2_v3.i111.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i112.i = add i32 %tmp0_v.i109.i, -8
  %3 = inttoptr i32 %tmp2_v4.i112.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i114.i = add i32 %tmp0_v.i109.i, -12
  %4 = inttoptr i32 %tmp2_v5.i114.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i109.i, -16
  %5 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i108.i, i32* %5, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i109.i, -52
  %6 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517276, i32* %6, align 4
  %tmp2_v.i7.i.i = add i32 %tmp0_v.i109.i, -56
  %7 = inttoptr i32 %tmp2_v.i7.i.i to i32*
  store i32 %tmp2_v4.i112.i, i32* %7, align 8
  %tmp2_v1.i.i.i = add i32 %tmp0_v.i109.i, -60
  %8 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 134529024, i32* %8, align 4
  %tmp2_v2.i11.i.i = add i32 %tmp0_v.i109.i, -84
  %9 = inttoptr i32 %tmp2_v2.i11.i.i to i32*
  store i32 134518214, i32* %9, align 4
  %tmp2_v.i.i.i = add i32 %tmp0_v.i109.i, -96
  %10 = inttoptr i32 %tmp2_v.i.i.i to i32*
  store i32 8, i32* %10, align 16
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i109.i, -100
  %11 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  store i32 134518230, i32* %11, align 4
  %arg.i.i.i = load i32, i32* %10, align 16
  %12 = tail call i32 @malloc(i32 %arg.i.i.i)
  %tmp2_v.i15.i.i = add i32 %tmp0_v.i109.i, -68
  %13 = inttoptr i32 %tmp2_v.i15.i.i to i32*
  store i32 %12, i32* %13, align 4
  %tmp2_v3.i.i.i = add i32 %12, 4
  %14 = inttoptr i32 %tmp2_v3.i.i.i to i32*
  store i32 0, i32* %14, align 4
  store i32 4, i32* %10, align 16
  store i32 134518256, i32* %11, align 4
  %arg.i.i17.i = load i32, i32* %10, align 16
  %15 = tail call i32 @malloc(i32 %arg.i.i17.i)
  %16 = load i32, i32* %13, align 4
  %17 = inttoptr i32 %16 to i32*
  store i32 %15, i32* %17, align 4
  %18 = load i32, i32* %13, align 4
  %19 = load i32, i32* %8, align 4
  %20 = load i32, i32* %7, align 8
  %tmp2_v.i86.i = add i32 %20, -36
  %21 = inttoptr i32 %tmp2_v.i86.i to i32*
  store i32 %18, i32* %21, align 4
  %tmp2_v3.i92.i = add i32 %tmp0_v.i109.i, -64
  %22 = inttoptr i32 %tmp2_v3.i92.i to i32*
  store i32 %18, i32* %22, align 16
  store i32 134517290, i32* %13, align 4
  %tmp2_v.i.i.i3 = add i32 %tmp0_v.i109.i, -72
  %23 = inttoptr i32 %tmp2_v.i.i.i3 to i32*
  store i32 %20, i32* %23, align 8
  %tmp2_v1.i.i.i4 = add i32 %tmp0_v.i109.i, -76
  %24 = inttoptr i32 %tmp2_v1.i.i.i4 to i32*
  store i32 134518286, i32* %24, align 4
  %25 = load i32, i32* %23, align 8
  %tmp2_v.i246.i = add i32 %19, -8184
  store i32 %tmp2_v.i246.i, i32* %22, align 16
  store i32 134517312, i32* %13, align 4
  %arg.i.i = load i32, i32* %22, align 16
  %26 = inttoptr i32 %arg.i.i to i8*
  %27 = tail call i32 @puts(i8* nonnull dereferenceable(1) %26)
  store i32 5, i32* %8, align 4
  %tmp2_v1.i164.i = add i32 %25, -36
  %28 = inttoptr i32 %tmp2_v1.i164.i to i32*
  %29 = load i32, i32* %28, align 4
  store i32 %29, i32* %22, align 16
  store i32 134517348, i32* %13, align 4
  %30 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v.i15.i.i, i32 %15, i32 %25, i32 %19)
  %newret356 = extractvalue { i32, i32, i32, i32 } %30, 0
  %newret358 = extractvalue { i32, i32, i32, i32 } %30, 1
  %newret360 = extractvalue { i32, i32, i32, i32 } %30, 2
  %newret362 = extractvalue { i32, i32, i32, i32 } %30, 3
  %tmp2_v.i29.i = add i32 %newret356, 4
  %31 = inttoptr i32 %tmp2_v.i29.i to i32*
  store i32 6, i32* %31, align 4
  %tmp2_v2.i31.i = add i32 %newret360, -36
  %32 = inttoptr i32 %tmp2_v2.i31.i to i32*
  %33 = load i32, i32* %32, align 4
  %34 = inttoptr i32 %newret356 to i32*
  store i32 %33, i32* %34, align 4
  %tmp2_v5.i33.i = add i32 %newret356, -4
  %35 = inttoptr i32 %tmp2_v5.i33.i to i32*
  store i32 134517364, i32* %35, align 4
  %36 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v5.i33.i, i32 %newret358, i32 %newret360, i32 %newret362)
  %newret348 = extractvalue { i32, i32, i32, i32 } %36, 0
  %newret350 = extractvalue { i32, i32, i32, i32 } %36, 1
  %newret352 = extractvalue { i32, i32, i32, i32 } %36, 2
  %newret354 = extractvalue { i32, i32, i32, i32 } %36, 3
  %tmp2_v.i278.i = add i32 %newret348, 4
  %37 = inttoptr i32 %tmp2_v.i278.i to i32*
  store i32 7, i32* %37, align 4
  %tmp2_v2.i280.i = add i32 %newret352, -36
  %38 = inttoptr i32 %tmp2_v2.i280.i to i32*
  %39 = load i32, i32* %38, align 4
  %40 = inttoptr i32 %newret348 to i32*
  store i32 %39, i32* %40, align 4
  %tmp2_v5.i282.i = add i32 %newret348, -4
  %41 = inttoptr i32 %tmp2_v5.i282.i to i32*
  store i32 134517380, i32* %41, align 4
  %42 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v5.i282.i, i32 %newret350, i32 %newret352, i32 %newret354)
  %newret340 = extractvalue { i32, i32, i32, i32 } %42, 0
  %newret342 = extractvalue { i32, i32, i32, i32 } %42, 1
  %newret344 = extractvalue { i32, i32, i32, i32 } %42, 2
  %newret346 = extractvalue { i32, i32, i32, i32 } %42, 3
  %tmp2_v.i323.i = add i32 %newret340, 4
  %43 = inttoptr i32 %tmp2_v.i323.i to i32*
  store i32 7, i32* %43, align 4
  %tmp2_v2.i325.i = add i32 %newret344, -36
  %44 = inttoptr i32 %tmp2_v2.i325.i to i32*
  %45 = load i32, i32* %44, align 4
  %46 = inttoptr i32 %newret340 to i32*
  store i32 %45, i32* %46, align 4
  %tmp2_v5.i327.i = add i32 %newret340, -4
  %47 = inttoptr i32 %tmp2_v5.i327.i to i32*
  store i32 134517396, i32* %47, align 4
  %48 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v5.i327.i, i32 %newret342, i32 %newret344, i32 %newret346)
  %newret332 = extractvalue { i32, i32, i32, i32 } %48, 0
  %newret334 = extractvalue { i32, i32, i32, i32 } %48, 1
  %newret336 = extractvalue { i32, i32, i32, i32 } %48, 2
  %newret338 = extractvalue { i32, i32, i32, i32 } %48, 3
  %tmp2_v.i72.i = add i32 %newret332, 4
  %49 = inttoptr i32 %tmp2_v.i72.i to i32*
  store i32 8, i32* %49, align 4
  %tmp2_v2.i74.i = add i32 %newret336, -36
  %50 = inttoptr i32 %tmp2_v2.i74.i to i32*
  %51 = load i32, i32* %50, align 4
  %52 = inttoptr i32 %newret332 to i32*
  store i32 %51, i32* %52, align 4
  %tmp2_v5.i76.i = add i32 %newret332, -4
  %53 = inttoptr i32 %tmp2_v5.i76.i to i32*
  store i32 134517412, i32* %53, align 4
  %54 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v5.i76.i, i32 %newret334, i32 %newret336, i32 %newret338)
  %newret324 = extractvalue { i32, i32, i32, i32 } %54, 0
  %newret326 = extractvalue { i32, i32, i32, i32 } %54, 1
  %newret328 = extractvalue { i32, i32, i32, i32 } %54, 2
  %newret330 = extractvalue { i32, i32, i32, i32 } %54, 3
  %tmp2_v.i337.i = add i32 %newret330, -8148
  %55 = inttoptr i32 %newret324 to i32*
  store i32 %tmp2_v.i337.i, i32* %55, align 4
  %tmp2_v3.i338.i = add i32 %newret324, -4
  %56 = inttoptr i32 %tmp2_v3.i338.i to i32*
  store i32 134517430, i32* %56, align 4
  %57 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %newret326, i32 noundef %newret324, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !16
  %tmp2_v.i217.i = add i32 %newret328, -36
  %58 = inttoptr i32 %tmp2_v.i217.i to i32*
  %59 = load i32, i32* %58, align 4
  store i32 %59, i32* %55, align 4
  store i32 134517444, i32* %56, align 4
  %tmp2_v.i3.i.i = add i32 %newret324, -8
  %60 = inttoptr i32 %tmp2_v.i3.i.i to i32*
  store i32 %newret328, i32* %60, align 4
  %tmp2_v1.i5.i.i = add i32 %newret324, -12
  %61 = inttoptr i32 %tmp2_v1.i5.i.i to i32*
  store i32 %newret330, i32* %61, align 4
  %tmp2_v2.i.i.i9 = add i32 %newret324, -36
  %62 = inttoptr i32 %tmp2_v2.i.i.i9 to i32*
  store i32 134518522, i32* %62, align 4
  %tmp2_v.i69.i.i = add i32 %newret324, -20
  %63 = inttoptr i32 %tmp2_v.i69.i.i to i32*
  store i32 0, i32* %63, align 4
  %64 = load i32, i32* %55, align 4
  %tmp2_v1.i.i22.i = add i32 %64, 4
  %65 = inttoptr i32 %tmp2_v1.i.i22.i to i32*
  %66 = load i32, i32* %65, align 4
  %67 = icmp sgt i32 %66, 0
  br i1 %67, label %BB_8049709.i.i.preheader, label %Func_print_set.exit

BB_8049709.i.i.preheader:                         ; preds = %Func_804922A.exit.i
  %tmp2_v8.i61.i.i = add i32 %newret324, -44
  %68 = inttoptr i32 %tmp2_v8.i61.i.i to i32*
  %tmp2_v10.i64.i.i = add i32 %newret324, -48
  %69 = inttoptr i32 %tmp2_v10.i64.i.i to i32*
  %tmp2_v11.i65.i.i = add i32 %newret324, -52
  %70 = inttoptr i32 %tmp2_v11.i65.i.i to i32*
  br label %BB_8049709.i.i

BB_8049709.i.i:                                   ; preds = %BB_8049709.i.i, %BB_8049709.i.i.preheader
  %71 = phi i32 [ %81, %BB_8049709.i.i ], [ %66, %BB_8049709.i.i.preheader ]
  %72 = phi i32 [ %79, %BB_8049709.i.i ], [ %64, %BB_8049709.i.i.preheader ]
  %storemerge23.i = phi i32 [ %tmp0_v1.i.i.i, %BB_8049709.i.i ], [ 0, %BB_8049709.i.i.preheader ]
  %tmp0_v3.i18.i.i = add nsw i32 %71, -1
  %.not.i.i.i10 = icmp eq i32 %storemerge23.i, %tmp0_v3.i18.i.i
  %73 = inttoptr i32 %72 to i32*
  %74 = load i32, i32* %73, align 4
  %tmp0_v4.i56.i.i = shl i32 %storemerge23.i, 2
  %tmp0_v5.i57.i.i = add i32 %74, %tmp0_v4.i56.i.i
  %75 = inttoptr i32 %tmp0_v5.i57.i.i to i32*
  %76 = load i32, i32* %75, align 4
  store i32 %76, i32* %68, align 4
  %spi478 = ptrtoint[4 x i8]* @str.478 to i32
  %spi479 = ptrtoint[4 x i8]* @str.479 to i32
  %..i = select i1 %.not.i.i.i10, i32 %spi478, i32 %spi479
  %.29.i = select i1 %.not.i.i.i10, i32 134518582, i32 134518618
  store i32 %..i, i32* %69, align 4
  store i32 %.29.i, i32* %70, align 4
  %77 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %tmp0_v4.i56.i.i, i32 noundef %tmp2_v10.i64.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" 
  %78 = load i32, i32* %63, align 4
  %tmp0_v1.i.i.i = add i32 %78, 1
  store i32 %tmp0_v1.i.i.i, i32* %63, align 4
  %79 = load i32, i32* %55, align 4
  %tmp2_v1.i.i.i11 = add i32 %79, 4
  %80 = inttoptr i32 %tmp2_v1.i.i.i11 to i32*
  %81 = load i32, i32* %80, align 4
  %82 = icmp slt i32 %tmp0_v1.i.i.i, %81
  br i1 %82, label %BB_8049709.i.i, label %Func_print_set.exit

Func_print_set.exit:                              ; preds = %BB_8049709.i.i, %Func_804922A.exit.i
  %83 = load i32, i32* %61, align 4
  %84 = load i32, i32* %60, align 4
  %tmp2_v.i375.i = add i32 %newret324, 12
  %85 = inttoptr i32 %tmp2_v.i375.i to i32*
  store i32 134517452, i32* %85, align 4
  %tmp2_v.i7.i.i14 = add i32 %newret324, 8
  %86 = inttoptr i32 %tmp2_v.i7.i.i14 to i32*
  store i32 %84, i32* %86, align 4
  %tmp2_v1.i.i.i15 = add i32 %newret324, 4
  %87 = inttoptr i32 %tmp2_v1.i.i.i15 to i32*
  store i32 %83, i32* %87, align 4
  store i32 134518214, i32* %63, align 4
  %tmp2_v.i.i.i17 = add i32 %newret324, -32
  %88 = inttoptr i32 %tmp2_v.i.i.i17 to i32*
  store i32 8, i32* %88, align 4
  store i32 134518230, i32* %62, align 4
  %arg.i.i.i19 = load i32, i32* %88, align 4
  %89 = tail call i32 @malloc(i32 %arg.i.i.i19)
  store i32 %89, i32* %56, align 4
  %tmp2_v3.i.i.i21 = add i32 %89, 4
  %90 = inttoptr i32 %tmp2_v3.i.i.i21 to i32*
  store i32 0, i32* %90, align 4
  store i32 4, i32* %88, align 4
  store i32 134518256, i32* %62, align 4
  %arg.i.i17.i22 = load i32, i32* %88, align 4
  %91 = tail call i32 @malloc(i32 %arg.i.i17.i22)
  %92 = load i32, i32* %56, align 4
  %93 = inttoptr i32 %92 to i32*
  store i32 %91, i32* %93, align 4
  %94 = load i32, i32* %56, align 4
  %95 = load i32, i32* %87, align 4
  %96 = load i32, i32* %86, align 4
  %tmp2_v.i228.i = add i32 %96, -32
  %97 = inttoptr i32 %tmp2_v.i228.i to i32*
  store i32 %94, i32* %97, align 4
  store i32 7, i32* %87, align 4
  %98 = load i32, i32* %97, align 4
  store i32 %98, i32* %55, align 4
  store i32 134517468, i32* %56, align 4
  %99 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v3.i338.i, i32 %91, i32 %96, i32 %95)
  %newret316 = extractvalue { i32, i32, i32, i32 } %99, 0
  %newret318 = extractvalue { i32, i32, i32, i32 } %99, 1
  %newret320 = extractvalue { i32, i32, i32, i32 } %99, 2
  %newret322 = extractvalue { i32, i32, i32, i32 } %99, 3
  %tmp2_v.i286.i = add i32 %newret316, 4
  %100 = inttoptr i32 %tmp2_v.i286.i to i32*
  store i32 8, i32* %100, align 4
  %tmp2_v2.i288.i = add i32 %newret320, -32
  %101 = inttoptr i32 %tmp2_v2.i288.i to i32*
  %102 = load i32, i32* %101, align 4
  %103 = inttoptr i32 %newret316 to i32*
  store i32 %102, i32* %103, align 4
  %tmp2_v5.i290.i = add i32 %newret316, -4
  %104 = inttoptr i32 %tmp2_v5.i290.i to i32*
  store i32 134517484, i32* %104, align 4
  %105 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v5.i290.i, i32 %newret318, i32 %newret320, i32 %newret322)
  %newret308 = extractvalue { i32, i32, i32, i32 } %105, 0
  %newret310 = extractvalue { i32, i32, i32, i32 } %105, 1
  %newret312 = extractvalue { i32, i32, i32, i32 } %105, 2
  %newret314 = extractvalue { i32, i32, i32, i32 } %105, 3
  %tmp2_v.i171.i = add i32 %newret308, 4
  %106 = inttoptr i32 %tmp2_v.i171.i to i32*
  store i32 9, i32* %106, align 4
  %tmp2_v2.i173.i = add i32 %newret312, -32
  %107 = inttoptr i32 %tmp2_v2.i173.i to i32*
  %108 = load i32, i32* %107, align 4
  %109 = inttoptr i32 %newret308 to i32*
  store i32 %108, i32* %109, align 4
  %tmp2_v5.i175.i = add i32 %newret308, -4
  %110 = inttoptr i32 %tmp2_v5.i175.i to i32*
  store i32 134517500, i32* %110, align 4
  %111 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v5.i175.i, i32 %newret310, i32 %newret312, i32 %newret314)
  %newret300 = extractvalue { i32, i32, i32, i32 } %111, 0
  %newret302 = extractvalue { i32, i32, i32, i32 } %111, 1
  %newret304 = extractvalue { i32, i32, i32, i32 } %111, 2
  %newret306 = extractvalue { i32, i32, i32, i32 } %111, 3
  %tmp2_v.i.i = add i32 %newret300, 4
  %112 = inttoptr i32 %tmp2_v.i.i to i32*
  store i32 10, i32* %112, align 4
  %tmp2_v2.i.i = add i32 %newret304, -32
  %113 = inttoptr i32 %tmp2_v2.i.i to i32*
  %114 = load i32, i32* %113, align 4
  %115 = inttoptr i32 %newret300 to i32*
  store i32 %114, i32* %115, align 4
  %tmp2_v5.i.i = add i32 %newret300, -4
  %116 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 134517516, i32* %116, align 4
  %117 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v5.i.i, i32 %newret302, i32 %newret304, i32 %newret306)
  %newret292 = extractvalue { i32, i32, i32, i32 } %117, 0
  %newret294 = extractvalue { i32, i32, i32, i32 } %117, 1
  %newret296 = extractvalue { i32, i32, i32, i32 } %117, 2
  %newret298 = extractvalue { i32, i32, i32, i32 } %117, 3
  %tmp2_v.i51.i = add i32 %newret298, -8140
  %118 = inttoptr i32 %newret292 to i32*
  store i32 %tmp2_v.i51.i, i32* %118, align 4
  %tmp2_v3.i52.i = add i32 %newret292, -4
  %119 = inttoptr i32 %tmp2_v3.i52.i to i32*
  store i32 134517534, i32* %119, align 4
  %120 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %newret294, i32 noundef %newret292, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !16
  %tmp2_v.i353.i = add i32 %newret296, -32
  %121 = inttoptr i32 %tmp2_v.i353.i to i32*
  %122 = load i32, i32* %121, align 4
  store i32 %122, i32* %118, align 4
  store i32 134517548, i32* %119, align 4
  %tmp2_v.i3.i.i30 = add i32 %newret292, -8
  %123 = inttoptr i32 %tmp2_v.i3.i.i30 to i32*
  store i32 %newret296, i32* %123, align 4
  %tmp2_v1.i5.i.i31 = add i32 %newret292, -12
  %124 = inttoptr i32 %tmp2_v1.i5.i.i31 to i32*
  store i32 %newret298, i32* %124, align 4
  %tmp2_v2.i.i.i32 = add i32 %newret292, -36
  %125 = inttoptr i32 %tmp2_v2.i.i.i32 to i32*
  store i32 134518522, i32* %125, align 4
  %tmp2_v.i69.i.i33 = add i32 %newret292, -20
  %126 = inttoptr i32 %tmp2_v.i69.i.i33 to i32*
  store i32 0, i32* %126, align 4
  %127 = load i32, i32* %118, align 4
  %tmp2_v1.i.i22.i34 = add i32 %127, 4
  %128 = inttoptr i32 %tmp2_v1.i.i22.i34 to i32*
  %129 = load i32, i32* %128, align 4
  %130 = icmp sgt i32 %129, 0
  %tmp2_v8.i61.i.i41 = add i32 %newret292, -44
  %131 = inttoptr i32 %tmp2_v8.i61.i.i41 to i32*
  br i1 %130, label %BB_8049709.i.i48.preheader, label %Func_print_set.exit.Func_print_set.exit54_crit_edge

Func_print_set.exit.Func_print_set.exit54_crit_edge: ; preds = %Func_print_set.exit
  %.pre314 = add i32 %newret292, -52
  %.pre315 = inttoptr i32 %.pre314 to i32*
  br label %Func_print_set.exit54

BB_8049709.i.i48.preheader:                       ; preds = %Func_print_set.exit
  %tmp2_v10.i64.i.i42 = add i32 %newret292, -48
  %132 = inttoptr i32 %tmp2_v10.i64.i.i42 to i32*
  %tmp2_v11.i65.i.i45 = add i32 %newret292, -52
  %133 = inttoptr i32 %tmp2_v11.i65.i.i45 to i32*
  br label %BB_8049709.i.i48

BB_8049709.i.i48:                                 ; preds = %BB_8049709.i.i48, %BB_8049709.i.i48.preheader
  %134 = phi i32 [ %144, %BB_8049709.i.i48 ], [ %129, %BB_8049709.i.i48.preheader ]
  %135 = phi i32 [ %142, %BB_8049709.i.i48 ], [ %127, %BB_8049709.i.i48.preheader ]
  %storemerge23.i36 = phi i32 [ %tmp0_v1.i.i.i46, %BB_8049709.i.i48 ], [ 0, %BB_8049709.i.i48.preheader ]
  %tmp0_v3.i18.i.i37 = add nsw i32 %134, -1
  %.not.i.i.i38 = icmp eq i32 %storemerge23.i36, %tmp0_v3.i18.i.i37
  %136 = inttoptr i32 %135 to i32*
  %137 = load i32, i32* %136, align 4
  %tmp0_v4.i56.i.i39 = shl i32 %storemerge23.i36, 2
  %tmp0_v5.i57.i.i40 = add i32 %137, %tmp0_v4.i56.i.i39
  %138 = inttoptr i32 %tmp0_v5.i57.i.i40 to i32*
  %139 = load i32, i32* %138, align 4
  store i32 %139, i32* %131, align 4
  %spi476 = ptrtoint[4 x i8]* @str.476 to i32
  %spi477 = ptrtoint[4 x i8]* @str.477 to i32
  %..i43 = select i1 %.not.i.i.i38, i32 %spi476, i32 %spi477
  %.29.i44 = select i1 %.not.i.i.i38, i32 134518582, i32 134518618
  store i32 %..i43, i32* %132, align 4
  store i32 %.29.i44, i32* %133, align 4
  %140 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %tmp0_v4.i56.i.i39, i32 noundef %tmp2_v10.i64.i.i42, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" 
  %141 = load i32, i32* %126, align 4
  %tmp0_v1.i.i.i46 = add i32 %141, 1
  store i32 %tmp0_v1.i.i.i46, i32* %126, align 4
  %142 = load i32, i32* %118, align 4
  %tmp2_v1.i.i.i47 = add i32 %142, 4
  %143 = inttoptr i32 %tmp2_v1.i.i.i47 to i32*
  %144 = load i32, i32* %143, align 4
  %145 = icmp slt i32 %tmp0_v1.i.i.i46, %144
  br i1 %145, label %BB_8049709.i.i48, label %Func_print_set.exit54

Func_print_set.exit54:                            ; preds = %BB_8049709.i.i48, %Func_print_set.exit.Func_print_set.exit54_crit_edge
  %.pre-phi316 = phi i32* [ %.pre315, %Func_print_set.exit.Func_print_set.exit54_crit_edge ], [ %133, %BB_8049709.i.i48 ]
  %146 = load i32, i32* %124, align 4
  %147 = load i32, i32* %123, align 4
  %tmp2_v.i384.i = add i32 %147, -32
  %148 = inttoptr i32 %tmp2_v.i384.i to i32*
  %149 = load i32, i32* %148, align 4
  %tmp2_v3.i386.i = add i32 %newret292, 4
  %150 = inttoptr i32 %tmp2_v3.i386.i to i32*
  store i32 %149, i32* %150, align 4
  %tmp2_v4.i387.i = add i32 %147, -36
  %151 = inttoptr i32 %tmp2_v4.i387.i to i32*
  %152 = load i32, i32* %151, align 4
  store i32 %152, i32* %118, align 4
  store i32 134517565, i32* %119, align 4
  store i32 %147, i32* %123, align 4
  %tmp4_v.i.i.i.i = add i32 %newret292, -32
  store i32 134518668, i32* %125, align 4
  %tmp2_v.i7.i.i.i = add i32 %newret292, -40
  %153 = inttoptr i32 %tmp2_v.i7.i.i.i to i32*
  store i32 %tmp2_v.i3.i.i30, i32* %153, align 4
  store i32 %146, i32* %131, align 4
  %tmp2_v2.i11.i.i.i = add i32 %newret292, -68
  %154 = inttoptr i32 %tmp2_v2.i11.i.i.i to i32*
  store i32 134518214, i32* %154, align 4
  %tmp2_v.i.i.i.i = add i32 %newret292, -80
  %155 = inttoptr i32 %tmp2_v.i.i.i.i to i32*
  store i32 8, i32* %155, align 4
  %tmp2_v2.i.i.i.i = add i32 %newret292, -84
  %156 = inttoptr i32 %tmp2_v2.i.i.i.i to i32*
  store i32 134518230, i32* %156, align 4
  %arg.i.i.i.i = load i32, i32* %155, align 4
  %157 = tail call i32 @malloc(i32 %arg.i.i.i.i)
  store i32 %157, i32* %.pre-phi316, align 4
  %tmp2_v3.i.i.i.i = add i32 %157, 4
  %158 = inttoptr i32 %tmp2_v3.i.i.i.i to i32*
  store i32 0, i32* %158, align 4
  store i32 4, i32* %155, align 4
  store i32 134518256, i32* %156, align 4
  %arg.i.i17.i.i = load i32, i32* %155, align 4
  %159 = tail call i32 @malloc(i32 %arg.i.i17.i.i)
  %160 = load i32, i32* %.pre-phi316, align 4
  %161 = inttoptr i32 %160 to i32*
  store i32 %159, i32* %161, align 4
  %162 = load i32, i32* %.pre-phi316, align 4
  %163 = load i32, i32* %131, align 4
  %164 = load i32, i32* %153, align 4
  %tmp2_v.i32.i.i = add i32 %164, -12
  %165 = inttoptr i32 %tmp2_v.i32.i.i to i32*
  store i32 %162, i32* %165, align 4
  %tmp2_v1.i34.i.i = add i32 %164, -20
  %166 = inttoptr i32 %tmp2_v1.i34.i.i to i32*
  store i32 0, i32* %166, align 4
  %tmp2_v.i66.i54.i = add i32 %164, 8
  %167 = inttoptr i32 %tmp2_v.i66.i54.i to i32*
  %168 = load i32, i32* %167, align 4
  %tmp2_v1.i68.i55.i = add i32 %168, 4
  %169 = inttoptr i32 %tmp2_v1.i68.i55.i to i32*
  %170 = load i32, i32* %169, align 4
  %171 = icmp sgt i32 %170, 0
  br i1 %171, label %BB_8049798.i.i, label %BB_80497C5.i.i

BB_8049798.i.i:                                   ; preds = %BB_8049798.i.i, %Func_print_set.exit54
  %172 = phi i32 [ %tmp0_v2.i.i.i, %BB_8049798.i.i ], [ 0, %Func_print_set.exit54 ]
  %173 = phi i32 [ %187, %BB_8049798.i.i ], [ %168, %Func_print_set.exit54 ]
  %r_ebp.159.i = phi i32 [ %newret45.i, %BB_8049798.i.i ], [ %164, %Func_print_set.exit54 ]
  %.pn5158.i = phi i32 [ %newret47.i, %BB_8049798.i.i ], [ %163, %Func_print_set.exit54 ]
  %r_esp.157.i = phi i32 [ %tmp0_v.i8.i.i, %BB_8049798.i.i ], [ %tmp4_v.i.i.i.i, %Func_print_set.exit54 ]
  %174 = inttoptr i32 %173 to i32*
  %175 = load i32, i32* %174, align 4
  %tmp0_v4.i.i.i = shl i32 %172, 2
  %tmp0_v5.i.i.i = add i32 %175, %tmp0_v4.i.i.i
  %176 = inttoptr i32 %tmp0_v5.i.i.i to i32*
  %177 = load i32, i32* %176, align 4
  %tmp2_v8.i.i.i = add i32 %r_esp.157.i, -12
  %178 = inttoptr i32 %tmp2_v8.i.i.i to i32*
  store i32 %177, i32* %178, align 4
  %tmp2_v9.i.i.i = add i32 %r_ebp.159.i, -12
  %179 = inttoptr i32 %tmp2_v9.i.i.i to i32*
  %180 = load i32, i32* %179, align 4
  %tmp2_v11.i.i.i = add i32 %r_esp.157.i, -16
  %181 = inttoptr i32 %tmp2_v11.i.i.i to i32*
  store i32 %180, i32* %181, align 4
  %tmp2_v12.i.i.i = add i32 %r_esp.157.i, -20
  %182 = inttoptr i32 %tmp2_v12.i.i.i to i32*
  store i32 134518707, i32* %182, align 4
  %183 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v12.i.i.i, i32 %tmp0_v4.i.i.i, i32 %r_ebp.159.i, i32 %.pn5158.i)
  %newret41.i = extractvalue { i32, i32, i32, i32 } %183, 0
  %newret45.i = extractvalue { i32, i32, i32, i32 } %183, 2
  %newret47.i = extractvalue { i32, i32, i32, i32 } %183, 3
  %tmp0_v.i8.i.i = add i32 %newret41.i, 16
  %tmp2_v.i10.i.i = add i32 %newret45.i, -20
  %184 = inttoptr i32 %tmp2_v.i10.i.i to i32*
  %185 = load i32, i32* %184, align 4
  %tmp0_v2.i.i.i = add i32 %185, 1
  store i32 %tmp0_v2.i.i.i, i32* %184, align 4
  %tmp2_v.i66.i.i = add i32 %newret45.i, 8
  %186 = inttoptr i32 %tmp2_v.i66.i.i to i32*
  %187 = load i32, i32* %186, align 4
  %tmp2_v1.i68.i.i = add i32 %187, 4
  %188 = inttoptr i32 %tmp2_v1.i68.i.i to i32*
  %189 = load i32, i32* %188, align 4
  %190 = icmp slt i32 %tmp0_v2.i.i.i, %189
  br i1 %190, label %BB_8049798.i.i, label %BB_80497BA.i.BB_80497C5.i_crit_edge.i

BB_80497BA.i.BB_80497C5.i_crit_edge.i:            ; preds = %BB_8049798.i.i
  %newret45.i.le = extractvalue { i32, i32, i32, i32 } %183, 2
  %newret47.i.le = extractvalue { i32, i32, i32, i32 } %183, 3
  %newret43.le.i = extractvalue { i32, i32, i32, i32 } %183, 1
  br label %BB_80497C5.i.i

BB_80497C5.i.i:                                   ; preds = %BB_80497BA.i.BB_80497C5.i_crit_edge.i, %Func_print_set.exit54
  %r_esp.1.lcssa.i = phi i32 [ %tmp0_v.i8.i.i, %BB_80497BA.i.BB_80497C5.i_crit_edge.i ], [ %tmp4_v.i.i.i.i, %Func_print_set.exit54 ]
  %.pn53.lcssa.i = phi i32 [ %newret43.le.i, %BB_80497BA.i.BB_80497C5.i_crit_edge.i ], [ %159, %Func_print_set.exit54 ]
  %.pn51.lcssa.i = phi i32 [ %newret47.i.le, %BB_80497BA.i.BB_80497C5.i_crit_edge.i ], [ %163, %Func_print_set.exit54 ]
  %r_ebp.1.lcssa.i = phi i32 [ %newret45.i.le, %BB_80497BA.i.BB_80497C5.i_crit_edge.i ], [ %164, %Func_print_set.exit54 ]
  %tmp2_v.i6.i.i = add i32 %r_ebp.1.lcssa.i, -16
  %191 = inttoptr i32 %tmp2_v.i6.i.i to i32*
  store i32 0, i32* %191, align 4
  %tmp2_v.i18.i65.i = add i32 %r_ebp.1.lcssa.i, 12
  %192 = inttoptr i32 %tmp2_v.i18.i65.i to i32*
  %193 = load i32, i32* %192, align 4
  %tmp2_v1.i20.i66.i = add i32 %193, 4
  %194 = inttoptr i32 %tmp2_v1.i20.i66.i to i32*
  %195 = load i32, i32* %194, align 4
  %196 = icmp sgt i32 %195, 0
  br i1 %196, label %BB_80497CE.i.i, label %Func_set_union.exit

BB_80497CE.i.i:                                   ; preds = %BB_80497CE.i.i, %BB_80497C5.i.i
  %197 = phi i32 [ %tmp0_v2.i56.i.i, %BB_80497CE.i.i ], [ 0, %BB_80497C5.i.i ]
  %198 = phi i32 [ %212, %BB_80497CE.i.i ], [ %193, %BB_80497C5.i.i ]
  %r_ebp.070.i = phi i32 [ %newret37.i, %BB_80497CE.i.i ], [ %r_ebp.1.lcssa.i, %BB_80497C5.i.i ]
  %r_ebx.069.i = phi i32 [ %newret39.i, %BB_80497CE.i.i ], [ %.pn51.lcssa.i, %BB_80497C5.i.i ]
  %r_esp.068.i = phi i32 [ %tmp0_v.i52.i.i, %BB_80497CE.i.i ], [ %r_esp.1.lcssa.i, %BB_80497C5.i.i ]
  %199 = inttoptr i32 %198 to i32*
  %200 = load i32, i32* %199, align 4
  %tmp0_v4.i41.i.i = shl i32 %197, 2
  %tmp0_v5.i42.i.i = add i32 %200, %tmp0_v4.i41.i.i
  %201 = inttoptr i32 %tmp0_v5.i42.i.i to i32*
  %202 = load i32, i32* %201, align 4
  %tmp2_v8.i46.i.i = add i32 %r_esp.068.i, -12
  %203 = inttoptr i32 %tmp2_v8.i46.i.i to i32*
  store i32 %202, i32* %203, align 4
  %tmp2_v9.i47.i.i = add i32 %r_ebp.070.i, -12
  %204 = inttoptr i32 %tmp2_v9.i47.i.i to i32*
  %205 = load i32, i32* %204, align 4
  %tmp2_v11.i49.i.i = add i32 %r_esp.068.i, -16
  %206 = inttoptr i32 %tmp2_v11.i49.i.i to i32*
  store i32 %205, i32* %206, align 4
  %tmp2_v12.i50.i.i = add i32 %r_esp.068.i, -20
  %207 = inttoptr i32 %tmp2_v12.i50.i.i to i32*
  store i32 134518761, i32* %207, align 4
  %208 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v12.i50.i.i, i32 %tmp0_v4.i41.i.i, i32 %r_ebp.070.i, i32 %r_ebx.069.i)
  %newret.i57 = extractvalue { i32, i32, i32, i32 } %208, 0
  %newret37.i = extractvalue { i32, i32, i32, i32 } %208, 2
  %newret39.i = extractvalue { i32, i32, i32, i32 } %208, 3
  %tmp0_v.i52.i.i = add i32 %newret.i57, 16
  %tmp2_v.i54.i.i = add i32 %newret37.i, -16
  %209 = inttoptr i32 %tmp2_v.i54.i.i to i32*
  %210 = load i32, i32* %209, align 4
  %tmp0_v2.i56.i.i = add i32 %210, 1
  store i32 %tmp0_v2.i56.i.i, i32* %209, align 4
  %tmp2_v.i18.i.i = add i32 %newret37.i, 12
  %211 = inttoptr i32 %tmp2_v.i18.i.i to i32*
  %212 = load i32, i32* %211, align 4
  %tmp2_v1.i20.i.i = add i32 %212, 4
  %213 = inttoptr i32 %tmp2_v1.i20.i.i to i32*
  %214 = load i32, i32* %213, align 4
  %215 = icmp slt i32 %tmp0_v2.i56.i.i, %214
  br i1 %215, label %BB_80497CE.i.i, label %BB_80497F0.i..exit_crit_edge.i

BB_80497F0.i..exit_crit_edge.i:                   ; preds = %BB_80497CE.i.i
  %newret37.i.le = extractvalue { i32, i32, i32, i32 } %208, 2
  %newret39.i.le = extractvalue { i32, i32, i32, i32 } %208, 3
  %newret35.le.i = extractvalue { i32, i32, i32, i32 } %208, 1
  br label %Func_set_union.exit

Func_set_union.exit:                              ; preds = %BB_80497F0.i..exit_crit_edge.i, %BB_80497C5.i.i
  %r_ebx.0.lcssa.i = phi i32 [ %newret39.i.le, %BB_80497F0.i..exit_crit_edge.i ], [ %.pn51.lcssa.i, %BB_80497C5.i.i ]
  %r_ebp.0.lcssa.i = phi i32 [ %newret37.i.le, %BB_80497F0.i..exit_crit_edge.i ], [ %r_ebp.1.lcssa.i, %BB_80497C5.i.i ]
  %.pn53.pn.lcssa.i = phi i32 [ %newret35.le.i, %BB_80497F0.i..exit_crit_edge.i ], [ %.pn53.lcssa.i, %BB_80497C5.i.i ]
  %tmp2_v.i27.i.i = add i32 %r_ebp.0.lcssa.i, -12
  %216 = inttoptr i32 %tmp2_v.i27.i.i to i32*
  %217 = load i32, i32* %216, align 4
  %218 = inttoptr i32 %r_ebp.0.lcssa.i to i32*
  %219 = load i32, i32* %218, align 4
  %tmp4_v3.i.i.i = add i32 %r_ebp.0.lcssa.i, 8
  %tmp2_v.i99.i = add i32 %219, -28
  %220 = inttoptr i32 %tmp2_v.i99.i to i32*
  store i32 %217, i32* %220, align 4
  %tmp2_v2.i103.i = add i32 %r_ebx.0.lcssa.i, -8132
  %221 = inttoptr i32 %tmp4_v3.i.i.i to i32*
  store i32 %tmp2_v2.i103.i, i32* %221, align 4
  %tmp2_v4.i104.i = add i32 %r_ebp.0.lcssa.i, 4
  %222 = inttoptr i32 %tmp2_v4.i104.i to i32*
  store i32 134517586, i32* %222, align 4
  %223 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %.pn53.pn.lcssa.i, i32 noundef %tmp4_v3.i.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !16
  %224 = load i32, i32* %220, align 4
  store i32 %224, i32* %221, align 4
  store i32 134517600, i32* %222, align 4
  store i32 %219, i32* %218, align 4
  %tmp2_v1.i5.i.i66 = add i32 %r_ebp.0.lcssa.i, -4
  %225 = inttoptr i32 %tmp2_v1.i5.i.i66 to i32*
  store i32 %r_ebx.0.lcssa.i, i32* %225, align 4
  %tmp2_v2.i.i.i67 = add i32 %r_ebp.0.lcssa.i, -28
  %226 = inttoptr i32 %tmp2_v2.i.i.i67 to i32*
  store i32 134518522, i32* %226, align 4
  store i32 0, i32* %216, align 4
  %227 = load i32, i32* %221, align 4
  %tmp2_v1.i.i22.i69 = add i32 %227, 4
  %228 = inttoptr i32 %tmp2_v1.i.i22.i69 to i32*
  %229 = load i32, i32* %228, align 4
  %230 = icmp sgt i32 %229, 0
  %tmp2_v8.i61.i.i76 = add i32 %r_ebp.0.lcssa.i, -36
  %231 = inttoptr i32 %tmp2_v8.i61.i.i76 to i32*
  br i1 %230, label %BB_8049709.i.i83.preheader, label %Func_set_union.exit.Func_print_set.exit89_crit_edge

Func_set_union.exit.Func_print_set.exit89_crit_edge: ; preds = %Func_set_union.exit
  %.pre320 = add i32 %r_ebp.0.lcssa.i, -44
  %.pre321 = inttoptr i32 %.pre320 to i32*
  br label %Func_print_set.exit89

BB_8049709.i.i83.preheader:                       ; preds = %Func_set_union.exit
  %tmp2_v10.i64.i.i77 = add i32 %r_ebp.0.lcssa.i, -40
  %232 = inttoptr i32 %tmp2_v10.i64.i.i77 to i32*
  %tmp2_v11.i65.i.i80 = add i32 %r_ebp.0.lcssa.i, -44
  %233 = inttoptr i32 %tmp2_v11.i65.i.i80 to i32*
  br label %BB_8049709.i.i83

BB_8049709.i.i83:                                 ; preds = %BB_8049709.i.i83, %BB_8049709.i.i83.preheader
  %234 = phi i32 [ %244, %BB_8049709.i.i83 ], [ %229, %BB_8049709.i.i83.preheader ]
  %235 = phi i32 [ %242, %BB_8049709.i.i83 ], [ %227, %BB_8049709.i.i83.preheader ]
  %storemerge23.i71 = phi i32 [ %tmp0_v1.i.i.i81, %BB_8049709.i.i83 ], [ 0, %BB_8049709.i.i83.preheader ]
  %tmp0_v3.i18.i.i72 = add nsw i32 %234, -1
  %.not.i.i.i73 = icmp eq i32 %storemerge23.i71, %tmp0_v3.i18.i.i72
  %236 = inttoptr i32 %235 to i32*
  %237 = load i32, i32* %236, align 4
  %tmp0_v4.i56.i.i74 = shl i32 %storemerge23.i71, 2
  %tmp0_v5.i57.i.i75 = add i32 %237, %tmp0_v4.i56.i.i74
  %238 = inttoptr i32 %tmp0_v5.i57.i.i75 to i32*
  %239 = load i32, i32* %238, align 4
  store i32 %239, i32* %231, align 4
  %spi474 = ptrtoint[4 x i8]* @str.474 to i32
  %spi475 = ptrtoint[4 x i8]* @str.475 to i32
  %..i78 = select i1 %.not.i.i.i73, i32 %spi474, i32 %spi475
  %.29.i79 = select i1 %.not.i.i.i73, i32 134518582, i32 134518618
  store i32 %..i78, i32* %232, align 4
  store i32 %.29.i79, i32* %233, align 4
  %240 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %tmp0_v4.i56.i.i74, i32 noundef %tmp2_v10.i64.i.i77, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" 
  %241 = load i32, i32* %216, align 4
  %tmp0_v1.i.i.i81 = add i32 %241, 1
  store i32 %tmp0_v1.i.i.i81, i32* %216, align 4
  %242 = load i32, i32* %221, align 4
  %tmp2_v1.i.i.i82 = add i32 %242, 4
  %243 = inttoptr i32 %tmp2_v1.i.i.i82 to i32*
  %244 = load i32, i32* %243, align 4
  %245 = icmp slt i32 %tmp0_v1.i.i.i81, %244
  br i1 %245, label %BB_8049709.i.i83, label %Func_print_set.exit89

Func_print_set.exit89:                            ; preds = %BB_8049709.i.i83, %Func_set_union.exit.Func_print_set.exit89_crit_edge
  %.pre-phi322 = phi i32* [ %.pre321, %Func_set_union.exit.Func_print_set.exit89_crit_edge ], [ %233, %BB_8049709.i.i83 ]
  %246 = load i32, i32* %225, align 4
  %247 = load i32, i32* %218, align 4
  %tmp2_v.i13.i = add i32 %247, -32
  %248 = inttoptr i32 %tmp2_v.i13.i to i32*
  %249 = load i32, i32* %248, align 4
  %tmp2_v3.i.i = add i32 %r_ebp.0.lcssa.i, 12
  %250 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %249, i32* %250, align 4
  %tmp2_v4.i15.i = add i32 %247, -36
  %251 = inttoptr i32 %tmp2_v4.i15.i to i32*
  %252 = load i32, i32* %251, align 4
  store i32 %252, i32* %221, align 4
  store i32 134517617, i32* %222, align 4
  store i32 %247, i32* %218, align 4
  store i32 134518809, i32* %226, align 4
  %tmp2_v.i7.i.i.i91 = add i32 %r_ebp.0.lcssa.i, -32
  %253 = inttoptr i32 %tmp2_v.i7.i.i.i91 to i32*
  store i32 %r_ebp.0.lcssa.i, i32* %253, align 4
  store i32 %246, i32* %231, align 4
  %tmp2_v2.i11.i.i.i93 = add i32 %r_ebp.0.lcssa.i, -60
  %254 = inttoptr i32 %tmp2_v2.i11.i.i.i93 to i32*
  store i32 134518214, i32* %254, align 4
  %tmp2_v.i.i.i.i94 = add i32 %r_ebp.0.lcssa.i, -72
  %255 = inttoptr i32 %tmp2_v.i.i.i.i94 to i32*
  store i32 8, i32* %255, align 4
  %tmp2_v2.i.i.i.i95 = add i32 %r_ebp.0.lcssa.i, -76
  %256 = inttoptr i32 %tmp2_v2.i.i.i.i95 to i32*
  store i32 134518230, i32* %256, align 4
  %arg.i.i.i.i96 = load i32, i32* %255, align 4
  %257 = tail call i32 @malloc(i32 %arg.i.i.i.i96)
  store i32 %257, i32* %.pre-phi322, align 4
  %tmp2_v3.i.i.i.i98 = add i32 %257, 4
  %258 = inttoptr i32 %tmp2_v3.i.i.i.i98 to i32*
  store i32 0, i32* %258, align 4
  store i32 4, i32* %255, align 4
  store i32 134518256, i32* %256, align 4
  %arg.i.i17.i.i99 = load i32, i32* %255, align 4
  %259 = tail call i32 @malloc(i32 %arg.i.i17.i.i99)
  %260 = load i32, i32* %.pre-phi322, align 4
  %261 = inttoptr i32 %260 to i32*
  store i32 %259, i32* %261, align 4
  %262 = load i32, i32* %.pre-phi322, align 4
  %263 = load i32, i32* %231, align 4
  %264 = load i32, i32* %253, align 4
  %tmp2_v.i26.i.i = add i32 %264, -12
  %265 = inttoptr i32 %tmp2_v.i26.i.i to i32*
  store i32 %262, i32* %265, align 4
  %tmp2_v1.i28.i.i = add i32 %264, -16
  %266 = inttoptr i32 %tmp2_v1.i28.i.i to i32*
  store i32 0, i32* %266, align 4
  %tmp2_v.i40.i44.i = add i32 %264, 8
  %267 = inttoptr i32 %tmp2_v.i40.i44.i to i32*
  %268 = load i32, i32* %267, align 4
  %tmp2_v1.i42.i45.i = add i32 %268, 4
  %269 = inttoptr i32 %tmp2_v1.i42.i45.i to i32*
  %270 = load i32, i32* %269, align 4
  %271 = icmp sgt i32 %270, 0
  br i1 %271, label %BB_8049825.i.preheader.i, label %Func_set_intersection.exit

BB_8049825.i.preheader.i:                         ; preds = %Func_print_set.exit89
  %tmp4_v.i.i.i.i100 = add i32 %r_ebp.0.lcssa.i, -24
  br label %BB_8049825.i.i

BB_8049825.i.i:                                   ; preds = %BB_8049865.i.i, %BB_8049825.i.preheader.i
  %272 = phi i32 [ %tmp0_v1.i32.i.i, %BB_8049865.i.i ], [ 0, %BB_8049825.i.preheader.i ]
  %273 = phi i32 [ %305, %BB_8049865.i.i ], [ %268, %BB_8049825.i.preheader.i ]
  %r_ebp.150.i = phi i32 [ %r_ebp.0.i, %BB_8049865.i.i ], [ %264, %BB_8049825.i.preheader.i ]
  %r_ebx.149.i = phi i32 [ %r_ebx.0.i, %BB_8049865.i.i ], [ %263, %BB_8049825.i.preheader.i ]
  %r_esp.147.i = phi i32 [ %r_esp.0.i, %BB_8049865.i.i ], [ %tmp4_v.i.i.i.i100, %BB_8049825.i.preheader.i ]
  %274 = inttoptr i32 %273 to i32*
  %275 = load i32, i32* %274, align 4
  %tmp0_v4.i5.i.i = shl i32 %272, 2
  %tmp0_v5.i.i.i101 = add i32 %275, %tmp0_v4.i5.i.i
  %276 = inttoptr i32 %tmp0_v5.i.i.i101 to i32*
  %277 = load i32, i32* %276, align 4
  %tmp2_v8.i.i.i102 = add i32 %r_esp.147.i, -12
  %278 = inttoptr i32 %tmp2_v8.i.i.i102 to i32*
  store i32 %277, i32* %278, align 4
  %tmp2_v9.i.i.i103 = add i32 %r_ebp.150.i, 12
  %279 = inttoptr i32 %tmp2_v9.i.i.i103 to i32*
  %280 = load i32, i32* %279, align 4
  %tmp2_v11.i.i.i104 = add i32 %r_esp.147.i, -16
  %281 = inttoptr i32 %tmp2_v11.i.i.i104 to i32*
  store i32 %280, i32* %281, align 4
  %tmp2_v12.i.i.i105 = add i32 %r_esp.147.i, -20
  %282 = inttoptr i32 %tmp2_v12.i.i.i105 to i32*
  store i32 134518848, i32* %282, align 4
  %tmp2_v.i.i.i38.i = add i32 %r_esp.147.i, -24
  %283 = inttoptr i32 %tmp2_v.i.i.i38.i to i32*
  store i32 %r_ebp.150.i, i32* %283, align 4
  %tmp2_v1.i.i.i39.i = add i32 %r_esp.147.i, -44
  %284 = inttoptr i32 %tmp2_v1.i.i.i39.i to i32*
  store i32 134518319, i32* %284, align 4
  %tmp2_v.i9.i.i.i = add i32 %r_esp.147.i, -28
  %285 = inttoptr i32 %tmp2_v.i9.i.i.i to i32*
  store i32 0, i32* %285, align 4
  %286 = load i32, i32* %281, align 4
  %tmp2_v1.i22.i12.i.i = add i32 %286, 4
  %287 = inttoptr i32 %tmp2_v1.i22.i12.i.i to i32*
  %288 = load i32, i32* %287, align 4
  %289 = icmp sgt i32 %288, 0
  br i1 %289, label %BB_804963D.i.i.i, label %Func_is_member.exit.thread.i

Func_is_member.exit.thread.i:                     ; preds = %BB_8049825.i.i
  %290 = load i32, i32* %283, align 4
  br label %BB_8049865.i.i

BB_804963D.i.i.i:                                 ; preds = %BB_804965C.i.i.i, %BB_8049825.i.i
  %291 = phi i32 [ %297, %BB_804965C.i.i.i ], [ %286, %BB_8049825.i.i ]
  %storemerge13.i.i = phi i32 [ %tmp0_v1.i13.i.i.i, %BB_804965C.i.i.i ], [ 0, %BB_8049825.i.i ]
  %292 = inttoptr i32 %291 to i32*
  %293 = load i32, i32* %292, align 4
  %tmp0_v4.i.i.i.i = shl i32 %storemerge13.i.i, 2
  %tmp0_v5.i.i.i.i = add i32 %293, %tmp0_v4.i.i.i.i
  %294 = inttoptr i32 %tmp0_v5.i.i.i.i to i32*
  %295 = load i32, i32* %294, align 4
  %296 = load i32, i32* %278, align 4
  %.not.i.i.i.i = icmp eq i32 %296, %295
  %tmp0_v1.i13.i.i.i = add nuw nsw i32 %storemerge13.i.i, 1
  br i1 %.not.i.i.i.i, label %BB_8049847.i.i, label %BB_804965C.i.i.i

BB_804965C.i.i.i:                                 ; preds = %BB_804963D.i.i.i
  store i32 %tmp0_v1.i13.i.i.i, i32* %285, align 4
  %297 = load i32, i32* %281, align 4
  %tmp2_v1.i22.i.i.i = add i32 %297, 4
  %298 = inttoptr i32 %tmp2_v1.i22.i.i.i to i32*
  %299 = load i32, i32* %298, align 4
  %300 = icmp slt i32 %tmp0_v1.i13.i.i.i, %299
  br i1 %300, label %BB_804963D.i.i.i, label %Func_is_member.exit.thread57.i

Func_is_member.exit.thread57.i:                   ; preds = %BB_804965C.i.i.i
  %301 = load i32, i32* %283, align 4
  br label %BB_8049865.i.i

BB_8049865.i.i:                                   ; preds = %BB_8049847.i.i, %Func_is_member.exit.thread57.i, %Func_is_member.exit.thread.i
  %r_esp.0.in.i = phi i32 [ %newret.i106, %BB_8049847.i.i ], [ %tmp2_v11.i.i.i104, %Func_is_member.exit.thread.i ], [ %tmp2_v11.i.i.i104, %Func_is_member.exit.thread57.i ]
  %r_ebx.0.i = phi i32 [ %newret35.i, %BB_8049847.i.i ], [ %r_ebx.149.i, %Func_is_member.exit.thread.i ], [ %r_ebx.149.i, %Func_is_member.exit.thread57.i ]
  %r_ebp.0.i = phi i32 [ %newret33.i, %BB_8049847.i.i ], [ %290, %Func_is_member.exit.thread.i ], [ %301, %Func_is_member.exit.thread57.i ]
  %r_edx.0.i = phi i32 [ %newret31.i, %BB_8049847.i.i ], [ %tmp0_v4.i5.i.i, %Func_is_member.exit.thread.i ], [ %tmp0_v4.i.i.i.i, %Func_is_member.exit.thread57.i ]
  %r_esp.0.i = add i32 %r_esp.0.in.i, 16
  %tmp2_v.i30.i.i = add i32 %r_ebp.0.i, -16
  %302 = inttoptr i32 %tmp2_v.i30.i.i to i32*
  %303 = load i32, i32* %302, align 4
  %tmp0_v1.i32.i.i = add i32 %303, 1
  store i32 %tmp0_v1.i32.i.i, i32* %302, align 4
  %tmp2_v.i40.i.i = add i32 %r_ebp.0.i, 8
  %304 = inttoptr i32 %tmp2_v.i40.i.i to i32*
  %305 = load i32, i32* %304, align 4
  %tmp2_v1.i42.i.i = add i32 %305, 4
  %306 = inttoptr i32 %tmp2_v1.i42.i.i to i32*
  %307 = load i32, i32* %306, align 4
  %308 = icmp slt i32 %tmp0_v1.i32.i.i, %307
  br i1 %308, label %BB_8049825.i.i, label %.exit.loopexit.i

BB_8049847.i.i:                                   ; preds = %BB_804963D.i.i.i
  %309 = load i32, i32* %283, align 4
  %tmp2_v.i49.i.i = add i32 %309, 8
  %310 = inttoptr i32 %tmp2_v.i49.i.i to i32*
  %311 = load i32, i32* %310, align 4
  %312 = inttoptr i32 %311 to i32*
  %313 = load i32, i32* %312, align 4
  %tmp2_v2.i52.i.i = add i32 %309, -16
  %314 = inttoptr i32 %tmp2_v2.i52.i.i to i32*
  %315 = load i32, i32* %314, align 4
  %tmp0_v4.i54.i.i = shl i32 %315, 2
  %tmp0_v5.i55.i.i = add i32 %tmp0_v4.i54.i.i, %313
  %316 = inttoptr i32 %tmp0_v5.i55.i.i to i32*
  %317 = load i32, i32* %316, align 4
  store i32 %317, i32* %278, align 4
  %tmp2_v9.i60.i.i = add i32 %309, -12
  %318 = inttoptr i32 %tmp2_v9.i60.i.i to i32*
  %319 = load i32, i32* %318, align 4
  store i32 %319, i32* %281, align 4
  store i32 134518882, i32* %282, align 4
  %320 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v12.i.i.i105, i32 %tmp0_v4.i54.i.i, i32 %309, i32 %r_ebx.149.i)
  %newret.i106 = extractvalue { i32, i32, i32, i32 } %320, 0
  %newret31.i = extractvalue { i32, i32, i32, i32 } %320, 1
  %newret33.i = extractvalue { i32, i32, i32, i32 } %320, 2
  %newret35.i = extractvalue { i32, i32, i32, i32 } %320, 3
  br label %BB_8049865.i.i

.exit.loopexit.i:                                 ; preds = %BB_8049865.i.i
  %321 = inttoptr i32 %tmp2_v.i40.i.i to i32*
  %.pre.i = add i32 %r_ebp.0.i, -12
  %.pre55.i = inttoptr i32 %.pre.i to i32*
  br label %Func_set_intersection.exit

Func_set_intersection.exit:                       ; preds = %.exit.loopexit.i, %Func_print_set.exit89
  %.pre-phi = phi i32* [ %267, %Func_print_set.exit89 ], [ %321, %.exit.loopexit.i ]
  %.pre-phi.i = phi i32* [ %265, %Func_print_set.exit89 ], [ %.pre55.i, %.exit.loopexit.i ]
  %r_ebx.1.lcssa.i = phi i32 [ %263, %Func_print_set.exit89 ], [ %r_ebx.0.i, %.exit.loopexit.i ]
  %r_ebp.1.lcssa.i107 = phi i32 [ %264, %Func_print_set.exit89 ], [ %r_ebp.0.i, %.exit.loopexit.i ]
  %r_edx.1.lcssa.i = phi i32 [ %259, %Func_print_set.exit89 ], [ %r_edx.0.i, %.exit.loopexit.i ]
  %tmp2_v.i40.i.lcssa.i = phi i32 [ %tmp2_v.i40.i44.i, %Func_print_set.exit89 ], [ %tmp2_v.i40.i.i, %.exit.loopexit.i ]
  %322 = load i32, i32* %.pre-phi.i, align 4
  %323 = inttoptr i32 %r_ebp.1.lcssa.i107 to i32*
  %324 = load i32, i32* %323, align 4
  %tmp2_v.i314.i = add i32 %324, -24
  %325 = inttoptr i32 %tmp2_v.i314.i to i32*
  store i32 %322, i32* %325, align 4
  %tmp2_v2.i318.i = add i32 %r_ebx.1.lcssa.i, -8120
  store i32 %tmp2_v2.i318.i, i32* %.pre-phi, align 4
  %tmp2_v4.i319.i = add i32 %tmp2_v.i40.i.lcssa.i, -4
  %326 = inttoptr i32 %tmp2_v4.i319.i to i32*
  store i32 134517638, i32* %326, align 4
  %327 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %r_edx.1.lcssa.i, i32 noundef %tmp2_v.i40.i.lcssa.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !16
  %328 = load i32, i32* %325, align 4
  store i32 %328, i32* %.pre-phi, align 4
  store i32 134517652, i32* %326, align 4
  %tmp2_v.i3.i.i115 = add i32 %tmp2_v.i40.i.lcssa.i, -8
  %329 = inttoptr i32 %tmp2_v.i3.i.i115 to i32*
  store i32 %324, i32* %329, align 4
  %tmp2_v1.i5.i.i116 = add i32 %tmp2_v.i40.i.lcssa.i, -12
  %330 = inttoptr i32 %tmp2_v1.i5.i.i116 to i32*
  store i32 %r_ebx.1.lcssa.i, i32* %330, align 4
  %tmp2_v2.i.i.i117 = add i32 %tmp2_v.i40.i.lcssa.i, -36
  %331 = inttoptr i32 %tmp2_v2.i.i.i117 to i32*
  store i32 134518522, i32* %331, align 4
  %tmp2_v.i69.i.i118 = add i32 %tmp2_v.i40.i.lcssa.i, -20
  %332 = inttoptr i32 %tmp2_v.i69.i.i118 to i32*
  store i32 0, i32* %332, align 4
  %333 = load i32, i32* %.pre-phi, align 4
  %tmp2_v1.i.i22.i119 = add i32 %333, 4
  %334 = inttoptr i32 %tmp2_v1.i.i22.i119 to i32*
  %335 = load i32, i32* %334, align 4
  %336 = icmp sgt i32 %335, 0
  br i1 %336, label %BB_8049709.i.i133.preheader, label %Func_print_set.exit139

BB_8049709.i.i133.preheader:                      ; preds = %Func_set_intersection.exit
  %tmp2_v8.i61.i.i126 = add i32 %tmp2_v.i40.i.lcssa.i, -44
  %337 = inttoptr i32 %tmp2_v8.i61.i.i126 to i32*
  %tmp2_v10.i64.i.i127 = add i32 %tmp2_v.i40.i.lcssa.i, -48
  %338 = inttoptr i32 %tmp2_v10.i64.i.i127 to i32*
  %tmp2_v11.i65.i.i130 = add i32 %tmp2_v.i40.i.lcssa.i, -52
  %339 = inttoptr i32 %tmp2_v11.i65.i.i130 to i32*
  br label %BB_8049709.i.i133

BB_8049709.i.i133:                                ; preds = %BB_8049709.i.i133, %BB_8049709.i.i133.preheader
  %340 = phi i32 [ %350, %BB_8049709.i.i133 ], [ %335, %BB_8049709.i.i133.preheader ]
  %341 = phi i32 [ %348, %BB_8049709.i.i133 ], [ %333, %BB_8049709.i.i133.preheader ]
  %storemerge23.i121 = phi i32 [ %tmp0_v1.i.i.i131, %BB_8049709.i.i133 ], [ 0, %BB_8049709.i.i133.preheader ]
  %tmp0_v3.i18.i.i122 = add nsw i32 %340, -1
  %.not.i.i.i123 = icmp eq i32 %storemerge23.i121, %tmp0_v3.i18.i.i122
  %342 = inttoptr i32 %341 to i32*
  %343 = load i32, i32* %342, align 4
  %tmp0_v4.i56.i.i124 = shl i32 %storemerge23.i121, 2
  %tmp0_v5.i57.i.i125 = add i32 %343, %tmp0_v4.i56.i.i124
  %344 = inttoptr i32 %tmp0_v5.i57.i.i125 to i32*
  %345 = load i32, i32* %344, align 4
  store i32 %345, i32* %337, align 4
  %spi472 = ptrtoint[4 x i8]* @str.472 to i32
  %spi473 = ptrtoint[4 x i8]* @str.473 to i32
  %..i128 = select i1 %.not.i.i.i123, i32 %spi472, i32 %spi473
  %.29.i129 = select i1 %.not.i.i.i123, i32 134518582, i32 134518618
  store i32 %..i128, i32* %338, align 4
  store i32 %.29.i129, i32* %339, align 4
  %346 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %tmp0_v4.i56.i.i124, i32 noundef %tmp2_v10.i64.i.i127, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" 
  %347 = load i32, i32* %332, align 4
  %tmp0_v1.i.i.i131 = add i32 %347, 1
  store i32 %tmp0_v1.i.i.i131, i32* %332, align 4
  %348 = load i32, i32* %.pre-phi, align 4
  %tmp2_v1.i.i.i132 = add i32 %348, 4
  %349 = inttoptr i32 %tmp2_v1.i.i.i132 to i32*
  %350 = load i32, i32* %349, align 4
  %351 = icmp slt i32 %tmp0_v1.i.i.i131, %350
  br i1 %351, label %BB_8049709.i.i133, label %Func_print_set.exit139

Func_print_set.exit139:                           ; preds = %BB_8049709.i.i133, %Func_set_intersection.exit
  %352 = load i32, i32* %330, align 4
  %353 = load i32, i32* %329, align 4
  %tmp2_v.i343.i = add i32 %353, -32
  %354 = inttoptr i32 %tmp2_v.i343.i to i32*
  %355 = load i32, i32* %354, align 4
  %tmp2_v3.i345.i = add i32 %tmp2_v.i40.i.lcssa.i, 4
  %356 = inttoptr i32 %tmp2_v3.i345.i to i32*
  store i32 %355, i32* %356, align 4
  %tmp2_v4.i346.i = add i32 %353, -36
  %357 = inttoptr i32 %tmp2_v4.i346.i to i32*
  %358 = load i32, i32* %357, align 4
  store i32 %358, i32* %.pre-phi, align 4
  store i32 134517669, i32* %326, align 4
  %359 = tail call fastcc { i32, i32, i32, i32, i32 } @Func_set_difference(i32 %tmp2_v4.i319.i, i32 %353, i32 %352)
  %360 = extractvalue { i32, i32, i32, i32, i32 } %359, 0
  %361 = extractvalue { i32, i32, i32, i32, i32 } %359, 1
  %362 = extractvalue { i32, i32, i32, i32, i32 } %359, 2
  %363 = extractvalue { i32, i32, i32, i32, i32 } %359, 3
  %364 = extractvalue { i32, i32, i32, i32, i32 } %359, 4
  %tmp2_v.i305.i = add i32 %363, -20
  %365 = inttoptr i32 %tmp2_v.i305.i to i32*
  store i32 %361, i32* %365, align 4
  %tmp2_v2.i309.i = add i32 %364, -8101
  %366 = inttoptr i32 %360 to i32*
  store i32 %tmp2_v2.i309.i, i32* %366, align 4
  %tmp2_v4.i310.i = add i32 %360, -4
  %367 = inttoptr i32 %tmp2_v4.i310.i to i32*
  store i32 134517690, i32* %367, align 4
  %368 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %362, i32 noundef %360, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !16
  %369 = load i32, i32* %365, align 4
  store i32 %369, i32* %366, align 4
  store i32 134517704, i32* %367, align 4
  %tmp2_v.i3.i.i142 = add i32 %360, -8
  %370 = inttoptr i32 %tmp2_v.i3.i.i142 to i32*
  store i32 %363, i32* %370, align 4
  %tmp2_v1.i5.i.i143 = add i32 %360, -12
  %371 = inttoptr i32 %tmp2_v1.i5.i.i143 to i32*
  store i32 %364, i32* %371, align 4
  %tmp2_v2.i.i.i144 = add i32 %360, -36
  %372 = inttoptr i32 %tmp2_v2.i.i.i144 to i32*
  store i32 134518522, i32* %372, align 4
  %tmp2_v.i69.i.i145 = add i32 %360, -20
  %373 = inttoptr i32 %tmp2_v.i69.i.i145 to i32*
  store i32 0, i32* %373, align 4
  %374 = load i32, i32* %366, align 4
  %tmp2_v1.i.i22.i146 = add i32 %374, 4
  %375 = inttoptr i32 %tmp2_v1.i.i22.i146 to i32*
  %376 = load i32, i32* %375, align 4
  %377 = icmp sgt i32 %376, 0
  br i1 %377, label %BB_8049709.i.i160.preheader, label %Func_print_set.exit166

BB_8049709.i.i160.preheader:                      ; preds = %Func_print_set.exit139
  %tmp2_v8.i61.i.i153 = add i32 %360, -44
  %378 = inttoptr i32 %tmp2_v8.i61.i.i153 to i32*
  %tmp2_v10.i64.i.i154 = add i32 %360, -48
  %379 = inttoptr i32 %tmp2_v10.i64.i.i154 to i32*
  %tmp2_v11.i65.i.i157 = add i32 %360, -52
  %380 = inttoptr i32 %tmp2_v11.i65.i.i157 to i32*
  br label %BB_8049709.i.i160

BB_8049709.i.i160:                                ; preds = %BB_8049709.i.i160, %BB_8049709.i.i160.preheader
  %381 = phi i32 [ %391, %BB_8049709.i.i160 ], [ %376, %BB_8049709.i.i160.preheader ]
  %382 = phi i32 [ %389, %BB_8049709.i.i160 ], [ %374, %BB_8049709.i.i160.preheader ]
  %storemerge23.i148 = phi i32 [ %tmp0_v1.i.i.i158, %BB_8049709.i.i160 ], [ 0, %BB_8049709.i.i160.preheader ]
  %tmp0_v3.i18.i.i149 = add nsw i32 %381, -1
  %.not.i.i.i150 = icmp eq i32 %storemerge23.i148, %tmp0_v3.i18.i.i149
  %383 = inttoptr i32 %382 to i32*
  %384 = load i32, i32* %383, align 4
  %tmp0_v4.i56.i.i151 = shl i32 %storemerge23.i148, 2
  %tmp0_v5.i57.i.i152 = add i32 %384, %tmp0_v4.i56.i.i151
  %385 = inttoptr i32 %tmp0_v5.i57.i.i152 to i32*
  %386 = load i32, i32* %385, align 4
  store i32 %386, i32* %378, align 4
  %spi470 = ptrtoint[4 x i8]* @str.470 to i32
  %spi471 = ptrtoint[4 x i8]* @str.471 to i32
  %..i155 = select i1 %.not.i.i.i150, i32 %spi470, i32 %spi471
  %.29.i156 = select i1 %.not.i.i.i150, i32 134518582, i32 134518618
  store i32 %..i155, i32* %379, align 4
  store i32 %.29.i156, i32* %380, align 4
  %387 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %tmp0_v4.i56.i.i151, i32 noundef %tmp2_v10.i64.i.i154, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" 
  %388 = load i32, i32* %373, align 4
  %tmp0_v1.i.i.i158 = add i32 %388, 1
  store i32 %tmp0_v1.i.i.i158, i32* %373, align 4
  %389 = load i32, i32* %366, align 4
  %tmp2_v1.i.i.i159 = add i32 %389, 4
  %390 = inttoptr i32 %tmp2_v1.i.i.i159 to i32*
  %391 = load i32, i32* %390, align 4
  %392 = icmp slt i32 %tmp0_v1.i.i.i158, %391
  br i1 %392, label %BB_8049709.i.i160, label %Func_print_set.exit166

Func_print_set.exit166:                           ; preds = %BB_8049709.i.i160, %Func_print_set.exit139
  %393 = load i32, i32* %371, align 4
  %394 = load i32, i32* %370, align 4
  %tmp2_v.i207.i = add i32 %394, -36
  %395 = inttoptr i32 %tmp2_v.i207.i to i32*
  %396 = load i32, i32* %395, align 4
  %tmp2_v3.i209.i = add i32 %360, 4
  %397 = inttoptr i32 %tmp2_v3.i209.i to i32*
  store i32 %396, i32* %397, align 4
  %tmp2_v4.i210.i = add i32 %394, -32
  %398 = inttoptr i32 %tmp2_v4.i210.i to i32*
  %399 = load i32, i32* %398, align 4
  store i32 %399, i32* %366, align 4
  store i32 134517721, i32* %367, align 4
  %400 = tail call fastcc { i32, i32, i32, i32, i32 } @Func_set_difference(i32 %tmp2_v4.i310.i, i32 %394, i32 %393)
  %401 = extractvalue { i32, i32, i32, i32, i32 } %400, 0
  %402 = extractvalue { i32, i32, i32, i32, i32 } %400, 1
  %403 = extractvalue { i32, i32, i32, i32, i32 } %400, 2
  %404 = extractvalue { i32, i32, i32, i32, i32 } %400, 3
  %405 = extractvalue { i32, i32, i32, i32, i32 } %400, 4
  %tmp2_v.i147.i = add i32 %404, -16
  %406 = inttoptr i32 %tmp2_v.i147.i to i32*
  store i32 %402, i32* %406, align 4
  %tmp2_v2.i151.i = add i32 %405, -8093
  %407 = inttoptr i32 %401 to i32*
  store i32 %tmp2_v2.i151.i, i32* %407, align 4
  %tmp2_v4.i152.i = add i32 %401, -4
  %408 = inttoptr i32 %tmp2_v4.i152.i to i32*
  store i32 134517742, i32* %408, align 4
  %409 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %403, i32 noundef %401, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !16
  %410 = lshr i64 %409, 32
  %411 = trunc i64 %410 to i32
  %412 = load i32, i32* %406, align 4
  store i32 %412, i32* %407, align 4
  store i32 134517756, i32* %408, align 4
  %tmp2_v.i3.i.i169 = add i32 %401, -8
  %413 = inttoptr i32 %tmp2_v.i3.i.i169 to i32*
  store i32 %404, i32* %413, align 4
  %tmp2_v1.i5.i.i170 = add i32 %401, -12
  %414 = inttoptr i32 %tmp2_v1.i5.i.i170 to i32*
  store i32 %405, i32* %414, align 4
  %tmp2_v2.i.i.i171 = add i32 %401, -36
  %415 = inttoptr i32 %tmp2_v2.i.i.i171 to i32*
  store i32 134518522, i32* %415, align 4
  %tmp2_v.i69.i.i172 = add i32 %401, -20
  %416 = inttoptr i32 %tmp2_v.i69.i.i172 to i32*
  store i32 0, i32* %416, align 4
  %417 = load i32, i32* %407, align 4
  %tmp2_v1.i.i22.i173 = add i32 %417, 4
  %418 = inttoptr i32 %tmp2_v1.i.i22.i173 to i32*
  %419 = load i32, i32* %418, align 4
  %420 = icmp sgt i32 %419, 0
  br i1 %420, label %BB_8049709.i.i187.preheader, label %Func_print_set.exit193

BB_8049709.i.i187.preheader:                      ; preds = %Func_print_set.exit166
  %tmp2_v8.i61.i.i180 = add i32 %401, -44
  %421 = inttoptr i32 %tmp2_v8.i61.i.i180 to i32*
  %tmp2_v10.i64.i.i181 = add i32 %401, -48
  %422 = inttoptr i32 %tmp2_v10.i64.i.i181 to i32*
  %tmp2_v11.i65.i.i184 = add i32 %401, -52
  %423 = inttoptr i32 %tmp2_v11.i65.i.i184 to i32*
  br label %BB_8049709.i.i187

BB_8049709.i.i187:                                ; preds = %BB_8049709.i.i187, %BB_8049709.i.i187.preheader
  %424 = phi i32 [ %434, %BB_8049709.i.i187 ], [ %419, %BB_8049709.i.i187.preheader ]
  %425 = phi i32 [ %432, %BB_8049709.i.i187 ], [ %417, %BB_8049709.i.i187.preheader ]
  %storemerge23.i175 = phi i32 [ %tmp0_v1.i.i.i185, %BB_8049709.i.i187 ], [ 0, %BB_8049709.i.i187.preheader ]
  %tmp0_v3.i18.i.i176 = add nsw i32 %424, -1
  %.not.i.i.i177 = icmp eq i32 %storemerge23.i175, %tmp0_v3.i18.i.i176
  %426 = inttoptr i32 %425 to i32*
  %427 = load i32, i32* %426, align 4
  %tmp0_v4.i56.i.i178 = shl i32 %storemerge23.i175, 2
  %tmp0_v5.i57.i.i179 = add i32 %427, %tmp0_v4.i56.i.i178
  %428 = inttoptr i32 %tmp0_v5.i57.i.i179 to i32*
  %429 = load i32, i32* %428, align 4
  store i32 %429, i32* %421, align 4
  %spi468 = ptrtoint[4 x i8]* @str.468 to i32
  %spi469 = ptrtoint[4 x i8]* @str.469 to i32
  %..i182 = select i1 %.not.i.i.i177, i32 %spi468, i32 %spi469
  %.29.i183 = select i1 %.not.i.i.i177, i32 134518582, i32 134518618
  store i32 %..i182, i32* %422, align 4
  store i32 %.29.i183, i32* %423, align 4
  %430 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %tmp0_v4.i56.i.i178, i32 noundef %tmp2_v10.i64.i.i181, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" 
  %431 = load i32, i32* %416, align 4
  %tmp0_v1.i.i.i185 = add i32 %431, 1
  store i32 %tmp0_v1.i.i.i185, i32* %416, align 4
  %432 = load i32, i32* %407, align 4
  %tmp2_v1.i.i.i186 = add i32 %432, 4
  %433 = inttoptr i32 %tmp2_v1.i.i.i186 to i32*
  %434 = load i32, i32* %433, align 4
  %435 = icmp slt i32 %tmp0_v1.i.i.i185, %434
  br i1 %435, label %BB_8049709.i.i187, label %Func_print_set.exit193.loopexit

Func_print_set.exit193.loopexit:                  ; preds = %BB_8049709.i.i187
  %436 = lshr i64 %430, 32
  %437 = trunc i64 %436 to i32
  br label %Func_print_set.exit193

Func_print_set.exit193:                           ; preds = %Func_print_set.exit193.loopexit, %Func_print_set.exit166
  %r_edx.0.lcssa.i188 = phi i32 [ %411, %Func_print_set.exit166 ], [ %437, %Func_print_set.exit193.loopexit ]
  %438 = load i32, i32* %414, align 4
  %439 = load i32, i32* %413, align 4
  %tmp2_v.i57.i = add i32 %439, -32
  %440 = inttoptr i32 %tmp2_v.i57.i to i32*
  %441 = load i32, i32* %440, align 4
  %tmp2_v3.i59.i = add i32 %401, 4
  %442 = inttoptr i32 %tmp2_v3.i59.i to i32*
  store i32 %441, i32* %442, align 4
  %tmp2_v4.i60.i = add i32 %439, -36
  %443 = inttoptr i32 %tmp2_v4.i60.i to i32*
  %444 = load i32, i32* %443, align 4
  store i32 %444, i32* %407, align 4
  store i32 134517773, i32* %408, align 4
  %445 = tail call fastcc { i32, i32, i32, i32 } @Func_is_subset(i32 %tmp2_v4.i152.i, i32 %r_edx.0.lcssa.i188, i32 %439)
  %446 = extractvalue { i32, i32, i32, i32 } %445, 0
  %447 = extractvalue { i32, i32, i32, i32 } %445, 2
  %448 = extractvalue { i32, i32, i32, i32 } %445, 3
  %tmp2_v.i37.i = add i32 %438, -8061
  %449 = inttoptr i32 %446 to i32*
  store i32 %tmp2_v.i37.i, i32* %449, align 4
  %tmp2_v2.i39.i = add i32 %446, -4
  %450 = inttoptr i32 %tmp2_v2.i39.i to i32*
  store i32 134517815, i32* %450, align 4
  %arg.i.i194 = load i32, i32* %449, align 4
  %451 = inttoptr i32 %arg.i.i194 to i8*
  %452 = tail call i32 @puts(i8* nonnull dereferenceable(1) %451)
  %tmp2_v.i367.i = add i32 %448, -32
  %453 = inttoptr i32 %tmp2_v.i367.i to i32*
  %454 = load i32, i32* %453, align 4
  %tmp2_v3.i369.i = add i32 %446, 4
  %455 = inttoptr i32 %tmp2_v3.i369.i to i32*
  store i32 %454, i32* %455, align 4
  %tmp2_v4.i370.i = add i32 %448, -16
  %456 = inttoptr i32 %tmp2_v4.i370.i to i32*
  %457 = load i32, i32* %456, align 4
  store i32 %457, i32* %449, align 4
  store i32 134517832, i32* %450, align 4
  %458 = tail call fastcc { i32, i32, i32, i32 } @Func_is_subset(i32 %tmp2_v2.i39.i, i32 %447, i32 %448)
  %459 = extractvalue { i32, i32, i32, i32 } %458, 0
  %460 = extractvalue { i32, i32, i32, i32 } %458, 3
  %tmp2_v.i18.i = add i32 %438, -8037
  %461 = inttoptr i32 %459 to i32*
  store i32 %tmp2_v.i18.i, i32* %461, align 4
  %tmp2_v2.i19.i = add i32 %459, -4
  %462 = inttoptr i32 %tmp2_v2.i19.i to i32*
  store i32 134517854, i32* %462, align 4
  %arg.i.i195 = load i32, i32* %461, align 4
  %463 = inttoptr i32 %arg.i.i195 to i8*
  %464 = tail call i32 @puts(i8* nonnull dereferenceable(1) %463)
  %tmp2_v.i179.i = add i32 %460, -32
  %465 = inttoptr i32 %tmp2_v.i179.i to i32*
  %466 = load i32, i32* %465, align 4
  %tmp2_v2.i181.i = add i32 %459, 4
  %467 = inttoptr i32 %tmp2_v2.i181.i to i32*
  store i32 %466, i32* %467, align 4
  %tmp2_v3.i182.i = add i32 %460, -16
  %468 = inttoptr i32 %tmp2_v3.i182.i to i32*
  %469 = load i32, i32* %468, align 4
  store i32 %469, i32* %461, align 4
  store i32 134517891, i32* %462, align 4
  %tmp2_v.i8.i.i = add i32 %459, -8
  %470 = inttoptr i32 %tmp2_v.i8.i.i to i32*
  store i32 %460, i32* %470, align 4
  %tmp2_v1.i10.i.i = add i32 %459, -12
  %471 = inttoptr i32 %tmp2_v1.i10.i.i to i32*
  store i32 134519133, i32* %471, align 4
  %472 = load i32, i32* %461, align 4
  %tmp2_v2.i.i.i196 = add i32 %472, 4
  %473 = inttoptr i32 %tmp2_v2.i.i.i196 to i32*
  %474 = load i32, i32* %473, align 4
  %475 = load i32, i32* %467, align 4
  %tmp2_v6.i.i.i = add i32 %475, 4
  %476 = inttoptr i32 %tmp2_v6.i.i.i to i32*
  %477 = load i32, i32* %476, align 4
  %478 = icmp eq i32 %474, %477
  br i1 %478, label %BB_8049979.i.i, label %Func_set_equality.exit

BB_8049979.i.i:                                   ; preds = %Func_print_set.exit193
  store i32 %475, i32* %471, align 4
  %479 = load i32, i32* %461, align 4
  %tmp2_v4.i6.i.i = add i32 %459, -16
  %480 = inttoptr i32 %tmp2_v4.i6.i.i to i32*
  store i32 %479, i32* %480, align 4
  %tmp2_v5.i.i.i = add i32 %459, -20
  %481 = inttoptr i32 %tmp2_v5.i.i.i to i32*
  store i32 134519172, i32* %481, align 4
  %482 = tail call fastcc { i32, i32, i32, i32 } @Func_is_subset(i32 %tmp2_v5.i.i.i, i32 %474, i32 %tmp2_v.i8.i.i)  nounwind 
  %483 = extractvalue { i32, i32, i32, i32 } %482, 3
  %.pre.i197 = inttoptr i32 %483 to i32*
  br label %Func_set_equality.exit

Func_set_equality.exit:                           ; preds = %BB_8049979.i.i, %Func_print_set.exit193
  %.pre-phi.i198 = phi i32* [ %470, %Func_print_set.exit193 ], [ %.pre.i197, %BB_8049979.i.i ]
  %r_ebp.0.i199 = phi i32 [ %tmp2_v.i8.i.i, %Func_print_set.exit193 ], [ %483, %BB_8049979.i.i ]
  %484 = load i32, i32* %.pre-phi.i198, align 4
  %tmp4_v2.i.i.i = add i32 %r_ebp.0.i199, 8
  %tmp2_v.i66.i = add i32 %438, -7976
  %485 = inttoptr i32 %tmp4_v2.i.i.i to i32*
  store i32 %tmp2_v.i66.i, i32* %485, align 4
  %tmp2_v2.i68.i = add i32 %r_ebp.0.i199, 4
  %486 = inttoptr i32 %tmp2_v2.i68.i to i32*
  store i32 134517933, i32* %486, align 4
  %arg.i.i205 = load i32, i32* %485, align 4
  %487 = inttoptr i32 %arg.i.i205 to i8*
  %488 = tail call i32 @puts(i8* nonnull dereferenceable(1) %487)
  %tmp2_v.i8.i = add i32 %r_ebp.0.i199, 20
  %489 = inttoptr i32 %tmp2_v.i8.i to i32*
  store i32 134517941, i32* %489, align 4
  %tmp2_v.i7.i.i206 = add i32 %r_ebp.0.i199, 16
  %490 = inttoptr i32 %tmp2_v.i7.i.i206 to i32*
  store i32 %484, i32* %490, align 4
  %tmp2_v1.i.i.i207 = add i32 %r_ebp.0.i199, 12
  %491 = inttoptr i32 %tmp2_v1.i.i.i207 to i32*
  store i32 %438, i32* %491, align 4
  %tmp2_v2.i11.i.i208 = add i32 %r_ebp.0.i199, -12
  %492 = inttoptr i32 %tmp2_v2.i11.i.i208 to i32*
  store i32 134518214, i32* %492, align 4
  %tmp2_v.i.i.i209 = add i32 %r_ebp.0.i199, -24
  %493 = inttoptr i32 %tmp2_v.i.i.i209 to i32*
  store i32 8, i32* %493, align 4
  %tmp2_v2.i.i.i210 = add i32 %r_ebp.0.i199, -28
  %494 = inttoptr i32 %tmp2_v2.i.i.i210 to i32*
  store i32 134518230, i32* %494, align 4
  %arg.i.i.i211 = load i32, i32* %493, align 4
  %495 = tail call i32 @malloc(i32 %arg.i.i.i211)
  store i32 %495, i32* %486, align 4
  %tmp2_v3.i.i.i213 = add i32 %495, 4
  %496 = inttoptr i32 %tmp2_v3.i.i.i213 to i32*
  store i32 0, i32* %496, align 4
  store i32 4, i32* %493, align 4
  store i32 134518256, i32* %494, align 4
  %arg.i.i17.i214 = load i32, i32* %493, align 4
  %497 = tail call i32 @malloc(i32 %arg.i.i17.i214)
  %498 = load i32, i32* %486, align 4
  %499 = inttoptr i32 %498 to i32*
  store i32 %497, i32* %499, align 4
  %500 = load i32, i32* %486, align 4
  %501 = load i32, i32* %491, align 4
  %502 = load i32, i32* %490, align 4
  %tmp2_v.i189.i = add i32 %502, -12
  %503 = inttoptr i32 %tmp2_v.i189.i to i32*
  store i32 %500, i32* %503, align 4
  store i32 9, i32* %491, align 4
  %504 = load i32, i32* %503, align 4
  store i32 %504, i32* %485, align 4
  store i32 134517957, i32* %486, align 4
  %505 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v2.i68.i, i32 %497, i32 %502, i32 %501)
  %newret284 = extractvalue { i32, i32, i32, i32 } %505, 0
  %newret286 = extractvalue { i32, i32, i32, i32 } %505, 1
  %newret288 = extractvalue { i32, i32, i32, i32 } %505, 2
  %newret290 = extractvalue { i32, i32, i32, i32 } %505, 3
  %tmp2_v.i119.i = add i32 %newret284, 4
  %506 = inttoptr i32 %tmp2_v.i119.i to i32*
  store i32 10, i32* %506, align 4
  %tmp2_v2.i121.i = add i32 %newret288, -12
  %507 = inttoptr i32 %tmp2_v2.i121.i to i32*
  %508 = load i32, i32* %507, align 4
  %509 = inttoptr i32 %newret284 to i32*
  store i32 %508, i32* %509, align 4
  %tmp2_v5.i123.i = add i32 %newret284, -4
  %510 = inttoptr i32 %tmp2_v5.i123.i to i32*
  store i32 134517973, i32* %510, align 4
  %511 = tail call fastcc { i32, i32, i32, i32 } @Func_insert(i32 %tmp2_v5.i123.i, i32 %newret286, i32 %newret288, i32 %newret290)
  %newret = extractvalue { i32, i32, i32, i32 } %511, 0
  %newret278 = extractvalue { i32, i32, i32, i32 } %511, 1
  %newret280 = extractvalue { i32, i32, i32, i32 } %511, 2
  %newret282 = extractvalue { i32, i32, i32, i32 } %511, 3
  %tmp2_v.i295.i = add i32 %newret282, -7955
  %512 = inttoptr i32 %newret to i32*
  store i32 %tmp2_v.i295.i, i32* %512, align 4
  %tmp2_v3.i296.i = add i32 %newret, -4
  %513 = inttoptr i32 %tmp2_v3.i296.i to i32*
  store i32 134517991, i32* %513, align 4
  %514 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %newret278, i32 noundef %newret, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !16
  %tmp2_v.i224.i = add i32 %newret280, -12
  %515 = inttoptr i32 %tmp2_v.i224.i to i32*
  %516 = load i32, i32* %515, align 4
  store i32 %516, i32* %512, align 4
  store i32 134518005, i32* %513, align 4
  %tmp2_v.i3.i.i223 = add i32 %newret, -8
  %517 = inttoptr i32 %tmp2_v.i3.i.i223 to i32*
  store i32 %newret280, i32* %517, align 4
  %tmp2_v1.i5.i.i224 = add i32 %newret, -12
  %518 = inttoptr i32 %tmp2_v1.i5.i.i224 to i32*
  store i32 %newret282, i32* %518, align 4
  %tmp2_v2.i.i.i225 = add i32 %newret, -36
  %519 = inttoptr i32 %tmp2_v2.i.i.i225 to i32*
  store i32 134518522, i32* %519, align 4
  %tmp2_v.i69.i.i226 = add i32 %newret, -20
  %520 = inttoptr i32 %tmp2_v.i69.i.i226 to i32*
  store i32 0, i32* %520, align 4
  %521 = load i32, i32* %512, align 4
  %tmp2_v1.i.i22.i227 = add i32 %521, 4
  %522 = inttoptr i32 %tmp2_v1.i.i22.i227 to i32*
  %523 = load i32, i32* %522, align 4
  %524 = icmp sgt i32 %523, 0
  br i1 %524, label %BB_8049709.i.i241.preheader, label %Func_print_set.exit247

BB_8049709.i.i241.preheader:                      ; preds = %Func_set_equality.exit
  %tmp2_v8.i61.i.i234 = add i32 %newret, -44
  %525 = inttoptr i32 %tmp2_v8.i61.i.i234 to i32*
  %tmp2_v10.i64.i.i235 = add i32 %newret, -48
  %526 = inttoptr i32 %tmp2_v10.i64.i.i235 to i32*
  %tmp2_v11.i65.i.i238 = add i32 %newret, -52
  %527 = inttoptr i32 %tmp2_v11.i65.i.i238 to i32*
  br label %BB_8049709.i.i241

BB_8049709.i.i241:                                ; preds = %BB_8049709.i.i241, %BB_8049709.i.i241.preheader
  %528 = phi i32 [ %538, %BB_8049709.i.i241 ], [ %523, %BB_8049709.i.i241.preheader ]
  %529 = phi i32 [ %536, %BB_8049709.i.i241 ], [ %521, %BB_8049709.i.i241.preheader ]
  %storemerge23.i229 = phi i32 [ %tmp0_v1.i.i.i239, %BB_8049709.i.i241 ], [ 0, %BB_8049709.i.i241.preheader ]
  %tmp0_v3.i18.i.i230 = add nsw i32 %528, -1
  %.not.i.i.i231 = icmp eq i32 %storemerge23.i229, %tmp0_v3.i18.i.i230
  %530 = inttoptr i32 %529 to i32*
  %531 = load i32, i32* %530, align 4
  %tmp0_v4.i56.i.i232 = shl i32 %storemerge23.i229, 2
  %tmp0_v5.i57.i.i233 = add i32 %531, %tmp0_v4.i56.i.i232
  %532 = inttoptr i32 %tmp0_v5.i57.i.i233 to i32*
  %533 = load i32, i32* %532, align 4
  store i32 %533, i32* %525, align 4
  %spi466 = ptrtoint[4 x i8]* @str.466 to i32
  %spi467 = ptrtoint[4 x i8]* @str.467 to i32
  %..i236 = select i1 %.not.i.i.i231, i32 %spi466, i32 %spi467
  %.29.i237 = select i1 %.not.i.i.i231, i32 134518582, i32 134518618
  store i32 %..i236, i32* %526, align 4
  store i32 %.29.i237, i32* %527, align 4
  %534 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i108.i, i32 inreg noundef %tmp0_v4.i56.i.i232, i32 noundef %tmp2_v10.i64.i.i235, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" 
  %535 = load i32, i32* %520, align 4
  %tmp0_v1.i.i.i239 = add i32 %535, 1
  store i32 %tmp0_v1.i.i.i239, i32* %520, align 4
  %536 = load i32, i32* %512, align 4
  %tmp2_v1.i.i.i240 = add i32 %536, 4
  %537 = inttoptr i32 %tmp2_v1.i.i.i240 to i32*
  %538 = load i32, i32* %537, align 4
  %539 = icmp slt i32 %tmp0_v1.i.i.i239, %538
  br i1 %539, label %BB_8049709.i.i241, label %Func_print_set.exit247

Func_print_set.exit247:                           ; preds = %BB_8049709.i.i241, %Func_set_equality.exit
  %540 = load i32, i32* %518, align 4
  %541 = load i32, i32* %517, align 4
  %tmp2_v.i269.i = add i32 %541, -12
  %542 = inttoptr i32 %tmp2_v.i269.i to i32*
  %543 = load i32, i32* %542, align 4
  %tmp2_v3.i271.i = add i32 %newret, 4
  %544 = inttoptr i32 %tmp2_v3.i271.i to i32*
  store i32 %543, i32* %544, align 4
  %tmp2_v4.i272.i = add i32 %541, -16
  %545 = inttoptr i32 %tmp2_v4.i272.i to i32*
  %546 = load i32, i32* %545, align 4
  store i32 %546, i32* %512, align 4
  store i32 134518022, i32* %513, align 4
  store i32 %541, i32* %517, align 4
  store i32 134519133, i32* %518, align 4
  %547 = load i32, i32* %512, align 4
  %tmp2_v2.i.i.i250 = add i32 %547, 4
  %548 = inttoptr i32 %tmp2_v2.i.i.i250 to i32*
  %549 = load i32, i32* %548, align 4
  %550 = load i32, i32* %544, align 4
  %tmp2_v6.i.i.i252 = add i32 %550, 4
  %551 = inttoptr i32 %tmp2_v6.i.i.i252 to i32*
  %552 = load i32, i32* %551, align 4
  %553 = icmp eq i32 %549, %552
  br i1 %553, label %BB_8049979.i.i256, label %Func_set_equality.exit266

BB_8049979.i.i256:                                ; preds = %Func_print_set.exit247
  store i32 %550, i32* %518, align 4
  %554 = load i32, i32* %512, align 4
  %tmp2_v4.i6.i.i253 = add i32 %newret, -16
  %555 = inttoptr i32 %tmp2_v4.i6.i.i253 to i32*
  store i32 %554, i32* %555, align 4
  store i32 134519172, i32* %520, align 4
  %556 = tail call fastcc { i32, i32, i32, i32 } @Func_is_subset(i32 %tmp2_v.i69.i.i226, i32 %549, i32 %tmp2_v.i3.i.i223)  nounwind 
  %557 = extractvalue { i32, i32, i32, i32 } %556, 3
  %.pre.i255 = inttoptr i32 %557 to i32*
  br label %Func_set_equality.exit266

Func_set_equality.exit266:                        ; preds = %BB_8049979.i.i256, %Func_print_set.exit247
  %.pre-phi.i257 = phi i32* [ %517, %Func_print_set.exit247 ], [ %.pre.i255, %BB_8049979.i.i256 ]
  %r_ebp.0.i258 = phi i32 [ %tmp2_v.i3.i.i223, %Func_print_set.exit247 ], [ %557, %BB_8049979.i.i256 ]
  %558 = load i32, i32* %.pre-phi.i257, align 4
  %tmp4_v2.i.i.i261 = add i32 %r_ebp.0.i258, 8
  %tmp2_v.i23.i = add i32 %540, -7947
  %559 = inttoptr i32 %tmp4_v2.i.i.i261 to i32*
  store i32 %tmp2_v.i23.i, i32* %559, align 4
  %tmp2_v2.i25.i = add i32 %r_ebp.0.i258, 4
  %560 = inttoptr i32 %tmp2_v2.i25.i to i32*
  store i32 134518044, i32* %560, align 4
  %arg.i.i267 = load i32, i32* %559, align 4
  %561 = inttoptr i32 %arg.i.i267 to i8*
  %562 = tail call i32 @puts(i8* nonnull dereferenceable(1) %561)
  %tmp2_v.i138.i = add i32 %r_ebp.0.i258, 12
  %563 = inttoptr i32 %tmp2_v.i138.i to i32*
  store i32 9, i32* %563, align 4
  %tmp2_v1.i140.i = add i32 %558, -16
  %564 = inttoptr i32 %tmp2_v1.i140.i to i32*
  %565 = load i32, i32* %564, align 4
  store i32 %565, i32* %559, align 4
  store i32 134518080, i32* %560, align 4
  store i32 %558, i32* %.pre-phi.i257, align 4
  %tmp2_v1.i.i.i269 = add i32 %r_ebp.0.i258, -20
  %566 = inttoptr i32 %tmp2_v1.i.i.i269 to i32*
  store i32 134518319, i32* %566, align 4
  %tmp2_v.i9.i.i270 = add i32 %r_ebp.0.i258, -4
  %567 = inttoptr i32 %tmp2_v.i9.i.i270 to i32*
  store i32 0, i32* %567, align 4
  %568 = load i32, i32* %559, align 4
  %tmp2_v1.i22.i12.i = add i32 %568, 4
  %569 = inttoptr i32 %tmp2_v1.i22.i12.i to i32*
  %570 = load i32, i32* %569, align 4
  %571 = icmp sgt i32 %570, 0
  br i1 %571, label %BB_804963D.i.i, label %Func_is_member.exit

BB_804963D.i.i:                                   ; preds = %BB_804965C.i.i, %Func_set_equality.exit266
  %572 = phi i32 [ %578, %BB_804965C.i.i ], [ %568, %Func_set_equality.exit266 ]
  %storemerge13.i = phi i32 [ %tmp0_v1.i13.i.i, %BB_804965C.i.i ], [ 0, %Func_set_equality.exit266 ]
  %573 = inttoptr i32 %572 to i32*
  %574 = load i32, i32* %573, align 4
  %tmp0_v4.i.i.i271 = shl i32 %storemerge13.i, 2
  %tmp0_v5.i.i.i272 = add i32 %574, %tmp0_v4.i.i.i271
  %575 = inttoptr i32 %tmp0_v5.i.i.i272 to i32*
  %576 = load i32, i32* %575, align 4
  %577 = load i32, i32* %563, align 4
  %.not.i.i.i273 = icmp eq i32 %577, %576
  %tmp0_v1.i13.i.i = add nuw nsw i32 %storemerge13.i, 1
  br i1 %.not.i.i.i273, label %Func_is_member.exit, label %BB_804965C.i.i

BB_804965C.i.i:                                   ; preds = %BB_804963D.i.i
  store i32 %tmp0_v1.i13.i.i, i32* %567, align 4
  %578 = load i32, i32* %559, align 4
  %tmp2_v1.i22.i.i = add i32 %578, 4
  %579 = inttoptr i32 %tmp2_v1.i22.i.i to i32*
  %580 = load i32, i32* %579, align 4
  %581 = icmp slt i32 %tmp0_v1.i13.i.i, %580
  br i1 %581, label %BB_804963D.i.i, label %Func_is_member.exit

Func_is_member.exit:                              ; preds = %BB_804965C.i.i, %BB_804963D.i.i, %Func_set_equality.exit266
  %582 = load i32, i32* %.pre-phi.i257, align 4
  %tmp2_v.i252.i = add i32 %540, -7909
  store i32 %tmp2_v.i252.i, i32* %559, align 4
  store i32 134518102, i32* %560, align 4
  %arg.i.i278 = load i32, i32* %559, align 4
  %583 = inttoptr i32 %arg.i.i278 to i8*
  %584 = tail call i32 @puts(i8* nonnull dereferenceable(1) %583)
  store i32 11, i32* %563, align 4
  %tmp2_v1.i261.i = add i32 %582, -16
  %585 = inttoptr i32 %tmp2_v1.i261.i to i32*
  %586 = load i32, i32* %585, align 4
  store i32 %586, i32* %559, align 4
  store i32 134518138, i32* %560, align 4
  store i32 %582, i32* %.pre-phi.i257, align 4
  store i32 134518319, i32* %566, align 4
  store i32 0, i32* %567, align 4
  %587 = load i32, i32* %559, align 4
  %tmp2_v1.i22.i12.i282 = add i32 %587, 4
  %588 = inttoptr i32 %tmp2_v1.i22.i12.i282 to i32*
  %589 = load i32, i32* %588, align 4
  %590 = icmp sgt i32 %589, 0
  br i1 %590, label %BB_804963D.i.i290, label %Func_is_member.exit298

BB_804963D.i.i290:                                ; preds = %BB_804965C.i.i292, %Func_is_member.exit
  %591 = phi i32 [ %597, %BB_804965C.i.i292 ], [ %587, %Func_is_member.exit ]
  %storemerge13.i285 = phi i32 [ %tmp0_v1.i13.i.i289, %BB_804965C.i.i292 ], [ 0, %Func_is_member.exit ]
  %592 = inttoptr i32 %591 to i32*
  %593 = load i32, i32* %592, align 4
  %tmp0_v4.i.i.i286 = shl i32 %storemerge13.i285, 2
  %tmp0_v5.i.i.i287 = add i32 %593, %tmp0_v4.i.i.i286
  %594 = inttoptr i32 %tmp0_v5.i.i.i287 to i32*
  %595 = load i32, i32* %594, align 4
  %596 = load i32, i32* %563, align 4
  %.not.i.i.i288 = icmp eq i32 %596, %595
  %tmp0_v1.i13.i.i289 = add nuw nsw i32 %storemerge13.i285, 1
  br i1 %.not.i.i.i288, label %Func_is_member.exit298, label %BB_804965C.i.i292

BB_804965C.i.i292:                                ; preds = %BB_804963D.i.i290
  store i32 %tmp0_v1.i13.i.i289, i32* %567, align 4
  %597 = load i32, i32* %559, align 4
  %tmp2_v1.i22.i.i291 = add i32 %597, 4
  %598 = inttoptr i32 %tmp2_v1.i22.i.i291 to i32*
  %599 = load i32, i32* %598, align 4
  %600 = icmp slt i32 %tmp0_v1.i13.i.i289, %599
  br i1 %600, label %BB_804963D.i.i290, label %Func_is_member.exit298

Func_is_member.exit298:                           ; preds = %BB_804965C.i.i292, %BB_804963D.i.i290, %Func_is_member.exit
  %tmp2_v.i240.i = add i32 %540, -7859
  store i32 %tmp2_v.i240.i, i32* %559, align 4
  store i32 134518180, i32* %560, align 4
  %arg.i.i299 = load i32, i32* %559, align 4
  %601 = inttoptr i32 %arg.i.i299 to i8*
  %602 = tail call i32 @puts(i8* nonnull dereferenceable(1) %601)
  ret void
}


!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
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
!12 = !{i32 0, i32 2, i32 3}
!13 = !{i32 0, i32 3, i32 4}
!14 = !{i32 0, i32 1, i32 2, i32 3, i32 4}
!15 = !{i32 0, i32 0, i32 0}
!16 = !{!"printf"}

  tail call fastcc void @sets480(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) nounwind
