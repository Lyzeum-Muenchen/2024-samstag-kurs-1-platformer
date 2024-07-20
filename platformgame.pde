boolean[] keysPressed = new boolean[128];
ArrayList<Platform> platforms = new ArrayList<Platform>();
Player p;



void setup() {
  size(800, 500);
  p = new Player();
  platforms.add(new Platform(200, 275, 100, 30, color(80, 30, 80)));
  platforms.add(new Platform(0, 450, 800, 30, color(80, 30, 80)));
}

void draw() {
  background(250, 250, 250);
  
  for (Platform platform : platforms){
    platform.draw();
  }
  
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
