MEMORY
{
	ROM   (rx) : ORIGIN = 0x00007000, LENGTH = (2k)
}

ENTRY(_start);
latte = 0x000000c0;

SECTIONS
{
	.text :
	{
		*(.text*)
		*(.rodata*)
	} > ROM

    /DISCARD/ :
    {
        *(.ARM.*)
        *(.debug_*)
        *(.comment)
    }
}


