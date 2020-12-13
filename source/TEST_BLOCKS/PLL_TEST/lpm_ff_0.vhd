-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 19.1.0 Build 670 09/22/2019 Patches 0.02std SJ Lite Edition"
-- CREATED		"Sun Dec 13 14:44:06 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
-- use the following when compiling in Quartus Prime
--LIBRARY lpm;
--USE lpm.lpm_components.all; 

-- use the following when compiling in third party tools --
-- add lpm_pack.vhd from the Quartus Prime library
LIBRARY work;
USE work.lpm_components.all;

ENTITY lpm_ff_0 IS 
PORT 
( 
	enable	:	IN	 STD_LOGIC;
	clock	:	IN	 STD_LOGIC;
	sload	:	IN	 STD_LOGIC;
	data	:	IN	 STD_LOGIC_VECTOR(7 DOWNTO 0);
	q	:	OUT	 STD_LOGIC_VECTOR(7 DOWNTO 0)
); 
END lpm_ff_0;

ARCHITECTURE bdf_type OF lpm_ff_0 IS 
BEGIN 

-- instantiate LPM macrofunction 

b2v_inst1 : lpm_ff
GENERIC MAP(LPM_FFTYPE => "TFF",
			LPM_WIDTH => 8)
PORT MAP(enable => enable,
		 clock => clock,
		 sload => sload,
		 data => data,
		 q => q);

END bdf_type; 