vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/clocking/mig_7series_v4_2_clk_ibuf.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/clocking/mig_7series_v4_2_infrastructure.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/clocking/mig_7series_v4_2_iodelay_ctrl.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/clocking/mig_7series_v4_2_tempmon.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_arb_mux.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_arb_row_col.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_arb_select.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_bank_cntrl.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_bank_common.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_bank_compare.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_bank_mach.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_bank_queue.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_bank_state.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_col_mach.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_mc.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_rank_cntrl.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_rank_common.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_rank_mach.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/controller/mig_7series_v4_2_round_robin_arb.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/ecc/mig_7series_v4_2_ecc_buf.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/ecc/mig_7series_v4_2_ecc_dec_fix.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/ecc/mig_7series_v4_2_ecc_gen.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/ecc/mig_7series_v4_2_ecc_merge_enc.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/ecc/mig_7series_v4_2_fi_xor.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/ip_top/mig_7series_v4_2_mem_intfc.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_group_io.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_lane.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_calib_top.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_if_post_fifo.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy_wrapper.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_of_pre_fifo.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_4lanes.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ck_addr_cmd_delay.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal_hr.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_init.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_cntlr.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_data.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_edge.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_lim.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_mux.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_po_cntlr.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_samp.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_oclkdelay_cal.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_prbs_rdlvl.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_rdlvl.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_tempmon.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrcal.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl_off_delay.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_prbs_gen.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_skip_calib_tap.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_poc_cc.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_poc_edge_store.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_poc_meta.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_poc_pd.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_poc_tap_base.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_poc_top.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/ui/mig_7series_v4_2_ui_cmd.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/ui/mig_7series_v4_2_ui_rd_data.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/ui/mig_7series_v4_2_ui_top.v" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/ui/mig_7series_v4_2_ui_wr_data.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_top.vhd" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/mig_7series_mig_sim.vhd" \
"../../../../UT_DRAM.srcs/sources_1/ip/mig_7series/mig_7series/user_design/rtl/mig_7series.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

