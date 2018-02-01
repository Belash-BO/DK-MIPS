library verilog;
use verilog.vl_types.all;
entity Data_Bus_Buffer_tb is
    generic(
        period          : integer := 1
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of period : constant is 1;
end Data_Bus_Buffer_tb;
