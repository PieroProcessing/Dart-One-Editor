class SisButton implements ControllerView<Button> {
  public void display(PGraphics theApplet, Button theButton) {
    theApplet.pushMatrix();
    strokeWeight(1);
    stroke(175);
    fill(32);
    rect(0, 5, theButton.getWidth(), theButton.getHeight()-5);
    theApplet.strokeWeight(1);
    //stroke(255, 0, 0);
    //strokeWeight(2);
    //line(0, theButton.getHeight()/2, theButton.getWidth()/6, theButton.getHeight()/2);
    //line(theButton.getWidth()*6/7, theButton.getHeight()/2, theButton.getWidth(), theButton.getHeight()/2);

    if (theButton.isInside()) {
      if (theButton.isPressed()) { // button is pressed
        theApplet.fill(ControlP5.RED);
        theApplet.rect(0, 0, theButton.getWidth(), theButton.getHeight());
      } else { // mouse hovers the button
        theApplet.fill(ControlP5.ORANGE);
        theApplet.rect(0, 0, theButton.getWidth(), theButton.getHeight());
      }
    } else { // the mouse is located outside the button area
      theApplet.fill(180, 150, 255);
    }
    // center the caption label 
    int x = theButton.getWidth()/2 - theButton.getCaptionLabel().getWidth()/2;
    int y = theButton.getHeight()/2 - theButton.getCaptionLabel().getHeight()/2;
    translate(x, y);
    theButton.getCaptionLabel().draw(theApplet);
    theApplet.popMatrix();
  }
}
class SensorButton implements ControllerView<Button> {
  public void display(PGraphics theApplet, Button theButton) {
    theApplet.pushMatrix();
    strokeWeight(1);
    stroke(175);
    noFill();
    rect(0, 0, theButton.getWidth(), theButton.getHeight());
    theApplet.strokeWeight(1);
    stroke(255, 255, 255);
    strokeWeight(2);
    if (theButton.isInside()) {
      if (theButton.isPressed()) { // button is pressed
        theApplet.fill(ControlP5.RED);
        theApplet.rect(0, 0, theButton.getWidth(), theButton.getHeight());
      } else { // mouse hovers the button
        theApplet.fill(ControlP5.ORANGE);
        theApplet.rect(0, 0, theButton.getWidth(), theButton.getHeight());
      }
    } else { // the mouse is located outside the button area
      theApplet.fill(180, 150, 255);
    }
    // center the caption label 
    int x = theButton.getWidth()/2 - theButton.getCaptionLabel().getWidth()/2;
    int y = theButton.getHeight()/2 - theButton.getCaptionLabel().getHeight()/2;
    translate(x, y);
    theButton.getCaptionLabel().draw(theApplet);
    theApplet.popMatrix();
  }
}
class potButton implements ControllerView<Button> {
  public void display(PGraphics theApplet, Button theButton) {
    theApplet.pushMatrix();
    if (theButton.isInside()) {
      if (theButton.isPressed()) { // button is pressed
        theApplet.fill(ControlP5.RED);
      } else { // mouse hovers the button
        theApplet.fill(ControlP5.YELLOW);
      }
    } else { // the mouse is located outside the button area
      theApplet.fill(ControlP5.ORANGE);
    }
    theApplet.strokeWeight(1);
    theApplet.ellipse(0, 0, theButton.getWidth(), theButton.getHeight());
    theApplet.fill(32, 44, 100);
    //theApplet.noFill();
    theApplet.strokeWeight(2);
    theApplet.stroke(11, 11, 189);
    theApplet.ellipse(5, 5, theButton.getWidth()-10, theButton.getWidth()-10);
    // center the caption label 
    int x = theButton.getWidth()/2 - theButton.getCaptionLabel().getWidth()/2;
    int y = theButton.getHeight()/2 - theButton.getCaptionLabel().getHeight()/2;
    theApplet.pushMatrix();
    translate(x, y);
    theButton.getCaptionLabel().draw(theApplet);
    theApplet.popMatrix();
    theApplet.popMatrix();
  }
}
class RectButton implements ControllerView<Button> {
  public void display(PGraphics theApplet, Button theButton) {
    theApplet.pushMatrix();
    strokeWeight(1);
    stroke(175);
    fill(32);
    rect(0, 5, theButton.getWidth(), theButton.getHeight()-5);
    theApplet.strokeWeight(1);
    //stroke(255, 0, 0);
    //strokeWeight(2);
    //line(0, theButton.getHeight()/2, theButton.getWidth()/5, theButton.getHeight()/2);
    //line(theButton.getWidth()*4/5, theButton.getHeight()/2, theButton.getWidth(), theButton.getHeight()/2);
    if (theButton.isInside()) {
      if (theButton.isPressed()) { // button is pressed
        theApplet.fill(ControlP5.RED);
        theApplet.rect(0, 0, theButton.getWidth(), theButton.getHeight());
      } else { // mouse hovers the button
        theApplet.fill(ControlP5.ORANGE);
        theApplet.rect(0, 0, theButton.getWidth(), theButton.getHeight());
      }
    } else { // the mouse is located outside the button area
      theApplet.fill(180, 150, 255);
    }
    // center the caption label 
    int x = theButton.getWidth()/2 - theButton.getCaptionLabel().getWidth()/2;
    int y = theButton.getHeight()/2 - theButton.getCaptionLabel().getHeight()/2;
    translate(x, y);
    theButton.getCaptionLabel().draw(theApplet);
    theApplet.popMatrix();
  }
}
class CircularButton implements ControllerView<Button> {
  public void display(PGraphics theApplet, Button theButton) {
    theApplet.pushMatrix();
    if (theButton.isInside()) {
      if (theButton.isPressed()) { // button is pressed
        theApplet.fill(ControlP5.RED);
      } else { // mouse hovers the button
        theApplet.fill(ControlP5.YELLOW);
      }
    } else { // the mouse is located outside the button area
      theApplet.fill(ControlP5.ORANGE);
    }
    theApplet.strokeWeight(1);
    theApplet.ellipse(0, 0, theButton.getWidth(), theButton.getHeight());
    theApplet.fill(32, 44, 100);
    theApplet.strokeWeight(2);
    theApplet.stroke(11, 11, 189);
    theApplet.ellipse(5, 5, theButton.getWidth()-10, theButton.getWidth()-10);
    // center the caption label 
    int x = theButton.getWidth()/2 - theButton.getCaptionLabel().getWidth()/2;
    int y = theButton.getHeight()/2 - theButton.getCaptionLabel().getHeight()/2;
    theApplet.pushMatrix();
    translate(x, y);
    theButton.getCaptionLabel().draw(theApplet);
    theApplet.popMatrix();
    theApplet.popMatrix();
  }
}
public class NumberboxInput {
  String text = "";
  Numberbox n;
  boolean active;
  NumberboxInput(Numberbox theNumberbox) {
    n = theNumberbox;
    registerMethod("keyEvent", this );
  }
  public void keyEvent(KeyEvent k) {
    // only process key event if input is active 
    if (k.getAction()==KeyEvent.PRESS && active) {
      if (k.getKey()=='\n') { // confirm input with enter
        submit();
        return;
      } else if (k.getKeyCode()==BACKSPACE) { 
        text = text.isEmpty() ? "":text.substring(0, text.length()-1);
        //text = ""; // clear all text with backspace
      } else if (k.getKey()<255) {
        // check if the input is a valid (decimal) number
        // final String regex = "\\d+([.]\\d{0,2})?";
        final String regex = "\\d+";
        String s = text + k.getKey();
        if ( java.util.regex.Pattern.matches(regex, s ) ) {
          text += k.getKey();
        }
      }
      n.getValueLabel().setText(this.text);
    }
  }
  public void setActive(boolean b) {
    active = b;
    if (active) {
      n.getValueLabel().setText("");
      text = "";
    }
  }
  public void submit() {
    if (!text.isEmpty()) {
      n.setValue( int( text ) );
      text = "";
    } else {
      n.getValueLabel().setText(""+n.getValue());
    }
  }
}