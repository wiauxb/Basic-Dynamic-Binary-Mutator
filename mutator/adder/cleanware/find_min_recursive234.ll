; Mutation 234
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack233 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.232 = constant [9 x i8] c"\6d\69\6e\3a\20\25\64\0a\00"

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
define internal fastcc void @find_min_recursive234(i32 %arg_esp) unnamed_addr  norecurse nounwind  !retregs !12 {
.exit:
  %tmp2_v.i8.i = add i32 %arg_esp, 4
  %tmp0_v.i9.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i9.i, -4
  %2 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i10.i = add i32 %tmp0_v.i9.i, -8
  %3 = inttoptr i32 %tmp2_v4.i10.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i.i = add i32 %tmp0_v.i9.i, -12
  %4 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i9.i, -16
  %5 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i8.i, i32* %5, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i9.i, -68
  %6 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517201, i32* %6, align 4
  %tmp4_v.i21.i.b = load i1, i1* @segs.0, align 1
  %7 = inttoptr i32 %arg_esp to i32*
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i25.i = add i32 %tmp0_v.i9.i, -20
  %9 = inttoptr i32 %tmp2_v2.i25.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp2_v3.i26.i = add i32 %tmp0_v.i9.i, -60
  %10 = inttoptr i32 %tmp2_v3.i26.i to i32*
  store i32 4, i32* %10, align 4
  %tmp2_v4.i27.i = add i32 %tmp0_v.i9.i, -56
  %11 = inttoptr i32 %tmp2_v4.i27.i to i32*
  store i32 1, i32* %11, align 8
  %tmp2_v5.i28.i = add i32 %tmp0_v.i9.i, -52
  %12 = inttoptr i32 %tmp2_v5.i28.i to i32*
  store i32 8, i32* %12, align 4
  %tmp2_v6.i29.i = add i32 %tmp0_v.i9.i, -48
  %13 = inttoptr i32 %tmp2_v6.i29.i to i32*
  store i32 6, i32* %13, align 16
  %tmp2_v7.i.i = add i32 %tmp0_v.i9.i, -44
  %14 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 0, i32* %14, align 4
  %tmp2_v8.i30.i = add i32 %tmp0_v.i9.i, -40
  %15 = inttoptr i32 %tmp2_v8.i30.i to i32*
  store i32 9, i32* %15, align 8
  %tmp2_v9.i.i = add i32 %tmp0_v.i9.i, -36
  %16 = inttoptr i32 %tmp2_v9.i.i to i32*
  store i32 5, i32* %16, align 4
  %tmp2_v10.i.i = add i32 %tmp0_v.i9.i, -32
  %17 = inttoptr i32 %tmp2_v10.i.i to i32*
  store i32 2, i32* %17, align 16
  %tmp2_v11.i.i = add i32 %tmp0_v.i9.i, -28
  %18 = inttoptr i32 %tmp2_v11.i.i to i32*
  store i32 3, i32* %18, align 4
  %tmp2_v12.i.i = add i32 %tmp0_v.i9.i, -24
  %19 = inttoptr i32 %tmp2_v12.i.i to i32*
  store i32 7, i32* %19, align 8
  %tmp2_v13.i.i = add i32 %tmp0_v.i9.i, -64
  %20 = inttoptr i32 %tmp2_v13.i.i to i32*
  store i32 10, i32* %20, align 16
  %tmp2_v17.i.i = add i32 %tmp0_v.i9.i, -76
  %21 = inttoptr i32 %tmp2_v17.i.i to i32*
  store i32 10, i32* %21, align 4
  %tmp2_v19.i.i = add i32 %tmp0_v.i9.i, -80
  %22 = inttoptr i32 %tmp2_v19.i.i to i32*
  store i32 %tmp2_v3.i26.i, i32* %22, align 16
  %tmp2_v20.i.i = add i32 %tmp0_v.i9.i, -84
  %23 = inttoptr i32 %tmp2_v20.i.i to i32*
  store i32 134517310, i32* %23, align 4
  %24 = tail call fastcc { i32, i32, i32, i32 } @Func_min(i32 %tmp2_v20.i.i, i32 %tmp2_v4.i10.i)
  %25 = extractvalue { i32, i32, i32, i32 } %24, 0
  %26 = extractvalue { i32, i32, i32, i32 } %24, 1
  %27 = extractvalue { i32, i32, i32, i32 } %24, 2
  %tmp2_v.i15.i = add i32 %25, 4
  %28 = inttoptr i32 %tmp2_v.i15.i to i32*
  store i32 %26, i32* %28, align 4
  %29 = inttoptr i32 %25 to i32*
  %spi.bis.232 = ptrtoint[9 x i8]* @str.bis.232 to i32
  store i32 %spi.bis.232, i32* %29, align 4
  %tmp2_v4.i18.i = add i32 %25, -4
  %30 = inttoptr i32 %tmp2_v4.i18.i to i32*
  store i32 134517329, i32* %30, align 4
  %31 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i8.i, i32 inreg noundef %27, i32 noundef %25, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  ret void
}

