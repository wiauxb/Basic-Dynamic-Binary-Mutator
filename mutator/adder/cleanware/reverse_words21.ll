; Mutation 21
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@stack = internal global [4194304 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly
define internal fastcc void @helper_fninit() unnamed_addr  mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87"  {
  store i32 0, i32* @fpstt, align 16
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, i8** noundef %1, i8** noundef %2) local_unnamed_addr  norecurse nounwind uwtable "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic"  {
  %4 = tail call i32 asm "pushf\0A\09popl $0", "=r,~{dirflag},~{fpsr},~{flags}"()  nounwind readnone 
  store i1 true, i1* @segs.0, align 1
  tail call fastcc void @helper_fninit()  nobuiltin nounwind "no-builtins" 
  %5 = ptrtoint i8** %2 to i32
  store i32 %5, i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194303), align 4, !tbaa !6
  %6 = ptrtoint i8** %1 to i32
  store i32 %6, i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194302), align 8, !tbaa !6
  store i32 %0, i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194301), align 4, !tbaa !6
  %7 = tail call i8* @llvm.returnaddress(i32 0)
  %8 = ptrtoint i8* %7 to i32
  store i32 %8, i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300), align 16, !tbaa !6
  tail call fastcc void @Func_main(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32))  nounwind 
  ret i32 0
}

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i8* @llvm.returnaddress(i32 immarg)  nofree nosync nounwind readnone willreturn 

declare dso_local i32 @puts(i8* noundef) local_unnamed_addr  "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" 

