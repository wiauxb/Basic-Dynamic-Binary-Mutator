; Mutation 401
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack400 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.398 = constant [3 x i8] c"\5c\30\00"
@str.bis.399 = constant [4 x i8] c"\25\63\0a\00"

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
declare i32 @strtok(i32, i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @strtok401(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
  %tmp2_v.i80.i = add i32 %arg_esp, 4
  %tmp0_v.i81.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i83.i = add i32 %tmp0_v.i81.i, -4
  %3 = inttoptr i32 %tmp2_v3.i83.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i84.i = add i32 %tmp0_v.i81.i, -8
  %4 = inttoptr i32 %tmp2_v4.i84.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i.i = add i32 %tmp0_v.i81.i, -12
  %5 = inttoptr i32 %tmp2_v5.i.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i87.i = add i32 %tmp0_v.i81.i, -16
  %6 = inttoptr i32 %tmp2_v6.i87.i to i32*
  store i32 %tmp2_v.i80.i, i32* %6, align 16
  %tmp2_v8.i88.i = add i32 %tmp0_v.i81.i, -68
  %7 = inttoptr i32 %tmp2_v8.i88.i to i32*
  store i32 134517265, i32* %7, align 4
  %tmp4_v.i93.i.b = load i1, i1* @segs.0, align 1
  %8 = inttoptr i32 %arg_esp to i32*
  %9 = load i32, i32* %8, align 4
  %tmp2_v2.i97.i = add i32 %tmp0_v.i81.i, -20
  %10 = inttoptr i32 %tmp2_v2.i97.i to i32*
  store i32 %9, i32* %10, align 4
  %tmp2_v3.i98.i = add i32 %tmp0_v.i81.i, -43
  %11 = inttoptr i32 %tmp2_v3.i98.i to i32*
  store i32 1936287828, i32* %11, align 4
  %tmp2_v4.i99.i = add i32 %tmp0_v.i81.i, -39
  %12 = inttoptr i32 %tmp2_v4.i99.i to i32*
  store i32 544434464, i32* %12, align 4
  %tmp2_v5.i100.i = add i32 %tmp0_v.i81.i, -35
  %13 = inttoptr i32 %tmp2_v5.i100.i to i32*
  store i32 543516788, i32* %13, align 4
  %tmp2_v6.i101.i = add i32 %tmp0_v.i81.i, -31
  %14 = inttoptr i32 %tmp2_v6.i101.i to i32*
  store i32 544825719, i32* %14, align 4
  %tmp2_v7.i102.i = add i32 %tmp0_v.i81.i, -27
  %15 = inttoptr i32 %tmp2_v7.i102.i to i32*
  store i32 1767991137, i32* %15, align 4
  %tmp2_v8.i103.i = add i32 %tmp0_v.i81.i, -23
  %16 = inttoptr i32 %tmp2_v8.i103.i to i16*
  store i16 11886, i16* %16, align 2
  %tmp2_v9.i104.i = add i32 %tmp0_v.i81.i, -21
  %17 = inttoptr i32 %tmp2_v9.i104.i to i8*
  store i8 0, i8* %17, align 1
  %tmp2_v10.i.i = add i32 %tmp0_v.i81.i, -45
  %18 = inttoptr i32 %tmp2_v10.i.i to i16*
  store i16 32, i16* %18, align 2
  %tmp2_v13.i.i = add i32 %tmp0_v.i81.i, -76
  %19 = inttoptr i32 %tmp2_v13.i.i to i32*
  store i32 %tmp2_v10.i.i, i32* %19, align 4
  %tmp2_v15.i.i = add i32 %tmp0_v.i81.i, -80
  %20 = inttoptr i32 %tmp2_v15.i.i to i32*
  store i32 %tmp2_v3.i98.i, i32* %20, align 16
  %tmp2_v16.i.i = add i32 %tmp0_v.i81.i, -84
  %21 = inttoptr i32 %tmp2_v16.i.i to i32*
  store i32 134517349, i32* %21, align 4
  %arg.i.i = load i32, i32* %20, align 16
  %arg2.i.i = load i32, i32* %19, align 4
  %22 = tail call i32 @strtok(i32 %arg.i.i, i32 %arg2.i.i)
  %mrv.i5 = insertvalue { i32, i32 } undef, i32 %tmp2_v15.i.i, 0
  %tmp2_v.i3.i = add i32 %tmp0_v.i81.i, -56
  %23 = inttoptr i32 %tmp2_v.i3.i to i32*
  store i32 %22, i32* %23, align 8
  %.not.i49.i12 = icmp eq i32 %22, 0
  br i1 %.not.i49.i12, label %BB_8049295.i, label %BB_804926D.i

BB_80492E2.i:                                     ; preds = %BB_80492AD.i, %BB_80492C1.i
  %24 = load i32, i32* %32, align 4
  %tmp0_v1.i13.i = add i32 %24, 1
  store i32 %tmp0_v1.i13.i, i32* %32, align 4
  %25 = icmp slt i32 %tmp0_v1.i13.i, 23
  br i1 %25, label %BB_804929E.i, label %.exit

BB_804926D.i:                                     ; preds = %BB_804926D.i, %0
  %r_esp.1.in15 = phi i32 [ %r_esp.1.in, %BB_804926D.i ], [ %tmp2_v15.i.i, %0 ]
  %.pn14 = phi i32 [ %31, %BB_804926D.i ], [ %22, %0 ]
  %.pn2.pn13 = phi { i32, i32 } [ %.pn2, %BB_804926D.i ], [ %mrv.i5, %0 ]
  %.pn2 = insertvalue { i32, i32 } %.pn2.pn13, i32 %.pn14, 1
  %26 = inttoptr i32 %r_esp.1.in15 to i32*
  store i32 %.pn14, i32* %26, align 4
  %tmp2_v3.i22.i = add i32 %r_esp.1.in15, -4
  %27 = inttoptr i32 %tmp2_v3.i22.i to i32*
  store i32 134517368, i32* %27, align 4
  %arg.i.i7 = load i32, i32* %26, align 4
  %28 = inttoptr i32 %arg.i.i7 to i8*
  %29 = tail call i32 @puts(i8* nonnull dereferenceable(1) %28)
  %tmp2_v2.i44.i = add i32 %r_esp.1.in15, 4
  %30 = inttoptr i32 %tmp2_v2.i44.i to i32*
  store i32 %tmp2_v10.i.i, i32* %30, align 4
  store i32 0, i32* %26, align 4
  store i32 134517385, i32* %27, align 4
  %arg.i.i8 = load i32, i32* %26, align 4
  %arg2.i.i9 = load i32, i32* %30, align 4
  %31 = tail call i32 @strtok(i32 %arg.i.i8, i32 %arg2.i.i9)
  store i32 %31, i32* %23, align 8
  %r_esp.1.in = extractvalue { i32, i32 } %.pn2.pn13, 0
  %.not.i49.i = icmp eq i32 %31, 0
  br i1 %.not.i49.i, label %BB_8049295.i, label %BB_804926D.i

BB_8049295.i:                                     ; preds = %BB_804926D.i, %0
  %.pn2.pn.lcssa = phi { i32, i32 } [ %mrv.i5, %0 ], [ %.pn2, %BB_804926D.i ]
  %r_esp.1.in.le = extractvalue { i32, i32 } %.pn2.pn.lcssa, 0
  %tmp2_v.i32.i = add i32 %tmp0_v.i81.i, -52
  %32 = inttoptr i32 %tmp2_v.i32.i to i32*
  store i32 0, i32* %32, align 4
  %tmp2_v6.i.i = add i32 %r_esp.1.in.le, 4
  %33 = inttoptr i32 %tmp2_v6.i.i to i32*
  %34 = inttoptr i32 %r_esp.1.in.le to i32*
  %tmp2_v9.i.i = add i32 %r_esp.1.in.le, -4
  %35 = inttoptr i32 %tmp2_v9.i.i to i32*
  br label %BB_804929E.i

BB_80492C1.i:                                     ; preds = %BB_804929E.i
  %tmp0_v4.i62.i = sext i8 %38 to i32
  store i32 %tmp0_v4.i62.i, i32* %33, align 4
  %spi.bis.399 = ptrtoint[4 x i8]* @str.bis.399 to i32
  store i32 %spi.bis.399, i32* %34, align 4
  store i32 134517471, i32* %35, align 4
  %36 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v.i80.i, i32 inreg noundef %tmp2_v3.i98.i, i32 noundef %r_esp.1.in.le, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  br label %BB_80492E2.i

BB_804929E.i:                                     ; preds = %BB_8049295.i, %BB_80492E2.i
  %storemerge16 = phi i32 [ 0, %BB_8049295.i ], [ %tmp0_v1.i13.i, %BB_80492E2.i ]
  %tmp0_v2.i69.i = add i32 %storemerge16, %tmp2_v3.i98.i
  %37 = inttoptr i32 %tmp0_v2.i69.i to i8*
  %38 = load i8, i8* %37, align 1
  %.not.i71.i = icmp eq i8 %38, 0
  br i1 %.not.i71.i, label %BB_80492AD.i, label %BB_80492C1.i

BB_80492AD.i:                                     ; preds = %BB_804929E.i
  %spi.bis.398 = ptrtoint[3 x i8]* @str.bis.398 to i32
  store i32 %spi.bis.398, i32* %34, align 4
  store i32 134517436, i32* %35, align 4
  %arg.i.i11 = load i32, i32* %34, align 4
  %39 = inttoptr i32 %arg.i.i11 to i8*
  %40 = tail call i32 @puts(i8* nonnull dereferenceable(1) %39)
  br label %BB_80492E2.i

.exit:                                            ; preds = %BB_80492E2.i
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
!12 = !{i32 0, i32 0, i32 0}
!13 = !{!"printf"}

  tail call fastcc void @strtok401 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack400, i32 0, i32 8092) to i32)) nounwind
