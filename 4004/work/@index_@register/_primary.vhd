library verilog;
use verilog.vl_types.all;
entity Index_Register is
    port(
        index_register_select: in     vl_logic_vector(3 downto 0);
        index_register_IO: in     vl_logic_vector(1 downto 0);
        index_register_I_WE: in     vl_logic;
        reset           : in     vl_logic;
        data_bus        : inout  vl_logic_vector(3 downto 0)
    );
end Index_Register;
