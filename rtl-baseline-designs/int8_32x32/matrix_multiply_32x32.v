`timescale 1 ns / 1 ps

// Matrix Multiply 32x32 - Hand-coded RTL to match HLS C++ dataflow design
// Implements concurrent DMA reads (A, B), streaming compute, and DMA write (C)
module matrix_multiply_32x32 (
    input wire clk,
    input wire rst,
    output reg interrupt,
    // AXI Lite slave interface for control
    input wire s_axil_awvalid,
    input wire [31:0] s_axil_awaddr,
    output wire s_axil_awready,
    input wire s_axil_wvalid,
    input wire [31:0] s_axil_wdata,
    input wire [3:0] s_axil_wstrb,
    output wire s_axil_wready,
    output wire s_axil_bvalid,
    input wire s_axil_bready,
    output wire [1:0] s_axil_bresp,
    input wire s_axil_arvalid,
    input wire [31:0] s_axil_araddr,
    output wire s_axil_arready,
    output wire s_axil_rvalid,
    input wire s_axil_rready,
    output wire [31:0] s_axil_rdata,
    output wire [1:0] s_axil_rresp,
    // AXI master interface for matrix A
    output wire m_axi_a_awvalid,
    input wire m_axi_a_awready,
    output wire [63:0] m_axi_a_awaddr,
    output wire [2:0] m_axi_a_awprot,
    output wire [3:0] m_axi_a_awid,
    output wire [7:0] m_axi_a_awlen,
    output wire [2:0] m_axi_a_awsize,
    output wire [1:0] m_axi_a_awburst,
    output wire [1:0] m_axi_a_awlock,
    output wire [3:0] m_axi_a_awcache,
    output wire [2:0] m_axi_a_awqos,
    output wire [3:0] m_axi_a_awregion,
    output wire m_axi_a_awuser,
    output wire m_axi_a_wvalid,
    input wire m_axi_a_wready,
    output wire [255:0] m_axi_a_wdata,
    output wire [31:0] m_axi_a_wstrb,
    output wire m_axi_a_wlast,
    output wire m_axi_a_wuser,
    input wire m_axi_a_bvalid,
    output wire m_axi_a_bready,
    input wire [1:0] m_axi_a_bresp,
    input wire [3:0] m_axi_a_bid,
    input wire m_axi_a_buser,
    output wire m_axi_a_arvalid,
    input wire m_axi_a_arready,
    output wire [63:0] m_axi_a_araddr,
    output wire [2:0] m_axi_a_arprot,
    output wire [3:0] m_axi_a_arid,
    output wire [7:0] m_axi_a_arlen,
    output wire [2:0] m_axi_a_arsize,
    output wire [1:0] m_axi_a_arburst,
    output wire [1:0] m_axi_a_arlock,
    output wire [3:0] m_axi_a_arcache,
    output wire [2:0] m_axi_a_arqos,
    output wire [3:0] m_axi_a_arregion,
    output wire m_axi_a_aruser,
    input wire m_axi_a_rvalid,
    output wire m_axi_a_rready,
    input wire [255:0] m_axi_a_rdata,
    input wire [1:0] m_axi_a_rresp,
    input wire [3:0] m_axi_a_rid,
    input wire m_axi_a_rlast,
    input wire m_axi_a_ruser,
    // AXI master interface for matrix B
    output wire m_axi_b_awvalid,
    input wire m_axi_b_awready,
    output wire [63:0] m_axi_b_awaddr,
    output wire [2:0] m_axi_b_awprot,
    output wire [3:0] m_axi_b_awid,
    output wire [7:0] m_axi_b_awlen,
    output wire [2:0] m_axi_b_awsize,
    output wire [1:0] m_axi_b_awburst,
    output wire [1:0] m_axi_b_awlock,
    output wire [3:0] m_axi_b_awcache,
    output wire [2:0] m_axi_b_awqos,
    output wire [3:0] m_axi_b_awregion,
    output wire m_axi_b_awuser,
    output wire m_axi_b_wvalid,
    input wire m_axi_b_wready,
    output wire [255:0] m_axi_b_wdata,
    output wire [31:0] m_axi_b_wstrb,
    output wire m_axi_b_wlast,
    output wire m_axi_b_wuser,
    input wire m_axi_b_bvalid,
    output wire m_axi_b_bready,
    input wire [1:0] m_axi_b_bresp,
    input wire [3:0] m_axi_b_bid,
    input wire m_axi_b_buser,
    output wire m_axi_b_arvalid,
    input wire m_axi_b_arready,
    output wire [63:0] m_axi_b_araddr,
    output wire [2:0] m_axi_b_arprot,
    output wire [3:0] m_axi_b_arid,
    output wire [7:0] m_axi_b_arlen,
    output wire [2:0] m_axi_b_arsize,
    output wire [1:0] m_axi_b_arburst,
    output wire [1:0] m_axi_b_arlock,
    output wire [3:0] m_axi_b_arcache,
    output wire [2:0] m_axi_b_arqos,
    output wire [3:0] m_axi_b_arregion,
    output wire m_axi_b_aruser,
    input wire m_axi_b_rvalid,
    output wire m_axi_b_rready,
    input wire [255:0] m_axi_b_rdata,
    input wire [1:0] m_axi_b_rresp,
    input wire [3:0] m_axi_b_rid,
    input wire m_axi_b_rlast,
    input wire m_axi_b_ruser,
    // AXI master interface for matrix C
    output wire m_axi_c_awvalid,
    input wire m_axi_c_awready,
    output wire [63:0] m_axi_c_awaddr,
    output wire [2:0] m_axi_c_awprot,
    output wire [3:0] m_axi_c_awid,
    output wire [7:0] m_axi_c_awlen,
    output wire [2:0] m_axi_c_awsize,
    output wire [1:0] m_axi_c_awburst,
    output wire [1:0] m_axi_c_awlock,
    output wire [3:0] m_axi_c_awcache,
    output wire [2:0] m_axi_c_awqos,
    output wire [3:0] m_axi_c_awregion,
    output wire m_axi_c_awuser,
    output wire m_axi_c_wvalid,
    input wire m_axi_c_wready,
    output wire [511:0] m_axi_c_wdata,
    output wire [63:0] m_axi_c_wstrb,
    output wire m_axi_c_wlast,
    output wire m_axi_c_wuser,
    input wire m_axi_c_bvalid,
    output wire m_axi_c_bready,
    input wire [1:0] m_axi_c_bresp,
    input wire [3:0] m_axi_c_bid,
    input wire m_axi_c_buser,
    output wire m_axi_c_arvalid,
    input wire m_axi_c_arready,
    output wire [63:0] m_axi_c_araddr,
    output wire [2:0] m_axi_c_arprot,
    output wire [3:0] m_axi_c_arid,
    output wire [7:0] m_axi_c_arlen,
    output wire [2:0] m_axi_c_arsize,
    output wire [1:0] m_axi_c_arburst,
    output wire [1:0] m_axi_c_arlock,
    output wire [3:0] m_axi_c_arcache,
    output wire [2:0] m_axi_c_arqos,
    output wire [3:0] m_axi_c_arregion,
    output wire m_axi_c_aruser,
    input wire m_axi_c_rvalid,
    output wire m_axi_c_rready,
    input wire [511:0] m_axi_c_rdata,
    input wire [1:0] m_axi_c_rresp,
    input wire [3:0] m_axi_c_rid,
    input wire m_axi_c_rlast,
    input wire m_axi_c_ruser
);

// Parameters
parameter AXIL_DATA_WIDTH = 32;
parameter AXIL_ADDR_WIDTH = 6;
parameter AXI_DATA_WIDTH = 32;
parameter AXI_ADDR_WIDTH = 64;
parameter AXI_ID_WIDTH = 4;
parameter AXI_LEN_WIDTH = 8;
parameter AXI_SIZE_WIDTH = 3;
parameter AXI_BURST_WIDTH = 2;
parameter AXI_LOCK_WIDTH = 2;
parameter AXI_CACHE_WIDTH = 4;
parameter AXI_PROT_WIDTH = 3;
parameter AXI_QOS_WIDTH = 4;

// Internal signals

// Control registers (HLS-compatible)
// 0x00: Control (bit 0: ap_start, bit 1: ap_done, bit 2: ap_idle, bit 3: ap_ready, bit 7: auto_restart)
// 0x04: Global interrupt enable
// 0x08: IP interrupt enable
// 0x0C: IP interrupt status
// 0x10-0x14: A address (64-bit)
// 0x18-0x1C: B address (64-bit)
// 0x20-0x24: C address (64-bit)

reg [31:0] control_reg;
reg [63:0] a_addr_reg;
reg [63:0] b_addr_reg;
reg [63:0] c_addr_reg;

wire ap_start = control_reg[0];
wire ap_done = control_reg[1];
wire ap_idle = control_reg[2];
wire ap_ready = control_reg[3];

// Register interface signals
wire [31:0] reg_wr_data;
wire [5:0] reg_wr_addr;
wire reg_wr_en;
wire [31:0] reg_rd_data;
wire [5:0] reg_rd_addr;
wire reg_rd_en;

// Instantiate AXI lite register interface
axil_reg_if #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(6),
    .STRB_WIDTH(4),
    .TIMEOUT(4)
) axil_reg_inst (
    .clk(clk),
    .rst(rst),
    .s_axil_awaddr(s_axil_awaddr[5:0]),
    .s_axil_awprot(3'b000),
    .s_axil_awvalid(s_axil_awvalid),
    .s_axil_awready(s_axil_awready),
    .s_axil_wdata(s_axil_wdata),
    .s_axil_wstrb(s_axil_wstrb),
    .s_axil_wvalid(s_axil_wvalid),
    .s_axil_wready(s_axil_wready),
    .s_axil_bresp(s_axil_bresp),
    .s_axil_bvalid(s_axil_bvalid),
    .s_axil_bready(s_axil_bready),
    .s_axil_araddr(s_axil_araddr[5:0]),
    .s_axil_arprot(3'b000),
    .s_axil_arvalid(s_axil_arvalid),
    .s_axil_arready(s_axil_arready),
    .s_axil_rdata(s_axil_rdata),
    .s_axil_rresp(s_axil_rresp),
    .s_axil_rvalid(s_axil_rvalid),
    .s_axil_rready(s_axil_rready),
    .reg_wr_addr(reg_wr_addr),
    .reg_wr_data(reg_wr_data),
    .reg_wr_en(reg_wr_en),
    .reg_wr_wait(1'b0),
    .reg_wr_ack(1'b0),
    .reg_rd_addr(reg_rd_addr),
    .reg_rd_en(reg_rd_en),
    .reg_rd_data(reg_rd_data),
    .reg_rd_wait(1'b0),
    .reg_rd_ack(1'b0)
);


// State machine - dataflow control (matches C++ HLS dataflow)
localparam IDLE = 3'd0;
localparam RUNNING = 3'd1;
localparam DONE = 3'd2;

reg [2:0] state;
reg ap_start_r;

// DMA descriptors
reg dma_a_desc_valid;
reg dma_b_desc_valid;
reg dma_c_desc_valid;
wire dma_a_desc_ready;
wire dma_b_desc_ready;
wire dma_c_desc_ready;

// DMA status
wire dma_a_status_valid;
wire dma_b_status_valid;
wire dma_c_status_valid;

// Track when all DMAs complete
reg dma_a_done_r;
reg dma_b_done_r;
reg dma_c_done_r;

// Stream signals between DMAs and wrapper
wire [255:0] a_stream_tdata;
wire a_stream_tvalid;
wire a_stream_tready;
wire a_stream_tlast;

wire [255:0] b_stream_tdata;
wire b_stream_tvalid;
wire b_stream_tready;
wire b_stream_tlast;

wire [511:0] c_stream_tdata;
wire c_stream_tvalid;
wire c_stream_tready;
wire c_stream_tlast;

// Wrapper control signals
wire wrapper_start;
wire wrapper_done;
wire wrapper_idle;
wire wrapper_ready;


// Instantiate DMA for A (read) - 32x32 matrix = 1024 bytes
axi_dma_rd #(
    .AXI_DATA_WIDTH(256),  // Match AXIS width to avoid conversion
    .AXI_ADDR_WIDTH(64),
    .AXI_ID_WIDTH(4),
    .AXIS_DATA_WIDTH(256),
    .AXIS_KEEP_WIDTH(32),
    .AXIS_LAST_ENABLE(1),
    .AXIS_ID_ENABLE(0),
    .AXIS_DEST_ENABLE(0),
    .AXIS_USER_ENABLE(0),
    .LEN_WIDTH(20),
    .TAG_WIDTH(8),
    .ENABLE_SG(0),
    .ENABLE_UNALIGNED(0)
) dma_a (
    .clk(clk),
    .rst(rst),
    // Descriptor input - address and length
    .s_axis_read_desc_addr(a_addr_reg),
    .s_axis_read_desc_len(20'd1024),  // 1024 bytes for 32x32 int8
    .s_axis_read_desc_tag(8'd0),
    .s_axis_read_desc_id(8'd0),
    .s_axis_read_desc_dest(8'd0),
    .s_axis_read_desc_user(1'b0),
    .s_axis_read_desc_valid(dma_a_desc_valid),
    .s_axis_read_desc_ready(dma_a_desc_ready),
    // Status output
    .m_axis_read_desc_status_tag(),
    .m_axis_read_desc_status_error(),
    .m_axis_read_desc_status_valid(dma_a_status_valid),
    // Data output stream
    .m_axis_read_data_tdata(a_stream_tdata),
    .m_axis_read_data_tkeep(),
    .m_axis_read_data_tvalid(a_stream_tvalid),
    .m_axis_read_data_tready(a_stream_tready),
    .m_axis_read_data_tlast(a_stream_tlast),
    .m_axis_read_data_tid(),
    .m_axis_read_data_tdest(),
    .m_axis_read_data_tuser(),
    // AXI interface
    .m_axi_arid(m_axi_a_arid),
    .m_axi_araddr(m_axi_a_araddr),
    .m_axi_arlen(m_axi_a_arlen),
    .m_axi_arsize(m_axi_a_arsize),
    .m_axi_arburst(m_axi_a_arburst),
    .m_axi_arlock(m_axi_a_arlock),
    .m_axi_arcache(m_axi_a_arcache),
    .m_axi_arprot(m_axi_a_arprot),
    .m_axi_arvalid(m_axi_a_arvalid),
    .m_axi_arready(m_axi_a_arready),
    .m_axi_rid(m_axi_a_rid),
    .m_axi_rdata(m_axi_a_rdata),
    .m_axi_rresp(m_axi_a_rresp),
    .m_axi_rlast(m_axi_a_rlast),
    .m_axi_rvalid(m_axi_a_rvalid),
    .m_axi_rready(m_axi_a_rready),
    // Configuration
    .enable(1'b1)
);

// Drive optional AXI signals not provided by axi_dma_rd
assign m_axi_a_arqos = 3'd0;
assign m_axi_a_arregion = 4'd0;
assign m_axi_a_aruser = 1'd0;

// Tie off unused write channel for A
assign m_axi_a_awid = 4'd0;
assign m_axi_a_awaddr = 64'd0;
assign m_axi_a_awlen = 8'd0;
assign m_axi_a_awsize = 3'd0;
assign m_axi_a_awburst = 2'd0;
assign m_axi_a_awlock = 2'd0;
assign m_axi_a_awcache = 4'd0;
assign m_axi_a_awprot = 3'd0;
assign m_axi_a_awqos = 3'd0;
assign m_axi_a_awregion = 4'd0;
assign m_axi_a_awuser = 1'd0;
assign m_axi_a_awvalid = 1'b0;
assign m_axi_a_wdata = 256'd0;
assign m_axi_a_wstrb = 32'd0;
assign m_axi_a_wlast = 1'b0;
assign m_axi_a_wuser = 1'd0;
assign m_axi_a_wvalid = 1'b0;
assign m_axi_a_bready = 1'b0;


// Instantiate DMA for B (read) - 32x32 matrix = 1024 bytes  
axi_dma_rd #(
    .AXI_DATA_WIDTH(256),
    .AXI_ADDR_WIDTH(64),
    .AXI_ID_WIDTH(4),
    .AXIS_DATA_WIDTH(256),
    .AXIS_KEEP_WIDTH(32),
    .AXIS_LAST_ENABLE(1),
    .AXIS_ID_ENABLE(0),
    .AXIS_DEST_ENABLE(0),
    .AXIS_USER_ENABLE(0),
    .LEN_WIDTH(20),
    .TAG_WIDTH(8),
    .ENABLE_SG(0),
    .ENABLE_UNALIGNED(0)
) dma_b (
    .clk(clk),
    .rst(rst),
    // Descriptor input
    .s_axis_read_desc_addr(b_addr_reg),
    .s_axis_read_desc_len(20'd1024),  // 1024 bytes for 32x32 int8
    .s_axis_read_desc_tag(8'd0),
    .s_axis_read_desc_id(8'd0),
    .s_axis_read_desc_dest(8'd0),
    .s_axis_read_desc_user(1'b0),
    .s_axis_read_desc_valid(dma_b_desc_valid),
    .s_axis_read_desc_ready(dma_b_desc_ready),
    // Status output
    .m_axis_read_desc_status_tag(),
    .m_axis_read_desc_status_error(),
    .m_axis_read_desc_status_valid(dma_b_status_valid),
    // Data output stream
    .m_axis_read_data_tdata(b_stream_tdata),
    .m_axis_read_data_tkeep(),
    .m_axis_read_data_tvalid(b_stream_tvalid),
    .m_axis_read_data_tready(b_stream_tready),
    .m_axis_read_data_tlast(b_stream_tlast),
    .m_axis_read_data_tid(),
    .m_axis_read_data_tdest(),
    .m_axis_read_data_tuser(),
    // AXI interface
    .m_axi_arid(m_axi_b_arid),
    .m_axi_araddr(m_axi_b_araddr),
    .m_axi_arlen(m_axi_b_arlen),
    .m_axi_arsize(m_axi_b_arsize),
    .m_axi_arburst(m_axi_b_arburst),
    .m_axi_arlock(m_axi_b_arlock),
    .m_axi_arcache(m_axi_b_arcache),
    .m_axi_arprot(m_axi_b_arprot),
    .m_axi_arvalid(m_axi_b_arvalid),
    .m_axi_arready(m_axi_b_arready),
    .m_axi_rid(m_axi_b_rid),
    .m_axi_rdata(m_axi_b_rdata),
    .m_axi_rresp(m_axi_b_rresp),
    .m_axi_rlast(m_axi_b_rlast),
    .m_axi_rvalid(m_axi_b_rvalid),
    .m_axi_rready(m_axi_b_rready),
    // Configuration
    .enable(1'b1)
);

// Drive optional AXI signals not provided by axi_dma_rd
assign m_axi_b_arqos = 3'd0;
assign m_axi_b_arregion = 4'd0;
assign m_axi_b_aruser = 1'd0;

// Tie off unused write channel for B
assign m_axi_b_awid = 4'd0;
assign m_axi_b_awaddr = 64'd0;
assign m_axi_b_awlen = 8'd0;
assign m_axi_b_awsize = 3'd0;
assign m_axi_b_awburst = 2'd0;
assign m_axi_b_awlock = 2'd0;
assign m_axi_b_awcache = 4'd0;
assign m_axi_b_awprot = 3'd0;
assign m_axi_b_awqos = 3'd0;
assign m_axi_b_awregion = 4'd0;
assign m_axi_b_awuser = 1'd0;
assign m_axi_b_awvalid = 1'b0;
assign m_axi_b_wdata = 256'd0;
assign m_axi_b_wstrb = 32'd0;
assign m_axi_b_wlast = 1'b0;
assign m_axi_b_wuser = 1'd0;
assign m_axi_b_wvalid = 1'b0;
assign m_axi_b_bready = 1'b0;


// Instantiate DMA for C (write) - 32x32 matrix of int16 = 2048 bytes
axi_dma_wr #(
    .AXI_DATA_WIDTH(512),
    .AXI_ADDR_WIDTH(64),
    .AXI_ID_WIDTH(4),
    .AXIS_DATA_WIDTH(512),
    .AXIS_KEEP_WIDTH(64),
    .AXIS_LAST_ENABLE(1),
    .AXIS_ID_ENABLE(0),
    .AXIS_DEST_ENABLE(0),
    .AXIS_USER_ENABLE(0),
    .LEN_WIDTH(20),
    .TAG_WIDTH(8),
    .ENABLE_SG(0),
    .ENABLE_UNALIGNED(0)
) dma_c (
    .clk(clk),
    .rst(rst),
    // Descriptor input
    .s_axis_write_desc_addr(c_addr_reg),
    .s_axis_write_desc_len(20'd2048),  // 2048 bytes for 32x32 int16
    .s_axis_write_desc_tag(8'd0),
    .s_axis_write_desc_valid(dma_c_desc_valid),
    .s_axis_write_desc_ready(dma_c_desc_ready),
    // Status output
    .m_axis_write_desc_status_len(),
    .m_axis_write_desc_status_tag(),
    .m_axis_write_desc_status_id(),
    .m_axis_write_desc_status_dest(),
    .m_axis_write_desc_status_user(),
    .m_axis_write_desc_status_error(),
    .m_axis_write_desc_status_valid(dma_c_status_valid),
    // Data input stream
    .s_axis_write_data_tdata(c_stream_tdata),
    .s_axis_write_data_tkeep(64'hFFFFFFFFFFFFFFFF),
    .s_axis_write_data_tvalid(c_stream_tvalid),
    .s_axis_write_data_tready(c_stream_tready),
    .s_axis_write_data_tlast(c_stream_tlast),
    .s_axis_write_data_tid(8'd0),
    .s_axis_write_data_tdest(8'd0),
    .s_axis_write_data_tuser(1'b0),
    // AXI interface
    .m_axi_awid(m_axi_c_awid),
    .m_axi_awaddr(m_axi_c_awaddr),
    .m_axi_awlen(m_axi_c_awlen),
    .m_axi_awsize(m_axi_c_awsize),
    .m_axi_awburst(m_axi_c_awburst),
    .m_axi_awlock(m_axi_c_awlock),
    .m_axi_awcache(m_axi_c_awcache),
    .m_axi_awprot(m_axi_c_awprot),
    .m_axi_awvalid(m_axi_c_awvalid),
    .m_axi_awready(m_axi_c_awready),
    .m_axi_wdata(m_axi_c_wdata),
    .m_axi_wstrb(m_axi_c_wstrb),
    .m_axi_wlast(m_axi_c_wlast),
    .m_axi_wvalid(m_axi_c_wvalid),
    .m_axi_wready(m_axi_c_wready),
    .m_axi_bid(m_axi_c_bid),
    .m_axi_bresp(m_axi_c_bresp),
    .m_axi_bvalid(m_axi_c_bvalid),
    .m_axi_bready(m_axi_c_bready),
    // Configuration
    .enable(1'b1),
    .abort(1'b0)
);

// Tie off unused read channel for C
assign m_axi_c_arid = 4'd0;
assign m_axi_c_araddr = 64'd0;
assign m_axi_c_arlen = 8'd0;
assign m_axi_c_arsize = 3'd0;
assign m_axi_c_arburst = 2'd0;
assign m_axi_c_arlock = 2'd0;
assign m_axi_c_arcache = 4'd0;
assign m_axi_c_arprot = 3'd0;
assign m_axi_c_arqos = 3'd0;
assign m_axi_c_arregion = 4'd0;
assign m_axi_c_aruser = 1'd0;
assign m_axi_c_arvalid = 1'b0;
assign m_axi_c_rready = 1'b0;
assign m_axi_c_awqos = 3'd0;
assign m_axi_c_awregion = 4'd0;
assign m_axi_c_awuser = 1'd0;
assign m_axi_c_wuser = 1'd0;


// Instantiate int8_32x32_wrapper - streams in A/B, streams out C
int8_32x32_wrapper wrapper (
    .ap_clk(clk),
    .ap_rst(rst),
    .ap_ce(1'b1),
    .ap_idle(wrapper_idle),
    .ap_start(wrapper_start),
    .ap_ready(wrapper_ready),
    .ap_done(wrapper_done),
    .ap_continue(1'b1),  // Always ready to accept new data
    // A input stream
    .a_tdata(a_stream_tdata),
    .a_tvalid(a_stream_tvalid),
    .a_tready(a_stream_tready),
    // B input stream
    .b_tdata(b_stream_tdata),
    .b_tvalid(b_stream_tvalid),
    .b_tready(b_stream_tready),
    // C output stream
    .c_tdata(c_stream_tdata),
    .c_tvalid(c_stream_tvalid),
    .c_tready(c_stream_tready)
);

// Wrapper starts when data is available
assign wrapper_start = (state == RUNNING);

// Generate tlast signals for proper framing
// For A and B: last transfer is the 32nd beat (256-bit beats)
reg [5:0] a_beat_count;
reg [5:0] b_beat_count;
reg [5:0] c_beat_count;

always @(posedge clk) begin
    if (rst || state == IDLE) begin
        a_beat_count <= 0;
        b_beat_count <= 0;
        c_beat_count <= 0;
    end else begin
        if (a_stream_tvalid && a_stream_tready) begin
            if (a_beat_count == 31)
                a_beat_count <= 0;
            else
                a_beat_count <= a_beat_count + 1;
        end
        
        if (b_stream_tvalid && b_stream_tready) begin
            if (b_beat_count == 31)
                b_beat_count <= 0;
            else
                b_beat_count <= b_beat_count + 1;
        end
        
        if (c_stream_tvalid && c_stream_tready) begin
            if (c_beat_count == 31)
                c_beat_count <= 0;
            else
                c_beat_count <= c_beat_count + 1;
        end
    end
end

assign c_stream_tlast = (c_beat_count == 31) && c_stream_tvalid;


// Main control state machine - implements HLS dataflow behavior
// Unlike sequential approach, this launches all DMAs concurrently
always @(posedge clk) begin
    if (rst) begin
        state <= IDLE;
        dma_a_desc_valid <= 0;
        dma_b_desc_valid <= 0;
        dma_c_desc_valid <= 0;
        dma_a_done_r <= 0;
        dma_b_done_r <= 0;
        dma_c_done_r <= 0;
        ap_start_r <= 0;
        interrupt <= 0;
    end else begin
        // Detect rising edge of ap_start
        ap_start_r <= ap_start;
        
        // Track DMA completion
        if (dma_a_status_valid)
            dma_a_done_r <= 1;
        if (dma_b_status_valid)
            dma_b_done_r <= 1;
        if (dma_c_status_valid)
            dma_c_done_r <= 1;
        
        case (state)
            IDLE: begin
                if (ap_start && !ap_start_r) begin
                    // Start all DMAs concurrently (dataflow behavior)
                    dma_a_desc_valid <= 1;
                    dma_b_desc_valid <= 1;
                    dma_c_desc_valid <= 1;
                    dma_a_done_r <= 0;
                    dma_b_done_r <= 0;
                    dma_c_done_r <= 0;
                    state <= RUNNING;
                    interrupt <= 0;
                end
            end
            
            RUNNING: begin
                // Clear descriptor valid after accepted
                if (dma_a_desc_ready)
                    dma_a_desc_valid <= 0;
                if (dma_b_desc_ready)
                    dma_b_desc_valid <= 0;
                if (dma_c_desc_ready)
                    dma_c_desc_valid <= 0;
                
                // Wait for all DMAs to complete
                if (dma_a_done_r && dma_b_done_r && dma_c_done_r) begin
                    state <= DONE;
                    interrupt <= 1;
                end
            end
            
            DONE: begin
                // Stay in done until cleared by writing ap_start = 0
                if (!ap_start) begin
                    state <= IDLE;
                    interrupt <= 0;
                end
            end
            
            default: state <= IDLE;
        endcase
    end
end

// Register interface - handle reads and writes to control registers
assign reg_rd_data = (reg_rd_addr[5:2] == 0)  ? control_reg :
                     (reg_rd_addr[5:2] == 4)  ? a_addr_reg[31:0] :
                     (reg_rd_addr[5:2] == 5)  ? a_addr_reg[63:32] :
                     (reg_rd_addr[5:2] == 6)  ? b_addr_reg[31:0] :
                     (reg_rd_addr[5:2] == 7)  ? b_addr_reg[63:32] :
                     (reg_rd_addr[5:2] == 8)  ? c_addr_reg[31:0] :
                     (reg_rd_addr[5:2] == 9)  ? c_addr_reg[63:32] :
                     32'd0;

always @(posedge clk) begin
    if (rst) begin
        control_reg <= 32'h4;  // ap_idle = 1
        a_addr_reg <= 0;
        b_addr_reg <= 0;
        c_addr_reg <= 0;
    end else begin
        // Update control register status bits
        control_reg[1] <= (state == DONE);      // ap_done
        control_reg[2] <= (state == IDLE);      // ap_idle
        control_reg[3] <= (state == IDLE);      // ap_ready
        
        // Handle register writes
        if (reg_wr_en) begin
            case (reg_wr_addr[5:2])
                0: control_reg[0] <= reg_wr_data[0];  // ap_start (bit 0)
                4: a_addr_reg[31:0] <= reg_wr_data;
                5: a_addr_reg[63:32] <= reg_wr_data;
                6: b_addr_reg[31:0] <= reg_wr_data;
                7: b_addr_reg[63:32] <= reg_wr_data;
                8: c_addr_reg[31:0] <= reg_wr_data;
                9: c_addr_reg[63:32] <= reg_wr_data;
            endcase
        end
    end
end

endmodule
