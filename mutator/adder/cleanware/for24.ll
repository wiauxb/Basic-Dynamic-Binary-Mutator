; Mutation 24
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack23 = internal global [8092 x i32] zeroinitializer, align 16
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.20 = constant [7 x i8] c"\69\3a\20\25\64\0a\00"
@str.bis.21 = constant [7 x i8] c"\69\3a\20\25\64\0a\00"
@str.bis.22 = constant [7 x i8] c"\69\3a\20\25\64\0a\00"

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

; Function Attrs: norecurse nounwind
define internal fastcc void @for24(i32 %arg_esp) unnamed_addr  norecurse nounwind  !retregs !12 {
  %tmp2_v.i34.i = add i32 %arg_esp, 4
  %tmp0_v.i35.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i36.i = add i32 %tmp0_v.i35.i, -4
  %3 = inttoptr i32 %tmp2_v3.i36.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i37.i = add i32 %tmp0_v.i35.i, -8
  %4 = inttoptr i32 %tmp2_v4.i37.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i39.i = add i32 %tmp0_v.i35.i, -12
  %5 = inttoptr i32 %tmp2_v5.i39.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i35.i, -16
  %6 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i34.i, i32* %6, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i35.i, -36
  %7 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517201, i32* %7, align 4
  %tmp2_v.i59.i = add i32 %tmp0_v.i35.i, -28
  %8 = inttoptr i32 %tmp2_v.i59.i to i32*
  %tmp2_v2.i9.i = add i32 %tmp0_v.i35.i, -44
  %9 = inttoptr i32 %tmp2_v2.i9.i to i32*
  %tmp2_v4.i12.i = add i32 %tmp0_v.i35.i, -48
  %10 = inttoptr i32 %tmp2_v4.i12.i to i32*
  %tmp2_v5.i13.i = add i32 %tmp0_v.i35.i, -52
  %11 = inttoptr i32 %tmp2_v5.i13.i to i32*
  store i32 0, i32* %8, align 4
  br label %BB_80491E0.i

BB_804923C.i:                                     ; preds = %BB_8049234.i
  %12 = trunc i64 %30 to i32
  store i32 10, i32* %10, align 16
  store i32 134517319, i32* %11, align 4
  %arg.i.i = load i32, i32* %10, align 16
  %13 = tail call i32 @putchar(i32 %arg.i.i)  nounwind 
  %tmp2_v.i32.i = add i32 %tmp0_v.i35.i, -20
  %14 = inttoptr i32 %tmp2_v.i32.i to i32*
  store i32 0, i32* %14, align 4
  br label %BB_8049253.i

BB_8049259.i:                                     ; preds = %BB_8049253.i
  store i32 %storemerge118, i32* %9, align 4
  %spi.bis.22 = ptrtoint[7 x i8]* @str.bis.22 to i32
  store i32 %spi.bis.22, i32* %10, align 16
  store i32 134517355, i32* %11, align 4
  %15 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i34.i, i32 inreg noundef %r_edx.119, i32 noundef %tmp2_v4.i12.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %16 = lshr i64 %15, 32
  %17 = trunc i64 %16 to i32
  %.pre = load i32, i32* %14, align 4
  br label %BB_8049271.i

BB_80491E0.i:                                     ; preds = %BB_80491E0.i, %0
  %r_edx.215 = phi i32 [ 0, %0 ], [ %20, %BB_80491E0.i ]
  %storemerge14 = phi i32 [ 0, %0 ], [ %tmp0_v2.i104.i, %BB_80491E0.i ]
  store i32 %storemerge14, i32* %9, align 4
  %spi.bis.21 = ptrtoint[7 x i8]* @str.bis.21 to i32
  store i32 %spi.bis.21, i32* %10, align 16
  store i32 134517234, i32* %11, align 4
  %18 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i34.i, i32 inreg noundef %r_edx.215, i32 noundef %tmp2_v4.i12.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %19 = lshr i64 %18, 32
  %20 = trunc i64 %19 to i32
  %21 = load i32, i32* %8, align 4
  %tmp0_v2.i104.i = add i32 %21, 1
  store i32 %tmp0_v2.i104.i, i32* %8, align 4
  %22 = icmp slt i32 %tmp0_v2.i104.i, 5
  br i1 %22, label %BB_80491E0.i, label %BB_80491FF.i

BB_8049271.i:                                     ; preds = %BB_8049253.i, %BB_8049259.i
  %23 = phi i32 [ %.pre, %BB_8049259.i ], [ 2, %BB_8049253.i ]
  %r_edx.0 = phi i32 [ %17, %BB_8049259.i ], [ %r_edx.119, %BB_8049253.i ]
  %tmp0_v1.i17.i = add i32 %23, 1
  store i32 %tmp0_v1.i17.i, i32* %14, align 4
  %24 = icmp slt i32 %tmp0_v1.i17.i, 5
  br i1 %24, label %BB_8049253.i, label %.exit

BB_80491FF.i:                                     ; preds = %BB_80491E0.i
  %25 = trunc i64 %19 to i32
  store i32 10, i32* %10, align 16
  store i32 134517257, i32* %11, align 4
  %arg.i.i9 = load i32, i32* %10, align 16
  %26 = tail call i32 @putchar(i32 %arg.i.i9)  nounwind 
  %tmp2_v.i78.i = add i32 %tmp0_v.i35.i, -24
  %27 = inttoptr i32 %tmp2_v.i78.i to i32*
  br label %BB_8049234.i

BB_8049253.i:                                     ; preds = %BB_8049271.i, %BB_804923C.i
  %r_edx.119 = phi i32 [ %12, %BB_804923C.i ], [ %r_edx.0, %BB_8049271.i ]
  %storemerge118 = phi i32 [ 0, %BB_804923C.i ], [ %tmp0_v1.i17.i, %BB_8049271.i ]
  %28 = icmp eq i32 %storemerge118, 2
  br i1 %28, label %BB_8049271.i, label %BB_8049259.i

BB_8049234.i:                                     ; preds = %BB_8049234.i, %BB_80491FF.i
  %storemerge2 = phi i32 [ %tmp0_v1.i94.i, %BB_8049234.i ], [ 0, %BB_80491FF.i ]
  %r_edx.3 = phi i32 [ %31, %BB_8049234.i ], [ %25, %BB_80491FF.i ]
  store i32 %storemerge2, i32* %27, align 8
  store i32 %storemerge2, i32* %9, align 4
  %spi.bis.20 = ptrtoint[7 x i8]* @str.bis.20 to i32
  store i32 %spi.bis.20, i32* %10, align 16
  store i32 134517287, i32* %11, align 4
  %29 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i34.i, i32 inreg noundef %r_edx.3, i32 noundef %tmp2_v4.i12.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %30 = lshr i64 %29, 32
  %31 = trunc i64 %30 to i32
  %32 = load i32, i32* %27, align 8
  %33 = icmp eq i32 %32, 2
  %tmp0_v1.i94.i = add i32 %32, 1
  br i1 %33, label %BB_804923C.i, label %BB_8049234.i

.exit:                                            ; preds = %BB_8049271.i
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

  tail call fastcc void @for24 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack23, i32 0, i32 8092) to i32)) nounwind