; Function Attrs: nofree nosync nounwind
define internal fastcc { i32, i32, i32, i32 } @Func_min(i32 %arg_esp, i32 %arg_ebp) unnamed_addr  nofree nosync nounwind  !retregs !14 {
Func_8049283.exit.i:
  %tmp2_v.i10.i = add i32 %arg_esp, -4
  %0 = inttoptr i32 %tmp2_v.i10.i to i32*
  store i32 %arg_ebp, i32* %0, align 4
  %tmp2_v1.i.i = add i32 %arg_esp, -32
  %1 = inttoptr i32 %tmp2_v1.i.i to i32*
  store i32 134517379, i32* %1, align 4
  %tmp2_v.i15.i = add i32 %arg_esp, 8
  %2 = inttoptr i32 %tmp2_v.i15.i to i32*
  %3 = load i32, i32* %2, align 4
  %.not.i.i = icmp eq i32 %3, 1
  br i1 %.not.i.i, label %BB_804928E.i, label %BB_80492A6.i

BB_804928E.i:                                     ; preds = %Func_8049283.exit.i
  %tmp2_v2.i.i = add i32 %arg_esp, 4
  %4 = inttoptr i32 %tmp2_v2.i.i to i32*
  %5 = load i32, i32* %4, align 4
  %6 = inttoptr i32 %5 to i32*
  %.pre18 = add i32 %arg_esp, 4
  br label %.exit

BB_80492A6.i:                                     ; preds = %Func_8049283.exit.i
  %tmp0_v1.i36.i = add i32 %3, -1
  %tmp2_v3.i.i = add i32 %arg_esp, -40
  %7 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %tmp0_v1.i36.i, i32* %7, align 4
  %tmp2_v4.i39.i = add i32 %arg_esp, 4
  %8 = inttoptr i32 %tmp2_v4.i39.i to i32*
  %9 = load i32, i32* %8, align 4
  %tmp2_v6.i.i = add i32 %arg_esp, -44
  %10 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %9, i32* %10, align 4
  %tmp2_v7.i.i = add i32 %arg_esp, -48
  %11 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 134517432, i32* %11, align 4
  %12 = tail call fastcc { i32, i32, i32, i32 } @Func_min(i32 %tmp2_v7.i.i, i32 %tmp2_v.i10.i)
  %13 = extractvalue { i32, i32, i32, i32 } %12, 1
  %14 = extractvalue { i32, i32, i32, i32 } %12, 3
  %tmp2_v.i20.i = add i32 %14, -12
  %15 = inttoptr i32 %tmp2_v.i20.i to i32*
  store i32 %13, i32* %15, align 4
  %tmp2_v1.i22.i = add i32 %14, 12
  %16 = inttoptr i32 %tmp2_v1.i22.i to i32*
  %17 = load i32, i32* %16, align 4
  %tmp0_v3.i23.i = shl i32 %17, 2
  %tmp4_v.i24.i = add i32 %tmp0_v3.i23.i, -4
  %tmp2_v4.i.i = add i32 %14, 8
  %18 = inttoptr i32 %tmp2_v4.i.i to i32*
  %19 = load i32, i32* %18, align 4
  %tmp0_v6.i26.i = add i32 %tmp4_v.i24.i, %19
  %20 = inttoptr i32 %tmp0_v6.i26.i to i32*
  %21 = load i32, i32* %20, align 4
  %.not.i28.i = icmp slt i32 %13, %21
  %spec.select = select i1 %.not.i28.i, i32* %15, i32* %20
  %.pre = inttoptr i32 %14 to i32*
  br label %.exit

.exit:                                            ; preds = %BB_80492A6.i, %BB_804928E.i
  %tmp4_v2.i.i.pre-phi = phi i32 [ %tmp2_v4.i.i, %BB_80492A6.i ], [ %.pre18, %BB_804928E.i ]
  %.pre-phi = phi i32* [ %.pre, %BB_80492A6.i ], [ %0, %BB_804928E.i ]
  %r_edx.0 = phi i32 [ %tmp4_v.i24.i, %BB_80492A6.i ], [ 0, %BB_804928E.i ]
  %r_eax.0.in = phi i32* [ %spec.select, %BB_80492A6.i ], [ %6, %BB_804928E.i ]
  %r_eax.0 = load i32, i32* %r_eax.0.in, align 4
  %22 = load i32, i32* %.pre-phi, align 4
  %mrv = insertvalue { i32, i32, i32, i32 } undef, i32 %tmp4_v2.i.i.pre-phi, 0
  %mrv1 = insertvalue { i32, i32, i32, i32 } %mrv, i32 %r_eax.0, 1
  %mrv2 = insertvalue { i32, i32, i32, i32 } %mrv1, i32 %r_edx.0, 2
  %mrv3 = insertvalue { i32, i32, i32, i32 } %mrv2, i32 %22, 3
  ret { i32, i32, i32, i32 } %mrv3
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
!12 = !{i32 0, i32 0, i32 0}
!13 = !{!"printf"}
!14 = !{i32 0, i32 3}

  tail call fastcc void @find_min_recursive234 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack233, i32 0, i32 8092) to i32)) nounwind
