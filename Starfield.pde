Star [] bob;
void setup()
{
  size(500, 500);
  bob=new Star [300];
  for (int i=0; i<6; i++) {
    bob[i]=new OddballStar();
  }

  bob[0]=new OddballStar();
  for (int i=6; i<bob.length; i++) {
    bob[i]=new Star();
  }
}
void draw()
{
  background (00, 00, 00);
  for (int i=0; i<bob.length; i++) {
    bob[i].show();
    bob[i].move();
  }
}

void mousePressed()
{
  for (int i=0; i<6; i++) {
    bob[i]=new OddballStar();
  }

  bob[0]=new OddballStar();
  for (int i=6; i<bob.length; i++) {
    bob[i]=new Star();
  }
  for (int i=0; i<bob.length; i++) {
    bob[i].y=250;
    bob[i].x=250;
  }
}

class Star
{
  double x, y, mySpeed, myAngle;
  color c;
  int k;
  Star()
  {
    k=((int)(Math.random()*6))*2;
    x= 250;
    y=250;
    myAngle=Math.random()*2*Math.PI;
    mySpeed=Math.random()*10;
  }


  void move() {
    x += Math.cos(myAngle) * mySpeed;
    y += Math.sin(myAngle) * mySpeed;
  }
  void show() {
    noStroke();
    fill(#FFFF00);
    star((int)x, (int)y, 10, 5, 5); 
    
    fill(255, 255, 255);
  }
}

class OddballStar extends Star{
  OddballStar()
  {
    x=y=250;
    k=(((int)(Math.random()*10))*2)+1;
    mySpeed=Math.random()*4+2;
  }


  void show() {
    noStroke();
    fill(255, 192, 203);
    star((int)x, (int)y, 15, 5, 5); 
    fill(255, 255, 255);
  }


  void move() {
    x += Math.cos(myAngle) * mySpeed;
    y += Math.sin(myAngle) * mySpeed;
    if (x>500 || x<0 ||y>500 || y<0) {
      x = 250;
      y = 250;
    }
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

