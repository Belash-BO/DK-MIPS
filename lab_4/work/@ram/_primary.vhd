library verilog;
use verilog.vl_types.all;
entity Ram is
    port(
        clk             : in     vl_logic;
        WE              : in     vl_logic;
        addr            : in     vl_logic_vector(31 downto 0);
        i_data          : in     vl_logic_vector(31 downto 0);
        o_data          : out    vl_logic_vector(31 downto 0)
    );
end Ram;
