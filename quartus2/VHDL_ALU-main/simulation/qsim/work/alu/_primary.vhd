library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        sel             : in     vl_logic_vector(3 downto 0);
        display_7_seg   : out    vl_logic_vector(6 downto 0)
    );
end alu;
