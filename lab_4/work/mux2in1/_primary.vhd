library verilog;
use verilog.vl_types.all;
entity mux2in1 is
    port(
        i_dat0          : in     vl_logic_vector(31 downto 0);
        i_dat1          : in     vl_logic_vector(31 downto 0);
        control         : in     vl_logic;
        o_dat           : out    vl_logic_vector(31 downto 0)
    );
end mux2in1;
