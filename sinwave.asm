; ECS 154A sinwave.asm 
; Loads a sinwave into the LED matrix and repeatedly starts over
MAIN: ; Entry point to program
    ; Setup the stack at 32512 (I/O starts at 32736), not necessary 
    LI x1, 32512
    ; Load the data location address
    LI x6, DATA
    NOP
    ; Load the address of the loop
    LI x5, LOOP
    ; Load the address of the LED matrix shift register
    LI x7, 0x7fef
    ; Initialize the loop count
    LI x2, 15
    ; Beginning of the inner loop
LOOP:
    ; x3 = Data + x2 (data address offset)
    ADD x3, x6, x2
    ; x4 = Data[x2] (subtract by 1 because loop variable hasn't been decremented)
    LW x4, -1(x3)
    ; Store the data into the shift register
    SW x4, 0(x7)
    ; Decrement the loop variable
    ADDI x2, x2, -1
    ; If loop variable is zero go to outer loop
    BZF OUTERLOOP
    ; Jump back to the beginning of inner loop
    J LOOP
    ; Outer loop reinitializes the loop variable and starts inner loop
OUTERLOOP:
    ; Reload the loop count
    LI x2, 15
    ; Jump back to the beginning of the inner loop
    JR x5
    ; Sin wave data
DATA:
    DAT 0x0080
    DAT 0x0400
    DAT 0x1000
    DAT 0x4000
    DAT 0x4000
    DAT 0x2000
    DAT 0x0800
    DAT 0x0100
    DAT 0x0040
    DAT 0x0008
    DAT 0x0002
    DAT 0x0001
    DAT 0x0001
    DAT 0x0004
    DAT 0x0010