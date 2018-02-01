library verilog;
use verilog.vl_types.all;
entity Temp_Register is
    port(
        data_bus        : in     vl_logic_vector(3 downto 0);
        temp_register_enable: in     vl_logic;
        B               : out    vl_logic_vector(3 downto 0)
    );
end Temp_Register;
