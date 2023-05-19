; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@stack = internal global [4194304 x i32] zeroinitializer, align 16
@onUnfallback = common local_unnamed_addr global i1 false

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly
define internal fastcc void @helper_fninit() unnamed_addr  mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87"  {
  store i32 0, i32* @fpstt, align 16
  ret void
}

; Function Attrs: mustprogress norecurse nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, i8** noundef %1, i8** noundef %2) local_unnamed_addr  mustprogress norecurse nounwind uwtable "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic"  {
  %4 = tail call i32 asm "pushf\0A\09popl $0", "=r,~{dirflag},~{fpsr},~{flags}"()  nounwind readnone 
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define internal fastcc void @parameters_vs_argumentsm15161636(i32 %arg_esp) unnamed_addr  mustprogress nofree norecurse nosync nounwind willreturn  !retregs !10 {
  %tmp2_v.i5.i = add i32 %arg_esp, -4
  %1 = inttoptr i32 %tmp2_v.i5.i to i32*
  store i32 0, i32* %1, align 4
  %tmp2_v1.i8.i = add i32 %arg_esp, -24
  %2 = inttoptr i32 %tmp2_v1.i8.i to i32*
  store i32 5, i32* %2, align 4
  %tmp2_v1.i12.i = add i32 %arg_esp, -28
  %3 = inttoptr i32 %tmp2_v1.i12.i to i32*
  store i32 10, i32* %3, align 4
  %tmp2_v2.i13.i = add i32 %arg_esp, -32
  %4 = inttoptr i32 %tmp2_v2.i13.i to i32*
  store i32 134517166, i32* %4, align 4
  %tmp2_v.i2.i.i = add i32 %arg_esp, -36
  %5 = inttoptr i32 %tmp2_v.i2.i.i to i32*
  store i32 %tmp2_v.i5.i, i32* %5, align 4
  %tmp2_v1.i.i.i = add i32 %arg_esp, -40
  %6 = inttoptr i32 %tmp2_v1.i.i.i to i32*
  store i32 134517122, i32* %6, align 4
  %7 = load i32, i32* %5, align 4
  %tmp2_v.i.i = add i32 %7, -8
  %8 = inttoptr i32 %tmp2_v.i.i to i32*
  store i32 2, i32* %8, align 4
  %tmp2_v1.i.i = add i32 %7, -4
  %9 = inttoptr i32 %tmp2_v1.i.i to i32*
  store i32 4, i32* %9, align 4
  %10 = load i32, i32* %8, align 4
  %tmp0_v4.i.i = add i32 %10, 2
  store i32 4, i32* %2, align 4
  store i32 %tmp0_v4.i.i, i32* %3, align 4
  store i32 134517198, i32* %4, align 4
  store i32 %7, i32* %5, align 4
  store i32 134517122, i32* %6, align 4
  ret void
}

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
!10 = !{i32 0, i32 0}

  tail call fastcc void @parameters_vs_argumentsm15161636(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) nounwind