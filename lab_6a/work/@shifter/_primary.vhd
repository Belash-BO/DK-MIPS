library verilog;
use verilog.vl_types.all;
entity Shifter is
    port(
        Data            : in     vl_logic_vector(31 downto 0);
        SRO             : in     vl_logic_vector(1 downto 0);
        SA              : in     vl_logic_vector(4 downto 0);
        Result          : out    vl_logic_vector(31 downto 0)
    );
end Shifter;
