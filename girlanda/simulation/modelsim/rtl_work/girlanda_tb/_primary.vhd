library verilog;
use verilog.vl_types.all;
entity girlanda_tb is
    generic(
        period          : integer := 2500
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of period : constant is 1;
end girlanda_tb;
