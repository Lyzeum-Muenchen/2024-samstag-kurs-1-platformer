boolean[] keysPressed = new boolean[128];
Player p;



void setup() {
  size(800, 500);
  p = new Player();
}

void draw() {
  background(250, 250, 250);
  fill(80, 30, 80);            // Legen die Farbe fest: Dunkelgrau 0-255
  rect(0, 450, 800, 30);       // rect(x, y, größe-x, größe-y);
  p.draw();
  
  p.setDirection(int(keysPressed['D']) - int(keysPressed['A']));
  if (keysPressed['W']) p.jump();

  p.move();
}

void keyPressed() {
  if (keyCode < 128) keysPressed[keyCode] = true;
}

void keyReleased() {
  if (keyCode < 128) keysPressed[keyCode] = false;
}
