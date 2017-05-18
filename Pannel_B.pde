// INTERFACE CONTROLL BUTTON
ControlP5 control;
Button exit, save, load, sendFirstPage, sendSecondPage, sendOnPageOne, sendOnPageTwo;

//**************************** 
//*****    the control p5 init
//**************************** 

void init() {
  control = new ControlP5(this);
  cp5 = new ControlP5(this);
  ellipseMode(CENTER);
  f = createFont("typeO.TTF", fontDimension-3); 
  textFont(f, fontDimension);
  cp5.setFont(f, fontDimension);
  control.setFont(f, 11);
}
// FUNCTION TO ACTIVATE PANEL BUTTON
void mousePressed() {
  if (exit.isPressed()) exit();
  if (save.isPressed()) selectOutput("Save Editor Settings:", "fileToSave"); 
  if (load.isPressed()) selectInput("Load Editor Settings:", "fileToLoad");
  //*************
  //send all to first page
  //**************
  if (sendFirstPage.isPressed()) {
    myBus.sendMessage(241,0,0);
    delay(160);
    for (myUI pz : elementData) {
      myBus.sendMessage(176+pz.midiChannel-1, pz.note, pz.memoryPosition);
      delay(4);
      myBus.sendMessage(176+pz.midiChannel-1, pz.setExcursionControllMax, pz.setExcursionControllMin);
      delay(4);
      myBus.sendMessage(176+pz.midiChannel-1, int(pz.toggleMode), pz.addressDMX);
      delay(4);
      myBus.sendMessage(176+pz.midiChannel-1, int(pz.togglePage), pz.indexMidiType); // da verificare
      delay(160);
    }
    //println("send all");
    myBus.sendMessage(241,0,0);
  }
  //*************
  //send all to second page
  //**************
  if (sendSecondPage.isPressed()) {
   myBus.sendMessage(241,0,0);
    delay(160);
    for (myUI pz : elementData) {
      myBus.sendMessage(176+pz.midiChannel-1, pz.note, pz.memoryPosition + 64);
      delay(4);
      myBus.sendMessage(176+pz.midiChannel-1, pz.setExcursionControllMax, pz.setExcursionControllMin);
      delay(4);
      myBus.sendMessage(176+pz.midiChannel-1, int(pz.toggleMode), pz.addressDMX);
      delay(4);
      myBus.sendMessage(176+pz.midiChannel-1, int(pz.togglePage), pz.indexMidiType); // da verificare
      delay(160);
    }
   myBus.sendMessage(241,0,0);
  }
  //*************
  //send selected to first page
  //**************
  if (sendOnPageOne.isPressed()) {
   myBus.sendMessage(241,0,0);
    delay(160);
    for (int i=0; i<elementData.size(); i++) {
      if (elementData.get(i).getStateDisplay()) {
        myBus.sendMessage(176+elementData.get(i).midiChannel-1, elementData.get(i).note, elementData.get(i).memoryPosition);
        delay(4);
        myBus.sendMessage(176+elementData.get(i).midiChannel-1, elementData.get(i).setExcursionControllMax, elementData.get(i).setExcursionControllMin);
        delay(4);
        myBus.sendMessage(176+elementData.get(i).midiChannel-1, elementData.get(i).toggleMode, elementData.get(i).addressDMX);
        delay(4);
        myBus.sendMessage(176+elementData.get(i).midiChannel-1, int(elementData.get(i).togglePage), elementData.get(i).indexMidiType); 
        delay(160);
        println(i);
      }
    } 
   myBus.sendMessage(241,0,0);
  }
  //*************
  //send selected to second page
  //**************
  if (sendOnPageTwo.isPressed()) {
   myBus.sendMessage(241,0,0);
    delay(160);
    for (int i=0; i<elementData.size(); i++) {
      if (elementData.get(i).getStateDisplay()) {
        myBus.sendMessage(176+elementData.get(i).midiChannel-1, elementData.get(i).note, elementData.get(i).memoryPosition+64);
        delay(4);
        myBus.sendMessage(176+elementData.get(i).midiChannel-1, elementData.get(i).setExcursionControllMax, elementData.get(i).setExcursionControllMin);
        delay(4);
        myBus.sendMessage(176+elementData.get(i).midiChannel-1, int(elementData.get(i).toggleMode), elementData.get(i).addressDMX);
        delay(4);
        myBus.sendMessage(176+elementData.get(i).midiChannel-1, int(elementData.get(i).togglePage), elementData.get(i).indexMidiType); // da verificare
        delay(160);
        println(i);
      }
    } 
   myBus.sendMessage(241,0,0);
  }
}
// TO SET THE BUTTON POSITION
void setUIButtonsPosition () {
  exit = control.addButton("Exit")
    .setId(1000)
    .setValue(0)
    .setPosition(gridCols[3], gridRow[2]-10)
    .setSize(100, 35)
    .setView(new SisButton())
    ;
  ;
  sendFirstPage = control.addButton("Send 1st Page")
    .setId(1001)
    .setValue(0)
    .setPosition(gridCols[6]-45, gridRow[2]-10)
    .setSize(140, 35)
    .setView(new SisButton())
    ;
  ;
  sendSecondPage = control.addButton("Send 2nd Page")
    .setId(1002)
    .setValue(0)
    .setPosition(gridCols[8]-5, gridRow[2]-10)
    .setSize(140, 35)
    .setView(new SisButton())
    ;
  ;
  sendOnPageOne = control.addButton("Send 1ST Page")
    .setId(1003)
    .setValue(0)
    .setPosition(gridCols[18]+1, gridRow[2]-10)
    .setSize(140, 35)
    .setView(new SisButton())
    ;
  ;
  sendOnPageTwo = control.addButton("Send 2ND Page")
    .setId(1003)
    .setValue(0)
    .setPosition(gridCols[20]+30, gridRow[2]-10)
    .setSize(140, 35)
    .setView(new SisButton())
    ;
  ;
  save = control.addButton("Save")
    .setId(1004)
    .setValue(0)
    .setPosition(gridCols[13]-5, gridRow[2]-10)
    .setSize(100, 35)
    .setView(new SisButton())
    ;
  ;
  load = control.addButton("Load")
    .setId(1005)
    .setValue(0)
    .setPosition(gridCols[11]-5, gridRow[2]-10)
    .setSize(100, 35)
    .setView(new SisButton())
    ;
  ;
}