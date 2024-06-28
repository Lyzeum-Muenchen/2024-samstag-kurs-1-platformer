class Player {
  PImage image;  // Bild des Spielers
  BoxCollider box;
  float sy;        // Geschwindigkeit y-Richtung
  float sx;     // Geschwindigkeit x-Richtung
  float jumpPower = 20;
  float moveSpeed = 5;

  Player() {
    image = loadImage("player.png"); // player.png = euer Bildname
    sy = 5.0;
    box = new BoxCollider(50., 50., 100., 100.);
  }

  void draw () {
    image(image, box.x, box.y, box.w, box.h);
  }
  
  void move() {
    println(box.y);
    box.x += sx;
    if (box.y + sy <= 370) box.y = box.y + sy;
    sy = sy +1;
  }
  
  void setDirection(int dir) {
    if (dir < 0) sx = - moveSpeed;
    else if (dir > 0) sx = moveSpeed;
    else sx = 0;

  }
  
  void jump() {
    if (box.y >= 365) sy = - jumpPower;
  }
}
