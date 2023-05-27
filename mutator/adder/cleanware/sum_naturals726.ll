; Mutation 726
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack725 = internal global [8092 x i32] zeroinitializer, align 16
@onUnfallback = common local_unnamed_addr global i1 false
@str.724 = constant [4 x i8] c"%d\0a\00"

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

; Function Attrs: nofree nosync nounwind
define internal fastcc { i32, i32, i32, i32 } @Func_sum(i32 %arg_esp, i32 %arg_ebp) unnamed_addr  nofree nosync nounwind  !retregs !12 {
Func_80491F2.exit.i:
  %tmp2_v.i2.i = add i32 %arg_esp, -4
  %0 = inttoptr i32 %tmp2_v.i2.i to i32*
  store i32 %arg_ebp, i32* %0, align 4
  %tmp2_v1.i.i = add i32 %arg_esp, -16
  %1 = inttoptr i32 %tmp2_v1.i.i to i32*
  store i32 134517234, i32* %1, align 4
  %tmp2_v.i7.i = add i32 %arg_esp, 4
  %2 = inttoptr i32 %tmp2_v.i7.i to i32*
  %3 = load i32, i32* %2, align 4
  %4 = icmp slt i32 %3, 1
  br i1 %4, label %Func_80491F2.exit.i..exit_crit_edge, label %BB_80491FD.i

Func_80491F2.exit.i..exit_crit_edge:              ; preds = %Func_80491F2.exit.i
  %.pre1 = add i32 %arg_esp, 4
  br label %.exit

BB_80491FD.i:                                     ; preds = %Func_80491F2.exit.i
  %tmp0_v1.i.i = add nsw i32 %3, -1
  %tmp2_v3.i.i = add i32 %arg_esp, -28
  %5 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %tmp0_v1.i.i, i32* %5, align 4
  %tmp2_v4.i.i = add i32 %arg_esp, -32
  %6 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 134517260, i32* %6, align 4
  %7 = tail call fastcc { i32, i32, i32, i32 } @Func_sum(i32 %tmp2_v4.i.i, i32 %tmp2_v.i2.i)
  %8 = extractvalue { i32, i32, i32, i32 } %7, 1
  %9 = extractvalue { i32, i32, i32, i32 } %7, 3
  %tmp2_v.i20.i = add i32 %9, 8
  %10 = inttoptr i32 %tmp2_v.i20.i to i32*
  %11 = load i32, i32* %10, align 4
  %tmp0_v2.i23.i = add i32 %8, %11
  %.pre = inttoptr i32 %9 to i32*
  br label %.exit

.exit:                                            ; preds = %BB_80491FD.i, %Func_80491F2.exit.i..exit_crit_edge
  %tmp4_v2.i.i.pre-phi = phi i32 [ %.pre1, %Func_80491F2.exit.i..exit_crit_edge ], [ %tmp2_v.i20.i, %BB_80491FD.i ]
  %.pre-phi = phi i32* [ %0, %Func_80491F2.exit.i..exit_crit_edge ], [ %.pre, %BB_80491FD.i ]
  %r_eax.0 = phi i32 [ 0, %Func_80491F2.exit.i..exit_crit_edge ], [ %tmp0_v2.i23.i, %BB_80491FD.i ]
  %r_edx.0 = phi i32 [ 0, %Func_80491F2.exit.i..exit_crit_edge ], [ %11, %BB_80491FD.i ]
  %12 = load i32, i32* %.pre-phi, align 4
  %mrv = insertvalue { i32, i32, i32, i32 } undef, i32 %tmp4_v2.i.i.pre-phi, 0
  %mrv1 = insertvalue { i32, i32, i32, i32 } %mrv, i32 %r_eax.0, 1
  %mrv2 = insertvalue { i32, i32, i32, i32 } %mrv1, i32 %r_edx.0, 2
  %mrv3 = insertvalue { i32, i32, i32, i32 } %mrv2, i32 %12, 3
  ret { i32, i32, i32, i32 } %mrv3
}

; Function Attrs: norecurse nounwind
define internal fastcc void @sum_naturals726(i32 %arg_esp) unnamed_addr  norecurse nounwind  !retregs !13 {
  %tmp2_v.i12.i = add i32 %arg_esp, 4
  %tmp0_v.i13.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i13.i, -4
  %3 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i15.i = add i32 %tmp0_v.i13.i, -8
  %4 = inttoptr i32 %tmp2_v4.i15.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i17.i = add i32 %tmp0_v.i13.i, -12
  %5 = inttoptr i32 %tmp2_v5.i17.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i13.i, -16
  %6 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i12.i, i32* %6, align 16
  %tmp2_v7.i.i = add i32 %tmp0_v.i13.i, -20
  %7 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 134517166, i32* %7, align 4
  %tmp2_v.i4.i = add i32 %tmp0_v.i13.i, -32
  %8 = inttoptr i32 %tmp2_v.i4.i to i32*
  store i32 5, i32* %8, align 16
  %tmp2_v2.i.i = add i32 %tmp0_v.i13.i, -36
  %9 = inttoptr i32 %tmp2_v2.i.i to i32*
  store i32 134517182, i32* %9, align 4
  %10 = tail call fastcc { i32, i32, i32, i32 } @Func_sum(i32 %tmp2_v2.i.i, i32 %tmp2_v4.i15.i)
  %11 = extractvalue { i32, i32, i32, i32 } %10, 0
  %12 = extractvalue { i32, i32, i32, i32 } %10, 1
  %13 = extractvalue { i32, i32, i32, i32 } %10, 2
  %tmp2_v.i8.i = add i32 %11, 4
  %14 = inttoptr i32 %tmp2_v.i8.i to i32*
  store i32 %12, i32* %14, align 4
  %15 = inttoptr i32 %11 to i32*
  %spi.bis.724 = ptrtoint[4 x i8]* @str.724 to i32
  store i32 %spi.bis.724, i32* %15, align 4
  %tmp2_v4.i.i = add i32 %11, -4
  %16 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 134517201, i32* %16, align 4
  %17 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i12.i, i32 inreg noundef %13, i32 noundef %11, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !14
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
!12 = !{i32 0, i32 2, i32 3}
!13 = !{i32 0, i32 0, i32 0, i32 0}
!14 = !{!"printf"}

  tail call fastcc void @sum_naturals726 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack725, i32 0, i32 8092) to i32)) nounwind
