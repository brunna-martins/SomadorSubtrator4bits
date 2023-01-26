library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity soma_sub4 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           r : buffer STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC;
           over : out STD_LOGIC);
end soma_sub4;

architecture Behavioral of soma_sub4 is

    component and4 
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Result : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component or4 
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Result : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component comp1 
        Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
               sel : in STD_LOGIC;
               s : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component detector_overflow 
        Port ( x : in STD_LOGIC;
               y : in STD_LOGIC;
               z : in STD_LOGIC;
               over : out STD_LOGIC);
    end component;
    
    component soma4 
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Cin : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               Cout : out STD_LOGIC);
    end component;

    signal sig1, sig2, sigsomasub, sigand, sigor: STD_LOGIC_VECTOR (3 downto 0);
    signal sigover, sigcout: STD_LOGIC;

begin
    c1: comp1 port map (x=>b, sel=>sel(0), s=>sig1);
                
    c2: detector_overflow port map (x=>a(3), y=>b(3), z=>sig2(3), over=>sigover);
    c3: soma4 port map (A=>a, B=>sig1, Cin=>sel(0), S=>sig2, Cout=>sigcout);
                
    c4: and4 port map (A=>a,B=>b,Result=>sigand);
              
    c5: or4 port map (A=>a,B=>b,Result=>sigor);
    
    r <= sig2 when sel(1)='0' else
         sigand when sel="10" else
         sigor when sel="11";
         
    Cout <= sigcout when sel(1)='0' else
            ('0');
            
    over <= sigover when sel(1)='0' else
            ('0');
            
                               
--    Cout <= sigcout and r <= sig2 and over <= sigover when sel(1)='0' else 
--    r <= sigand when  sel="10" else
--    r => sigor;
   
end Behavioral;