library verilog;
use verilog.vl_types.all;
entity processor_4004_tb is
    generic(
        period          : integer := 2
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of period : constant is 1;
end processor_4004_tb;
