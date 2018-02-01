library verilog;
use verilog.vl_types.all;
entity Alu_Control is
    port(
        alu_op          : in     vl_logic_vector(5 downto 0);
        alu_funct       : in     vl_logic_vector(5 downto 0);
        alu_control     : out    vl_logic_vector(3 downto 0)
    );
end Alu_Control;
