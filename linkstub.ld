/***********************************************************************************************************************
 * linker script to define memory addresse / sections and symbols of the binary to be build
 * known constraints:
 * Entry point address need to be 0x80000
 * Stack pointer and heap pointer need to be 16Bit aligned
 *
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/

ENTRY(_start)

SECTIONS
{
	/* start memory address for RPi modules in RAM */
	. = 0x0;
	.text : {  *(.text*) }
  .rodata : { *(.rodata*) }
  .data : { *(.data*) }

	/* fill the binary to always have an aligned binary size */
	.fill : {
		FILL(0x0)
		. += 1;
		. = ALIGN(256) - 1;
		BYTE(0x00) 
	}

	. = ALIGN(256);
	__stub_end = .;
}