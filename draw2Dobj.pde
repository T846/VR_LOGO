void drawMap(){
  float mapSize = 0.4;//0.0~1.0
  int mapW = int(width * mapSize);
  int mapH = int(height * mapSize);
  PGraphics pg = createGraphics(mapW,mapH);
  
  pg.beginDraw();
    pg.background(255);
    pg.noFill();
    pg.stroke(0);
    pg.rect(0,0,mapW-1,mapH-1);
    pg.pushStyle();
      pg.stroke(255, 0, 0);
      pg.beginShape();
        for( PVector p : paintline ){
          pg.vertex( p.x * mapSize, p.z*mapSize );
        }
      pg.endShape();
    pg.popStyle();
  pg.endDraw();
  drawSmallTri( pg, 40 * mapSize, triOffsetX * mapSize, triOffsetZ * mapSize, triDirection);
  
  loadPixels();
  pg.loadPixels();
  for(int y = 0; y < mapH; y++){
    for(int x = 0; x < mapW; x++ ){
      pixels[y * width + x] = pg.pixels[ y*mapW + x];
    }
  }
  updatePixels();
  
}

void drawSmallTri(PGraphics pg, float size, float cx, float cz, int direction){
  float r = size;
  PVector p1,p2,p3;
  p1 = new PVector( cx + r * cos(radians(direction + 270)), cz + r * sin(radians(direction + 270)) );
  p2 = new PVector( cx + r * cos(radians(direction + 30)), cz + r * sin(radians(direction + 30)) );
  p3 = new PVector( cx + r * cos(radians(direction + 150)), cz + r * sin(radians(direction + 150)) );
  
  pg.beginDraw();
  pg.beginShape();
  pg.fill(255,0,0);
  pg.vertex(p1.x,p1.y);
  pg.vertex(p2.x,p2.y);
  pg.vertex(p3.x,p3.y);
  pg.endShape(CLOSE);
  pg.line(p1.x,p1.y, cx,cz);
  pg.endDraw();
}