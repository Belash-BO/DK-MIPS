library verilog;
use verilog.vl_types.all;
entity signExtend is
    port(
        i_data          : in     vl_logic_vector(15 downto 0);
        o_data          : out    vl_logic_vector(31 downto 0);
        ext_op          : in     vl_logic
    );
end signExtend;
