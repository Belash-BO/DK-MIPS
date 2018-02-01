library verilog;
use verilog.vl_types.all;
entity MIPS is
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        \OF\            : out    vl_logic;
        ZF              : out    vl_logic
    );
end MIPS;
