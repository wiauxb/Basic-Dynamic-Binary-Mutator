; Mutation 701
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack700 = internal global [8092 x i32] zeroinitializer, align 16
@segs.0 = internal unnamed_addr global i1 false
@df = internal unnamed_addr global i32 0
@_ZL6segmem = internal global [1024 x i8] zeroinitializer, align 1
@onUnfallback = common local_unnamed_addr global i1 false
@str.698 = constant [16 x i8] c"add instruction\00"
@str.699 = constant [21 x i8] c"subtract instruction\00"

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

; Function Attrs: nofree noinline nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr  nofree noinline nounwind 

; Function Attrs: norecurse
define internal fastcc void @token_pasting_operator701(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
  %tmp2_v.i59.i = add i32 %arg_esp, 4
  %tmp0_v.i60.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i62.i = add i32 %tmp0_v.i60.i, -4
  %3 = inttoptr i32 %tmp2_v3.i62.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i63.i = add i32 %tmp0_v.i60.i, -8
  %4 = inttoptr i32 %tmp2_v4.i63.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i65.i = add i32 %tmp0_v.i60.i, -12
  %5 = inttoptr i32 %tmp2_v5.i65.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i67.i = add i32 %tmp0_v.i60.i, -16
  %6 = inttoptr i32 %tmp2_v6.i67.i to i32*
  store i32 0, i32* %6, align 16
  %tmp2_v7.i69.i = add i32 %tmp0_v.i60.i, -20
  %7 = inttoptr i32 %tmp2_v7.i69.i to i32*
  store i32 0, i32* %7, align 4
  %tmp2_v8.i71.i = add i32 %tmp0_v.i60.i, -24
  %8 = inttoptr i32 %tmp2_v8.i71.i to i32*
  store i32 %tmp2_v.i59.i, i32* %8, align 8
  %tmp2_v10.i73.i = add i32 %tmp0_v.i60.i, -276
  %9 = inttoptr i32 %tmp2_v10.i73.i to i32*
  store i32 134517364, i32* %9, align 4
  %tmp4_v.i29.i.b = load i1, i1* @segs.0, align 1
  %10 = inttoptr i32 %arg_esp to i32*
  %11 = load i32, i32* %10, align 4
  %tmp2_v2.i.i = add i32 %tmp0_v.i60.i, -36
  %12 = inttoptr i32 %tmp2_v2.i.i to i32*
  store i32 %11, i32* %12, align 4
  %tmp2_v3.i33.i = add i32 %tmp0_v.i60.i, -46
  %13 = inttoptr i32 %tmp2_v3.i33.i to i32*
  store i32 543648066, i32* %13, align 4
  %tmp2_v4.i34.i = add i32 %tmp0_v.i60.i, -42
  %14 = inttoptr i32 %tmp2_v4.i34.i to i32*
  store i32 1819308097, i32* %14, align 4
  %tmp2_v5.i.i = add i32 %tmp0_v.i60.i, -38
  %15 = inttoptr i32 %tmp2_v5.i.i to i16*
  store i16 101, i16* %15, align 2
  %tmp2_v6.i.i = add i32 %tmp0_v.i60.i, -55
  %16 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 543648066, i32* %16, align 4
  %tmp2_v7.i35.i = add i32 %tmp0_v.i60.i, -51
  %17 = inttoptr i32 %tmp2_v7.i35.i to i32*
  store i32 1918985552, i32* %17, align 4
  %tmp2_v8.i36.i = add i32 %tmp0_v.i60.i, -47
  %18 = inttoptr i32 %tmp2_v8.i36.i to i8*
  store i8 0, i8* %18, align 1
  %tmp2_v11.i.i = add i32 %tmp0_v.i60.i, -288
  %19 = inttoptr i32 %tmp2_v11.i.i to i32*
  store i32 %tmp2_v3.i33.i, i32* %19, align 16
  %tmp2_v12.i.i = add i32 %tmp0_v.i60.i, -292
  %20 = inttoptr i32 %tmp2_v12.i.i to i32*
  store i32 134517431, i32* %20, align 4
  %arg.i.i = load i32, i32* %19, align 16
  %21 = inttoptr i32 %arg.i.i to i8*
  %22 = tail call i32 @puts(i8* nonnull dereferenceable(1) %21)
  store i32 %tmp2_v6.i.i, i32* %19, align 16
  store i32 134517446, i32* %20, align 4
  %arg.i.i7 = load i32, i32* %19, align 16
  %23 = inttoptr i32 %arg.i.i7 to i8*
  %24 = tail call i32 @puts(i8* nonnull dereferenceable(1) %23)
  %tmp2_v.i16.i = add i32 %tmp0_v.i60.i, -264
  br label %Func_80492DE.exit.i

BB_80492EC.i.lr.ph:                               ; preds = %Func_80492DE.exit.i
  %tmp2_v.i21.i = add i32 %tmp0_v.i60.i, -268
  %25 = inttoptr i32 %tmp2_v.i21.i to i32*
  store i32 0, i32* %25, align 4
  %tmp2_v7.i.i = add i32 %tmp0_v.i60.i, -284
  %26 = inttoptr i32 %tmp2_v7.i.i to i32*
  %tmp2_v.i6.i.i = add i32 %tmp0_v.i60.i, -280
  %27 = inttoptr i32 %tmp2_v.i6.i.i to i32*
  %tmp2_v2.i.i.i = add i32 %tmp0_v.i60.i, -304
  %28 = inttoptr i32 %tmp2_v2.i.i.i to i32*
  %tmp2_v3.i.i.i = add i32 %tmp0_v.i60.i, -308
  %29 = inttoptr i32 %tmp2_v3.i.i.i to i32*
  br label %BB_80492EC.i

Func_80492DE.exit.i:                              ; preds = %Func_80492DE.exit.i, %0
  %r_edi.031 = phi i32 [ %tmp2_v.i16.i, %0 ], [ %tmp4_v3.i.i, %Func_80492DE.exit.i ]
  %r_esi.030 = phi i32 [ 134529088, %0 ], [ %tmp4_v.i25.i, %Func_80492DE.exit.i ]
  %r_ecx.029 = phi i32 [ 52, %0 ], [ %tmp4_v5.i26.i, %Func_80492DE.exit.i ]
  %30 = inttoptr i32 %r_esi.030 to i32*
  %31 = load i32, i32* %30, align 4
  %32 = inttoptr i32 %r_edi.031 to i32*
  store i32 %31, i32* %32, align 4
  %tmp0_v1.i23.i = load i32, i32* @df, align 4
  %tmp0_v2.i24.i = shl i32 %tmp0_v1.i23.i, 2
  %tmp4_v.i25.i = add i32 %tmp0_v2.i24.i, %r_esi.030
  %tmp4_v3.i.i = add i32 %tmp0_v2.i24.i, %r_edi.031
  %tmp4_v5.i26.i = add nsw i32 %r_ecx.029, -1
  %.not.i.i = icmp eq i32 %tmp4_v5.i26.i, 0
  br i1 %.not.i.i, label %BB_80492EC.i.lr.ph, label %Func_80492DE.exit.i

BB_80492EC.i:                                     ; preds = %BB_80492EC.i, %BB_80492EC.i.lr.ph
  %33 = phi i32* [ %25, %BB_80492EC.i.lr.ph ], [ %41, %BB_80492EC.i ]
  %r_ebx.135 = phi i32 [ 134529024, %BB_80492EC.i.lr.ph ], [ %.pn26, %BB_80492EC.i ]
  %r_ebp.134 = phi i32 [ %tmp2_v4.i63.i, %BB_80492EC.i.lr.ph ], [ %.pn27, %BB_80492EC.i ]
  %r_ecx.233 = phi i32 [ 0, %BB_80492EC.i.lr.ph ], [ %tmp2_v4.i.i, %BB_80492EC.i ]
  store i32 10, i32* %19, align 16
  store i32 134517494, i32* %20, align 4
  %arg.i.i18 = load i32, i32* %19, align 16
  %34 = tail call i32 @putchar(i32 %arg.i.i18)  nounwind 
  %tmp2_v.i4.i = add i32 %r_ebp.134, -256
  %35 = load i32, i32* %33, align 4
  %tmp15_v3.i.i = mul i32 %35, 104
  %tmp0_v5.i.i = add i32 %tmp15_v3.i.i, %tmp2_v.i4.i
  store i32 %tmp0_v5.i.i, i32* %26, align 4
  %tmp2_v8.i.i = add i32 %r_ebx.135, -8147
  store i32 %tmp2_v8.i.i, i32* %19, align 16
  store i32 134517530, i32* %20, align 4
  %36 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.233, i32 inreg noundef %tmp2_v.i4.i, i32 noundef %tmp2_v11.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %37 = load i32, i32* %33, align 4
  %tmp15_v2.i.i = mul i32 %37, 104
  %tmp2_v4.i.i = add i32 %r_ebp.134, -24
  %tmp0_v5.i10.i = add i32 %r_ebp.134, -156
  %tmp0_v6.i11.i = add i32 %tmp0_v5.i10.i, %tmp15_v2.i.i
  %38 = inttoptr i32 %tmp0_v6.i11.i to i32*
  %39 = load i32, i32* %38, align 4
  store i32 134517556, i32* %9, align 4
  %switch6 = icmp eq i32 %39, 134517238
  %. = select i1 %switch6, i32 134517254, i32 134517301
  %spi.bis.698 = ptrtoint[16 x i8]* @str.698 to i32
  %spi.bis.699 = ptrtoint[21 x i8]* @str.699 to i32
  %.39 = select i1 %switch6, i32 %spi.bis.698, i32 %spi.bis.699
  %.40 = select i1 %switch6, i32 134517276, i32 134517323
  store i32 %r_ebp.134, i32* %27, align 8
  store i32 %r_ebx.135, i32* %26, align 4
  store i32 %., i32* %20, align 4
  store i32 %.39, i32* %28, align 16
  store i32 %.40, i32* %29, align 4
  %40 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %tmp2_v4.i.i, i32 inreg noundef %.39, i32 noundef %tmp2_v2.i.i.i, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" 
  %.pn26 = load i32, i32* %26, align 4
  %.pn27 = load i32, i32* %27, align 8
  %tmp2_v.i40.i = add i32 %.pn27, -260
  %41 = inttoptr i32 %tmp2_v.i40.i to i32*
  %42 = load i32, i32* %41, align 4
  %tmp0_v1.i42.i = add i32 %42, 1
  store i32 %tmp0_v1.i42.i, i32* %41, align 4
  %43 = icmp slt i32 %tmp0_v1.i42.i, 2
  br i1 %43, label %BB_80492EC.i, label %.exit

.exit:                                            ; preds = %BB_80492EC.i
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
!12 = !{i32 0, i32 0, i32 0, i32 0, i32 0}
!13 = !{!"printf"}

  tail call fastcc void @token_pasting_operator701 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack700, i32 0, i32 8092) to i32)) nounwind
