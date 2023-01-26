library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           result : out STD_LOGIC);
end or1;

architecture Behavioral of or1 is

begin

    result <= a or b;

end Behavioral;
