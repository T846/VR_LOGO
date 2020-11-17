import java.awt.AWTException;
import java.awt.Robot;
import java.awt.Component;
import com.jogamp.newt.opengl.GLWindow;
import com.jogamp.nativewindow.util.Point;

float triOffsetX = 0, triOffsetZ = 0;
int triDirection = 0;
float cameraDirection = 0;
float cameraUpDown = 0;

int dv = 3, dd = 2;

ArrayList<int[]> commands;
ArrayList<PVector> paintline;

Command dummy;
Command currentCmd;
int iterater = -1;

Robot robot;

boolean runFlag = false;

int statement = 0;

String[] code = {
                  "RIGHT,18",
                  "FORWARD,200",
                  "FOR,4",
                  "RIGHT,144",
                  "FORWARD,200",
                  "END,0",
                  "RIGHT,126",
                };
                
  /*              
String[] code = {
                  "FOR,120",
                  "FORWARD,4",
                  "RIGHT,3",
                  "END,1"
                };
                
*/
void setup(){
  size( 1000, 700, P3D);
  triOffsetX = width/2;
  triOffsetZ = height/2;
  fill(255,0,0);
  try {
    robot = new Robot();
  }
  catch (AWTException e) {
    e.printStackTrace();
  }
  
  paintline = new ArrayList<PVector>();
  paintline.add( new PVector(triOffsetX, height-1, triOffsetZ) );
  //noCursor();
  //noLoop();
  frameRate(60);
}

void draw(){
  background(255);
  switch(statement){
    case 0 : 
      active();
      break;
  }
}

void active(){
   if(runFlag){
    if( iterater < commands.size() && iterater > -1 ){
      oneStepRun( commands.get(iterater) );
      iterater++;
    }else if( iterater >= commands.size() ){
      iterater = 0;
      currentCmd = currentCmd.run();
      
      if(currentCmd != null){
        //println("["+currentCmd.commandLine+"]");
        commands = vrLogoCompiler(currentCmd.commandLine);
      }
      else runFlag = false;
    }
  }
  pushMatrix();
  myCamera();
  drawField( 0, height, 0 );
  drawTri(40, triOffsetX,triOffsetZ,triDirection);
  drawline();
  popMatrix();
  
  drawMap();
  
  if(keyPressed) keyPressed();
}