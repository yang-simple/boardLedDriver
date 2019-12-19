
.global _start    

_start:
                        @enable all clock
    ldr r0, =0x020c4068   @CCGR0
    ldr r1, =0xffffffff    @write number
    str r1, [r0]           @0xffffffff -> CCGR0

    ldr r0, =0x020c406c  @CCGR1
    str r1, [r0]    

    ldr r0, =0x020c4070  @CCGR2
    str r1, [r0] 

    ldr r0, =0x020c4074  @CCGR3
    str r1, [r0] 

    ldr r0, =0x020c4078  @CCGR4
    str r1, [r0] 

    ldr r0, =0x020c407c  @CCGR5
    str r1, [r0]        

    ldr r0, =0x020c4080  @CCGR6
    str r1, [r0] 

            @IO    function set
    ldr r0, =0x020e0068
    ldr r1, =0x5       @write number
    str r1, [r0]

    @ GPIO1_IO03 current property
    @020e0ef4  
    @bit0     0 low speed

	ldr r0, =0x020e02f4
	ldr r1, =0x10b0
	str r1, [r0]

	@set GPIO function
	@ GPIO1_GDIR   0x0209c004
	@ set GPIO1_GDIR bit3=1
	ldr r0, =0x0209c004
	ldr r1, =0x8
	str r1, [r0]

	@ open led
	@ GPIO_DR
	@ox0209c000
	ldr r0, =0x0209c000
	ldr r1, =0
	str r1, [r0]


loop:	
	b loop

    