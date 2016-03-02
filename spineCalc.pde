

class spineCalc {

PVector anchorLeft = new PVector(50,300);
PVector anchorRight = new PVector(750,300);
PVector handleLeft = new PVector(anchorLeft.x,anchorLeft.y);
PVector handleRight = new PVector(anchorRight.x,anchorRight.y);

float duration = 5.0;

PVector[] screen = new PVector[10];

float[] target = new float[5];

  spineCalc() {
    rectMode(CENTER);
    for (int i = 0; i < screen.length; i++) {
      screen[i] = new PVector();
    }
    
    target[0] = 300;
    target[1] = 300;
    target[2] = 300;
    target[3] = 300;
    
  }


void calcScreens() {
  
  /*anchorLeft.y = target[0];
  anchorRight.y = target[1];
  handleLeft.y = target[2];
  handleRight.y = target[3];*/
  
  for (int i = 0; i < screen.length; i++) {
    
      float t = map(i, 0, screen.length -1, 0, 1);
      float x = map(i, 0, screen.length -1, anchorLeft.x, anchorRight.x);
      float y = bezierPoint(anchorLeft.y, handleLeft.y, handleRight.y, anchorRight.y, t);
      
      
      screen[i].set(x,y);

  }
  
  
  
}

  void display() {
    background(0);
        
    // Draw screens
    
    int multiplier = 8;
    for (PVector s : screen) {
      
      stroke(255);
      noFill();
      
      //draw tv rectangle
      rect(s.x, s.y, 9*multiplier, 16*multiplier);
      
      //draw anchor point
      line(s.x-5,s.y,s.x+5,s.y);
      line(s.x,s.y-5,s.x,s.y+5);
      
      //draw vinch wire
      line(s.x,s.y-8*multiplier,s.x,0);
      
      //draw y coord text
      noStroke();
      fill(255);
      text("y:"+round(s.y),s.x-2*multiplier,s.y+6*multiplier);
    }
    
    // Draw bezier curve
    stroke(255);
    noFill();
    bezier(anchorLeft.x, anchorLeft.y, handleLeft.x, handleLeft.y, handleRight.x, handleRight.y, anchorRight.x, anchorRight.y);
  
    // Draw handle lines 
    stroke(255);
    line(anchorLeft.x-multiplier, anchorLeft.y, handleLeft.x-multiplier, handleLeft.y);
    line(anchorRight.x+multiplier, anchorRight.y, handleRight.x+multiplier, handleRight.y);
    
    //draw floor
    line(0,500,800,500);
    
    //draw target text
    noStroke();
    fill(255);
    for (int i = 0; i < 4; i++) {
     text("target["+i+"]: " + round(target[i]),20,530 + i*16);
    }
    
  }


  void setTarget(int t, float v) {
    target[t] = v;
    switch(t) {
      case 0: 
        Ani.to(anchorLeft, duration, "y", v, Ani.SINE_IN_OUT); 
        break;
      case 1: 
        Ani.to(anchorRight, duration, "y", v, Ani.SINE_IN_OUT); 
        break;
      case 2: 
        Ani.to(handleLeft, duration, "y", v, Ani.SINE_IN_OUT); 
        break;
      case 3: 
        Ani.to(handleRight, duration, "y", v, Ani.SINE_IN_OUT); 
        break;
    }
    
  }


  void setRightHandle(int y) {
    handleRight.set(anchorRight.x,y);
  }
  
  void setLeftHandle(int y) {
    handleLeft.set(anchorLeft.x,y);
  }



}