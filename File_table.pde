Table table;
// *****************************************
// init TABLE to set data // 
//******************************************
void initTableOfElementData() {
  table = new Table();
  table.addColumn("Name");
  table.addColumn("MemoryPosition");
  table.addColumn("midiType");
  table.addColumn("Note");
  table.addColumn("MaximumValue");
  table.addColumn("MinimumValue");
  table.addColumn("MidiChannel");
  table.addColumn("Toggle");
  table.addColumn("DMXAddress");
  table.addColumn("Page");
}
// *****************************************
// SAVE AND LOAD SETTINGS INTO TABLE // 
//******************************************
void saveTableSettings(String s ) {
  for (int i =0; i<elementData.size(); i++) {
    TableRow r = table.getRow(i);
    r.setString("Name", elementData.get(i).label);
    r.setInt("MemoryPosition", elementData.get(i).memoryPosition);
    r.setString("midiType", typeMidiList[elementData.get(i).indexMidiType]);
    r.setInt("Note", elementData.get(i).note);
    r.setInt("MaximumValue", elementData.get(i).setExcursionControllMax);
    r.setInt("MinimumValue", elementData.get(i).setExcursionControllMin);
    r.setInt("MidiChannel", elementData.get(i).midiChannel);
    r.setString("Toggle", toggleList[elementData.get(i).toggleMode]);
    r.setInt("DMXAddress", elementData.get(i).addressDMX);
    r.setInt("Page", int (elementData.get(i).togglePage));
  }
  saveTable(table, s+".csv");
}
void loadTableSettings(String s) {
  table = loadTable(s, "header");
  for (int i=0; i<elementData.size(); i++) {
    elementData.get(i).loadTableRow(table.getRow(i));
  }
}
void fileToSave(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    saveTableSettings(selection.getAbsolutePath());
  }
}
void fileToLoad(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    loadTableSettings(selection.getAbsolutePath());
  }
}
// *****************************************
// This function returns all the files in a directory as an array of Strings  
//******************************************
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}