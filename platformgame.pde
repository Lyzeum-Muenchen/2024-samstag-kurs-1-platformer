Player p;

void setup() {
  size(800, 500);
  p = new Player();
}

void draw() {
  background(250, 250, 250);
  fill(80, 30, 80);            // Legen die Farbe fest: Dunkelgrau 0-255
  rect(0, 450, 800, 30);       // rect(x, y, größe-x, größe-y);
  image(p.image, p.box.x, p.box.y, p.box.w, p.box.h);
  
  if (p.box.y + p.sy <= 370) p.box.y = p.box.y + p.sy;
  p.sy = p.sy +1;
  
}

void keyPressed() {
  if (key == 'd') p.box.x = p.box.x + 10;
  else if (key == 'a') p.box.x = p.box.x - 10;
  if (key == 'w' && p.box.y >= 362) {
    p.sy = -15;
  }
}
