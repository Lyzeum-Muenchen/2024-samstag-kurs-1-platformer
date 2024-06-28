class Player {
  PImage image;  // Bild des Spielers
  BoxCollider box;
  float sy;        // Geschwindigkeit y-Richtung
  float sx;     // Geschwindigkeit x-Richtung
  float jumpPower = 15;
  float moveSpeed = 5;
  float gravity = 0.6;
  boolean grounded = false;


  Player() {
    image = loadImage("player.png"); // player.png = euer Bildname
    sy = 0.0;
    box = new BoxCollider(50., 50., 55., 71.);
  }

  void draw () {
    //rect(box.x,box.y,box.w,box.h);
    image(image, box.x - 21, box.y - 17, 100., 100.);
  }

  void move() {
    if(! grounded) sy = sy + gravity;
    box.x += sx;
    box.y = box.y + sy;
    println("(x: " + box.x + ", y: " + box.y + ", sx: " + sx + ", sy: " + sy);

    checkCollisions();
  }

  void setDirection(int dir) {
    if (dir < 0) sx = - moveSpeed;
    else if (dir > 0) sx = moveSpeed;
    else sx = 0;
  }

  boolean jump() {
    if (grounded) sy = - jumpPower;
    return grounded;
  }

  void checkCollisions() {
    grounded = false;
    for (Platform platform : platforms) {
      if (box.collidesWith(platform.box)) {
        println("Hilfe");
        // Abstand zum Rand mit dem der Spieler kollidiert ist
        float dx = box.x + box.w - platform.box.x;
        if (sx < 0) dx = box.x - (platform.box.x + platform.box.w);
        float dy = box.y + box.h - platform.box.y;
        if (sy < 0) dy = box.y - (platform.box.y + platform.box.h);

        // Zeitpunkt der Kollision
        boolean isHorizontal = (sy == 0 || abs(dx / sx) < abs(dy / sy));
        
        println("x: " +box.x + ", y: " + box.y); 
                
        if (isHorizontal) box.x -= dx;
        else box.y -= dy;
        
        println("x: " +box.x + ", y: " + box.y + " isHor: " + isHorizontal);

        if (isHorizontal) sx = 0;
        else sy = 0;
      }
      if (box.isOnTopOf(platform.box)) grounded = true;
    }
  }
}