; Function Attrs: noinline
declare i32 @strlen(i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @reverse_words21(i32 %arg_esp) unnamed_addr  norecurse  !retregs !10 {
.exit:
  %tmp2_v.i28.i = add i32 %arg_esp, 4
  %tmp0_v.i29.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i30.i = add i32 %tmp0_v.i29.i, -4
  %2 = inttoptr i32 %tmp2_v3.i30.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i31.i = add i32 %tmp0_v.i29.i, -8
  %3 = inttoptr i32 %tmp2_v4.i31.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i33.i = add i32 %tmp0_v.i29.i, -12
  %4 = inttoptr i32 %tmp2_v5.i33.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i35.i = add i32 %tmp0_v.i29.i, -16
  %5 = inttoptr i32 %tmp2_v6.i35.i to i32*
  store i32 %tmp2_v.i28.i, i32* %5, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i29.i, -52
  %6 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517233, i32* %6, align 4
  %tmp4_v.i8.i.b = load i1, i1* @segs.0, align 1
  %7 = inttoptr i32 %arg_esp to i32*
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i12.i = add i32 %tmp0_v.i29.i, -20
  %9 = inttoptr i32 %tmp2_v2.i12.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i29.i, -37
  %10 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 1936287828, i32* %10, align 4
  %tmp2_v4.i13.i = add i32 %tmp0_v.i29.i, -33
  %11 = inttoptr i32 %tmp2_v4.i13.i to i32*
  store i32 544434464, i32* %11, align 4
  %tmp2_v5.i.i = add i32 %tmp0_v.i29.i, -29
  %12 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 543516788, i32* %12, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i29.i, -25
  %13 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 779706743, i32* %13, align 4
  %tmp2_v7.i.i = add i32 %tmp0_v.i29.i, -21
  %14 = inttoptr i32 %tmp2_v7.i.i to i8*
  store i8 0, i8* %14, align 1
  %tmp2_v10.i.i = add i32 %tmp0_v.i29.i, -64
  %15 = inttoptr i32 %tmp2_v10.i.i to i32*
  store i32 %tmp2_v3.i.i, i32* %15, align 16
  %tmp2_v11.i.i = add i32 %tmp0_v.i29.i, -68
  %16 = inttoptr i32 %tmp2_v11.i.i to i32*
  store i32 134517294, i32* %16, align 4
  %arg.i.i = load i32, i32* %15, align 16
  %17 = inttoptr i32 %arg.i.i to i8*
  %18 = tail call i32 @puts(i8* nonnull dereferenceable(1) %17)
  store i32 %tmp2_v3.i.i, i32* %15, align 16
  store i32 134517309, i32* %16, align 4
  %tmp2_v.i36.i.i = add i32 %tmp0_v.i29.i, -72
  %19 = inttoptr i32 %tmp2_v.i36.i.i to i32*
  store i32 %tmp2_v4.i31.i, i32* %19, align 8
  %tmp2_v1.i38.i.i = add i32 %tmp0_v.i29.i, -76
  %20 = inttoptr i32 %tmp2_v1.i38.i.i to i32*
  store i32 134529024, i32* %20, align 4
  %tmp2_v2.i40.i.i = add i32 %tmp0_v.i29.i, -228
  %21 = inttoptr i32 %tmp2_v2.i40.i.i to i32*
  store i32 134517378, i32* %21, align 4
  %22 = load i32, i32* %15, align 16
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i29.i, -212
  %23 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  store i32 %22, i32* %23, align 4
  %tmp4_v.i8.i.b.i = load i1, i1* @segs.0, align 1
  %24 = inttoptr i32 %arg_esp to i32*
  %25 = load i32, i32* %24, align 4
  %tmp2_v5.i.i.i = add i32 %tmp0_v.i29.i, -84
  %26 = inttoptr i32 %tmp2_v5.i.i.i to i32*
  store i32 %25, i32* %26, align 4
  %27 = load i32, i32* %23, align 4
  %tmp2_v9.i.i.i = add i32 %tmp0_v.i29.i, -240
  %28 = inttoptr i32 %tmp2_v9.i.i.i to i32*
  store i32 %27, i32* %28, align 16
  %tmp2_v10.i.i.i = add i32 %tmp0_v.i29.i, -244
  %29 = inttoptr i32 %tmp2_v10.i.i.i to i32*
  store i32 134517420, i32* %29, align 4
  %arg.i.i.i = load i32, i32* %28, align 16
  %30 = tail call i32 @strlen(i32 %arg.i.i.i)
  %tmp2_v.i69.i.i = add i32 %tmp0_v.i29.i, -188
  %31 = inttoptr i32 %tmp2_v.i69.i.i to i32*
  store i32 %30, i32* %31, align 4
  %tmp2_v1.i71.i.i = add i32 %tmp0_v.i29.i, -196
  %32 = inttoptr i32 %tmp2_v1.i71.i.i to i32*
  %tmp2_v2.i72.i.i = add i32 %tmp0_v.i29.i, -192
  %33 = inttoptr i32 %tmp2_v2.i72.i.i to i32*
  store i32 0, i32* %33, align 16
  store i32 0, i32* %32, align 4
  %34 = load i32, i32* %31, align 4
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %BB_80492CC.i.lr.ph.i, label %Func_reverse_words.exit

BB_80492CC.i.lr.ph.i:                             ; preds = %.exit
  %tmp2_v5.i81.i.i = add i32 %tmp0_v.i29.i, -184
  br label %BB_80492CC.i.i

BB_80492CC.i.i:                                   ; preds = %BB_804934B.i.i, %BB_80492CC.i.lr.ph.i
  store i32 0, i32* %33, align 16
  %.pre.i = load i32, i32* %32, align 4
  br label %BB_8049319.i.i

BB_8049323.i.i:                                   ; preds = %BB_8049345.i.preheader.i, %BB_8049323.i.i
  %36 = phi i32 [ %42, %BB_8049323.i.i ], [ %48, %BB_8049345.i.preheader.i ]
  %tmp0_v1.i15.i.i = add nsw i32 %36, -1
  store i32 %tmp0_v1.i15.i.i, i32* %33, align 16
  %37 = load i32, i32* %32, align 4
  %tmp2_v6.i.i.i = sub i32 %37, %36
  %38 = load i32, i32* %23, align 4
  %tmp0_v9.i.i.i = add i32 %tmp2_v6.i.i.i, %38
  %tmp0_v13.i.i.i = add i32 %tmp0_v1.i15.i.i, %tmp2_v5.i81.i.i
  %39 = inttoptr i32 %tmp0_v13.i.i.i to i8*
  %40 = load i8, i8* %39, align 1
  %41 = inttoptr i32 %tmp0_v9.i.i.i to i8*
  store i8 %40, i8* %41, align 1
  %42 = load i32, i32* %33, align 16
  %43 = icmp sgt i32 %42, 0
  br i1 %43, label %BB_8049323.i.i, label %BB_804934B.i.loopexit.i

BB_8049319.i.i:                                   ; preds = %BB_80492F9.i.i, %BB_80492CC.i.i
  %44 = phi i32 [ %tmp0_v14.i86.i.i, %BB_80492F9.i.i ], [ %.pre.i, %BB_80492CC.i.i ]
  %45 = load i32, i32* %23, align 4
  %tmp0_v3.i.i.i = add i32 %45, %44
  %46 = inttoptr i32 %tmp0_v3.i.i.i to i8*
  %47 = load i8, i8* %46, align 1
  switch i8 %47, label %BB_80492F9.i.i [
    i8 32, label %BB_8049345.i.preheader.i
    i8 46, label %BB_8049345.i.preheader.i
  ]

BB_8049345.i.preheader.i:                         ; preds = %BB_8049319.i.i, %BB_8049319.i.i
  %48 = load i32, i32* %33, align 16
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %BB_8049323.i.i, label %BB_804934B.i.i

BB_80492F9.i.i:                                   ; preds = %BB_8049319.i.i
  %50 = load i32, i32* %33, align 16
  %tmp0_v8.i83.i.i = add i32 %50, %tmp2_v5.i81.i.i
  %51 = inttoptr i32 %tmp0_v8.i83.i.i to i8*
  store i8 %47, i8* %51, align 1
  %52 = load i32, i32* %33, align 16
  %tmp0_v11.i.i.i = add i32 %52, 1
  store i32 %tmp0_v11.i.i.i, i32* %33, align 16
  %53 = load i32, i32* %32, align 4
  %tmp0_v14.i86.i.i = add i32 %53, 1
  store i32 %tmp0_v14.i86.i.i, i32* %32, align 4
  br label %BB_8049319.i.i

BB_804934B.i.loopexit.i:                          ; preds = %BB_8049323.i.i
  %.pre27.i = load i32, i32* %32, align 4
  br label %BB_804934B.i.i

BB_804934B.i.i:                                   ; preds = %BB_804934B.i.loopexit.i, %BB_8049345.i.preheader.i
  %54 = phi i32 [ %.pre27.i, %BB_804934B.i.loopexit.i ], [ %44, %BB_8049345.i.preheader.i ]
  %tmp0_v1.i95.i.i = add i32 %54, 1
  store i32 %tmp0_v1.i95.i.i, i32* %32, align 4
  %55 = load i32, i32* %31, align 4
  %56 = icmp slt i32 %tmp0_v1.i95.i.i, %55
  br i1 %56, label %BB_80492CC.i.i, label %Func_reverse_words.exit

Func_reverse_words.exit:                          ; preds = %BB_804934B.i.i, %.exit
  %57 = load i32, i32* %19, align 8
  %tmp2_v.i25.i = add i32 %57, -29
  store i32 %tmp2_v.i25.i, i32* %15, align 16
  store i32 134517324, i32* %16, align 4
  %arg.i.i4 = load i32, i32* %15, align 16
  %58 = inttoptr i32 %arg.i.i4 to i8*
  %59 = tail call i32 @puts(i8* nonnull dereferenceable(1) %58)
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

  tail call fastcc void @reverse_words21(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) nounwind
