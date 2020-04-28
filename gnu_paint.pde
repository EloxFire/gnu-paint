import controlP5.*;
ControlP5 jControl;

Slider redSlider, blueSlider, greenSlider;
color paintColor;

void setup(){
  surface.setTitle("Linux Paint");
  fullScreen();
  background(255);
  jControl = new ControlP5(this);
  
  redSlider = jControl.addSlider("RED").setRange(0, 255).setSize(300, 30).setPosition(20, 20).setColorBackground(color(255, 0, 0)).setColorForeground(color(188, 60, 60));
  greenSlider = jControl.addSlider("GREEN").setRange(0, 255).setSize(300, 30).setPosition(20, 60).setColorBackground(color(0, 255, 0)).setColorForeground(color(60, 180, 60)); 
  blueSlider = jControl.addSlider("BLUE").setRange(0, 255).setSize(300, 30).setPosition(20, 100).setColorBackground(color(0, 0, 255)).setColorForeground(color(60, 60, 180));
  
}

void draw(){
  pushStyle();
  fill(#333333);
  rect(0, 0, 400, height);
  popStyle();

  float red = jControl.getController("RED").getValue();
  float green = jControl.getController("GREEN").getValue();
  float blue = jControl.getController("BLUE").getValue();
  
  if(mouseX > 401 && mousePressed){
    paintColor = color(int(red), int(green), int(blue));
    pushStyle();
    stroke(red, green, blue);
    strokeWeight(5);
    line(mouseX, mouseY, pmouseX, pmouseY);
    popStyle();
  }
}

void setBrushColor(){
  float red = jControl.getController("RED").getValue();
  float green = jControl.getController("GREEN").getValue();
  float blue = jControl.getController("BLUE").getValue();
  
  paintColor = color(red, green, blue);
}
