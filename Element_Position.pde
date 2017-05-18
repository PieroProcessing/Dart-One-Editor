void potPosition() {
  //myKnob(PApplet applet, String label_, int posx_, int posy_, int rW, int rH, int r_)
  for (int i=0; i<4; i++) {
    elementData.add( new myUI(this, cp5, "P"+(i+1), memPosLUT[i], i, gridCols[4]+i*spaceBetw, gridRow[7], rW, rH, 2));
  }
  for (int i=4; i<8; i++) {
    elementData.add(new myUI(this, cp5, "P"+(i+1), memPosLUT[i], i, gridCols[4]+(i-4)*spaceBetw, gridRow[7]+spaceBetw, rW, rH, 2));
  }
  for (int i=8; i<12; i++) {
    elementData.add(new myUI(this, cp5, "P"+(i+1), memPosLUT[i], i, gridCols[4]+(i-4)*spaceBetw, gridRow[7], rW, rH, 2));
  }

  for (int i=12; i<16; i++) {
    elementData.add(new myUI(this, cp5, "P"+(i+1), memPosLUT[i], i, gridCols[4]+(i-8)*spaceBetw, gridRow[7]+spaceBetw, rW, rH, 2));
  }
}
void FFSliderPosition() {
  elementData.add(new myUI(this, cp5, "F1", memPosLUT[16], 16, gridCols[3]*2.7, gridRow[8]+spaceBetw*4, rW, rH-34, 0));
  elementData.add(new myUI(this, cp5, "F2", memPosLUT[17], 17, gridCols[3]*2.7+spaceBetw, gridRow[9]+spaceBetw*4, rW, rH-34, 0));
}
void buttPosition() {
  //myUI(PApplet applet, String label_, int posx_, int posy_, int rW, int rH)
  for (int i=18; i<22; i++) {
    elementData.add(new myUI(this, cp5, "B"+(i-17), memPosLUT[i], i, gridCols[4]+(i-18)*spaceBetw, gridRow[11], rW, rH, 1));
  }
  for (int i=22; i<26; i++) {
    elementData.add(new myUI(this, cp5, "B"+(i-17), memPosLUT[i], i, gridCols[4]+(i-22)*spaceBetw, gridRow[11]+spaceBetw, rW, rH, 1));
  }
  for (int i=26; i<30; i++) {
    elementData.add(new myUI(this, cp5, "B"+(i-17), memPosLUT[i], i, gridCols[4]+(i-22)*spaceBetw, gridRow[11], rW, rH, 1));
  }
  for (int i=30; i<34; i++) {
    elementData.add(new myUI(this, cp5, "B"+(i-17), memPosLUT[i], i, gridCols[4]+(i-26)*spaceBetw, gridRow[11]+spaceBetw, rW, rH, 1));
  }
}
void lateralButton() {
  elementData.add(new myUI(this, cp5, "B17", memPosLUT[34], 34, gridCols[3]-rW/3, gridRow[8], rW, rH, 1));
  elementData.add(new myUI(this, cp5, "B18", memPosLUT[35], 35, gridCols[3]-rW/3, gridRow[6]+spaceBetw*4, rW, rH, 1));
  elementData.add(new myUI(this, cp5, "B19", memPosLUT[36], 36, gridCols[4], gridRow[11]+spaceBetw*3, rW+5, rH+5, 1));
  elementData.add(new myUI(this, cp5, "B20", memPosLUT[37], 37, gridCols[4]+spaceBetw, gridRow[11]+spaceBetw*2, rW+5, rH+5, 1));
}
void JTPosition() {
  elementData.add(new myUI(this, cp5, "J1", memPosLUT[38], 38, gridCols[12]+spaceBetw/3, gridRow[10]+10+spaceBetw*3, rW, rH, 4));
  elementData.add(new myUI(this, cp5, "J2", memPosLUT[39], 39, gridCols[3]-rW/2, gridRow[6]+spaceBetw*2, rW+15, rH+15, 2));
  elementData.add(new myUI(this, cp5, "T1", memPosLUT[40], 40, gridCols[9]+rW*2, gridRow[6]+spaceBetw*4.5, rW-25, rH-25, 0));
  elementData.add(new myUI(this, cp5, "T2", memPosLUT[41], 41, gridCols[3]-rW/5, gridRow[6]+spaceBetw*3, rW-20, rH-20, 0));
}
void sensorT() {
  elementData.add(new myUI(this, cp5, "Sensor", memPosLUT[42], 42, gridCols[3]+rW, gridRow[11]+spaceBetw*2, rW+5, rH/3, 5));
}
void PadsDart() {
  elementData.add(new myUI(this, cp5, "Pads", memPosLUT[43], 43, gridCols[15], gridRow[10]+spaceBetw*2, rW*2, rH/2, 5));
}
void PageSwitch() {
  elementData.add(new myUI(this, cp5, "Switch", memPosLUT[44], 44, gridCols[15], gridRow[10]+spaceBetw*2.5, rW*2, rH/2, 5));
}
// THE BUTTON POSITION AND POLYMORFISM in ElementPosition class//
void setupElement () {
  potPosition();
  FFSliderPosition();
  buttPosition();
  lateralButton();
  JTPosition();
  sensorT();
  PadsDart();
  PageSwitch();
}