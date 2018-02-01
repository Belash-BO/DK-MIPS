library verilog;
use verilog.vl_types.all;
entity regFile is
    port(
        clk             : in     vl_logic;
        i_we            : in     vl_logic;
        reset_n         : in     vl_logic;
        i_raddr1        : in     vl_logic_vector(4 downto 0);
        i_raddr2        : in     vl_logic_vector(4 downto 0);
        i_waddr         : in     vl_logic_vector(4 downto 0);
        i_wdata         : in     vl_logic_vector(31 downto 0);
        o_rdata1        : out    vl_logic_vector(31 downto 0);
        o_rdata2        : out    vl_logic_vector(31 downto 0)
    );
end regFile;
