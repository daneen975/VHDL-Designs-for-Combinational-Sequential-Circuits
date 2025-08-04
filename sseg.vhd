LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg IS
    PORT (
        bcd_id    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- BCD input for student ID digit
        bcd_state : IN  STD_LOGIC_VECTOR(2 DOWNTO 0); -- BCD input for FSM state (3 bits, since 8 states)
        leds_id   : OUT STD_LOGIC_VECTOR(0 TO 6);     -- 7-segment display for the student ID digit (right display)
        leds_state: OUT STD_LOGIC_VECTOR(0 TO 6)    -- 7-segment display for FSM state (left display)
       
    );
END sseg;

ARCHITECTURE Behavior OF sseg IS
BEGIN
    PROCESS (bcd_id, bcd_state)
    BEGIN
        -- Right display: showing student ID digit based on bcd_id
        CASE bcd_id IS  -- abcdefg segment representation for student ID
            WHEN "0000" => leds_id <= NOT ("1111110"); -- 0
            WHEN "0001" => leds_id <= NOT ("0110000"); -- 1
            WHEN "0010" => leds_id <= NOT ("1101101"); -- 2
            WHEN "0011" => leds_id <= NOT ("1111001"); -- 3
            WHEN "0100" => leds_id <= NOT ("0110011"); -- 4
            WHEN "0101" => leds_id <= NOT ("1011011"); -- 5
            WHEN "0110" => leds_id <= NOT ("1011111"); -- 6
            WHEN "0111" => leds_id <= NOT ("1110000"); -- 7
            WHEN "1000" => leds_id <= NOT ("1111111"); -- 8
            WHEN "1001" => leds_id <= NOT ("1110011"); -- 9
            WHEN "1010" => leds_id <=  ("0001000"); -- A
            WHEN "1011" => leds_id <=  ("1100000"); -- B
            WHEN "1100" => leds_id <=  ("0110001"); -- C
            WHEN "1101" => leds_id <=  ("1000010"); -- D
            WHEN "1110" => leds_id <=  ("0110000"); -- E
            WHEN "1111" => leds_id <=  ("0111000"); -- F
            WHEN OTHERS => leds_id <= ("1111111");     -- Blank display for unexpected input
        END CASE;

        -- Left display: showing FSM state based on bcd_state
        CASE bcd_state IS
            WHEN "000" => leds_state <= NOT ("1111110"); -- 0 (s0)
            WHEN "001" => leds_state <= NOT ("0110000"); -- 1 (s1)
            WHEN "010" => leds_state <= NOT ("1101101"); -- 2 (s2)
            WHEN "011" => leds_state <= NOT ("1111001"); -- 3 (s3)
            WHEN "100" => leds_state <= NOT ("0110011"); -- 4 (s4)
            WHEN "101" => leds_state <= NOT ("1011011"); -- 5 (s5)
            WHEN "110" => leds_state <= NOT ("1011111"); -- 6 (s6)
            WHEN "111" => leds_state <= NOT ("1110000"); -- 7 (s7)
            WHEN OTHERS => leds_state <= ("1111111");   -- Blank display for unexpected input
        END CASE;
    END PROCESS;
END Behavior;