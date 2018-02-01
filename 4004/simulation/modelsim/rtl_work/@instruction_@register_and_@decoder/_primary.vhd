library verilog;
use verilog.vl_types.all;
entity Instruction_Register_and_Decoder is
    port(
        Data            : in     vl_logic_vector(3 downto 0);
        Clk1            : in     vl_logic;
        Clk2            : in     vl_logic;
        Instruction_Decoder: out    vl_logic_vector(7 downto 0)
    );
end Instruction_Register_and_Decoder;
