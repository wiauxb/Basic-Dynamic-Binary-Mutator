; Mutation 676
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@stack675 = internal global [8092 x i32] zeroinitializer, align 16
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

declare dso_local i32 @puts(i8* noundef) local_unnamed_addr  "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" 

; Function Attrs: noinline
declare i32 @strlen(i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare i32 @strchr(i32, i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare i32 @malloc(i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare i32 @strcpy(i32, i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare void @free(i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @largest_word_print676(i32 %arg_esp) unnamed_addr  norecurse  !retregs !10 {
.exit:
  %tmp2_v.i30.i = add i32 %arg_esp, 4
  %tmp0_v.i31.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i33.i = add i32 %tmp0_v.i31.i, -4
  %2 = inttoptr i32 %tmp2_v3.i33.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i34.i = add i32 %tmp0_v.i31.i, -8
  %3 = inttoptr i32 %tmp2_v4.i34.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i36.i = add i32 %tmp0_v.i31.i, -12
  %4 = inttoptr i32 %tmp2_v5.i36.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i38.i = add i32 %tmp0_v.i31.i, -16
  %5 = inttoptr i32 %tmp2_v6.i38.i to i32*
  store i32 %tmp2_v.i30.i, i32* %5, align 16
  %tmp2_v8.i39.i = add i32 %tmp0_v.i31.i, -68
  %6 = inttoptr i32 %tmp2_v8.i39.i to i32*
  store i32 134517361, i32* %6, align 4
  %tmp4_v.i13.i.b = load i1, i1* @segs.0, align 1
  %7 = inttoptr i32 %arg_esp to i32*
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i17.i = add i32 %tmp0_v.i31.i, -20
  %9 = inttoptr i32 %tmp2_v2.i17.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i31.i, -51
  %10 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 1702043713, i32* %10, align 4
  %tmp2_v4.i18.i = add i32 %tmp0_v.i31.i, -47
  %11 = inttoptr i32 %tmp2_v4.i18.i to i32*
  store i32 1852142702, i32* %11, align 4
  %tmp2_v5.i19.i = add i32 %tmp0_v.i31.i, -43
  %12 = inttoptr i32 %tmp2_v5.i19.i to i32*
  store i32 1998611811, i32* %12, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i31.i, -39
  %13 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 543716457, i32* %13, align 4
  %tmp2_v7.i.i = add i32 %tmp0_v.i31.i, -35
  %14 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 1702258035, i32* %14, align 4
  %tmp2_v8.i.i = add i32 %tmp0_v.i31.i, -31
  %15 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 543973746, i32* %15, align 4
  %tmp2_v9.i.i = add i32 %tmp0_v.i31.i, -27
  %16 = inttoptr i32 %tmp2_v9.i.i to i32*
  store i32 1685221239, i32* %16, align 4
  %tmp2_v10.i.i = add i32 %tmp0_v.i31.i, -23
  %17 = inttoptr i32 %tmp2_v10.i.i to i16*
  store i16 11891, i16* %17, align 2
  %tmp2_v11.i.i = add i32 %tmp0_v.i31.i, -21
  %18 = inttoptr i32 %tmp2_v11.i.i to i8*
  store i8 0, i8* %18, align 1
  %tmp2_v14.i.i = add i32 %tmp0_v.i31.i, -80
  %19 = inttoptr i32 %tmp2_v14.i.i to i32*
  store i32 %tmp2_v3.i.i, i32* %19, align 16
  %tmp2_v15.i.i = add i32 %tmp0_v.i31.i, -84
  %20 = inttoptr i32 %tmp2_v15.i.i to i32*
  store i32 134517449, i32* %20, align 4
  %tmp2_v.i127.i.i = add i32 %tmp0_v.i31.i, -88
  %21 = inttoptr i32 %tmp2_v.i127.i.i to i32*
  store i32 %tmp2_v4.i34.i, i32* %21, align 8
  %tmp2_v1.i129.i.i = add i32 %tmp0_v.i31.i, -92
  %22 = inttoptr i32 %tmp2_v1.i129.i.i to i32*
  store i32 134529024, i32* %22, align 4
  %tmp2_v2.i132.i.i = add i32 %tmp0_v.i31.i, -660
  %23 = inttoptr i32 %tmp2_v2.i132.i.i to i32*
  store i32 134517534, i32* %23, align 4
  %24 = load i32, i32* %19, align 16
  %tmp2_v2.i68.i.i = add i32 %tmp0_v.i31.i, -644
  %25 = inttoptr i32 %tmp2_v2.i68.i.i to i32*
  store i32 %24, i32* %25, align 4
  %tmp4_v.i69.i.b.i = load i1, i1* @segs.0, align 1
  %26 = inttoptr i32 %arg_esp to i32*
  %27 = load i32, i32* %26, align 4
  %tmp2_v5.i72.i.i = add i32 %tmp0_v.i31.i, -100
  %28 = inttoptr i32 %tmp2_v5.i72.i.i to i32*
  store i32 %27, i32* %28, align 4
  %29 = load i32, i32* %25, align 4
  %tmp2_v9.i77.i.i = add i32 %tmp0_v.i31.i, -672
  %30 = inttoptr i32 %tmp2_v9.i77.i.i to i32*
  store i32 %29, i32* %30, align 16
  %tmp2_v10.i78.i.i = add i32 %tmp0_v.i31.i, -676
  %31 = inttoptr i32 %tmp2_v10.i78.i.i to i32*
  store i32 134517574, i32* %31, align 4
  %arg.i.i.i = load i32, i32* %30, align 16
  %32 = tail call i32 @strlen(i32 %arg.i.i.i)
  %tmp2_v.i5.i.i = add i32 %tmp0_v.i31.i, -628
  %33 = inttoptr i32 %tmp2_v.i5.i.i to i32*
  store i32 %32, i32* %33, align 4
  %tmp2_v1.i.i.i = add i32 %tmp0_v.i31.i, -640
  %34 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 0, i32* %34, align 16
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i31.i, -636
  %35 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  store i32 -1, i32* %35, align 4
  %tmp2_v3.i.i.i = add i32 %tmp0_v.i31.i, -619
  %36 = inttoptr i32 %tmp2_v3.i.i.i to i32*
  store i32 992751136, i32* %36, align 4
  %tmp2_v4.i.i.i = add i32 %tmp0_v.i31.i, -615
  %37 = inttoptr i32 %tmp2_v4.i.i.i to i16*
  store i16 2314, i16* %37, align 2
  %tmp2_v5.i.i.i = add i32 %tmp0_v.i31.i, -613
  %38 = inttoptr i32 %tmp2_v5.i.i.i to i8*
  store i8 0, i8* %38, align 1
  %tmp2_v6.i.i.i = add i32 %tmp0_v.i31.i, -632
  %39 = inttoptr i32 %tmp2_v6.i.i.i to i32*
  store i32 0, i32* %39, align 8
  %40 = load i32, i32* %33, align 4
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %BB_80493F2.i.preheader.lr.ph.i, label %.BB_804949D.i_crit_edge.i

.BB_804949D.i_crit_edge.i:                        ; preds = %.exit
  %.pre78.i = add i32 %tmp0_v.i31.i, -356
  %.pre79.i = add i32 %tmp0_v.i31.i, -668
  %.pre80.i = inttoptr i32 %.pre79.i to i32*
  br label %Func_largest_word.exit

BB_80493F2.i.preheader.lr.ph.i:                   ; preds = %.exit
  %tmp2_v7.i143.i.i = add i32 %tmp0_v.i31.i, -668
  %42 = inttoptr i32 %tmp2_v7.i143.i.i to i32*
  %tmp2_v5.i58.i.i = add i32 %tmp0_v.i31.i, -612
  %tmp2_v5.i40.i.i = add i32 %tmp0_v.i31.i, -356
  br label %BB_80493F2.i.preheader.i

BB_8049449.i.i:                                   ; preds = %BB_804947D.i.preheader.i, %BB_8049476.i.i
  %43 = phi i32 [ %tmp0_v1.i82.i.i, %BB_8049476.i.i ], [ %68, %BB_804947D.i.preheader.i ]
  %44 = load i32, i32* %25, align 4
  %tmp0_v3.i27.i.i = add i32 %44, %43
  %45 = inttoptr i32 %tmp0_v3.i27.i.i to i8*
  %46 = load i8, i8* %45, align 1
  %tmp0_v5.i28.i.i = sext i8 %46 to i32
  store i32 %tmp0_v5.i28.i.i, i32* %42, align 4
  store i32 %tmp2_v3.i.i.i, i32* %30, align 16
  store i32 134517869, i32* %31, align 4
  %arg.i.i54.i = load i32, i32* %30, align 16
  %arg2.i.i55.i = load i32, i32* %42, align 4
  %47 = tail call i32 @strchr(i32 %arg.i.i54.i, i32 %arg2.i.i55.i)
  %.not.i.i.i = icmp eq i32 %47, 0
  %.pre.pre.i = load i32, i32* %39, align 8
  br i1 %.not.i.i.i, label %BB_8049449.i.BB_804948B.i.loopexit.loopexit_crit_edge.i, label %BB_8049476.i.i

BB_8049449.i.BB_804948B.i.loopexit.loopexit_crit_edge.i: ; preds = %BB_8049449.i.i
  %.pre75.pre.i = load i32, i32* %33, align 4
  br label %BB_804948B.i.loopexit.i

BB_8049422.i.i:                                   ; preds = %BB_8049402.i.i
  store i32 %66, i32* %35, align 4
  store i32 %tmp2_v5.i58.i.i, i32* %42, align 4
  store i32 %tmp2_v5.i40.i.i, i32* %30, align 16
  store i32 134517828, i32* %31, align 4
  %arg.i.i58.i = load i32, i32* %30, align 16
  %arg2.i.i59.i = load i32, i32* %42, align 4
  %48 = tail call i32 @strcpy(i32 %arg.i.i58.i, i32 %arg2.i.i59.i)
  br label %BB_804947D.i.preheader.i

BB_80493C3.i.i:                                   ; preds = %BB_80493F2.i.preheader.i, %BB_80493C3.i.i
  %49 = load i32, i32* %39, align 8
  %50 = load i32, i32* %25, align 4
  %tmp0_v3.i56.i.i = add i32 %50, %49
  %51 = inttoptr i32 %tmp0_v3.i56.i.i to i8*
  %52 = load i8, i8* %51, align 1
  %53 = load i32, i32* %34, align 16
  %tmp0_v8.i.i.i = add i32 %53, %tmp2_v5.i58.i.i
  %54 = inttoptr i32 %tmp0_v8.i.i.i to i8*
  store i8 %52, i8* %54, align 1
  %55 = load i32, i32* %39, align 8
  %tmp0_v11.i.i.i = add i32 %55, 1
  store i32 %tmp0_v11.i.i.i, i32* %39, align 8
  %56 = load i32, i32* %34, align 16
  %tmp0_v14.i.i.i = add i32 %56, 1
  store i32 %tmp0_v14.i.i.i, i32* %34, align 16
  %57 = load i32, i32* %39, align 8
  %58 = load i32, i32* %25, align 4
  %tmp0_v3.i138.i.i = add i32 %58, %57
  %59 = inttoptr i32 %tmp0_v3.i138.i.i to i8*
  %60 = load i8, i8* %59, align 1
  %tmp0_v5.i140.i.i = sext i8 %60 to i32
  store i32 %tmp0_v5.i140.i.i, i32* %42, align 4
  store i32 %tmp2_v3.i.i.i, i32* %30, align 16
  store i32 134517692, i32* %31, align 4
  %arg.i.i51.i = load i32, i32* %30, align 16
  %arg2.i.i.i = load i32, i32* %42, align 4
  %61 = tail call i32 @strchr(i32 %arg.i.i51.i, i32 %arg2.i.i.i)
  %.not.i152.i.i = icmp eq i32 %61, 0
  br i1 %.not.i152.i.i, label %BB_80493C3.i.i, label %BB_8049402.i.i

BB_8049476.i.i:                                   ; preds = %BB_8049449.i.i
  %tmp0_v1.i82.i.i = add i32 %.pre.pre.i, 1
  store i32 %tmp0_v1.i82.i.i, i32* %39, align 8
  %62 = load i32, i32* %33, align 4
  %63 = icmp slt i32 %tmp0_v1.i82.i.i, %62
  br i1 %63, label %BB_8049449.i.i, label %BB_804948B.i.loopexit.i

BB_8049402.i.i:                                   ; preds = %BB_80493F2.i.preheader.i, %BB_80493C3.i.i
  %64 = load i32, i32* %34, align 16
  %tmp0_v2.i93.i.i = add i32 %64, %tmp2_v5.i58.i.i
  %65 = inttoptr i32 %tmp0_v2.i93.i.i to i8*
  store i8 0, i8* %65, align 1
  %66 = load i32, i32* %34, align 16
  %67 = load i32, i32* %35, align 4
  %.not.i99.i.i = icmp sgt i32 %66, %67
  br i1 %.not.i99.i.i, label %BB_8049422.i.i, label %BB_804947D.i.preheader.i

BB_804947D.i.preheader.i:                         ; preds = %BB_8049402.i.i, %BB_8049422.i.i
  %68 = load i32, i32* %39, align 8
  %69 = load i32, i32* %33, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %BB_8049449.i.i, label %BB_804948B.i.loopexit.i

BB_804948B.i.loopexit.i:                          ; preds = %BB_804947D.i.preheader.i, %BB_8049476.i.i, %BB_8049449.i.BB_804948B.i.loopexit.loopexit_crit_edge.i
  %71 = phi i32 [ %69, %BB_804947D.i.preheader.i ], [ %.pre75.pre.i, %BB_8049449.i.BB_804948B.i.loopexit.loopexit_crit_edge.i ], [ %62, %BB_8049476.i.i ]
  %72 = phi i32 [ %68, %BB_804947D.i.preheader.i ], [ %.pre.pre.i, %BB_8049449.i.BB_804948B.i.loopexit.loopexit_crit_edge.i ], [ %tmp0_v1.i82.i.i, %BB_8049476.i.i ]
  %73 = icmp slt i32 %72, %71
  br i1 %73, label %BB_80493F2.i.preheader.i, label %Func_largest_word.exit

BB_80493F2.i.preheader.i:                         ; preds = %BB_804948B.i.loopexit.i, %BB_80493F2.i.preheader.lr.ph.i
  store i32 0, i32* %34, align 16
  %74 = load i32, i32* %39, align 8
  %75 = load i32, i32* %25, align 4
  %tmp0_v3.i138.i68.i = add i32 %75, %74
  %76 = inttoptr i32 %tmp0_v3.i138.i68.i to i8*
  %77 = load i8, i8* %76, align 1
  %tmp0_v5.i140.i69.i = sext i8 %77 to i32
  store i32 %tmp0_v5.i140.i69.i, i32* %42, align 4
  store i32 %tmp2_v3.i.i.i, i32* %30, align 16
  store i32 134517692, i32* %31, align 4
  %arg.i.i5170.i = load i32, i32* %30, align 16
  %arg2.i.i71.i = load i32, i32* %42, align 4
  %78 = tail call i32 @strchr(i32 %arg.i.i5170.i, i32 %arg2.i.i71.i)
  %.not.i152.i72.i = icmp eq i32 %78, 0
  br i1 %.not.i152.i72.i, label %BB_80493C3.i.i, label %BB_8049402.i.i

Func_largest_word.exit:                           ; preds = %BB_804948B.i.loopexit.i, %.BB_804949D.i_crit_edge.i
  %.pre-phi.i = phi i32* [ %.pre80.i, %.BB_804949D.i_crit_edge.i ], [ %42, %BB_804948B.i.loopexit.i ]
  %tmp2_v2.i114.i.pre-phi.i = phi i32 [ %.pre78.i, %.BB_804949D.i_crit_edge.i ], [ %tmp2_v5.i40.i.i, %BB_804948B.i.loopexit.i ]
  %79 = load i32, i32* %35, align 4
  %tmp0_v1.i46.i.i = add i32 %79, 1
  store i32 %tmp0_v1.i46.i.i, i32* %30, align 16
  store i32 134517935, i32* %31, align 4
  %arg.i.i60.i = load i32, i32* %30, align 16
  %80 = tail call i32 @malloc(i32 %arg.i.i60.i)
  %tmp2_v.i111.i.i = add i32 %tmp0_v.i31.i, -624
  %81 = inttoptr i32 %tmp2_v.i111.i.i to i32*
  store i32 %80, i32* %81, align 16
  store i32 %tmp2_v2.i114.i.pre-phi.i, i32* %.pre-phi.i, align 4
  %82 = load i32, i32* %81, align 16
  store i32 %82, i32* %30, align 16
  store i32 134517965, i32* %31, align 4
  %arg.i.i63.i = load i32, i32* %30, align 16
  %arg2.i.i64.i = load i32, i32* %.pre-phi.i, align 4
  %83 = tail call i32 @strcpy(i32 %arg.i.i63.i, i32 %arg2.i.i64.i)
  %84 = load i32, i32* %81, align 16
  %85 = load i32, i32* %21, align 8
  %tmp2_v.i.i = add i32 %85, -48
  %86 = inttoptr i32 %tmp2_v.i.i to i32*
  store i32 %84, i32* %86, align 4
  store i32 %84, i32* %19, align 16
  store i32 134517466, i32* %20, align 4
  %arg.i.i = load i32, i32* %19, align 16
  %87 = inttoptr i32 %arg.i.i to i8*
  %88 = tail call i32 @puts(i8* nonnull dereferenceable(1) %87)
  %89 = load i32, i32* %86, align 4
  store i32 %89, i32* %19, align 16
  store i32 134517480, i32* %20, align 4
  %arg.i.i3 = load i32, i32* %19, align 16
  tail call void @free(i32 %arg.i.i3)
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

  tail call fastcc void @largest_word_print676 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack675, i32 0, i32 8092) to i32)) nounwind
