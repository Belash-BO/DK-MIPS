library verilog;
use verilog.vl_types.all;
entity next_pc is
    port(
        inc_pc          : in     vl_logic_vector(31 downto 0);
        imm26           : in     vl_logic_vector(25 downto 0);
        zero            : in     vl_logic;
        beq             : in     vl_logic;
        bne             : in     vl_logic;
        j               : in     vl_logic;
        result          : out    vl_logic_vector(31 downto 0);
        pc_src          : out    vl_logic
    );
end next_pc;
