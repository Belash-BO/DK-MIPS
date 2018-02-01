library verilog;
use verilog.vl_types.all;
entity Data_Bus_Buffer is
    port(
        D0_D3           : in     vl_logic_vector(3 downto 0);
        clk_2           : in     vl_logic;
        data_bus_buffer_enable: in     vl_logic;
        data_bus_buffer_path: in     vl_logic_vector(1 downto 0);
        data_bus        : inout  vl_logic_vector(3 downto 0)
    );
end Data_Bus_Buffer;
