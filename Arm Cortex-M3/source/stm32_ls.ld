ENTRY(Reset_Handler)

MEMORY
{
  FLASH(rx):ORIGIN =0x08001000,LENGTH =60K
  SRAM(rwx):ORIGIN =0x20000000,LENGTH =20K
}

SECTIONS
{
  
  .text :
  {
    *(.isr_vector)
	  main.o(.text);
	  RCC_Program.o(.text);
	  GPIO_Program.o(.text);
	  stm32_startup.o(.text); 
	*(.rodata)
	. = ALIGN(4);
	_etext = .;
	
  }> FLASH
    
  .data :
  {
    _sdata = .;
	*(.data)
	. = ALIGN(4);
	_edata = .;
  }> SRAM AT> FLASH
  
  .bss :
  {
    _sbss = .;
	*(.bss)
	
	. = ALIGN(4);
	_ebss = .;
  }> SRAM
  
  
  
}