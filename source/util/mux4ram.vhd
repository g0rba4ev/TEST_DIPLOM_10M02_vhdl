-- mux for clocking RAM
library ieee;
use ieee.std_logic_1164.all;

-- sel=0 -> clk_50_Mhz on inclock
-- sel=1 -> clk_50_Mhz on outclock
entity mux4ram is
	port
	(
		clk_50_Mhz	: in std_logic;
		sel			: in std_logic;
		inclock		: out std_logic;
		outclock	: out std_logic
	);
end entity;


architecture rtl of mux4ram is
begin

	process(clk_50_Mhz, sel)
	begin
		if(sel = '0') then
			inclock  <= clk_50_Mhz;
			outclock <= 'Z';
		elsif(sel = '1') then
			inclock	 <= 'Z';
			outclock <= clk_50_Mhz;
		else
			inclock  <= 'Z';
			outclock <= 'Z';
		end if;
	end process;

end rtl;
