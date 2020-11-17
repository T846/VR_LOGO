void myCamera(){
  float cameraX = triOffsetX - 100 * cos(radians(triDirection + 270));
  float cameraY = height-80;
  float cameraZ = triOffsetZ - 100 * sin(radians(triDirection + 270));
  camera(cameraX,
         cameraY,
         cameraZ,
         
         cameraX + (400 * cos(radians(cameraDirection + 270))) * abs( cos(radians(cameraUpDown)) ),
         cameraY + 400 * sin(radians(cameraUpDown)),
         cameraZ + (400 * sin(radians(cameraDirection + 270))) * abs( cos(radians(cameraUpDown)) ),
         
         0,1,0);
}