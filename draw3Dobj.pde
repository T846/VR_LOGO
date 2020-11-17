void drawField( float offsetX, float offsetY, float offsetZ ){
  pushStyle();
  stroke(100);
  strokeWeight(0.5);
  for(int i = 10; i < 1000; i = i + 10 ) line(offsetX + i, offsetY, offsetZ,  offsetX + i, offsetY, offsetZ + height);
  for(int i = 10; i < 700; i = i + 10 ) line(offsetX, offsetY, offsetZ + i, offsetX + width, offsetY, offsetZ + i);
  popStyle();
}

void drawTri(float size, float cx, float cz, int direction){
  float r = size;
  PVector p1,p2,p3;
  p1 = new PVector( cx + r * cos(radians(direction + 270)), height-2, cz + r * sin(radians(direction + 270)) );
  p2 = new PVector( cx + r * cos(radians(direction + 30)), height-2, cz + r * sin(radians(direction + 30)) );
  p3 = new PVector( cx + r * cos(radians(direction + 150)), height-2, cz + r * sin(radians(direction + 150)) );
  
  
  beginShape();
  fill(255,0,0);
  vertex(p1.x,p1.y, p1.z);
  vertex(p2.x,p2.y, p2.z);
  vertex(p3.x,p3.y, p3.z);
  endShape(CLOSE);
  line(p1.x,p1.y,p1.z, cx,height-2,cz);
}

void drawline(){
    pushStyle();
    noFill();
    stroke(255,0,0);
    strokeWeight(3);
    for( int i = 1; i < paintline.size(); i++ ){
      PVector pp = paintline.get(i-1);
      PVector p = paintline.get(i);
      line( pp.x, pp.y, pp.z, p.x, p.y, p.z );
    }
    popStyle();
}