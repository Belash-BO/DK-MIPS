library verilog;
use verilog.vl_types.all;
entity Control is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        reg_dst         : out    vl_logic;
        reg_write       : out    vl_logic;
        ext_op          : out    vl_logic;
        ALU_scr         : out    vl_logic;
        beq             : out    vl_logic;
        bne             : out    vl_logic;
        j               : out    vl_logic;
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        mem_to_reg      : out    vl_logic
    );
end Control;
