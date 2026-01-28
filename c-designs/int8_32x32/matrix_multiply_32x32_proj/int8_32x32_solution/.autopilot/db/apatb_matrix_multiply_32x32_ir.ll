; ModuleID = '/mnt/vault0/rsunketa/vitis-hls-blackbox/c-designs/int8_32x32/matrix_multiply_32x32_proj/int8_32x32_solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_int<8>" = type { %"struct.ap_int_base<8, true>" }
%"struct.ap_int_base<8, true>" = type { %"struct.ssdm_int<8, true>" }
%"struct.ssdm_int<8, true>" = type { i8 }
%"struct.ap_int<16>" = type { %"struct.ap_int_base<16, true>" }
%"struct.ap_int_base<16, true>" = type { %"struct.ssdm_int<16, true>" }
%"struct.ssdm_int<16, true>" = type { i16 }

; Function Attrs: noinline
define void @apatb_matrix_multiply_32x32_ir([32 x %"struct.ap_int<8>"]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="32" "maxi" %A, [32 x %"struct.ap_int<8>"]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="32" "maxi" %B, [32 x %"struct.ap_int<16>"]* noalias nocapture nonnull "fpga.decayed.dim.hint"="32" "maxi" %C) local_unnamed_addr #0 {
entry:
  %A_copy = alloca [32 x [32 x i8]], align 512
  %B_copy = alloca [32 x [32 x i8]], align 512
  %C_copy = alloca [32 x [32 x i16]], align 512
  %0 = bitcast [32 x %"struct.ap_int<8>"]* %A to [32 x [32 x %"struct.ap_int<8>"]]*
  %1 = bitcast [32 x %"struct.ap_int<8>"]* %B to [32 x [32 x %"struct.ap_int<8>"]]*
  %2 = bitcast [32 x %"struct.ap_int<16>"]* %C to [32 x [32 x %"struct.ap_int<16>"]]*
  call fastcc void @copy_in([32 x [32 x %"struct.ap_int<8>"]]* nonnull %0, [32 x [32 x i8]]* nonnull align 512 %A_copy, [32 x [32 x %"struct.ap_int<8>"]]* nonnull %1, [32 x [32 x i8]]* nonnull align 512 %B_copy, [32 x [32 x %"struct.ap_int<16>"]]* nonnull %2, [32 x [32 x i16]]* nonnull align 512 %C_copy)
  call void @apatb_matrix_multiply_32x32_hw([32 x [32 x i8]]* %A_copy, [32 x [32 x i8]]* %B_copy, [32 x [32 x i16]]* %C_copy)
  call void @copy_back([32 x [32 x %"struct.ap_int<8>"]]* %0, [32 x [32 x i8]]* %A_copy, [32 x [32 x %"struct.ap_int<8>"]]* %1, [32 x [32 x i8]]* %B_copy, [32 x [32 x %"struct.ap_int<16>"]]* %2, [32 x [32 x i16]]* %C_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([32 x [32 x %"struct.ap_int<8>"]]* noalias readonly, [32 x [32 x i8]]* noalias align 512, [32 x [32 x %"struct.ap_int<8>"]]* noalias readonly, [32 x [32 x i8]]* noalias align 512, [32 x [32 x %"struct.ap_int<16>"]]* noalias readonly, [32 x [32 x i16]]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_int<8>"([32 x [32 x i8]]* align 512 %1, [32 x [32 x %"struct.ap_int<8>"]]* %0)
  call fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_int<8>"([32 x [32 x i8]]* align 512 %3, [32 x [32 x %"struct.ap_int<8>"]]* %2)
  call fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_int<16>"([32 x [32 x i16]]* align 512 %5, [32 x [32 x %"struct.ap_int<16>"]]* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32a32struct.ap_int<8>"([32 x [32 x %"struct.ap_int<8>"]]* %dst, [32 x [32 x %"struct.ap_int<8>"]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x [32 x %"struct.ap_int<8>"]]* %src, null
  %1 = icmp eq [32 x [32 x %"struct.ap_int<8>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x [32 x %"struct.ap_int<8>"]], [32 x [32 x %"struct.ap_int<8>"]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [32 x [32 x %"struct.ap_int<8>"]], [32 x [32 x %"struct.ap_int<8>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a32struct.ap_int<8>"([32 x %"struct.ap_int<8>"]* %dst.addr, [32 x %"struct.ap_int<8>"]* %src.addr, i64 32)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32struct.ap_int<8>"([32 x %"struct.ap_int<8>"]* %dst, [32 x %"struct.ap_int<8>"]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x %"struct.ap_int<8>"]* %src, null
  %1 = icmp eq [32 x %"struct.ap_int<8>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [32 x %"struct.ap_int<8>"], [32 x %"struct.ap_int<8>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [32 x %"struct.ap_int<8>"], [32 x %"struct.ap_int<8>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = load i8, i8* %src.addr.0.0.05, align 1
  store i8 %3, i8* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_int<16>"([32 x [32 x i16]]* noalias align 512 %dst, [32 x [32 x %"struct.ap_int<16>"]]* noalias readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x [32 x i16]]* %dst, null
  %1 = icmp eq [32 x [32 x %"struct.ap_int<16>"]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32a32struct.ap_int<16>"([32 x [32 x i16]]* nonnull %dst, [32 x [32 x %"struct.ap_int<16>"]]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32a32struct.ap_int<16>"([32 x [32 x i16]]* %dst, [32 x [32 x %"struct.ap_int<16>"]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x [32 x %"struct.ap_int<16>"]]* %src, null
  %1 = icmp eq [32 x [32 x i16]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [32 x [32 x i16]], [32 x [32 x i16]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [32 x [32 x %"struct.ap_int<16>"]], [32 x [32 x %"struct.ap_int<16>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a32struct.ap_int<16>"([32 x i16]* %3, [32 x %"struct.ap_int<16>"]* %src.addr, i64 32)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32struct.ap_int<16>"([32 x i16]* %dst, [32 x %"struct.ap_int<16>"]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x %"struct.ap_int<16>"]* %src, null
  %1 = icmp eq [32 x i16]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [32 x %"struct.ap_int<16>"], [32 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = getelementptr [32 x i16], [32 x i16]* %dst, i64 0, i64 %for.loop.idx8
  %4 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %4, i16* %3, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([32 x [32 x %"struct.ap_int<8>"]]* noalias, [32 x [32 x i8]]* noalias readonly align 512, [32 x [32 x %"struct.ap_int<8>"]]* noalias, [32 x [32 x i8]]* noalias readonly align 512, [32 x [32 x %"struct.ap_int<16>"]]* noalias, [32 x [32 x i16]]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_int<8>.36"([32 x [32 x %"struct.ap_int<8>"]]* %0, [32 x [32 x i8]]* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_int<8>.36"([32 x [32 x %"struct.ap_int<8>"]]* %2, [32 x [32 x i8]]* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_int<16>.12"([32 x [32 x %"struct.ap_int<16>"]]* %4, [32 x [32 x i16]]* align 512 %5)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_int<16>.12"([32 x [32 x %"struct.ap_int<16>"]]* noalias %dst, [32 x [32 x i16]]* noalias readonly align 512 %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x [32 x %"struct.ap_int<16>"]]* %dst, null
  %1 = icmp eq [32 x [32 x i16]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32a32struct.ap_int<16>.15"([32 x [32 x %"struct.ap_int<16>"]]* nonnull %dst, [32 x [32 x i16]]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32a32struct.ap_int<16>.15"([32 x [32 x %"struct.ap_int<16>"]]* %dst, [32 x [32 x i16]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x [32 x i16]]* %src, null
  %1 = icmp eq [32 x [32 x %"struct.ap_int<16>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x [32 x %"struct.ap_int<16>"]], [32 x [32 x %"struct.ap_int<16>"]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [32 x [32 x i16]], [32 x [32 x i16]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a32struct.ap_int<16>.18"([32 x %"struct.ap_int<16>"]* %dst.addr, [32 x i16]* %3, i64 32)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32struct.ap_int<16>.18"([32 x %"struct.ap_int<16>"]* %dst, [32 x i16]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x i16]* %src, null
  %1 = icmp eq [32 x %"struct.ap_int<16>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [32 x i16], [32 x i16]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.0.0.06 = getelementptr [32 x %"struct.ap_int<16>"], [32 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %4 = load i16, i16* %3, align 2
  store i16 %4, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_int<8>"([32 x [32 x i8]]* noalias align 512 %dst, [32 x [32 x %"struct.ap_int<8>"]]* noalias readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x [32 x i8]]* %dst, null
  %1 = icmp eq [32 x [32 x %"struct.ap_int<8>"]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32a32struct.ap_int<8>.29"([32 x [32 x i8]]* nonnull %dst, [32 x [32 x %"struct.ap_int<8>"]]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32a32struct.ap_int<8>.29"([32 x [32 x i8]]* %dst, [32 x [32 x %"struct.ap_int<8>"]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x [32 x %"struct.ap_int<8>"]]* %src, null
  %1 = icmp eq [32 x [32 x i8]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [32 x [32 x i8]], [32 x [32 x i8]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [32 x [32 x %"struct.ap_int<8>"]], [32 x [32 x %"struct.ap_int<8>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a32struct.ap_int<8>.32"([32 x i8]* %3, [32 x %"struct.ap_int<8>"]* %src.addr, i64 32)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32struct.ap_int<8>.32"([32 x i8]* %dst, [32 x %"struct.ap_int<8>"]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x %"struct.ap_int<8>"]* %src, null
  %1 = icmp eq [32 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [32 x %"struct.ap_int<8>"], [32 x %"struct.ap_int<8>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = getelementptr [32 x i8], [32 x i8]* %dst, i64 0, i64 %for.loop.idx8
  %4 = load i8, i8* %src.addr.0.0.05, align 1
  store i8 %4, i8* %3, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_int<8>.36"([32 x [32 x %"struct.ap_int<8>"]]* noalias %dst, [32 x [32 x i8]]* noalias readonly align 512 %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x [32 x %"struct.ap_int<8>"]]* %dst, null
  %1 = icmp eq [32 x [32 x i8]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32a32struct.ap_int<8>.39"([32 x [32 x %"struct.ap_int<8>"]]* nonnull %dst, [32 x [32 x i8]]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32a32struct.ap_int<8>.39"([32 x [32 x %"struct.ap_int<8>"]]* %dst, [32 x [32 x i8]]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x [32 x i8]]* %src, null
  %1 = icmp eq [32 x [32 x %"struct.ap_int<8>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x [32 x %"struct.ap_int<8>"]], [32 x [32 x %"struct.ap_int<8>"]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [32 x [32 x i8]], [32 x [32 x i8]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a32struct.ap_int<8>.42"([32 x %"struct.ap_int<8>"]* %dst.addr, [32 x i8]* %3, i64 32)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32struct.ap_int<8>.42"([32 x %"struct.ap_int<8>"]* %dst, [32 x i8]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x i8]* %src, null
  %1 = icmp eq [32 x %"struct.ap_int<8>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [32 x i8], [32 x i8]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.0.0.06 = getelementptr [32 x %"struct.ap_int<8>"], [32 x %"struct.ap_int<8>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %4 = load i8, i8* %3, align 1
  store i8 %4, i8* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare void @apatb_matrix_multiply_32x32_hw([32 x [32 x i8]]*, [32 x [32 x i8]]*, [32 x [32 x i16]]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([32 x [32 x %"struct.ap_int<8>"]]* noalias, [32 x [32 x i8]]* noalias readonly align 512, [32 x [32 x %"struct.ap_int<8>"]]* noalias, [32 x [32 x i8]]* noalias readonly align 512, [32 x [32 x %"struct.ap_int<16>"]]* noalias, [32 x [32 x i16]]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a32a32struct.ap_int<16>.12"([32 x [32 x %"struct.ap_int<16>"]]* %4, [32 x [32 x i16]]* align 512 %5)
  ret void
}

define void @matrix_multiply_32x32_hw_stub_wrapper([32 x [32 x i8]]*, [32 x [32 x i8]]*, [32 x [32 x i16]]*) #5 {
entry:
  %3 = alloca [32 x [32 x %"struct.ap_int<8>"]]
  %4 = alloca [32 x [32 x %"struct.ap_int<8>"]]
  %5 = alloca [32 x [32 x %"struct.ap_int<16>"]]
  call void @copy_out([32 x [32 x %"struct.ap_int<8>"]]* %3, [32 x [32 x i8]]* %0, [32 x [32 x %"struct.ap_int<8>"]]* %4, [32 x [32 x i8]]* %1, [32 x [32 x %"struct.ap_int<16>"]]* %5, [32 x [32 x i16]]* %2)
  %6 = bitcast [32 x [32 x %"struct.ap_int<8>"]]* %3 to [32 x %"struct.ap_int<8>"]*
  %7 = bitcast [32 x [32 x %"struct.ap_int<8>"]]* %4 to [32 x %"struct.ap_int<8>"]*
  %8 = bitcast [32 x [32 x %"struct.ap_int<16>"]]* %5 to [32 x %"struct.ap_int<16>"]*
  call void @matrix_multiply_32x32_hw_stub([32 x %"struct.ap_int<8>"]* %6, [32 x %"struct.ap_int<8>"]* %7, [32 x %"struct.ap_int<16>"]* %8)
  call void @copy_in([32 x [32 x %"struct.ap_int<8>"]]* %3, [32 x [32 x i8]]* %0, [32 x [32 x %"struct.ap_int<8>"]]* %4, [32 x [32 x i8]]* %1, [32 x [32 x %"struct.ap_int<16>"]]* %5, [32 x [32 x i16]]* %2)
  ret void
}

declare void @matrix_multiply_32x32_hw_stub([32 x %"struct.ap_int<8>"]* noalias nocapture nonnull readonly, [32 x %"struct.ap_int<8>"]* noalias nocapture nonnull readonly, [32 x %"struct.ap_int<16>"]* noalias nocapture nonnull)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{!"int8_32x32_wrapper", !5}
!5 = !{!"int8_32x32_wrapper", !6, !13, !15, !16, !17, !14}
!6 = !{!7, !9, !11}
!7 = !{!"stream", !"in", !"ram_none", i32 0, !8}
!8 = !{!"FIFO_data_read_in", !"a_tdata", !"FIFO_empty_flag", !"a_tready", !"FIFO_read_enable", !"a_tvalid"}
!9 = !{!"stream", !"in", !"ram_none", i32 0, !10}
!10 = !{!"FIFO_data_read_in", !"b_tdata", !"FIFO_empty_flag", !"b_tready", !"FIFO_read_enable", !"b_tvalid"}
!11 = !{!"stream", !"out", !"ram_none", i32 0, !12}
!12 = !{!"FIFO_data_write_out", !"c_tdata", !"FIFO_full_flag", !"c_tready", !"FIFO_write_enable", !"c_tvalid"}
!13 = !{!"void", !"none", !"ram_none", i32 0, !14}
!14 = !{}
!15 = !{!"ap_ctrl_chain_protocol_continue", !"ap_continue", !"ap_ctrl_chain_protocol_done", !"ap_done", !"ap_ctrl_chain_protocol_idle", !"ap_idle", !"ap_ctrl_chain_protocol_ready", !"ap_ready", !"ap_ctrl_chain_protocol_start", !"ap_start", !"module_clock", !"ap_clk", !"module_clock_enable", !"ap_ce", !"module_reset", !"ap_rst"}
!16 = !{i32 33, i32 1, double 0.000000e+00, !14, !14}
!17 = !{!"FF", i32 0, !"LUT", i32 0, !"BRAM", i32 0, !"URAM", i32 0, !"DSP", i32 1024}
