library verilog;
use verilog.vl_types.all;
entity girlanda_vlg_check_tst is
    port(
        green           : in     vl_logic_vector(3 downto 0);
        red             : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end girlanda_vlg_check_tst;
