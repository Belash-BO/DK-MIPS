library verilog;
use verilog.vl_types.all;
entity processor_4004 is
    port(
        reset           : in     vl_logic;
        clk_1           : in     vl_logic;
        clk_2           : in     vl_logic;
        D0_D3           : in     vl_logic_vector(3 downto 0);
        carry_out       : out    vl_logic;
        data_bus        : out    vl_logic_vector(3 downto 0)
    );
end processor_4004;
