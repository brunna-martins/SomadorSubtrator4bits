library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Result : out STD_LOGIC_VECTOR (3 downto 0));
end or4;

architecture Behavioral of or4 is

    component or1 
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               result : out STD_LOGIC);
    end component;

begin

    sum1: or1 port map (a=>A(0), b=>B(0), result=>Result(0));
    sum2: or1 port map (a=>A(1), b=>B(1), result=>Result(1));
    sum3: or1 port map (a=>A(2), b=>B(2), result=>Result(2));
    sum4: or1 port map (a=>A(3), b=>B(3), result=>Result(3));

end Behavioral;
