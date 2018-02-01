library verilog;
use verilog.vl_types.all;
entity girlanda is
    port(
        clk             : in     vl_logic;
        button          : in     vl_logic;
        reset           : in     vl_logic;
        red             : out    vl_logic_vector(4 downto 0);
        green           : out    vl_logic_vector(4 downto 0)
    );
end girlanda;
