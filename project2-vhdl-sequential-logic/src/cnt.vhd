library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cnt is
    Port (
        CLK : in  STD_LOGIC;
        LD  : in  STD_LOGIC;
        EN  : in  STD_LOGIC;
        UD  : in  STD_LOGIC;
        D   : in  STD_LOGIC_VECTOR (3 downto 0);
        Q   : buffer STD_LOGIC_VECTOR (3 downto 0);
        RCO : out STD_LOGIC
    );
end cnt;

architecture Behavioral of cnt is
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            -- LD has highest priority
            if LD = '1' then
                Q <= D;
            -- if not loading, check enable
            elsif EN = '1' then
                if UD = '0' then
                    Q <= Q - 1;
                else
                    Q <= Q + 1;
                end if;
            -- hold value if EN = 0
            else
                Q <= Q;
            end if;
        end if;
    end process;

    -- ripple-carry output at the terminal count for the selected direction
    RCO <= '1' when ((LD = '0') and (EN = '1') and (UD = '0') and (Q = "0000")) or
                    ((LD = '0') and (EN = '1') and (UD = '1') and (Q = "1111"))
           else '0';
end Behavioral;
