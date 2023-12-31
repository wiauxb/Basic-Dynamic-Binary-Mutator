; Mutation 503
; ModuleID = 'optimized.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@fpstt = internal unnamed_addr global i32 0
@fp_status.0 = internal unnamed_addr global i8 0
@stack502 = internal global [8092 x i32] zeroinitializer, align 16
@onUnfallback = common local_unnamed_addr global i1 false
@str.bis.499 = constant [6 x i8] c"\25\30\32\64\20\00"
@str.bis.500 = constant [6 x i8] c"\25\30\32\64\20\00"
@str.bis.501 = constant [6 x i8] c"\25\30\32\64\20\00"

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

; Function Attrs: noinline
declare i32 @malloc(i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare i32 @realloc(i32, i32) local_unnamed_addr  noinline 

; Function Attrs: noinline
declare void @free(i32) local_unnamed_addr  noinline 

; Function Attrs: norecurse
define internal fastcc void @increase_size_dynamic_2d_array503(i32 %arg_esp) unnamed_addr  norecurse  !retregs !12 {
  %tmp2_v.i449.i = add i32 %arg_esp, 4
  %tmp0_v.i450.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i452.i = add i32 %tmp0_v.i450.i, -4
  %3 = inttoptr i32 %tmp2_v3.i452.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i453.i = add i32 %tmp0_v.i450.i, -8
  %4 = inttoptr i32 %tmp2_v4.i453.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i455.i = add i32 %tmp0_v.i450.i, -12
  %5 = inttoptr i32 %tmp2_v5.i455.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i457.i = add i32 %tmp0_v.i450.i, -16
  %6 = inttoptr i32 %tmp2_v6.i457.i to i32*
  store i32 0, i32* %6, align 16
  %tmp2_v7.i459.i = add i32 %tmp0_v.i450.i, -20
  %7 = inttoptr i32 %tmp2_v7.i459.i to i32*
  store i32 %tmp2_v.i449.i, i32* %7, align 4
  %tmp2_v9.i461.i = add i32 %tmp0_v.i450.i, -116
  %8 = inttoptr i32 %tmp2_v9.i461.i to i32*
  store i32 134517298, i32* %8, align 4
  %tmp2_v.i196.i = add i32 %tmp0_v.i450.i, -48
  %9 = inttoptr i32 %tmp2_v.i196.i to i32*
  store i32 4, i32* %9, align 16
  %tmp2_v1.i197.i = add i32 %tmp0_v.i450.i, -44
  %10 = inttoptr i32 %tmp2_v1.i197.i to i32*
  store i32 4, i32* %10, align 4
  %tmp2_v6.i203.i = add i32 %tmp0_v.i450.i, -128
  %11 = inttoptr i32 %tmp2_v6.i203.i to i32*
  store i32 16, i32* %11, align 16
  %tmp2_v7.i.i = add i32 %tmp0_v.i450.i, -132
  %12 = inttoptr i32 %tmp2_v7.i.i to i32*
  store i32 134517333, i32* %12, align 4
  %arg.i.i = load i32, i32* %11, align 16
  %13 = tail call i32 @malloc(i32 %arg.i.i)
  %mrv.i42 = insertvalue { i32, i32 } undef, i32 %tmp2_v6.i203.i, 0
  %tmp2_v.i315.i = add i32 %tmp0_v.i450.i, -40
  %14 = inttoptr i32 %tmp2_v.i315.i to i32*
  store i32 %13, i32* %14, align 8
  %tmp2_v1.i317.i = add i32 %tmp0_v.i450.i, -112
  %15 = inttoptr i32 %tmp2_v1.i317.i to i32*
  store i32 0, i32* %15, align 16
  %16 = load i32, i32* %10, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %BB_8049264.i, label %BB_8049294.i

BB_804957E.i:                                     ; preds = %BB_8049544.i, %BB_804953B.i
  store i32 10, i32* %103, align 4
  store i32 134518152, i32* %104, align 4
  %arg.i.i44 = load i32, i32* %103, align 4
  %18 = tail call i32 @putchar(i32 %arg.i.i44)  nounwind 
  %19 = load i32, i32* %98, align 4
  %tmp0_v2.i371.i = add i32 %19, 1
  store i32 %tmp0_v2.i371.i, i32* %98, align 4
  %20 = load i32, i32* %10, align 4
  %21 = icmp slt i32 %tmp0_v2.i371.i, %20
  br i1 %21, label %BB_804953B.i, label %BB_8049597.i

BB_8049454.i:                                     ; preds = %BB_8049411.i, %BB_804941A.i
  store i32 10, i32* %.pre-phi, align 4
  store i32 134517854, i32* %.pre-phi97, align 4
  %arg.i.i45 = load i32, i32* %.pre-phi, align 4
  %22 = tail call i32 @putchar(i32 %arg.i.i45)  nounwind 
  %23 = load i32, i32* %175, align 16
  %tmp0_v2.i78.i = add i32 %23, 1
  store i32 %tmp0_v2.i78.i, i32* %175, align 16
  %24 = load i32, i32* %10, align 4
  %25 = icmp slt i32 %tmp0_v2.i78.i, %24
  br i1 %25, label %BB_8049411.i, label %BB_804946D.i

BB_8049264.i:                                     ; preds = %BB_8049264.i, %0
  %r_esp.8.in68 = phi i32 [ %r_esp.8.in, %BB_8049264.i ], [ %tmp2_v6.i203.i, %0 ]
  %.pn6367 = phi i32 [ %30, %BB_8049264.i ], [ %13, %0 ]
  %.pn.pn66 = phi { i32, i32 } [ %.pn, %BB_8049264.i ], [ %mrv.i42, %0 ]
  %storemerge2665 = phi i32 [ %tmp0_v2.i66.i, %BB_8049264.i ], [ 0, %0 ]
  %.pn = insertvalue { i32, i32 } %.pn.pn66, i32 %.pn6367, 1
  %26 = load i32, i32* %9, align 16
  %tmp0_v1.i.i = shl i32 %26, 2
  %tmp4_v.i.i = shl i32 %storemerge2665, 2
  %27 = load i32, i32* %14, align 8
  %tmp2_v6.i.i = add i32 %27, %tmp4_v.i.i
  %28 = inttoptr i32 %r_esp.8.in68 to i32*
  store i32 %tmp0_v1.i.i, i32* %28, align 4
  %tmp2_v9.i.i = add i32 %r_esp.8.in68, -4
  %29 = inttoptr i32 %tmp2_v9.i.i to i32*
  store i32 134517379, i32* %29, align 4
  %arg.i.i46 = load i32, i32* %28, align 4
  %30 = tail call i32 @malloc(i32 %arg.i.i46)
  %31 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %30, i32* %31, align 4
  %32 = load i32, i32* %15, align 16
  %tmp0_v2.i66.i = add i32 %32, 1
  store i32 %tmp0_v2.i66.i, i32* %15, align 16
  %r_esp.8.in = extractvalue { i32, i32 } %.pn.pn66, 0
  %33 = load i32, i32* %10, align 4
  %34 = icmp slt i32 %tmp0_v2.i66.i, %33
  br i1 %34, label %BB_8049264.i, label %BB_8049294.i

BB_80493C2.i:                                     ; preds = %BB_80493B9.i, %BB_80493C2.i
  %storemerge2277 = phi i32 [ %tmp0_v19.i.i, %BB_80493C2.i ], [ 0, %BB_80493B9.i ]
  %35 = load i32, i32* %138, align 8
  %tmp0_v3.i46.i = mul i32 %35, 10
  %tmp4_v.i49.i = shl i32 %35, 2
  %36 = load i32, i32* %14, align 8
  %tmp0_v8.i.i = add i32 %36, %tmp4_v.i49.i
  %37 = inttoptr i32 %tmp0_v8.i.i to i32*
  %38 = load i32, i32* %37, align 4
  %tmp0_v12.i.i = shl i32 %storemerge2277, 2
  %tmp0_v13.i.i = add i32 %38, %tmp0_v12.i.i
  %tmp0_v16.i.i = add i32 %tmp0_v3.i46.i, %storemerge2277
  %39 = inttoptr i32 %tmp0_v13.i.i to i32*
  store i32 %tmp0_v16.i.i, i32* %39, align 4
  %40 = load i32, i32* %141, align 4
  %tmp0_v19.i.i = add i32 %40, 1
  store i32 %tmp0_v19.i.i, i32* %141, align 4
  %41 = load i32, i32* %9, align 16
  %42 = icmp slt i32 %tmp0_v19.i.i, %41
  br i1 %42, label %BB_80493C2.i, label %BB_80493FC.i

BB_804953B.i:                                     ; preds = %BB_804953B.i.lr.ph, %BB_804957E.i
  store i32 0, i32* %101, align 8
  %43 = load i32, i32* %9, align 16
  %44 = icmp sgt i32 %43, 0
  br i1 %44, label %BB_8049544.i, label %BB_804957E.i

BB_80492F5.i:                                     ; preds = %BB_80492F5.i.lr.ph, %BB_8049338.i
  store i32 0, i32* %171, align 16
  %45 = load i32, i32* %9, align 16
  %46 = icmp sgt i32 %45, 0
  br i1 %46, label %BB_80492FE.i, label %BB_8049338.i

BB_80494DA.i.loopexit:                            ; preds = %BB_80494AA.i
  %.pre = extractvalue { i32, i32 } %.pn13.pn83, 0
  br label %BB_80494DA.i

BB_80494DA.i:                                     ; preds = %BB_804946D.i, %BB_80494DA.i.loopexit
  %r_esp.6.in.le.pre-phi = phi i32 [ %.pre, %BB_80494DA.i.loopexit ], [ %r_esp.8.in.le, %BB_804946D.i ]
  %r_ecx.5.lcssa = phi i32 [ %tmp4_v.i421.i, %BB_80494DA.i.loopexit ], [ %r_ecx.3.lcssa, %BB_804946D.i ]
  %tmp2_v.i60.i = add i32 %tmp0_v.i450.i, -68
  %47 = inttoptr i32 %tmp2_v.i60.i to i32*
  store i32 0, i32* %47, align 4
  %48 = load i32, i32* %10, align 4
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %BB_80494E3.i.lr.ph, label %BB_8049532.i

BB_80494E3.i.lr.ph:                               ; preds = %BB_80494DA.i
  %tmp2_v.i447.i = add i32 %tmp0_v.i450.i, -64
  %50 = inttoptr i32 %tmp2_v.i447.i to i32*
  br label %BB_80494E3.i

BB_80492FE.i:                                     ; preds = %BB_80492FE.i, %BB_80492F5.i
  %storemerge2474 = phi i32 [ %tmp0_v2.i256.i, %BB_80492FE.i ], [ 0, %BB_80492F5.i ]
  %51 = load i32, i32* %168, align 4
  %tmp4_v.i92.i = shl i32 %51, 2
  %52 = load i32, i32* %14, align 8
  %tmp0_v3.i95.i = add i32 %52, %tmp4_v.i92.i
  %53 = inttoptr i32 %tmp0_v3.i95.i to i32*
  %54 = load i32, i32* %53, align 4
  %tmp0_v7.i98.i = shl i32 %storemerge2474, 2
  %tmp0_v8.i99.i = add i32 %54, %tmp0_v7.i98.i
  %55 = inttoptr i32 %tmp0_v8.i99.i to i32*
  %56 = load i32, i32* %55, align 4
  store i32 %56, i32* %172, align 4
  %spi.bis.501 = ptrtoint[6 x i8]* @str.bis.501 to i32
  store i32 %spi.bis.501, i32* %173, align 4
  store i32 134517545, i32* %174, align 4
  %57 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.4.lcssa, i32 inreg noundef %tmp0_v7.i98.i, i32 noundef %r_esp.8.in.le, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %58 = load i32, i32* %171, align 16
  %tmp0_v2.i256.i = add i32 %58, 1
  store i32 %tmp0_v2.i256.i, i32* %171, align 16
  %59 = load i32, i32* %9, align 16
  %60 = icmp slt i32 %tmp0_v2.i256.i, %59
  br i1 %60, label %BB_80492FE.i, label %BB_8049338.i

BB_804941A.i:                                     ; preds = %BB_8049411.i, %BB_804941A.i
  %storemerge2081 = phi i32 [ %tmp0_v2.i530.i, %BB_804941A.i ], [ 0, %BB_8049411.i ]
  %61 = load i32, i32* %175, align 16
  %tmp4_v.i106.i = shl i32 %61, 2
  %62 = load i32, i32* %14, align 8
  %tmp0_v3.i109.i = add i32 %62, %tmp4_v.i106.i
  %63 = inttoptr i32 %tmp0_v3.i109.i to i32*
  %64 = load i32, i32* %63, align 4
  %tmp0_v7.i113.i = shl i32 %storemerge2081, 2
  %tmp0_v8.i114.i = add i32 %64, %tmp0_v7.i113.i
  %65 = inttoptr i32 %tmp0_v8.i114.i to i32*
  %66 = load i32, i32* %65, align 4
  store i32 %66, i32* %179, align 4
  %spi.bis.500 = ptrtoint[6 x i8]* @str.bis.500 to i32
  store i32 %spi.bis.500, i32* %.pre-phi, align 4
  store i32 134517829, i32* %.pre-phi97, align 4
  %67 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.3.lcssa, i32 inreg noundef %tmp0_v7.i113.i, i32 noundef %r_esp.8.in.le, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %68 = load i32, i32* %178, align 4
  %tmp0_v2.i530.i = add i32 %68, 1
  store i32 %tmp0_v2.i530.i, i32* %178, align 4
  %69 = load i32, i32* %9, align 16
  %70 = icmp slt i32 %tmp0_v2.i530.i, %69
  br i1 %70, label %BB_804941A.i, label %BB_8049454.i

BB_804936B.i:                                     ; preds = %BB_804936B.i.lr.ph, %BB_804936B.i
  %storemerge1275 = phi i32 [ 0, %BB_804936B.i.lr.ph ], [ %tmp0_v2.i511.i, %BB_804936B.i ]
  %71 = load i32, i32* %9, align 16
  %tmp4_v.i126.i = shl i32 %71, 2
  %tmp4_v3.i.i = shl i32 %storemerge1275, 2
  %72 = load i32, i32* %14, align 8
  %tmp0_v6.i131.i = add i32 %72, %tmp4_v3.i.i
  %73 = inttoptr i32 %tmp0_v6.i131.i to i32*
  %74 = load i32, i32* %73, align 4
  store i32 %tmp4_v.i126.i, i32* %118, align 4
  store i32 %74, i32* %.pre-phi, align 4
  store i32 134517663, i32* %.pre-phi97, align 4
  %arg.i.i48 = load i32, i32* %.pre-phi, align 4
  %arg2.i.i = load i32, i32* %118, align 4
  %75 = tail call i32 @realloc(i32 %arg.i.i48, i32 %arg2.i.i)
  store i32 %75, i32* %73, align 4
  %76 = load i32, i32* %115, align 4
  %tmp0_v2.i511.i = add i32 %76, 1
  store i32 %tmp0_v2.i511.i, i32* %115, align 4
  %77 = load i32, i32* %10, align 4
  %78 = icmp slt i32 %tmp0_v2.i511.i, %77
  br i1 %78, label %BB_804936B.i, label %BB_80493B0.i

BB_804946D.i:                                     ; preds = %BB_8049408.i.BB_804946D.i_crit_edge, %BB_8049454.i
  %.pre-phi100 = phi i32* [ %.pre99, %BB_8049408.i.BB_804946D.i_crit_edge ], [ %179, %BB_8049454.i ]
  store i32 10, i32* %.pre-phi, align 4
  store i32 134517879, i32* %.pre-phi97, align 4
  %arg.i.i51 = load i32, i32* %.pre-phi, align 4
  %79 = tail call i32 @putchar(i32 %arg.i.i51)  nounwind 
  %tmp2_v.i170.i = add i32 %tmp0_v.i450.i, -36
  %80 = inttoptr i32 %tmp2_v.i170.i to i32*
  store i32 3, i32* %80, align 4
  %81 = load i32, i32* %10, align 4
  %tmp0_v5.i175.i = add i32 %81, 3
  store i32 %tmp0_v5.i175.i, i32* %10, align 4
  %tmp0_v8.i178.i = shl i32 %tmp0_v5.i175.i, 2
  store i32 %tmp0_v8.i178.i, i32* %.pre-phi100, align 4
  %82 = load i32, i32* %14, align 8
  store i32 %82, i32* %.pre-phi, align 4
  store i32 134517913, i32* %.pre-phi97, align 4
  %arg.i.i52 = load i32, i32* %.pre-phi, align 4
  %arg2.i.i53 = load i32, i32* %.pre-phi100, align 4
  %83 = tail call i32 @realloc(i32 %arg.i.i52, i32 %arg2.i.i53)
  store i32 %83, i32* %14, align 8
  %84 = load i32, i32* %10, align 4
  %85 = load i32, i32* %80, align 4
  %tmp0_v4.i242.i = sub i32 %84, %85
  %tmp2_v5.i243.i = add i32 %tmp0_v.i450.i, -72
  %86 = inttoptr i32 %tmp2_v5.i243.i to i32*
  store i32 %tmp0_v4.i242.i, i32* %86, align 8
  %87 = load i32, i32* %10, align 4
  %88 = icmp slt i32 %tmp0_v4.i242.i, %87
  br i1 %88, label %BB_80494AA.i, label %BB_80494DA.i

BB_8049526.i:                                     ; preds = %BB_80494E3.i, %BB_80494EC.i
  %r_ecx.2.lcssa = phi i32 [ %r_ecx.690, %BB_80494E3.i ], [ %tmp0_v3.i323.i, %BB_80494EC.i ]
  %89 = load i32, i32* %47, align 4
  %tmp0_v1.i147.i = add i32 %89, 1
  store i32 %tmp0_v1.i147.i, i32* %47, align 4
  %90 = load i32, i32* %10, align 4
  %91 = icmp slt i32 %tmp0_v1.i147.i, %90
  br i1 %91, label %BB_80494E3.i, label %BB_8049532.i

BB_80493B9.i:                                     ; preds = %BB_80493B9.i.lr.ph, %BB_80493FC.i
  %r_ecx.379 = phi i32 [ %r_ecx.7.lcssa, %BB_80493B9.i.lr.ph ], [ %r_ecx.0.lcssa, %BB_80493FC.i ]
  store i32 0, i32* %141, align 4
  %92 = load i32, i32* %9, align 16
  %93 = icmp sgt i32 %92, 0
  br i1 %93, label %BB_80493C2.i, label %BB_80493FC.i

BB_8049597.i:                                     ; preds = %BB_8049532.i.BB_8049597.i_crit_edge, %BB_804957E.i
  %.pre-phi105 = phi i32* [ %.pre104, %BB_8049532.i.BB_8049597.i_crit_edge ], [ %104, %BB_804957E.i ]
  %.pre-phi102 = phi i32* [ %.pre101, %BB_8049532.i.BB_8049597.i_crit_edge ], [ %103, %BB_804957E.i ]
  store i32 10, i32* %.pre-phi102, align 4
  store i32 134518177, i32* %.pre-phi105, align 4
  %arg.i.i56 = load i32, i32* %.pre-phi102, align 4
  %94 = tail call i32 @putchar(i32 %arg.i.i56)  nounwind 
  %tmp2_v.i88.i = add i32 %tmp0_v.i450.i, -52
  %95 = inttoptr i32 %tmp2_v.i88.i to i32*
  store i32 0, i32* %95, align 4
  %96 = load i32, i32* %10, align 4
  %97 = icmp sgt i32 %96, 0
  br i1 %97, label %BB_80495AD.i, label %.exit

BB_8049532.i:                                     ; preds = %BB_8049526.i, %BB_80494DA.i
  %r_ecx.6.lcssa = phi i32 [ %r_ecx.5.lcssa, %BB_80494DA.i ], [ %r_ecx.2.lcssa, %BB_8049526.i ]
  %tmp2_v.i192.i = add i32 %tmp0_v.i450.i, -60
  %98 = inttoptr i32 %tmp2_v.i192.i to i32*
  store i32 0, i32* %98, align 4
  %99 = load i32, i32* %10, align 4
  %100 = icmp sgt i32 %99, 0
  br i1 %100, label %BB_804953B.i.lr.ph, label %BB_8049532.i.BB_8049597.i_crit_edge

BB_8049532.i.BB_8049597.i_crit_edge:              ; preds = %BB_8049532.i
  %.pre101 = inttoptr i32 %r_esp.6.in.le.pre-phi to i32*
  %.pre103 = add i32 %r_esp.6.in.le.pre-phi, -4
  %.pre104 = inttoptr i32 %.pre103 to i32*
  br label %BB_8049597.i

BB_804953B.i.lr.ph:                               ; preds = %BB_8049532.i
  %tmp2_v.i56.i = add i32 %tmp0_v.i450.i, -56
  %101 = inttoptr i32 %tmp2_v.i56.i to i32*
  %tmp2_v11.i400.i = add i32 %r_esp.6.in.le.pre-phi, 4
  %102 = inttoptr i32 %tmp2_v11.i400.i to i32*
  %103 = inttoptr i32 %r_esp.6.in.le.pre-phi to i32*
  %tmp2_v14.i404.i = add i32 %r_esp.6.in.le.pre-phi, -4
  %104 = inttoptr i32 %tmp2_v14.i404.i to i32*
  br label %BB_804953B.i

BB_8049338.i:                                     ; preds = %BB_80492FE.i, %BB_80492F5.i
  store i32 10, i32* %173, align 4
  store i32 134517570, i32* %174, align 4
  %arg.i.i57 = load i32, i32* %173, align 4
  %105 = tail call i32 @putchar(i32 %arg.i.i57)  nounwind 
  %106 = load i32, i32* %168, align 4
  %tmp0_v2.i497.i = add i32 %106, 1
  store i32 %tmp0_v2.i497.i, i32* %168, align 4
  %107 = load i32, i32* %10, align 4
  %108 = icmp slt i32 %tmp0_v2.i497.i, %107
  br i1 %108, label %BB_80492F5.i, label %BB_8049351.i

BB_8049294.i:                                     ; preds = %BB_8049264.i, %0
  %.pn.pn.lcssa = phi { i32, i32 } [ %mrv.i42, %0 ], [ %.pn, %BB_8049264.i ]
  %r_ecx.8.lcssa = phi i32 [ %tmp2_v.i449.i, %0 ], [ %tmp4_v.i.i, %BB_8049264.i ]
  %r_esp.8.in.le = extractvalue { i32, i32 } %.pn.pn.lcssa, 0
  %tmp2_v.i216.i = add i32 %tmp0_v.i450.i, -108
  %109 = inttoptr i32 %tmp2_v.i216.i to i32*
  store i32 0, i32* %109, align 4
  %110 = load i32, i32* %10, align 4
  %111 = icmp sgt i32 %110, 0
  br i1 %111, label %BB_804929D.i.lr.ph, label %BB_80492EC.i

BB_804929D.i.lr.ph:                               ; preds = %BB_8049294.i
  %tmp2_v.i413.i = add i32 %tmp0_v.i450.i, -104
  %112 = inttoptr i32 %tmp2_v.i413.i to i32*
  br label %BB_804929D.i

BB_8049351.i:                                     ; preds = %BB_80492EC.i.BB_8049351.i_crit_edge, %BB_8049338.i
  %.pre-phi97 = phi i32* [ %.pre96, %BB_80492EC.i.BB_8049351.i_crit_edge ], [ %174, %BB_8049338.i ]
  %.pre-phi = phi i32* [ %.pre94, %BB_80492EC.i.BB_8049351.i_crit_edge ], [ %173, %BB_8049338.i ]
  store i32 10, i32* %.pre-phi, align 4
  store i32 134517595, i32* %.pre-phi97, align 4
  %arg.i.i58 = load i32, i32* %.pre-phi, align 4
  %113 = tail call i32 @putchar(i32 %arg.i.i58)  nounwind 
  %114 = load i32, i32* %9, align 16
  %tmp0_v2.i303.i = add i32 %114, 3
  store i32 %tmp0_v2.i303.i, i32* %9, align 16
  %tmp2_v3.i304.i = add i32 %tmp0_v.i450.i, -92
  %115 = inttoptr i32 %tmp2_v3.i304.i to i32*
  store i32 0, i32* %115, align 4
  %116 = load i32, i32* %10, align 4
  %117 = icmp sgt i32 %116, 0
  br i1 %117, label %BB_804936B.i.lr.ph, label %BB_80493B0.i

BB_804936B.i.lr.ph:                               ; preds = %BB_8049351.i
  %tmp2_v15.i.i = add i32 %r_esp.8.in.le, 4
  %118 = inttoptr i32 %tmp2_v15.i.i to i32*
  br label %BB_804936B.i

BB_80495AD.i:                                     ; preds = %BB_80495AD.i, %BB_8049597.i
  %storemerge1693 = phi i32 [ %tmp0_v2.i483.i, %BB_80495AD.i ], [ 0, %BB_8049597.i ]
  %tmp4_v.i224.i = shl i32 %storemerge1693, 2
  %119 = load i32, i32* %14, align 8
  %tmp0_v3.i227.i = add i32 %119, %tmp4_v.i224.i
  %120 = inttoptr i32 %tmp0_v3.i227.i to i32*
  %121 = load i32, i32* %120, align 4
  store i32 %121, i32* %.pre-phi102, align 4
  store i32 134518215, i32* %.pre-phi105, align 4
  %arg.i.i59 = load i32, i32* %.pre-phi102, align 4
  tail call void @free(i32 %arg.i.i59)
  %122 = load i32, i32* %95, align 4
  %tmp0_v2.i483.i = add i32 %122, 1
  store i32 %tmp0_v2.i483.i, i32* %95, align 4
  %123 = load i32, i32* %10, align 4
  %124 = icmp slt i32 %tmp0_v2.i483.i, %123
  br i1 %124, label %BB_80495AD.i, label %.exit

BB_8049411.i:                                     ; preds = %BB_8049411.i.lr.ph, %BB_8049454.i
  store i32 0, i32* %178, align 4
  %125 = load i32, i32* %9, align 16
  %126 = icmp sgt i32 %125, 0
  br i1 %126, label %BB_804941A.i, label %BB_8049454.i

BB_80494EC.i:                                     ; preds = %BB_80494E3.i, %BB_80494EC.i
  %storemerge1888 = phi i32 [ %tmp0_v19.i340.i, %BB_80494EC.i ], [ 0, %BB_80494E3.i ]
  %127 = load i32, i32* %47, align 4
  %tmp0_v3.i323.i = mul i32 %127, 10
  %tmp4_v.i326.i = shl i32 %127, 2
  %128 = load i32, i32* %14, align 8
  %tmp0_v8.i329.i = add i32 %128, %tmp4_v.i326.i
  %129 = inttoptr i32 %tmp0_v8.i329.i to i32*
  %130 = load i32, i32* %129, align 4
  %tmp0_v12.i333.i = shl i32 %storemerge1888, 2
  %tmp0_v13.i334.i = add i32 %130, %tmp0_v12.i333.i
  %tmp0_v16.i337.i = add i32 %tmp0_v3.i323.i, %storemerge1888
  %131 = inttoptr i32 %tmp0_v13.i334.i to i32*
  store i32 %tmp0_v16.i337.i, i32* %131, align 4
  %132 = load i32, i32* %50, align 16
  %tmp0_v19.i340.i = add i32 %132, 1
  store i32 %tmp0_v19.i340.i, i32* %50, align 16
  %133 = load i32, i32* %9, align 16
  %134 = icmp slt i32 %tmp0_v19.i340.i, %133
  br i1 %134, label %BB_80494EC.i, label %BB_8049526.i

BB_80493FC.i:                                     ; preds = %BB_80493B9.i, %BB_80493C2.i
  %r_ecx.0.lcssa = phi i32 [ %r_ecx.379, %BB_80493B9.i ], [ %tmp0_v3.i46.i, %BB_80493C2.i ]
  %135 = load i32, i32* %138, align 8
  %tmp0_v1.i357.i = add i32 %135, 1
  store i32 %tmp0_v1.i357.i, i32* %138, align 8
  %136 = load i32, i32* %10, align 4
  %137 = icmp slt i32 %tmp0_v1.i357.i, %136
  br i1 %137, label %BB_80493B9.i, label %BB_8049408.i

BB_80493B0.i:                                     ; preds = %BB_8049351.i, %BB_804936B.i
  %r_ecx.7.lcssa = phi i32 [ %r_ecx.4.lcssa, %BB_8049351.i ], [ %72, %BB_804936B.i ]
  %tmp2_v.i365.i = add i32 %tmp0_v.i450.i, -88
  %138 = inttoptr i32 %tmp2_v.i365.i to i32*
  store i32 0, i32* %138, align 8
  %139 = load i32, i32* %10, align 4
  %140 = icmp sgt i32 %139, 0
  br i1 %140, label %BB_80493B9.i.lr.ph, label %BB_8049408.i

BB_80493B9.i.lr.ph:                               ; preds = %BB_80493B0.i
  %tmp2_v.i155.i = add i32 %tmp0_v.i450.i, -84
  %141 = inttoptr i32 %tmp2_v.i155.i to i32*
  br label %BB_80493B9.i

BB_8049544.i:                                     ; preds = %BB_8049544.i, %BB_804953B.i
  %storemerge1792 = phi i32 [ %tmp0_v2.i.i, %BB_8049544.i ], [ 0, %BB_804953B.i ]
  %142 = load i32, i32* %98, align 4
  %tmp4_v.i388.i = shl i32 %142, 2
  %143 = load i32, i32* %14, align 8
  %tmp0_v3.i391.i = add i32 %143, %tmp4_v.i388.i
  %144 = inttoptr i32 %tmp0_v3.i391.i to i32*
  %145 = load i32, i32* %144, align 4
  %tmp0_v7.i395.i = shl i32 %storemerge1792, 2
  %tmp0_v8.i396.i = add i32 %145, %tmp0_v7.i395.i
  %146 = inttoptr i32 %tmp0_v8.i396.i to i32*
  %147 = load i32, i32* %146, align 4
  store i32 %147, i32* %102, align 4
  %spi.bis.499 = ptrtoint[6 x i8]* @str.bis.499 to i32
  store i32 %spi.bis.499, i32* %103, align 4
  store i32 134518127, i32* %104, align 4
  %148 = tail call x86_fastcallcc i64 @helper_stub_trampoline(i32 inreg noundef %r_ecx.6.lcssa, i32 inreg noundef %tmp0_v7.i395.i, i32 noundef %r_esp.6.in.le.pre-phi, i32 noundef ptrtoint (i32 (i8*, ...)* @printf to i32))  nobuiltin nounwind "no-builtins" , !funcname !13
  %149 = load i32, i32* %101, align 8
  %tmp0_v2.i.i = add i32 %149, 1
  store i32 %tmp0_v2.i.i, i32* %101, align 8
  %150 = load i32, i32* %9, align 16
  %151 = icmp slt i32 %tmp0_v2.i.i, %150
  br i1 %151, label %BB_8049544.i, label %BB_804957E.i

BB_804929D.i:                                     ; preds = %BB_80492E0.i, %BB_804929D.i.lr.ph
  %r_ecx.472 = phi i32 [ %r_ecx.8.lcssa, %BB_804929D.i.lr.ph ], [ %r_ecx.1.lcssa, %BB_80492E0.i ]
  store i32 0, i32* %112, align 8
  %152 = load i32, i32* %9, align 16
  %153 = icmp sgt i32 %152, 0
  br i1 %153, label %BB_80492A6.i, label %BB_80492E0.i

BB_80494AA.i:                                     ; preds = %BB_80494AA.i, %BB_804946D.i
  %r_esp.6.in85 = phi i32 [ %r_esp.6.in, %BB_80494AA.i ], [ %r_esp.8.in.le, %BB_804946D.i ]
  %.pn6484 = phi i32 [ %158, %BB_80494AA.i ], [ %83, %BB_804946D.i ]
  %.pn13.pn83 = phi { i32, i32 } [ %.pn13, %BB_80494AA.i ], [ %.pn.pn.lcssa, %BB_804946D.i ]
  %storemerge1982 = phi i32 [ %tmp0_v2.i471.i, %BB_80494AA.i ], [ %tmp0_v4.i242.i, %BB_804946D.i ]
  %.pn13 = insertvalue { i32, i32 } %.pn13.pn83, i32 %.pn6484, 1
  %154 = load i32, i32* %9, align 16
  %tmp0_v1.i418.i = shl i32 %154, 2
  %tmp4_v.i421.i = shl i32 %storemerge1982, 2
  %155 = load i32, i32* %14, align 8
  %tmp2_v6.i424.i = add i32 %155, %tmp4_v.i421.i
  %156 = inttoptr i32 %r_esp.6.in85 to i32*
  store i32 %tmp0_v1.i418.i, i32* %156, align 4
  %tmp2_v9.i428.i = add i32 %r_esp.6.in85, -4
  %157 = inttoptr i32 %tmp2_v9.i428.i to i32*
  store i32 134517961, i32* %157, align 4
  %arg.i.i60 = load i32, i32* %156, align 4
  %158 = tail call i32 @malloc(i32 %arg.i.i60)
  %159 = inttoptr i32 %tmp2_v6.i424.i to i32*
  store i32 %158, i32* %159, align 4
  %160 = load i32, i32* %86, align 8
  %tmp0_v2.i471.i = add i32 %160, 1
  store i32 %tmp0_v2.i471.i, i32* %86, align 8
  %r_esp.6.in = extractvalue { i32, i32 } %.pn13.pn83, 0
  %161 = load i32, i32* %10, align 4
  %162 = icmp slt i32 %tmp0_v2.i471.i, %161
  br i1 %162, label %BB_80494AA.i, label %BB_80494DA.i.loopexit

BB_80492E0.i:                                     ; preds = %BB_80492A6.i, %BB_804929D.i
  %r_ecx.1.lcssa = phi i32 [ %r_ecx.472, %BB_804929D.i ], [ %tmp0_v3.i542.i, %BB_80492A6.i ]
  %163 = load i32, i32* %109, align 4
  %tmp0_v1.i432.i = add i32 %163, 1
  store i32 %tmp0_v1.i432.i, i32* %109, align 4
  %164 = load i32, i32* %10, align 4
  %165 = icmp slt i32 %tmp0_v1.i432.i, %164
  br i1 %165, label %BB_804929D.i, label %BB_80492EC.i

BB_80494E3.i:                                     ; preds = %BB_8049526.i, %BB_80494E3.i.lr.ph
  %r_ecx.690 = phi i32 [ %r_ecx.5.lcssa, %BB_80494E3.i.lr.ph ], [ %r_ecx.2.lcssa, %BB_8049526.i ]
  store i32 0, i32* %50, align 16
  %166 = load i32, i32* %9, align 16
  %167 = icmp sgt i32 %166, 0
  br i1 %167, label %BB_80494EC.i, label %BB_8049526.i

BB_80492EC.i:                                     ; preds = %BB_80492E0.i, %BB_8049294.i
  %r_ecx.4.lcssa = phi i32 [ %r_ecx.8.lcssa, %BB_8049294.i ], [ %r_ecx.1.lcssa, %BB_80492E0.i ]
  %tmp2_v.i463.i = add i32 %tmp0_v.i450.i, -100
  %168 = inttoptr i32 %tmp2_v.i463.i to i32*
  store i32 0, i32* %168, align 4
  %169 = load i32, i32* %10, align 4
  %170 = icmp sgt i32 %169, 0
  br i1 %170, label %BB_80492F5.i.lr.ph, label %BB_80492EC.i.BB_8049351.i_crit_edge

BB_80492EC.i.BB_8049351.i_crit_edge:              ; preds = %BB_80492EC.i
  %.pre94 = inttoptr i32 %r_esp.8.in.le to i32*
  %.pre95 = add i32 %r_esp.8.in.le, -4
  %.pre96 = inttoptr i32 %.pre95 to i32*
  br label %BB_8049351.i

BB_80492F5.i.lr.ph:                               ; preds = %BB_80492EC.i
  %tmp2_v.i58.i = add i32 %tmp0_v.i450.i, -96
  %171 = inttoptr i32 %tmp2_v.i58.i to i32*
  %tmp2_v11.i.i = add i32 %r_esp.8.in.le, 4
  %172 = inttoptr i32 %tmp2_v11.i.i to i32*
  %173 = inttoptr i32 %r_esp.8.in.le to i32*
  %tmp2_v14.i102.i = add i32 %r_esp.8.in.le, -4
  %174 = inttoptr i32 %tmp2_v14.i102.i to i32*
  br label %BB_80492F5.i

BB_8049408.i:                                     ; preds = %BB_80493B0.i, %BB_80493FC.i
  %r_ecx.3.lcssa = phi i32 [ %r_ecx.7.lcssa, %BB_80493B0.i ], [ %r_ecx.0.lcssa, %BB_80493FC.i ]
  %tmp2_v.i491.i = add i32 %tmp0_v.i450.i, -80
  %175 = inttoptr i32 %tmp2_v.i491.i to i32*
  store i32 0, i32* %175, align 16
  %176 = load i32, i32* %10, align 4
  %177 = icmp sgt i32 %176, 0
  br i1 %177, label %BB_8049411.i.lr.ph, label %BB_8049408.i.BB_804946D.i_crit_edge

BB_8049408.i.BB_804946D.i_crit_edge:              ; preds = %BB_8049408.i
  %.pre98 = add i32 %r_esp.8.in.le, 4
  %.pre99 = inttoptr i32 %.pre98 to i32*
  br label %BB_804946D.i

BB_8049411.i.lr.ph:                               ; preds = %BB_8049408.i
  %tmp2_v.i290.i = add i32 %tmp0_v.i450.i, -76
  %178 = inttoptr i32 %tmp2_v.i290.i to i32*
  %tmp2_v11.i118.i = add i32 %r_esp.8.in.le, 4
  %179 = inttoptr i32 %tmp2_v11.i118.i to i32*
  br label %BB_8049411.i

BB_80492A6.i:                                     ; preds = %BB_80492A6.i, %BB_804929D.i
  %storemerge2570 = phi i32 [ %tmp0_v19.i559.i, %BB_80492A6.i ], [ 0, %BB_804929D.i ]
  %180 = load i32, i32* %109, align 4
  %tmp0_v3.i542.i = mul i32 %180, 10
  %tmp4_v.i545.i = shl i32 %180, 2
  %181 = load i32, i32* %14, align 8
  %tmp0_v8.i548.i = add i32 %181, %tmp4_v.i545.i
  %182 = inttoptr i32 %tmp0_v8.i548.i to i32*
  %183 = load i32, i32* %182, align 4
  %tmp0_v12.i552.i = shl i32 %storemerge2570, 2
  %tmp0_v13.i553.i = add i32 %183, %tmp0_v12.i552.i
  %tmp0_v16.i556.i = add i32 %tmp0_v3.i542.i, %storemerge2570
  %184 = inttoptr i32 %tmp0_v13.i553.i to i32*
  store i32 %tmp0_v16.i556.i, i32* %184, align 4
  %185 = load i32, i32* %112, align 8
  %tmp0_v19.i559.i = add i32 %185, 1
  store i32 %tmp0_v19.i559.i, i32* %112, align 8
  %186 = load i32, i32* %9, align 16
  %187 = icmp slt i32 %tmp0_v19.i559.i, %186
  br i1 %187, label %BB_80492A6.i, label %BB_80492E0.i

.exit:                                            ; preds = %BB_80495AD.i, %BB_8049597.i
  %188 = load i32, i32* %14, align 8
  store i32 %188, i32* %.pre-phi102, align 4
  store i32 134518241, i32* %.pre-phi105, align 4
  %arg.i.i62 = load i32, i32* %.pre-phi102, align 4
  tail call void @free(i32 %arg.i.i62)
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

  tail call fastcc void @increase_size_dynamic_2d_array503 (i32 ptrtoint (i32* getelementptr inbounds ([8092 x i32], [8092 x i32]* @stack502, i32 0, i32 8092) to i32)) nounwind
