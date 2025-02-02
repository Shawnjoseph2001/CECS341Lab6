#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.2.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Fri Dec 18 00:05:09 PST 2020
# SW Build 2729669 on Thu Dec  5 04:48:12 MST 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim Datapath_tb_behav -key {Behavioral:sim_1:Functional:Datapath_tb} -tclbatch Datapath_tb.tcl -protoinst "protoinst_files/design_1.protoinst" -view /media/psf/Home/Documents/GitHub/CECS341Lab6/project_5/Datapath_tb_behav1.wcfg -log simulate.log"
xsim Datapath_tb_behav -key {Behavioral:sim_1:Functional:Datapath_tb} -tclbatch Datapath_tb.tcl -protoinst "protoinst_files/design_1.protoinst" -view /media/psf/Home/Documents/GitHub/CECS341Lab6/project_5/Datapath_tb_behav1.wcfg -log simulate.log

