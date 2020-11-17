void oneStepRun( int[] cmd ){
   switch(cmd[0]){
     case 0:
     forward(cmd[1]);
     break;
     
     case 1:
     back(cmd[1]);
     break;
     
     case 2:
     right(cmd[1]);
     break;
     
     case 3:
     left(cmd[1]);
     break;
   }
}

float forward(int dv){
  float result = 0;
  triOffsetX += dv * cos(radians(triDirection + 270));
  triOffsetZ += dv * sin(radians(triDirection + 270));
  paintline.add(new PVector( triOffsetX, height-1, triOffsetZ ));
  return result;
}

float back(int dv){
  float result = 0;
  triOffsetX -= dv * cos(radians(triDirection + 270));
  triOffsetZ -= dv * sin(radians(triDirection + 270));
  paintline.add(new PVector( triOffsetX, height-1, triOffsetZ ));
  return result;
}

float right(int dd){
  float result = 0;
  triDirection += dd;
  cameraDirection += dd;
  return result;
}

float left(int dd){
  float result = 0;
  triDirection -= dd;
  cameraDirection -= dd;
  return result;
}