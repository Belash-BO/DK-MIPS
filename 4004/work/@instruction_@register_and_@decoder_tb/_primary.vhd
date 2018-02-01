library verilog;
use verilog.vl_types.all;
entity Instruction_Register_and_Decoder_tb is
    generic(
        period          : integer := 2
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of period : constant is 1;
end Instruction_Register_and_Decoder_tb;
