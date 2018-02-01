library verilog;
use verilog.vl_types.all;
entity Extender is
    port(
        Data            : in     vl_logic_vector(31 downto 0);
        SRO             : in     vl_logic_vector(1 downto 0);
        Result          : out    vl_logic_vector(62 downto 0)
    );
end Extender;
