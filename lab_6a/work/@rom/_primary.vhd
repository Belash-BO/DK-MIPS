library verilog;
use verilog.vl_types.all;
entity Rom is
    port(
        address         : in     vl_logic_vector(31 downto 0);
        data            : out    vl_logic_vector(31 downto 0)
    );
end Rom;
