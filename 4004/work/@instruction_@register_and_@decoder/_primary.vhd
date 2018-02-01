library verilog;
use verilog.vl_types.all;
entity Instruction_Register_and_Decoder is
    port(
        data_bus        : in     vl_logic_vector(3 downto 0);
        clk_1           : in     vl_logic;
        clk_2           : in     vl_logic;
        instruction_register_WE: in     vl_logic;
        instruction_decoder: out    vl_logic_vector(7 downto 0)
    );
end Instruction_Register_and_Decoder;
