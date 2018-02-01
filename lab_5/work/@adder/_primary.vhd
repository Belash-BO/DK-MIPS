library verilog;
use verilog.vl_types.all;
entity Adder is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        AO              : in     vl_logic;
        Result          : out    vl_logic_vector(31 downto 0);
        \OF\            : out    vl_logic
    );
end Adder;
