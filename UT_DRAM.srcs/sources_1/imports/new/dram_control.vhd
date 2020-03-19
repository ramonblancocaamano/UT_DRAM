----------------------------------------------------------------------------------
-- @FILE : dram_control.vhd 
-- @AUTHOR: BLANCO CAAMANO, RAMON. <ramonblancocaamano@gmail.com> 
-- 
-- @ABOUT: .
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY dram_control IS
    GENERIC( 
        AW : INTEGER;
        DDRWIDTH : INTEGER;
        NDATA : INTEGER;
        NACK : INTEGER;
        DW : INTEGER;
        SELW : INTEGER
    );
    PORT(
        rst : IN STD_LOGIC;    
        clk_81 : IN STD_LOGIC;        
        dout: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        rd_trigger: IN STD_LOGIC; 
        wr_trigger : OUT STD_LOGIC;
        wr_trigger_ok : IN STD_LOGIC; 
        wr_continue : IN STD_LOGIC;
        wr_continue_ok : OUT STD_LOGIC;
        i_buff_rd_en: OUT STD_LOGIC;
        i_buff_empty: IN STD_LOGIC;
        o_buff_wr_en: OUT STD_LOGIC;
        dram_rst : OUT STD_LOGIC;           
        dram_wb_cyc : OUT STD_LOGIC;
        dram_wb_stb : OUT STD_LOGIC;
        dram_wb_we : OUT STD_LOGIC;
        dram_wb_addr : OUT STD_LOGIC_VECTOR((AW-1) DOWNTO 0);        
        dram_wb_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        dram_wb_ack : IN STD_LOGIC;
        dram_wb_stall : IN STD_LOGIC;
        dram_wb_err : IN STD_LOGIC       
    );
END dram_control;

ARCHITECTURE behavioral OF dram_control IS

    TYPE ST_DRAM IS (IDLE, SEND, RECEIVE, WAIT_FOR);
    SIGNAL dram_state : ST_DRAM := IDLE;
    
    SIGNAL dc_dout: STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dc_wr_trigger : STD_LOGIC := '0';
    SIGNAL dc_wr_continue_ok : STD_LOGIC := '0';
    SIGNAL dc_i_buff_rd_en: STD_LOGIC := '0';
    SIGNAL dc_dram_rst : STD_LOGIC := '0';             
    SIGNAL dc_dram_wb_cyc : STD_LOGIC := '0';  
    SIGNAL dc_dram_wb_stb : STD_LOGIC := '0';  
    SIGNAL dc_dram_wb_we : STD_LOGIC := '0';  
    SIGNAL dc_dram_wb_addr : STD_LOGIC_VECTOR((AW-1) DOWNTO 0) := (OTHERS => '0'); 
    SIGNAL dc_o_buff_wr_en : STD_LOGIC := '0';
    SIGNAL full: INTEGER := 0;
        
