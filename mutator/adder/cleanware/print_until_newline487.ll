; Mutation 487
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@stack486 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly
define internal fastcc void @helper_fninit() unnamed_addr  mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87"  {
  store i32 0, i32* @fpstt, align 16
  ret void
}

; Function Attrs: norecurse nounwind uwtable

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i8* @llvm.returnaddress(i32 immarg)  nofree nosync nounwind readnone willreturn 

; Function Attrs: nofree noinline nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr  nofree noinline nounwind 

; Function Attrs: nofree norecurse nounwind
define internal fastcc void @print_until_newline487(i32 %arg_esp) unnamed_addr  nofree norecurse nounwind  !retregs !10 {
.exit:
  %tmp2_v.i1.i = add i32 %arg_esp, 4
  %tmp0_v.i2.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i2.i, -4
  %2 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i3.i = add i32 %tmp0_v.i2.i, -8
  %3 = inttoptr i32 %tmp2_v4.i3.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i.i = add i32 %tmp0_v.i2.i, -12
  %4 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i2.i, -16
  %5 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i1.i, i32* %5, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i2.i, -52
  %6 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517201, i32* %6, align 4
  %tmp4_v.i7.i.b = load i1, i1* @segs.0, align 1
  %7 = inttoptr i32 %arg_esp to i32*
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i.i = add i32 %tmp0_v.i2.i, -20
  %9 = inttoptr i32 %tmp2_v2.i.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp2_v3.i11.i = add i32 %tmp0_v.i2.i, -44
  %10 = inttoptr i32 %tmp2_v3.i11.i to i32*
  store i32 1936287828, i32* %10, align 4
  %tmp2_v4.i12.i = add i32 %tmp0_v.i2.i, -40
  %11 = inttoptr i32 %tmp2_v4.i12.i to i32*
  store i32 544434464, i32* %11, align 8
  %tmp2_v5.i13.i = add i32 %tmp0_v.i2.i, -36
  %12 = inttoptr i32 %tmp2_v5.i13.i to i32*
  store i32 543516788, i32* %12, align 4
  %tmp2_v6.i14.i = add i32 %tmp0_v.i2.i, -32
  %13 = inttoptr i32 %tmp2_v6.i14.i to i32*
  store i32 779706743, i32* %13, align 16
  %tmp2_v7.i.i = add i32 %tmp0_v.i2.i, -28
  %14 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 1634156832, i32* %14, align 4
  %tmp2_v8.i15.i = add i32 %tmp0_v.i2.i, -24
  %15 = inttoptr i32 %tmp2_v8.i15.i to i32*
  store i32 2190953, i32* %15, align 8
  %tmp2_v11.i.i = add i32 %tmp0_v.i2.i, -64
  %16 = inttoptr i32 %tmp2_v11.i.i to i32*
  store i32 %tmp2_v3.i11.i, i32* %16, align 16
  %tmp2_v12.i.i = add i32 %tmp0_v.i2.i, -68
  %17 = inttoptr i32 %tmp2_v12.i.i to i32*
  store i32 134517272, i32* %17, align 4
  %tmp2_v.i1.i.i = add i32 %tmp0_v.i2.i, -72
  %18 = inttoptr i32 %tmp2_v.i1.i.i to i32*
  store i32 %tmp2_v4.i3.i, i32* %18, align 8
  %tmp2_v1.i3.i.i = add i32 %tmp0_v.i2.i, -76
  %19 = inttoptr i32 %tmp2_v1.i3.i.i to i32*
  store i32 134529024, i32* %19, align 4
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i2.i, -100
  %20 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  store i32 134517336, i32* %20, align 4
  %tmp2_v.i8.i.i = add i32 %tmp0_v.i2.i, -84
  %21 = inttoptr i32 %tmp2_v.i8.i.i to i32*
  store i32 0, i32* %21, align 4
  %22 = load i32, i32* %16, align 16
  %23 = inttoptr i32 %22 to i8*
  %24 = load i8, i8* %23, align 1
  %.not.i.i14.i = icmp eq i8 %24, 0
  br i1 %.not.i.i14.i, label %Func_print_until_newline.exit, label %BB_8049267.i.lr.ph.i

BB_8049267.i.lr.ph.i:                             ; preds = %.exit
  %tmp2_v7.i.i.i = add i32 %tmp0_v.i2.i, -112
  %25 = inttoptr i32 %tmp2_v7.i.i.i to i32*
  %tmp2_v8.i.i.i = add i32 %tmp0_v.i2.i, -116
  %26 = inttoptr i32 %tmp2_v8.i.i.i to i32*
  br label %BB_8049267.i.i

BB_8049267.i.i:                                   ; preds = %BB_8049267.i.i, %BB_8049267.i.lr.ph.i
  %27 = phi i8 [ %24, %BB_8049267.i.lr.ph.i ], [ %32, %BB_8049267.i.i ]
  %tmp0_v5.i.i.i = sext i8 %27 to i32
  store i32 %tmp0_v5.i.i.i, i32* %25, align 16
  store i32 134517374, i32* %26, align 4
  %arg.i.i.i = load i32, i32* %25, align 16
  %28 = tail call i32 @putchar(i32 %arg.i.i.i)  nounwind 
  %29 = load i32, i32* %21, align 4
  %tmp0_v2.i27.i.i = add i32 %29, 1
  store i32 %tmp0_v2.i27.i.i, i32* %21, align 4
  %30 = load i32, i32* %16, align 16
  %tmp0_v3.i.i.i = add i32 %30, %tmp0_v2.i27.i.i
  %31 = inttoptr i32 %tmp0_v3.i.i.i to i8*
  %32 = load i8, i8* %31, align 1
  %.not.i.i.i = icmp eq i8 %32, 0
  br i1 %.not.i.i.i, label %Func_print_until_newline.exit, label %BB_8049267.i.i

Func_print_until_newline.exit:                    ; preds = %BB_8049267.i.i, %.exit
  store i32 10, i32* %16, align 16
  store i32 134517285, i32* %17, align 4
  %arg.i.i = load i32, i32* %16, align 16
  %33 = tail call i32 @putchar(i32 %arg.i.i)  nounwind 
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
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{i32 0, i32 0, i32 0}

  tail call fastcc void @print_until_newline487 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack486, i32 0, i32 8092) to i32)) nounwind