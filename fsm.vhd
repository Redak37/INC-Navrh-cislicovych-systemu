-- fsm.vhd: Finite State Machine
-- Author(s): 
--
library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic;
   FSM_MX_MEM  : out std_logic;
   FSM_MX_LCD  : out std_logic;
   FSM_LCD_WR  : out std_logic;
   FSM_LCD_CLR : out std_logic
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (
	S00, S01, S02, S03, S04, S05, S06, S07, S08,
	S10, S11, S12, S13, S14, S15, S16, S17, S18,
	PRINT_MESSAGE, PRINT_FAIL,
	START, CORRECT, FAIL, FINISH);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') then
      present_state <= START;
   elsif (CLK'event AND CLK = '1') then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when START =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(1) = '1') then
	 next_state <= S00;
      elsif (KEY(3) = '1') then
	 next_state <= S10;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
	 next_state <= START;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S00 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(4) = '1') then
	 next_state <= S01;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S00;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S01 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(2) = '1') then
	 next_state <= S02;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S01;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S02 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(6) = '1') then
	 next_state <= S03;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S02;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S03 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(6) = '1') then
	 next_state <= S04;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S03;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S04 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(2) = '1') then
	 next_state <= S05;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S04;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S05 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(7) = '1') then
	 next_state <= S06;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S05;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S06 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(3) = '1') then
	 next_state <= S07;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S06;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S07 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(8) = '1') then
	 next_state <= S08;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S07;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S08 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(0) = '1') then
	 next_state <= CORRECT;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S08;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S10 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(9) = '1') then
	 next_state <= S11;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S10;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S11 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(2) = '1') then
	 next_state <= S12;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S11;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S12 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(3) = '1') then
	 next_state <= S13;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S12;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S13 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(2) = '1') then
	 next_state <= S14;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S13;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S14 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(2) = '1') then
	 next_state <= S15;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S14;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S15 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(5) = '1') then
	 next_state <= S16;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S15;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S16 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(2) = '1') then
	 next_state <= S17;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S16;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S17 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(9) = '1') then
	 next_state <= S18;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S17;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when S18 =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      elsif (KEY(6) = '1') then
	 next_state <= CORRECT;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
         next_state <= S18;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FAIL =>
      if (KEY(15) = '1') then
         next_state <= PRINT_FAIL;
      else
         next_state <= FAIL;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when CORRECT =>
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FAIL;
      else
	 next_state <= CORRECT;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_FAIL =>
      if (CNT_OF = '1') then
         next_state <= FINISH;
      else
         next_state <= PRINT_FAIL;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE =>
      if (CNT_OF = '1') then
         next_state <= FINISH;
      else
	 next_state <= PRINT_MESSAGE;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      if (KEY(15) = '1') then
         next_state <= START; 
      else
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
      next_state <= START;
   end case;
end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
      FSM_MX_MEM     <= '1';
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_FAIL =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
      if (KEY(14 downto 0) /= "000000000000000") then
         FSM_LCD_WR     <= '1';
      end if;
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   end case;
end process output_logic;

end architecture behavioral;

