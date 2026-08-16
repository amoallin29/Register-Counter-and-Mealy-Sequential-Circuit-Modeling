library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mealy is
    Port (
        CLK : in  STD_LOGIC;
        X   : in  STD_LOGIC;
        Z   : out STD_LOGIC
    );
end mealy;

architecture Behavioral of mealy is
    type state_type is (S0, S1, S2, S3, S4);
    signal present_state : state_type := S0;
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            case present_state is
                when S0 =>
                    if X = '0' then
                        present_state <= S1;
                    else
                        present_state <= S0;
                    end if;
                    Z <= '0';

                when S1 =>
                    if X = '0' then
                        present_state <= S1;
                    else
                        present_state <= S2;
                    end if;
                    Z <= '0';

                when S2 =>
                    if X = '1' then
                        present_state <= S3;
                    else
                        present_state <= S1;
                    end if;
                    Z <= '0';

                when S3 =>
                    if X = '0' then
                        present_state <= S4;
                    else
                        present_state <= S0;
                    end if;
                    Z <= '0';

                when S4 =>
                    if X = '1' then
                        present_state <= S2; -- overlap
                        Z <= '1';            -- detects 01101
                    else
                        present_state <= S1;
                        Z <= '0';
                    end if;
            end case;
        end if;
    end process;
end Behavioral;
