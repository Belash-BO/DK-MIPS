library verilog;
use verilog.vl_types.all;
entity Control_Unit is
    port(
        reset           : in     vl_logic;
        clk_2           : in     vl_logic;
        instruction     : in     vl_logic_vector(7 downto 0);
        data_bus_buffer_enable: out    vl_logic;
        ALU_enable      : out    vl_logic;
        ALU_operation   : out    vl_logic;
        temp_register_enable: out    vl_logic;
        index_register_I_WE: out    vl_logic;
        instruction_register_WE: out    vl_logic;
        data_bus_buffer_path: out    vl_logic_vector(1 downto 0);
        accumulator_enable: out    vl_logic_vector(1 downto 0);
        index_register_IO: out    vl_logic_vector(1 downto 0);
        index_register_select: out    vl_logic_vector(3 downto 0);
        data_bus        : out    vl_logic_vector(3 downto 0)
    );
end Control_Unit;
