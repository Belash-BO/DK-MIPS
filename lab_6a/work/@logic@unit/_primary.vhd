library verilog;
use verilog.vl_types.all;
entity LogicUnit is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        LO              : in     vl_logic_vector(1 downto 0);
        Result          : out    vl_logic_vector(31 downto 0)
    );
end LogicUnit;
