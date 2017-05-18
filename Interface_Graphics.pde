//********************************** 
//  POSITION GLOBAL VARIABLES FOR THE LOOK OF THE EDITOR
//  interface grid for element location
//**********************************
int cols = 25;
int rows = 25;
float [] gridRow = new float [rows];
float [] gridCols = new float [cols];
float W, H;
PImage logo, jogWheel ; 
float spaceBetw;
//**********************************
/// THE AMBIENT VARIABLES
//***********************************
PFont f;
int fontDimension=13;
int rW = 60;
int rH = 60;
int rR = 30;

void settingScreen() {

  W=width/rows;
  H=height/cols;

  for (int i = 0; i < cols; i++) {
    gridCols[i] = W*i ;
    // println("i: "+ gridCols[i]);
  }
  for (int j = 0; j < rows; j++) {
    gridRow[j] =  H*j ;
    // println("j: "+ gridRow[j]);
  }
  spaceBetw =  gridCols[1]+rW/3;
}
// *****************************************
//           the background look
//******************************************

void interfaceDisp() {
  // Background
  background(16, 50);
  // box for Setting Label
  stroke(64);
  fill(32, 180);
  rect((int)gridCols[18]+1, (int) gridCols[0]+20, (int)gridCols[5]-2, spaceBetw/3);
  // box for sis button
  stroke(64);
  fill(32, 180);
  rect(gridCols[3]-rW/10, gridRow[2]-rW/4, spaceBetw*9-15, spaceBetw-25);
  // the info box up design
  stroke(100);
  //fill(109, 136, 163);
  rect(gridCols[3]-rW/10, gridRow[2]+spaceBetw-rW/4, spaceBetw*9-15, spaceBetw);
  // box for Settings elements
  stroke(64);
  fill(64, 180);
  rect((int)gridCols[18]+1, (int) gridCols[2]+25, (int)gridCols[5]-2, gridCols[8]+30);
  // jogWheel img
  image(jogWheel, gridCols[11]+spaceBetw/2, gridRow[9]+spaceBetw*3);
  // fake outline for faders
  strokeWeight(1);
  fill(24);
  rect(gridCols[3]*2.85-3, gridRow[7]+spaceBetw*4, rW/4, rH*2);
  rect(gridCols[3]*2.85+spaceBetw-3, gridRow[7]+spaceBetw*4, rW/4, rH*2);
  fill(0);
  rect(gridCols[3]*2.85+3, gridRow[7]+spaceBetw*4+3, rW/4-12, rH*2-3);
  rect(gridCols[3]*2.85+spaceBetw+3, gridRow[7]+spaceBetw*4+3, rW/4-12, rH*2-3);

  // fake circle in the console
  for ( int i=0; i<4; i++)
  {
    //ellipse(gridCols[4]-rW/3, gridRow[7]+i*(gridCols[2]+rW/6), rW/6, rW/6);
    ellipse(gridCols[5]+rW/4+i*(gridCols[2]+rW/1.5), gridRow[9], rW/6, rW/6);
    ellipse(gridCols[5]+rW/4+i*(gridCols[2]+rW/1.5), gridRow[11], rW/6, rW/6);
    ellipse(gridCols[5]+rW/4+i*(gridCols[2]+rW/1.5), gridRow[13], rW/6, rW/6);
  }
}
// THE MIDI MONITOR POSITION //
void midiMonitor() {
  // background
  noStroke();
  fill(32, 32, 32);
  strokeWeight(2);
  stroke(200);  
  rect((int)gridCols[18]+1, (int) gridCols[11]+25, (int)gridCols[5]-2, spaceBetw*1.8); //red out
  //noStroke();
  noFill();
  strokeWeight(2);
  stroke(128);  
  rect((int)gridCols[18]+1, (int) gridCols[11]+25, (int)gridCols[5]-2, spaceBetw*1.8-2);// red in

  fill(0, 255, 0);
  textSize(12);
  text("Channel: "+ Channel, gridCols[18]+10, (int) gridCols[11]+10+H);
  text("Type: "+ optCC, gridCols[18]+10, (int) gridCols[11]+35+H);
  text("Value 1: "+Note, gridCols[18]+10, (int) gridCols[12]+10+H);
  text("Value 2: "+Intensity, gridCols[18]+10, (int) gridCols[12]+35+H);
}
void explanationText() {
  if ( infoGraph<16) {        
    text("Potenciometers can send  Poly-AT, Control-Change, Channel-AT and Pitch-Bend messages.\n"+
      "Set them in POT MODE (debouncing not active) to achieve a coninuous output.", gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<18) { 
    //SLIDER
    text("Sliders can send  Poly-AT, Control-Change, Channel-AT and Pitch-Bend messages.\n"+
      "Set them in POT MODE (debouncing not active) to achieve a coninuous output.", gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<38) {
    //BUTTONS
    text("Buttons can send Note, Poly-AT, Control-Change, Program-Change, Channel-AT and Pitch-Bend messages.\n"+
      "Set them in BUTTON MODE or TOGGLE MODE to activate debouncing, and achieve a clean on-off message.", 
      gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<39) {
    //JOBWEAL
    text("The JOG WHEEL can send Poly-AT, Control-Change, Program-Change, Channel-AT and Pitch-Bend messages.\n"+
      "If MIDI TYPE is set to NOTE or PITCH-BEND, it will output midi CC data in POT mode (from min to max)\n"+
      "In all the other cases it will output the specied MIDI TYPE message in ENDLESS MODE. ", 
      gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<40) {
    //JOBWEAL
    text("The side-Spinner can send Poly-AT, Control-Change, Program-Change, Channel-AT and Pitch-Bend messages.\n"+
      "If MIDI TYPE is set to NOTE or PITCH-BEND, it will output midi CC data in POT mode (from min to max)\n"+
      "In all the other cases it will output the specied MIDI TYPE message in ENDLESS MODE.", 
      gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<42) {
    //touch
    text("The touch sensor acs like any othe button.\nIt can send Note, Poly-AT, Control-Change, Program-Change, Channel-AT and Pitch-Bend messages.\n"+
      "IT will also reset the Pitch-Bend value of the jog wheels to it's mid position.", 
      gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<43) {
    //SENSOR
    text("The distance sensor can send Note, Poly-AT, Control-Change, Program-Change, Channel-AT\n and Pitch-Bend messages.\n"+
      "Set it in POT MODE to have a continuous output, otherwise it will act as a momentary on-off button.", 
      gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<44) {
    //PADS
    text("Percussive PADS input: the MIDI setup defined here will be used for all four pads, but with a value increased by 1.", 
      gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<45) {
    //SWITCH
    text("The page switch also sends a midi message.\nIt's related midi message is the one reccorded in the 1st page.", 
      gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<2002) {
    text("Midi event type: Note, Poly-AT, Control-Change, Program-Change, Channel-AT and Pitch-Bend messages", gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<2003) {
    text("Value of the note", gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<2004) {
    text("Min Value", gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<2005) {
    text("Max Value", gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<2006) {
    text("Midi Channel", gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<2007) {
    text("Address DMX", gridCols[3], gridRow[2]+spaceBetw);
  } else if (infoGraph<2008) {
    text("POT = Continuous output, use this setup for potenciometers and sensors.\n"+
      "BUTTON = debounced on-off output. Use it for Pushbuttons.\nTOGGLE = debounced Toggle mode.\n"+
      "TOGGLE GROUPS = Only a single button can be ON at a time, for it's specified group.", gridCols[3], gridRow[2]+spaceBetw);
  }
}