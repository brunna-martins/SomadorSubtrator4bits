library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity and1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           result : out STD_LOGIC);
end and1;

architecture Behavioral of and1 is

begin

    result <= a and b;

end Behavioral;
