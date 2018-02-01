library verilog;
use verilog.vl_types.all;
entity pc is
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        i_pc            : in     vl_logic_vector(31 downto 0);
        o_pc            : out    vl_logic_vector(31 downto 0)
    );
end pc;
