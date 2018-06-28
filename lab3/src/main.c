#include <stdio.h>
#include <xio.h>

#include "xparameters.h"
#include "cam_ctrl_header.h"
#include "vmodcam_header.h"
#include "globals.h"


#define blDvmaCR		0x00000000 // Control Reg Offset
#define blDvmaFWR		0x00000004 // Frame Width Reg Offset
#define blDvmaFHR		0x00000008 // Frame Height Reg Offset
#define blDvmaFBAR	0x0000000c // Frame Base Addr Reg Offset
#define blDvmaFLSR	0x00000010 // Frame Line Stride Reg Offeset
#define blDvmaHSR		0x00000014 // H Sync Reg Offset
#define blDvmaHBPR	0x00000018 // H Back Porch Reg Offset
#define blDvmaHFPR	0x0000001c // H Front Porch Reg Offset
#define blDvmaHTR		0x00000020 // H Total Reg Offset
#define blDvmaVSR		0x00000024 // V Sync Reg Offset
#define blDvmaVBPR	0x00000028 // V Back Porch Reg Offset
#define blDvmaVFPR	0x0000002c // V Front Porch Reg Offset
#define blDvmaVTR		0x00000030 // V Total Reg Offset

#define printf xil_printf	/* A smaller footprint printf */

void main() {

	xil_printf("hello\n");
/*
	u32 lDvmaBaseAddress = XPAR_DVMA_0_BASEADDR;
	int posX, posY;
	int color;
	for(posX = 0; posX<2560; posX++){
			for(posY = 0; posY<720; posY++)
				XIo_Out16(XPAR_DDR2_SDRAM_MPMC_BASEADDR + 2*(posY*2560+posX), (posX/40)<<4);
	}

	XIo_Out32(lDvmaBaseAddress + blDvmaHSR, 40); // hsync
	XIo_Out32(lDvmaBaseAddress + blDvmaHBPR, 260); // hbpr
	XIo_Out32(lDvmaBaseAddress + blDvmaHFPR, 1540); // hfpr
	XIo_Out32(lDvmaBaseAddress + blDvmaHTR, 1650); // htr
	XIo_Out32(lDvmaBaseAddress + blDvmaVSR, 5); // vsync
	XIo_Out32(lDvmaBaseAddress + blDvmaVBPR, 25); // vbpr
	XIo_Out32(lDvmaBaseAddress + blDvmaVFPR, 745); // vfpr
	XIo_Out32(lDvmaBaseAddress + blDvmaVTR, 750); // vtr
*/
/*
	XIo_Out32(lDvmaBaseAddress + blDvmaFWR, 0x00000500); // frame width
	XIo_Out32(lDvmaBaseAddress + blDvmaFHR, 0x000002D0); // frame height
	XIo_Out32(lDvmaBaseAddress + blDvmaFBAR, XPAR_DDR2_SDRAM_MPMC_BASEADDR); // frame base addr
	XIo_Out32(lDvmaBaseAddress + blDvmaFLSR, 0x00000A00); // frame line stride
	XIo_Out32(lDvmaBaseAddress + blDvmaCR, 0x00000003); // dvma enable, dfl enable

	CamIicCfg(XPAR_CAM_IIC_0_BASEADDR, CAM_CFG_640x480P);
	CamIicCfg(XPAR_CAM_IIC_1_BASEADDR, CAM_CFG_640x480P);
	CamCtrlInit(XPAR_CAM_CTRL_0_BASEADDR, CAM_CFG_640x480P, 640*2);
	CamCtrlInit(XPAR_CAM_CTRL_1_BASEADDR, CAM_CFG_640x480P, 0);
*/
/*
	for(posX = 0; posX<2560; posX++)
		for(posY = 0; posY<720; posY++)
			XIo_Out16(XPAR_DDR2_SDRAM_MPMC_BASEADDR + 2*(posY*2560+posX), 0x0000);

	int num = 0;

	while(1){

		// draw box on the screen where the user inputs a character/letter
		// draw top rectangle
		for(posX = X_MIN-BORDER_WIDTH; posX<=X_MAX+BORDER_WIDTH; posX++){
			for(posY = Y_MIN-BORDER_WIDTH; posY<=Y_MIN; posY++){
				XIo_Out16(XPAR_DDR2_SDRAM_MPMC_BASEADDR + 2*(posY*2560+posX), 0xf00);
			}
		}
		// draw bottom rect
		for(posX = X_MIN-BORDER_WIDTH; posX<=X_MAX+BORDER_WIDTH; posX++){
			for(posY = Y_MAX; posY<=Y_MAX+BORDER_WIDTH; posY++){
				XIo_Out16(XPAR_DDR2_SDRAM_MPMC_BASEADDR + 2*(posY*2560+posX), 0xf00);
			}
		}
		// draw left rect
		for(posX = X_MIN-BORDER_WIDTH; posX<X_MIN; posX++){
			for(posY = Y_MIN; posY<=Y_MAX; posY++){
				XIo_Out16(XPAR_DDR2_SDRAM_MPMC_BASEADDR + 2*(posY*2560+posX), 0xf00);
			}
		}
		// draw right rect
		for(posX = X_MAX; posX<=X_MAX+BORDER_WIDTH; posX++){
			for(posY = Y_MIN; posY<=Y_MAX+BORDER_WIDTH; posY++){
				XIo_Out16(XPAR_DDR2_SDRAM_MPMC_BASEADDR + 2*(posY*2560+posX), 0xf00);
			}
		}


		// process the image to find Letter/User
		// if process returns 1: we found a recognized character
		num = process();
		if (num == 1 || num == 2 || num == 3){
			break;
		}

	}

	printf("User Detected. Enter your Pin:\n");


// Problem with keypad is that we can't request a second number. It always returns 0 after the first call.

	u32 key1 = 0;
	key1 = keypad();
	u32 key2 = 0;
	key2 = keypad();

	// Luke's pin is 3
	if (num == 1 && (key1 == 3)){
		printf("Welcome Luke\n");
	}
	// David's pin is 2
	if (num == 2 && (key1 == 2)){
		printf("Welcome David\n");
	}
	// Matt's pin is 1
	if (num == 3 && (key1 == 1)){
		printf("Welcome Hatt\n");
	}

	printf("Welcome Hatt\n");
*/

}
