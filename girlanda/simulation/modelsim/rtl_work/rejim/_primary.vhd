library verilog;
use verilog.vl_types.all;
entity rejim is
    port(
        counter         : in     vl_logic_vector(1 downto 0);
        count_in        : in     vl_logic_vector(31 downto 0);
        r               : in     vl_logic;
        g               : in     vl_logic;
        red             : out    vl_logic_vector(4 downto 0);
        green           : out    vl_logic_vector(4 downto 0);
        count_out       : out    vl_logic;
        r_task          : out    vl_logic;
        g_task          : out    vl_logic
    );
end rejim;
