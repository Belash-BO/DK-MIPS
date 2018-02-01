library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        ALU_operation   : in     vl_logic;
        ALU_enable      : in     vl_logic;
        data_bus        : out    vl_logic_vector(3 downto 0);
        carry_out       : out    vl_logic
    );
end ALU;
