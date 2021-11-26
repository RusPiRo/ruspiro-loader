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

ENTRY(__boot)

SECTIONS
{
	/* start memory address for RPi modules in RAM */
	. = 0x10000;
	__bootloader_start = .;
	.text.boot : { KEEP(*(.text.boot)) }
	/**************************************************************************************************************
	 * ensure running code waiting for new kernel is far enough in the memory to allow switching the boot part
	 * starting from 0x80000 (aarch64) or 0x8000 (aarch32) on the fly.
	 * The kernel to be loaded should always be smaller as this value!!!!!
	 * So the actual new kernel need to be less than 400kB
	 **************************************************************************************************************/
	/*. += 0xF0000;*/
    .text : {  *(.text*) }
    .rodata : { *(.rodata*) }
    .data : { *(.data*) }
    
	
  . = ALIGN(8);
  .init_array : {
		__init_start = .;
		*(.init_array)
		*(.init_array.*)
		__init_end = .;
	}

  /* bss section, contains all static variables of the rust code */
  . = ALIGN(16);
	.bss : { 
    	__bss_start__ = .;
    	*(.bss*)
    	*(COMMON)
		. = ALIGN(16);
    	__bss_end__ = .;
    }

	PROVIDE(_data = .);
	.data : { *(.data*) }

	/* fill the binary to always have an aligned binary size - needed for the bootloader on RPi to work properly */
	.fill : {
		FILL(0xDEADBEEF)
		. += 1;
		. = ALIGN(64) - 1;
		BYTE(0xAA) 
	}

	/*********************************************************************************
	 * after the code the stack pointers will start. They cannot start from the end of
	 * usable memory as the memory is split betwean ARM CPU and GPU and the GPU memory
	 * size is not known during compile/link time.
	 * As the boot-loader is only running on a single core we only need stack pointer 
	 * for core 0
	 *********************************************************************************/
	. = ALIGN(16);
	__bootloader_end = .;
/*	__stack_end__ = .;
	. += 0x01000;
	__stack_top_core0__ = .;
	__stack_top__ = .;
	*/
	/* the heap memory address space starts where the executable and the static variables ends
	 * (aligned to 4kB to fit into a MMU page)
	 */
	 
    . = ALIGN(4096);
	__heap_start = .;
    /* heap end is defined by the usage split of CPU/GPU - however,
	 * from link script point of view this is where the memory ends (on RPi3)
	 */
	 /*
	__heap_end = 0x3E000000;
	*/

	/DISCARD/ :
	{
		*(.note.gnu*)
	}
}