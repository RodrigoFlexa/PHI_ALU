library verilog;
use verilog.vl_types.all;
entity alu_vlg_check_tst is
    port(
        display_7_seg   : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end alu_vlg_check_tst;
