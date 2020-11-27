library ieee;
use ieee.std_logic_1164.all;

entity invertor is

	port 
	(
		input		: in std_logic;
		output	: out std_logic
	);

end entity;

architecture rtl of invertor is

begin
	output <= not input;
end rtl;