BEGIN

    dout <= dc_dout;
    wr_trigger <= dc_wr_trigger;
    wr_continue_ok <= dc_wr_continue_ok;
    i_buff_rd_en <= dc_i_buff_rd_en;
    
    dram_rst <= dc_dram_rst;             
    dram_wb_cyc <= dc_dram_wb_cyc;  
    dram_wb_stb <= dc_dram_wb_stb;  
    dram_wb_we <= dc_dram_wb_we;  
    dram_wb_addr <= dc_dram_wb_addr;  
    o_buff_wr_en <= dc_o_buff_wr_en;      
    
    
   PROCESS(rst, clk_81, rd_trigger, wr_trigger_ok, wr_continue, i_buff_empty, dram_wb_data, dram_wb_ack, dram_wb_stall, dram_wb_err, dc_dout, 
        dram_state, dc_wr_trigger, dc_wr_continue_ok, dc_i_buff_rd_en, dc_dram_rst, dc_dram_wb_cyc, 
        dc_dram_wb_stb, dc_dram_wb_we, dc_dram_wb_addr, dc_o_buff_wr_en, full)
     
        VARIABLE dram : INTEGER := 0;
        VARIABLE addr: INTEGER := 0; 
        VARIABLE ack: INTEGER := 0;   
    
    BEGIN
    
        IF rst = '1' THEN
                dram := 0;
                addr := 0;
                ack := 0;
                full <= 0;                
                dc_dout <= (OTHERS => '0');
                dc_wr_trigger <= '0'; 
                dc_o_buff_wr_en <= '0';                
                dc_dram_rst <= '0';                
                dc_dram_wb_cyc <= '0';
                dc_dram_wb_stb <= '0';                
                dc_dram_wb_we <= '0';                
                dc_dram_wb_addr <= (OTHERS => '0');               
                dram_state <= IDLE;
                
       ELSIF RISING_EDGE(clk_81) THEN                    
                IF dram_wb_ack = '1' THEN   
                    ack := ack + 1;
                END IF;
                IF wr_trigger_ok = '1' THEN
                    dc_wr_trigger <= '0';
                END IF;
                CASE dram_state IS
                
                    WHEN IDLE =>
                    
                        dram := 0;
                        ack := 0; 
                        dc_dout <= (OTHERS => '0'); 
                        dc_o_buff_wr_en <= '0';
                        dc_dram_rst <= '1';                                           
                        dc_dram_wb_cyc <= '0';
                        dc_dram_wb_stb <= '0';
                        dc_dram_wb_we <= '0';
                        dc_dram_wb_addr <= (OTHERS => '0');                                         
                        IF rd_trigger = '1' THEN   
                            dram_state <= SEND;
                        END IF;                       
                        IF full = 32768 THEN                           
                            addr := 0;
                            full <= 0;
                            dram_state <= RECEIVE;
                        END IF;                    
                    
                    WHEN SEND =>
                    
                        IF dram < NDATA/2 AND dram_wb_stall = '0'  THEN                                                          
                            dc_dram_wb_cyc <= '1';
                            dc_dram_wb_stb <= '1';
                            dc_dram_wb_we <= '1';
                            dc_dram_wb_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(addr,AW));
                            dram := dram + 1;
                            addr := addr + 1;                         
                        ELSIF dram_wb_stall = '0' THEN
                            dc_dram_wb_stb <= '0';
                        END IF;
                        IF dc_dram_wb_stb = '0' AND dram_wb_ack = '1' AND ack = NACK THEN
                            dram := 0;
                            ack := 0;
                            full <= full + 1;
                            dc_dram_wb_cyc <= '0';                            
                            dram_state <= IDLE;
                        END IF;
                    
                    WHEN RECEIVE =>
                    
                        IF wr_continue = '0' THEN
                            dc_wr_continue_ok <= '0';
                        END if;                                                           
                        IF dram < NDATA/2 AND dram_wb_stall = '0'THEN
                            dc_dram_wb_cyc <= '1';
                            dc_dram_wb_stb <= '1';                            
                            dc_dram_wb_we <= '0';
                            dc_dram_wb_addr <= STD_LOGIC_VECTOR(TO_UNSIGNED(addr,AW)); 
                            dram := dram + 1;
                            addr := addr + 1;
                        ELSIF dram_wb_stall = '0' then
                            dc_dram_wb_stb <= '0';
                        END if;                        
                        IF dram_wb_ack = '1' THEN
                            dc_dout <= dram_wb_data;
                            dc_o_buff_wr_en <= '1';
                        ELSE 
                            dc_o_buff_wr_en <= '0';
                        END if;                        
                        IF dc_dram_wb_stb = '0' AND dram_wb_ack = '1' AND ack = NACK THEN
                            dram := 0;
                            ack := 0;
                            full <= full + 1;
                            dc_wr_trigger <= '1';
                            dc_dram_wb_cyc <= '0';                                                       
                            dram_state <= WAIT_FOR;
                        END IF;
                    
                    WHEN WAIT_FOR =>
                    
                        IF dram_wb_ack = '1' THEN
                            dc_dout <= dram_wb_data;
                            dc_o_buff_wr_en <= '1';
                        ELSE 
                            dc_o_buff_wr_en <= '0';
                        END IF;
                        IF full = 32768 AND wr_trigger_ok = '1' THEN                            
                            addr := 0;
                            full <= 0;
                            dram_state <= IDLE;                        
                        ELSIF wr_continue = '1' THEN
                            dc_wr_continue_ok <= '1';
                            dram_state <= RECEIVE;
                        END IF;
                    
                END CASE;
            END IF;
    END PROCESS;
                                            
    dc_i_buff_rd_en <= '1' WHEN dram_wb_stall = '0' AND i_buff_empty = '0' AND dram_state = SEND 
                    ELSE '0';
    
END behavioral;
