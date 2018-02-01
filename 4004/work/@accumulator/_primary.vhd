library verilog;
use verilog.vl_types.all;
entity Accumulator is
    port(
        data_bus        : inout  vl_logic_vector(3 downto 0);
        accumulator_enable: in     vl_logic_vector(1 downto 0);
        A               : out    vl_logic_vector(3 downto 0)
    );
end Accumulator;
