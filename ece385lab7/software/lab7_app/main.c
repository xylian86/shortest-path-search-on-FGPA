int main()
{
	int i=0;
	int flag = 0;
	volatile unsigned int *LED_PIO = (unsigned int*)0x90; //make a pointer to access the PIO block
	volatile unsigned int *SWITCH = (unsigned int*) 0x80;
	volatile unsigned int *ACCUMU = (unsigned int*) 0x70;
	volatile unsigned int *CLEAR = (unsigned int*) 0x60;
	*LED_PIO = 0; //clear all LEDs

	while ( (1+1) != 3) //infinite loop
	{
//		for (i = 0; i < 100000; i++); //software delay
//		*LED_PIO |= 0x1; //set LSB
//		for (i = 0; i < 100000; i++); //software delay
//		*LED_PIO &= ~0x1; //clear LSB

		// add part
		if(*CLEAR == 0)		//Clear step
			*LED_PIO = 0;
		flag = 0;
		if(*ACCUMU == 0){	//Add step
		*LED_PIO = (*LED_PIO + *SWITCH) % 256;
		flag = 1;
		}
		while((*ACCUMU == 0) && (flag == 1)){	//Hold step
			continue;
		}
	}
	return 1; //never gets here
}