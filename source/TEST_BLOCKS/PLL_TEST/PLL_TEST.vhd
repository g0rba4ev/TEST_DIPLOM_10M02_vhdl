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

LIBRARY work;

ENTITY PLL_TEST IS 
	PORT
	(
		clk_50MHz :  IN  STD_LOGIC;
		tested_clk :  IN  STD_LOGIC;
		pll_ok :  OUT  STD_LOGIC
	);
END PLL_TEST;

ARCHITECTURE bdf_type OF PLL_TEST IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT lpm_ff_0
	PORT(enable : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 sload : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT;
ATTRIBUTE black_box OF lpm_ff_0: COMPONENT IS true;
ATTRIBUTE noopt OF lpm_ff_0: COMPONENT IS true;

COMPONENT counter
	PORT(sclr : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT copmarator
	PORT(dataa : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 aeb : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT constant01
	PORT(		 result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 
SYNTHESIZED_WIRE_5 <= '1';



b2v_inst : counter
PORT MAP(sclr => clk_50MHz,
		 clock => tested_clk,
		 q => SYNTHESIZED_WIRE_2);


b2v_inst1 : lpm_ff_0
PORT MAP(enable => SYNTHESIZED_WIRE_5,
		 clock => clk_50MHz,
		 sload => SYNTHESIZED_WIRE_5,
		 data => SYNTHESIZED_WIRE_2,
		 q => SYNTHESIZED_WIRE_3);


b2v_inst2 : copmarator
PORT MAP(dataa => SYNTHESIZED_WIRE_3,
		 datab => SYNTHESIZED_WIRE_4,
		 aeb => pll_ok);


b2v_inst3 : constant01
PORT MAP(		 result => SYNTHESIZED_WIRE_4);



END bdf_type;