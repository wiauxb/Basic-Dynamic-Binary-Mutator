; Mutation 772
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@stack = internal global [4194304 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.771 = constant [16 x i8] c"Could not find!\00"

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
declare i32 @strpbrk(i32, i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @strpbrk772(i32 %arg_esp) unnamed_addr  norecurse  !retregs !10 {
Func_8049271.exit.i:
  %tmp2_v.i21.i = add i32 %arg_esp, 4
  %tmp0_v.i22.i = and i32 %arg_esp, -16
  %0 = inttoptr i32 %arg_esp to i32*
  %1 = load i32, i32* %0, align 4
  %tmp2_v3.i24.i = add i32 %tmp0_v.i22.i, -4
  %2 = inttoptr i32 %tmp2_v3.i24.i to i32*
  store i32 %1, i32* %2, align 4
  %tmp2_v4.i25.i = add i32 %tmp0_v.i22.i, -8
  %3 = inttoptr i32 %tmp2_v4.i25.i to i32*
  store i32 0, i32* %3, align 8
  %tmp2_v5.i27.i = add i32 %tmp0_v.i22.i, -12
  %4 = inttoptr i32 %tmp2_v5.i27.i to i32*
  store i32 0, i32* %4, align 4
  %tmp2_v6.i29.i = add i32 %tmp0_v.i22.i, -16
  %5 = inttoptr i32 %tmp2_v6.i29.i to i32*
  store i32 %tmp2_v.i21.i, i32* %5, align 16
  %tmp2_v8.i30.i = add i32 %tmp0_v.i22.i, -68
  %6 = inttoptr i32 %tmp2_v8.i30.i to i32*
  store i32 134517233, i32* %6, align 4
  %tmp4_v.i5.i.b = load i1, i1* @segs.0, align 1
  %7 = inttoptr i32 %arg_esp to i32*
  %8 = load i32, i32* %7, align 4
  %tmp2_v2.i.i = add i32 %tmp0_v.i22.i, -20
  %9 = inttoptr i32 %tmp2_v2.i.i to i32*
  store i32 %8, i32* %9, align 4
  %tmp2_v3.i.i = add i32 %tmp0_v.i22.i, -36
  %10 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 1146306881, i32* %10, align 4
  %tmp2_v4.i9.i = add i32 %tmp0_v.i22.i, -32
  %11 = inttoptr i32 %tmp2_v4.i9.i to i32*
  store i32 1397113158, i32* %11, align 16
  %tmp2_v5.i.i = add i32 %tmp0_v.i22.i, -28
  %12 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 858927411, i32* %12, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i22.i, -24
  %13 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 3355185, i32* %13, align 8
  %tmp2_v7.i.i = add i32 %tmp0_v.i22.i, -47
  %14 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 858927408, i32* %14, align 4
  %tmp2_v8.i.i = add i32 %tmp0_v.i22.i, -43
  %15 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 926299444, i32* %15, align 4
  %tmp2_v9.i.i = add i32 %tmp0_v.i22.i, -39
  %16 = inttoptr i32 %tmp2_v9.i.i to i16*
  store i16 14648, i16* %16, align 2
  %tmp2_v10.i.i = add i32 %tmp0_v.i22.i, -37
  %17 = inttoptr i32 %tmp2_v10.i.i to i8*
  store i8 0, i8* %17, align 1
  %tmp2_v13.i.i = add i32 %tmp0_v.i22.i, -76
  %18 = inttoptr i32 %tmp2_v13.i.i to i32*
  store i32 %tmp2_v7.i.i, i32* %18, align 4
  %tmp2_v15.i.i = add i32 %tmp0_v.i22.i, -80
  %19 = inttoptr i32 %tmp2_v15.i.i to i32*
  store i32 %tmp2_v3.i.i, i32* %19, align 16
  %tmp2_v16.i.i = add i32 %tmp0_v.i22.i, -84
  %20 = inttoptr i32 %tmp2_v16.i.i to i32*
  store i32 134517318, i32* %20, align 4
  %arg.i.i = load i32, i32* %19, align 16
  %arg2.i.i = load i32, i32* %18, align 4
  %21 = tail call i32 @strpbrk(i32 %arg.i.i, i32 %arg2.i.i)
  %tmp2_v.i49.i = add i32 %tmp0_v.i22.i, -60
  %22 = inttoptr i32 %tmp2_v.i49.i to i32*
  store i32 %21, i32* %22, align 4
  store i32 %21, i32* %19, align 16
  store i32 134517335, i32* %20, align 4
  %arg.i.i3 = load i32, i32* %19, align 16
  %23 = inttoptr i32 %arg.i.i3 to i8*
  %24 = tail call i32 @puts(i8* nonnull dereferenceable(1) %23)
  %tmp2_v.i40.i = add i32 %tmp0_v.i22.i, -51
  %25 = inttoptr i32 %tmp2_v.i40.i to i32*
  store i32 3816236, i32* %25, align 4
  store i32 %tmp2_v.i40.i, i32* %18, align 4
  store i32 %tmp2_v3.i.i, i32* %19, align 16
  store i32 134517361, i32* %20, align 4
  %arg.i.i4 = load i32, i32* %19, align 16
  %arg2.i.i5 = load i32, i32* %18, align 4
  %26 = tail call i32 @strpbrk(i32 %arg.i.i4, i32 %arg2.i.i5)
  %tmp2_v.i.i = add i32 %tmp0_v.i22.i, -56
  %27 = inttoptr i32 %tmp2_v.i.i to i32*
  store i32 %26, i32* %27, align 8
  %spi771 = ptrtoint[16 x i8]* @str.771 to i32
  store i32 %spi771, i32* %19, align 16
  store i32 134517388, i32* %20, align 4
  %arg.i.i7 = load i32, i32* %19, align 16
  %28 = inttoptr i32 %arg.i.i7 to i8*
  %29 = tail call i32 @puts(i8* nonnull dereferenceable(1) %28)
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

  tail call fastcc void @strpbrk772(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) nounwind