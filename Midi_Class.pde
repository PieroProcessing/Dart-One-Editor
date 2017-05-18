// THE MIDI VARIABLES
MidiBus myBus; // The MidiBus
int Channel =1;
int Note, Intensity;
String optCC;
int DartIN, DartOUT;
int inD, outD;
int [] typeMidiArray={ 144, 160, 176, 192, 208, 224};
String [] typeMidiList= {"Note", "Poly AT", "CC", "PC", "AT", "PB"};
String []  toggleList ={"Pot", "Button", "Toggle", "Toggle Group 1", "Toggle Group 2", "Toggle Group 3", "Toggle Group 4", "Toggle Group 5", "Toggle Group 6"};

// THE MIDI INIT SETTINGS //
void initMidi() {

  try { 
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
  } 
  catch (Exception e) { 
    e.printStackTrace();
  } 
  MidiBus.list();
  // List all available Midi devices on STDOUT. This will show each device's index and name.
  String [] deviceIn= MidiBus.availableInputs();
  String [] deviceOut=MidiBus.availableOutputs();
  boolean checkIN=false;
  boolean checkOUT=false;


  for (int i=0; i<deviceIn.length; i++) {
    if (deviceIn[i].equals( "DART"))
    { 
      checkIN=true;
      DartIN =i;
      println(DartIN);
      break;
    }
  }
  for (int i=0; i<deviceOut.length; i++) {
    if (deviceOut[i].equals("DART"))
    { 
      checkOUT=true;
      DartOUT =i;
      println(DartOUT);
      break;
    }
  }
  if (checkIN && checkOUT) {
    myBus = new MidiBus(this, DartIN, DartOUT); // Create a new MidiBus object
  } else {

    String inputOpt = (String) JOptionPane.showInputDialog(
      null, //component parentComponent
      "Dart In", //object message
      "DART EDITOR", //string title
      JOptionPane.QUESTION_MESSAGE, // int messagetype
      null, //icon icon
      deviceIn, // object [] section values
      deviceIn[0]); // object initial values
    for (int i=0; i<deviceIn.length; i++) {
      if (deviceIn[i].equals(inputOpt))
      { 
        inD =i;
        println(DartIN);
        break;
      }
    }
    println(inputOpt);

    String outputOpt = (String) JOptionPane.showInputDialog(
      null, 
      "Dart Out", 
      "DART EDITOR", 
      JOptionPane.QUESTION_MESSAGE, 
      null, 
      deviceOut, 
      deviceOut[0]);
    for (int i=0; i<deviceOut.length; i++) {
      if (deviceOut[i].equals(outputOpt))
      { 
        outD =i;
        println(DartOUT);
        break;
      }
    }
    println(outputOpt);
    myBus = new MidiBus(this, inD, outD); // Create a new MidiBus object
  }
}
void midiMessage(MidiMessage message) { // You can also use midiMessage(MidiMessage message, long timestamp, String bus_name)
  // Receive a MidiMessage
  // MidiMessage is an abstract class, the actual passed object will be either javax.sound.midi.MetaMessage, javax.sound.midi.ShortMessage, javax.sound.midi.SysexMessage.
  // Check it out here http://java.sun.com/j2se/1.5.0/docs/api/javax/sound/midi/package-summary.html
  int midiSignal = constrain ((int)(message.getStatus()), 144, 240);
  int indexTypeMidi = constrain(((midiSignal-144)/16), 0, 5);
  optCC= typeMidiList[(indexTypeMidi)];
  println("Type: "+ optCC);
  Channel = midiSignal- typeMidiArray[indexTypeMidi]+1;
  println("Channel: "+ Channel);
  Note = (int)(message.getMessage()[1] & 0xFF);
  println("Value 1: " + Note);
   if (indexTypeMidi == 3 || indexTypeMidi == 4) {
  } else {
    Intensity = (int)(message.getMessage()[2] & 0xFF);
  }
  println("Value 2: " + Intensity);
}
void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}