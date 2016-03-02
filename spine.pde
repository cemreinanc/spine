import de.looksgood.ani.*;
import controlP5.*;

ControlP5 cp5;
spineCalc spine;

void setup(){
  size(800,600);
  spine = new spineCalc();
  Ani.init(this);
  cp5 = new ControlP5(this);
  
  cp5.addButton("randomize").setPosition(120,520).setSize(100,19);
  
}

void draw(){

  spine.calcScreens();
  spine.display();
  
}

public void randomize() {
 for (int i = 0; i < 4; i++) {
   spine.setTarget(i,random(140,420));
 }
}