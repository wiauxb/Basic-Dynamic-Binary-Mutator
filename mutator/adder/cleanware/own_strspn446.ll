; Mutation 446
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack = internal global [4194304 x i32] zeroinitializer, align 16
@onUnfallback = common local_unnamed_addr global i1 false
@str.443 = constant [11 x i8] c"0123456789\00"
@str.444 = constant [11 x i8] c"0123456789\00"
@str.445 = constant [11 x i8] c"12363acdef\00"

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

; Function Attrs: noinline
declare i32 @strlen(i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @own_strspn446(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
  %tmp2_v.i2.i = add i32 %arg_esp, 4
  %tmp0_v.i3.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i3.i, -4
  %3 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i.i = add i32 %tmp0_v.i3.i, -8
  %4 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i6.i = add i32 %tmp0_v.i3.i, -12
  %5 = inttoptr i32 %tmp2_v5.i6.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i3.i, -16
  %6 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i2.i, i32* %6, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i3.i, -36
  %7 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517201, i32* %7, align 4
  %tmp2_v1.i.i = add i32 %tmp0_v.i3.i, -28
  %8 = inttoptr i32 %tmp2_v1.i.i to i32*
  %spi445 = ptrtoint[11 x i8]* @str.445 to i32
  store i32 %spi445, i32* %8, align 4
  %tmp2_v3.i11.i = add i32 %tmp0_v.i3.i, -24
  %9 = inttoptr i32 %tmp2_v3.i11.i to i32*
  %spi444 = ptrtoint[11 x i8]* @str.444 to i32
  store i32 %spi444, i32* %9, align 8
  %tmp2_v7.i.i = add i32 %tmp0_v.i3.i, -44
  %10 = inttoptr i32 %tmp2_v7.i.i to i32*
  %spi443 = ptrtoint[11 x i8]* @str.443 to i32
  store i32 %spi443, i32* %10, align 4
  %11 = load i32, i32* %8, align 4
  %tmp2_v10.i.i = add i32 %tmp0_v.i3.i, -48
  %12 = inttoptr i32 %tmp2_v10.i.i to i32*
  store i32 %11, i32* %12, align 16
  %tmp2_v11.i.i = add i32 %tmp0_v.i3.i, -52
  %13 = inttoptr i32 %tmp2_v11.i.i to i32*
  store i32 134517239, i32* %13, align 4
  %tmp2_v.i6.i.i = add i32 %tmp0_v.i3.i, -56
  %14 = inttoptr i32 %tmp2_v.i6.i.i to i32*
  store i32 %tmp2_v4.i.i, i32* %14, align 8
  %tmp2_v1.i8.i.i = add i32 %tmp0_v.i3.i, -60
  %15 = inttoptr i32 %tmp2_v1.i8.i.i to i32*
  store i32 134529024, i32* %15, align 4
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i3.i, -100
  %16 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  store i32 134517297, i32* %16, align 4
  %tmp2_v.i66.i.i = add i32 %tmp0_v.i3.i, -84
  %17 = inttoptr i32 %tmp2_v.i66.i.i to i32*
  store i32 0, i32* %17, align 4
  %18 = load i32, i32* %12, align 16
  %tmp2_v4.i71.i.i = add i32 %tmp0_v.i3.i, -112
  %19 = inttoptr i32 %tmp2_v4.i71.i.i to i32*
  store i32 %18, i32* %19, align 16
  %tmp2_v5.i72.i.i = add i32 %tmp0_v.i3.i, -116
  %20 = inttoptr i32 %tmp2_v5.i72.i.i to i32*
  store i32 134517321, i32* %20, align 4
  %arg.i.i.i = load i32, i32* %19, align 16
  %21 = tail call i32 @strlen(i32 %arg.i.i.i)
  %tmp2_v.i76.i.i = add i32 %tmp0_v.i3.i, -72
  %22 = inttoptr i32 %tmp2_v.i76.i.i to i32*
  store i32 %21, i32* %22, align 8
  %23 = load i32, i32* %10, align 4
  store i32 %23, i32* %19, align 16
  store i32 134517338, i32* %20, align 4
  %arg.i.i6.i = load i32, i32* %19, align 16
  %24 = tail call i32 @strlen(i32 %arg.i.i6.i)
  %tmp2_v.i41.i.i = add i32 %tmp0_v.i3.i, -68
  %25 = inttoptr i32 %tmp2_v.i41.i.i to i32*
  store i32 %24, i32* %25, align 4
  %tmp2_v1.i42.i.i = add i32 %tmp0_v.i3.i, -80
  %26 = inttoptr i32 %tmp2_v1.i42.i.i to i32*
  %tmp2_v.i11.i.i = add i32 %tmp0_v.i3.i, -85
  %27 = inttoptr i32 %tmp2_v.i11.i.i to i8*
  %tmp2_v1.i12.i.i = add i32 %tmp0_v.i3.i, -76
  %28 = inttoptr i32 %tmp2_v1.i12.i.i to i32*
  br label %BB_80492B5.i.i

BB_80492A2.i.i:                                   ; preds = %BB_804929A.i.i, %BB_80492B5.i.i
  %r_ecx.2.lcssa.i = phi i32 [ %r_ecx.1.i, %BB_80492B5.i.i ], [ %32, %BB_804929A.i.i ]
  %r_edx.2.lcssa.i = phi i32 [ %r_edx.1.i, %BB_80492B5.i.i ], [ %tmp0_v4.i.i.i, %BB_804929A.i.i ]
  %.pr.i = load i8, i8* %27, align 1
  %.not.i.i.i = icmp eq i8 %.pr.i, 1
  br i1 %.not.i.i.i, label %BB_80492AD.i.i, label %Func__strspn.exit

BB_8049276.i.i:                                   ; preds = %BB_804929A.i.i, %BB_80492B5.i.i
  %storemerge115.i = phi i32 [ %tmp0_v1.i18.i.i, %BB_804929A.i.i ], [ 0, %BB_80492B5.i.i ]
  %29 = load i32, i32* %10, align 4
  %tmp0_v3.i.i.i = add i32 %29, %storemerge115.i
  %30 = inttoptr i32 %tmp0_v3.i.i.i to i8*
  %31 = load i8, i8* %30, align 1
  %tmp0_v4.i.i.i = zext i8 %31 to i32
  %32 = load i32, i32* %12, align 16
  %33 = load i32, i32* %26, align 16
  %tmp0_v9.i.i.i = add i32 %33, %32
  %34 = inttoptr i32 %tmp0_v9.i.i.i to i8*
  %35 = load i8, i8* %34, align 1
  %tmp0_v10.i.i.i = zext i8 %35 to i32
  %cc_dst_v.i.i.i = sub nsw i32 %tmp0_v4.i.i.i, %tmp0_v10.i.i.i
  %tmp4_v.i.i.i1 = and i32 %cc_dst_v.i.i.i, 255
  %.not.i4.i.i = icmp eq i32 %tmp4_v.i.i.i1, 0
  %tmp0_v1.i18.i.i = add nuw i32 %storemerge115.i, 1
  br i1 %.not.i4.i.i, label %BB_80492A2.i.thread.i, label %BB_804929A.i.i

BB_80492A2.i.thread.i:                            ; preds = %BB_8049276.i.i
  store i8 1, i8* %27, align 1
  br label %BB_80492AD.i.i

BB_80492B5.i.i:                                   ; preds = %BB_80492AD.i.i, %0
  %storemerge.i = phi i32 [ 0, %0 ], [ %tmp0_v4.i56.i.i, %BB_80492AD.i.i ]
  %r_ecx.1.i = phi i32 [ %tmp2_v.i2.i, %0 ], [ %r_ecx.011.i, %BB_80492AD.i.i ]
  %r_edx.1.i = phi i32 [ 0, %0 ], [ %r_edx.012.i, %BB_80492AD.i.i ]
  store i32 %storemerge.i, i32* %26, align 16
  store i8 0, i8* %27, align 1
  store i32 0, i32* %28, align 4
  %36 = load i32, i32* %25, align 4
  %.not.i = icmp eq i32 %36, 0
  br i1 %.not.i, label %BB_80492A2.i.i, label %BB_8049276.i.i

BB_804929A.i.i:                                   ; preds = %BB_8049276.i.i
  store i32 %tmp0_v1.i18.i.i, i32* %28, align 4
  %37 = load i32, i32* %25, align 4
  %38 = icmp ult i32 %tmp0_v1.i18.i.i, %37
  br i1 %38, label %BB_8049276.i.i, label %BB_80492A2.i.i

BB_80492AD.i.i:                                   ; preds = %BB_80492A2.i.thread.i, %BB_80492A2.i.i
  %r_edx.012.i = phi i32 [ %tmp0_v4.i.i.i, %BB_80492A2.i.thread.i ], [ %r_edx.2.lcssa.i, %BB_80492A2.i.i ]
  %r_ecx.011.i = phi i32 [ %32, %BB_80492A2.i.thread.i ], [ %r_ecx.2.lcssa.i, %BB_80492A2.i.i ]
  %39 = load i32, i32* %17, align 4
  %tmp0_v1.i53.i.i = add i32 %39, 1
  store i32 %tmp0_v1.i53.i.i, i32* %17, align 4
  %40 = load i32, i32* %26, align 16
  %tmp0_v4.i56.i.i = add i32 %40, 1
  br label %BB_80492B5.i.i

Func__strspn.exit:                                ; preds = %BB_80492A2.i.i
  %41 = load i32, i32* %17, align 4
  %42 = load i32, i32* %15, align 4
  %43 = load i32, i32* %14, align 8
  %tmp2_v.i20.i = add i32 %43, -12
  %44 = inttoptr i32 %tmp2_v.i20.i to i32*
  store i32 %41, i32* %44, align 4
  store i32 %41, i32* %10, align 4
  %tmp2_v5.i25.i = add i32 %42, -8160
  store i32 %tmp2_v5.i25.i, i32* %12, align 16
  store i32 134517263, i32* %13, align 4
  %45 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.2.lcssa.i, i32 inreg noundef %r_edx.2.lcssa.i, i32 noundef %tmp2_v10.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
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

  tail call fastcc void @own_strspn446(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) nounwind
