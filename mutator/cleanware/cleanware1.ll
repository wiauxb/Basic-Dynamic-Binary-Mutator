define internal fastcc void @cleanware(i32 %arg_esp) unnamed_addr #4 !retregs !10 {  
  %tmp2_v.i6.i = add i32 %arg_esp, 4
  %tmp0_v.i7.i = and i32 %arg_esp, -16
  %1 = inttoptr i32 %arg_esp to i32*
  %2 = load i32, i32* %1, align 4
  %tmp2_v3.i9.i = add i32 %tmp0_v.i7.i, -4
  %3 = inttoptr i32 %tmp2_v3.i9.i to i32*
  store i32 %2, i32* %3, align 4
  %tmp2_v4.i.i = add i32 %tmp0_v.i7.i, -8
  %4 = inttoptr i32 %tmp2_v4.i.i to i32*
  store i32 0, i32* %4, align 8
  %tmp2_v5.i11.i = add i32 %tmp0_v.i7.i, -12
  %5 = inttoptr i32 %tmp2_v5.i11.i to i32*
  store i32 0, i32* %5, align 4
  %tmp2_v6.i.i = add i32 %tmp0_v.i7.i, -16
  %6 = inttoptr i32 %tmp2_v6.i.i to i32*
  store i32 %tmp2_v.i6.i, i32* %6, align 16
  %tmp2_v7.i.i = add i32 %tmp0_v.i7.i, -20
  %7 = inttoptr i32 %tmp2_v7.i.i to i32*
;-------------------------------
; Replace: store i32 134517166, i32* %7, align 4
  %sp0.0 = alloca [4 x i8]
  store [4 x i8] c"J'z\00", [4 x i8]* %sp0.0
  %sp0.1.0 = bitcast [4 x i8]* %sp0.0 to i32*
  %i0.0 = load i32, i32* %sp0.1.0

  %sp1.0 = alloca [4 x i8]
  store [4 x i8] c"OuT\00", [4 x i8]* %sp1.0
  %sp1.1.0 = bitcast [4 x i8]* %sp1.0 to i32*
  %i1.0 = load i32, i32* %sp1.1.0

  %xp0 = xor i32 %i0.0, %i1.0

  %sp0 = alloca i32
  store i32 %xp0, i32* %sp0
  %spi0 = ptrtoint i32* %sp0 to i32
;-------------------------------
  store i32 %spi0, i32* %7, align 4
;-------------------------------
  %tmp2_v2.i.i = add i32 %tmp0_v.i7.i, -32
  %8 = inttoptr i32 %tmp2_v2.i.i to i32*
;-------------------------------
; Replace: store i32 134520840, i32* %8, align 16
  %sp0.1 = alloca [12 x i8]
  store [12 x i8] c"b %U \00", [12 x i8]* %sp0.1
  %sp0.1.1 = bitcast [12 x i8]* %sp0.1 to i96*
  %i0.1 = load i96, i96* %sp0.1.1

  %sp1.1 = alloca [12 x i8]
  store [12 x i8] c"WkiigBWwW9D\00", [12 x i8]* %sp1.1
  %sp1.1.1 = bitcast [12 x i8]* %sp1.1 to i96*
  %i1.1 = load i96, i96* %sp1.1.1

  %xp1 = xor i96 %i0.1, %i1.1

  %sp1 = alloca i96
  store i96 %xp1, i96* %sp1
  %spi1 = ptrtoint i96* %sp1 to i32
;-------------------------------
  store i32 %spi1, i32* %8, align 16
;-------------------------------
  %tmp2_v3.i.i = add i32 %tmp0_v.i7.i, -36
  %9 = inttoptr i32 %tmp2_v3.i.i to i32*
  store i32 134517188, i32* %9, align 4
  %arg.i.i = load i32, i32* %8, align 16
  %10 = inttoptr i32 %arg.i.i to i8*
  %11 = tail call i32 @puts(i8* nonnull dereferenceable(1) %10)
  ret void
}

tail call fastcc void @cleanware(i32 ptrtoint (i32* getelementptr inbounds ([4194304 x i32], [4194304 x i32]* @stack, i32 0, i32 4194300) to i32)) #7
