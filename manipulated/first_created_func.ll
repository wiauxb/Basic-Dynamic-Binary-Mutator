; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack = internal global [4194304 x i32] zeroinitializer, align 16
@onUnfallback = common local_unnamed_addr global i1 false

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define internal fastcc void @helper_fldl_ST0(i64 noundef %0) unnamed_addr #0 {
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
define internal fastcc void @helper_fninit() unnamed_addr #1 {
  store i32 0, i32* @fpstt, align 16
  ret void
}

; Function Attrs: naked noinline
declare dso_local i32 @printf(i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: mustprogress nounwind uwtable
define internal x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %0, i32 inreg noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #3 {
  %5 = alloca double, align 8
  %6 = tail call { i32, i32 } asm "movl    %esp, %ebx\0A\09movl    $2, %esp\0A\09calll   *$3\0A\09movl    %ebx, %esp", "={ax},={dx},r,r,{cx},{dx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %2, i32 %3, i32 %0, i32 %1) #10
  %7 = extractvalue { i32, i32 } %6, 0
  %8 = extractvalue { i32, i32 } %6, 1
  %9 = bitcast double* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9) #11
  call void asm "fstpl   $0", "=*m,~{dirflag},~{fpsr},~{flags}"(double* nonnull elementtype(double) %5) #11
  %10 = load double, double* %5, align 8, !tbaa !6
  %11 = fptoui double %10 to i64
  call fastcc void @helper_fldl_ST0(i64 noundef %11) #12
  %12 = zext i32 %8 to i64
  %13 = shl nuw i64 %12, 32
  %14 = zext i32 %7 to i64
  %15 = or i64 %13, %14
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #11
  ret i64 %15
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: norecurse nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, i8** noundef %1, i8** noundef %2) local_unnamed_addr #5 {
  %4 = tail call i32 asm "pushf\0A\09popl $0", "=r,~{dirflag},~{fpsr},~{flags}"() #10
  tail call fastcc void @helper_fninit() #12
  %5 = ptrtoint i8** %2 to i32
  store i32 %5, i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194303), align 4, !tbaa !10
  %6 = ptrtoint i8** %1 to i32
  store i32 %6, i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194302), align 8, !tbaa !10
  store i32 %0, i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194301), align 4, !tbaa !10
  %7 = tail call i8* @llvm.returnaddress(i32 0)
  %8 = ptrtoint i8* %7 to i32
  store i32 %8, i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300), align 16, !tbaa !10
  tail call fastcc void @Func_main(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) #11
  ret i32 0
}

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i8* @llvm.returnaddress(i32 immarg) #6

declare dso_local i32 @puts(i8* noundef) local_unnamed_addr #7

; Function Attrs: noinline
declare i32 @sleep(i32) local_unnamed_addr #8

; Function Attrs: norecurse
define internal fastcc void @Func_main(i32 %arg_esp) unnamed_addr #9 !retregs !12 {
  %tmp2_v.i24.i = add i32 %arg_esp, 4
  %tmp0_v.i25.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i27.i = add i32 %tmp0_v.i25.i, -4
  %3 = inttoptr i32 %tmp2_v3.i27.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i28.i = add i32 %tmp0_v.i25.i, -8
  %4 = inttoptr i32 %tmp2_v4.i28.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i30.i = add i32 %tmp0_v.i25.i, -12
  %5 = inttoptr i32 %tmp2_v5.i30.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i25.i, -16
  %6 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i24.i, i32* %6, align 16
  %tmp2_v8.i.i = add i32 %tmp0_v.i25.i, -36
  %7 = inttoptr i32 %tmp2_v8.i.i to i32*
  store i32 134517233, i32* %7, align 4
  %tmp2_v.i20.i = add i32 %tmp0_v.i25.i, -44
  %8 = inttoptr i32 %tmp2_v.i20.i to i32*
  store i32 4242, i32* %8, align 4
  %tmp2_v3.i22.i = add i32 %tmp0_v.i25.i, -48
  %9 = inttoptr i32 %tmp2_v3.i22.i to i32*
  store i32 134520840, i32* %9, align 16
  %tmp2_v4.i.i = add i32 %tmp0_v.i25.i, -52
  %10 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 134517259, i32* %10, align 4
  %11 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i24.i, i32 inreg noundef 0, i32 noundef %tmp2_v3.i22.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32)) #12, !funcname !13
  %12 = lshr i64 %11, 32
  %13 = trunc i64 %12 to i32
  ;-----------------------------------
  tail call fastcc void @reroute(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) #11
  ;--------------------------------------
  store i32 4242, i32* %8, align 4
  store i32 134520840, i32* %9, align 16
  store i32 134517345, i32* %10, align 4
  %14 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i24.i, i32 inreg noundef %13, i32 noundef %tmp2_v3.i22.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32)) #12, !funcname !13
  ret void
}

; [MEM]
define internal fastcc void @reroute(i32 %arg_esp) unnamed_addr norecurse !retregs !{i32 0, i32 0, i32 0, i32 0} {
  %tmp2_v.i24.i = add i32 %arg_esp, 4
  %tmp0_v.i25.i = and i32 %arg_esp, -16
  %tmp2_v3.i22.i = add i32 %tmp0_v.i25.i, -48
  %1 = inttoptr i32 %tmp2_v3.i22.i to i32*
  store i32 134520840, i32* %1, align 16
  %tmp2_v4.i.i = add i32 %tmp0_v.i25.i, -52
  %2 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 134517259, i32* %2, align 4

  %tmp2_v.i7.i = add i32 %tmp0_v.i25.i, -24
  %3 = inttoptr i32 %tmp2_v.i7.i to i32*
  store i32 5, i32* %3, align 8

  %tmp2_v1.i.i = add i32 %tmp0_v.i25.i, -20
  %4 = inttoptr i32 %tmp2_v1.i.i to i32*
  store i32 7, i32* %4, align 4

  ; https://stackoverflow.com/questions/37101965/create-local-string-using-llvm
  %sp = alloca [10 x i8]
  store [10 x i8] c"We are in\00", [10 x i8]* %sp
  %str = bitcast [10 x i8]* %sp to i8*
  tail call i32 @puts(i8* nonnull dereferenceable(1) %str)

  tail call i32 @sleep(i32 2)
  
  %sp2 = alloca [9 x i8]
  store [9 x i8] c"We leave\00", [9 x i8]* %sp2
  %str2 = bitcast [9 x i8]* %sp2 to i8*
  tail call i32 @puts(i8* nonnull dereferenceable(1) %str2)
  
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" }
attributes #2 = { naked noinline "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nosync nounwind willreturn }
attributes #5 = { norecurse nounwind uwtable "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nosync nounwind readnone willreturn }
attributes #7 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noinline }
attributes #9 = { norecurse }
attributes #10 = { nounwind readnone }
attributes #11 = { nounwind }
attributes #12 = { nobuiltin nounwind "no-builtins" }

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
