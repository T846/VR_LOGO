void mouseClicked(){
  runFlag = true;
  dummy = new Command();
  dummy.commandLine = "Program Start, 1";
  createCommandTree(dummy, 0, code);
  currentCmd = dummy.run();
  iterater = 0;
  commands = vrLogoCompiler(currentCmd.commandLine);
}

void mouseMoved(){
  float d = 1;
  if( abs(width/2 - mouseX) >= 1 ){
    if( mouseX > width/2 ) cameraDirection+=d;
    else cameraDirection-=d;
  }
  cameraDirection %= 360;
  
  if( abs(height/2 - mouseY) >= 1 ){
    if( mouseY > height/2 ) cameraUpDown+=d;
    else cameraUpDown-=d;
  }
  cameraUpDown = constrain(cameraUpDown, -89, 89);//-90 ~ 90
  
  resetMousePosition();
}

void keyPressed(){
  if(key=='w'){
    forward(dv);
  }
  if(key=='s'){
    back(dv);
  }
  if(key =='d'){
    right(dd);
  }
  if(key=='a'){
    left(dd);
  }
}

void resetMousePosition() {
  GLWindow glwindow = (GLWindow)surface.getNative();
  Point sp = new Point(0,0);
  glwindow.getLocationOnScreen(sp);
  //カーソルを中央に引き戻す
  robot.mouseMove( sp.getX() + width/2, sp.getY() + height/2);
}