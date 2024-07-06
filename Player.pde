class Player {
  PImage image;  // Bild des Spielers
  BoxCollider box;
  float sy;        // Geschwindigkeit y-Richtung
  float sx;        // Geschwindigkeit x-Richtung
  float moveSpeed = 5;

  Player() {
    image = loadImage("player.png"); // player.png = euer Bildname
    sy = 5.0;
    box = new BoxCollider(50., 50., 100., 100.);
  }

  void draw() {
    image(image, box.x, box.y, box.w, box.h);
  }
  
  void setDirection(int direction){
    sx = direction * moveSpeed;
  }
  
  boolean jump(){
    if (box.y >= 365){
      sy = -10;
      return true;
    }
    return false;
  }

  void move() {
    if (box.y + sy <= 370) box.y = box.y + sy;
    sy = sy +1;
    box.x += sx;
  }
}
