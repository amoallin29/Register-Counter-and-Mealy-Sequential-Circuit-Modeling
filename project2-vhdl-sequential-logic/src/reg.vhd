library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
    Port (
        CLK  : in  STD_LOGIC;
        CLRN : in  STD_LOGIC;
        S1   : in  STD_LOGIC;
        S0   : in  STD_LOGIC;
        D    : in  STD_LOGIC_VECTOR (3 downto 0);
        RSI  : in  STD_LOGIC;
        LSI  : in  STD_LOGIC;
        Q    : buffer STD_LOGIC_VECTOR (3 downto 0)
    );
end reg;

architecture Behavioral of reg is
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            -- synchronous active-low clear
            if CLRN = '0' then
                Q <= "0000";
            -- hold
            elsif (S1 = '0' and S0 = '0') then
                Q <= Q;
            -- shift right
            elsif (S1 = '0' and S0 = '1') then
                Q <= RSI & Q(3 downto 1);
            -- shift left
            elsif (S1 = '1' and S0 = '0') then
                Q <= Q(2 downto 0) & LSI;
            -- parallel load
            elsif (S1 = '1' and S0 = '1') then
                Q <= D;
            end if;
        end if;
    end process;
end Behavioral;
