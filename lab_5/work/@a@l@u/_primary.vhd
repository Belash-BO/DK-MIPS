library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        alu_control     : in     vl_logic_vector(3 downto 0);
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        Result          : out    vl_logic_vector(31 downto 0);
        \OF\            : out    vl_logic;
        ZF              : out    vl_logic
    );
end ALU;
