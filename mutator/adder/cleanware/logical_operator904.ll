; Mutation 904
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@stack903 = internal global [8092 x i32] zeroinitializer, align 16
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.900 = constant [4 x i8] c"\4f\4b\21\00"
@str.bis.901 = constant [4 x i8] c"\4f\4b\21\00"
@str.bis.902 = constant [4 x i8] c"\4f\4b\21\00"

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly
define internal fastcc void @helper_fninit() unnamed_addr  mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87"  {
  store i32 0, i32* @fpstt, align 16
  ret void
}

; Function Attrs: norecurse nounwind uwtable

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i8* @llvm.returnaddress(i32 immarg)  nofree nosync nounwind readnone willreturn 

declare dso_local i32 @puts(i8* noundef) local_unnamed_addr  "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" 

; Function Attrs: norecurse
define internal fastcc void @logical_operator904(i32 %arg_esp) unnamed_addr  norecurse  !retregs !10 {
Func_80491B1.exit.i:
  %tmp2_v.i8.i = add i32 %arg_esp, 4
  %tmp0_v.i9.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i9.i, -4
  %2 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i.i = add i32 %tmp0_v.i9.i, -8
  %3 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i.i = add i32 %tmp0_v.i9.i, -12
  %4 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i9.i, -16
  %5 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i8.i, i32* %5, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i9.i, -36
  %6 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517169, i32* %6, align 4
  %tmp2_v.i4.i = add i32 %tmp0_v.i9.i, -24
  %7 = inttoptr i32 %tmp2_v.i4.i to i32*
  store i32 2020, i32* %7, align 8
  %tmp2_v1.i.i = add i32 %tmp0_v.i9.i, -20
  %8 = inttoptr i32 %tmp2_v1.i.i to i32*
  store i32 19000, i32* %8, align 4
  %tmp2_v1.i47.i = add i32 %tmp0_v.i9.i, -48
  %9 = inttoptr i32 %tmp2_v1.i47.i to i32*
  %spi.bis.902 = ptrtoint[4 x i8]* @str.bis.902 to i32
  store i32 %spi.bis.902, i32* %9, align 16
  %tmp2_v2.i48.i = add i32 %tmp0_v.i9.i, -52
  %10 = inttoptr i32 %tmp2_v2.i48.i to i32*
  store i32 134517222, i32* %10, align 4
  %arg.i.i = load i32, i32* %9, align 16
  %11 = inttoptr i32 %arg.i.i to i8*
  %12 = tail call i32 @puts(i8* nonnull dereferenceable(1) %11)
  %spi.bis.901 = ptrtoint[4 x i8]* @str.bis.901 to i32
  store i32 %spi.bis.901, i32* %9, align 16
  store i32 134517278, i32* %10, align 4
  %arg.i.i3 = load i32, i32* %9, align 16
  %13 = inttoptr i32 %arg.i.i3 to i8*
  %14 = tail call i32 @puts(i8* nonnull dereferenceable(1) %13)
  %spi.bis.900 = ptrtoint[4 x i8]* @str.bis.900 to i32
  store i32 %spi.bis.900, i32* %9, align 16
  store i32 134517325, i32* %10, align 4
  %arg.i.i4 = load i32, i32* %9, align 16
  %15 = inttoptr i32 %arg.i.i4 to i8*
  %16 = tail call i32 @puts(i8* nonnull dereferenceable(1) %15)
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

  tail call fastcc void @logical_operator904 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack903, i32 0, i32 8092) to i32)) nounwind
