class Player {
  PImage image;  // Bild des Spielers
  BoxCollider box;
  float sy;        // Geschwindigkeit y-Richtung
  float sx;        // Geschwindigkeit x-Richtung
  float moveSpeed = 5;
  float jumpPower = 20;
  boolean grounded = true;

  Player() {
    image = loadImage("player.png"); // player.png = euer Bildname
    sy = 0.0;
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
      sy = -jumpPower;
      return true;
    }
    return false;
  }
  
  void checkCollisions() {
    grounded = box.y > 370;
    if(grounded) sy = 0; 
  }

  void move() {
    if (!grounded) sy = sy +1;
    box.y = box.y + sy;
    
    box.x += sx;
    checkCollisions();
  }
}
