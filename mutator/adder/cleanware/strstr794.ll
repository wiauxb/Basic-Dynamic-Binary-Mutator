; Mutation 794
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack793 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.791 = constant [23 x i8] c"\66\61\69\6c\65\64\20\74\6f\20\66\69\6e\64\20\73\74\72\69\6e\67\21\00"
@str.bis.792 = constant [9 x i8] c"\74\68\65\3a\20\25\73\0a\00"

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

declare dso_local i32 @puts(i8* noundef) local_unnamed_addr  "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" 

; Function Attrs: noinline
declare i32 @strstr(i32, i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @strstr794(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
Func_804928B.exit.i:
  %tmp2_v.i36.i = add i32 %arg_esp, 4
  %tmp0_v.i37.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i39.i = add i32 %tmp0_v.i37.i, -4
  %2 = inttoptr i32 %tmp2_v3.i39.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i40.i = add i32 %tmp0_v.i37.i, -8
  %3 = inttoptr i32 %tmp2_v4.i40.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i42.i = add i32 %tmp0_v.i37.i, -12
  %4 = inttoptr i32 %tmp2_v5.i42.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i44.i = add i32 %tmp0_v.i37.i, -16
  %5 = inttoptr i32 %tmp2_v6.i44.i to i32*
  store i32 %tmp2_v.i36.i, i32* %5, align 16
  %tmp2_v8.i45.i = add i32 %tmp0_v.i37.i, -68
  %6 = inttoptr i32 %tmp2_v8.i45.i to i32*
  store i32 134517265, i32* %6, align 4
  %tmp4_v.i10.i.b = load i1, i1* @segs.0, align 1
  %7 = inttoptr i32 %arg_esp to i32*
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i14.i = add i32 %tmp0_v.i37.i, -20
  %9 = inttoptr i32 %tmp2_v2.i14.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i37.i, -37
  %10 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 1936287828, i32* %10, align 4
  %tmp2_v4.i15.i = add i32 %tmp0_v.i37.i, -33
  %11 = inttoptr i32 %tmp2_v4.i15.i to i32*
  store i32 544434464, i32* %11, align 4
  %tmp2_v5.i.i = add i32 %tmp0_v.i37.i, -29
  %12 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 543516788, i32* %12, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i37.i, -25
  %13 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 779706743, i32* %13, align 4
  %tmp2_v7.i.i = add i32 %tmp0_v.i37.i, -21
  %14 = inttoptr i32 %tmp2_v7.i.i to i8*
  store i8 0, i8* %14, align 1
  %tmp2_v8.i.i = add i32 %tmp0_v.i37.i, -45
  %15 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 6645876, i32* %15, align 4
  %tmp2_v11.i.i = add i32 %tmp0_v.i37.i, -76
  %16 = inttoptr i32 %tmp2_v11.i.i to i32*
  store i32 %tmp2_v8.i.i, i32* %16, align 4
  %tmp2_v13.i.i = add i32 %tmp0_v.i37.i, -80
  %17 = inttoptr i32 %tmp2_v13.i.i to i32*
  store i32 %tmp2_v3.i.i, i32* %17, align 16
  %tmp2_v14.i.i = add i32 %tmp0_v.i37.i, -84
  %18 = inttoptr i32 %tmp2_v14.i.i to i32*
  store i32 134517337, i32* %18, align 4
  %arg.i.i = load i32, i32* %17, align 16
  %arg2.i.i = load i32, i32* %16, align 4
  %19 = tail call i32 @strstr(i32 %arg.i.i, i32 %arg2.i.i)
  %tmp2_v.i49.i = add i32 %tmp0_v.i37.i, -56
  %20 = inttoptr i32 %tmp2_v.i49.i to i32*
  store i32 %19, i32* %20, align 8
  store i32 %19, i32* %16, align 4
  %spi.bis.792 = ptrtoint[9 x i8]* @str.bis.792 to i32
  store i32 %spi.bis.792, i32* %17, align 16
  store i32 134517361, i32* %18, align 4
  %21 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i36.i, i32 inreg noundef 0, i32 noundef %tmp2_v13.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %tmp2_v.i29.i = add i32 %tmp0_v.i37.i, -41
  %22 = inttoptr i32 %tmp2_v.i29.i to i32*
  store i32 7827310, i32* %22, align 4
  store i32 %tmp2_v.i29.i, i32* %16, align 4
  store i32 %tmp2_v3.i.i, i32* %17, align 16
  store i32 134517387, i32* %18, align 4
  %arg.i.i3 = load i32, i32* %17, align 16
  %arg2.i.i4 = load i32, i32* %16, align 4
  %23 = tail call i32 @strstr(i32 %arg.i.i3, i32 %arg2.i.i4)
  %tmp2_v.i6.i = add i32 %tmp0_v.i37.i, -52
  %24 = inttoptr i32 %tmp2_v.i6.i to i32*
  store i32 %23, i32* %24, align 4
  %spi.bis.791 = ptrtoint[23 x i8]* @str.bis.791 to i32
  store i32 %spi.bis.791, i32* %17, align 16
  store i32 134517414, i32* %18, align 4
  %arg.i.i6 = load i32, i32* %17, align 16
  %25 = inttoptr i32 %arg.i.i6 to i8*
  %26 = tail call i32 @puts(i8* nonnull dereferenceable(1) %25)
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

  tail call fastcc void @strstr794 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack793, i32 0, i32 8092) to i32)) nounwind
