#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.2.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Mon Dec 07 20:04:12 PST 2020
# SW Build 2729669 on Thu Dec  5 04:48:12 MST 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto 492badede3b4491295cef8ff36086d43 --incr --debug all --relax --mt 32 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot Datapath_tb_behav xil_defaultlib.Datapath_tb xil_defaultlib.glbl -log elaborate.log"
xelab -wto 492badede3b4491295cef8ff36086d43 --incr --debug all --relax --mt 32 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot Datapath_tb_behav xil_defaultlib.Datapath_tb xil_defaultlib.glbl -log elaborate.log

