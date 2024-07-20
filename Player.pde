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

  void setDirection(int direction) {
    sx = direction * moveSpeed;
  }

  boolean jump() {
    if (grounded) sy = -jumpPower;
    return grounded;
  }

  void checkCollisions() {
    grounded = false;
    // for (<Datentyp> <variable> : <Liste>)
    for (Platform platform : platforms) {
      // falls Spieler mit Platform kollidiert
      if (box.collidesWith(platform.box)) {
        // Berechne Abstand zwischen Spieler und Platform
        float dx = box.x + box.w - platform.box.x;
        if (sx < 0) dx = box.x - (platform.box.x + platform.box.w);

        float dy = box.y + box.h - platform.box.y;
        if (sy < 0) dy = box.y - (platform.box.y + platform.box.h);
      }
      if (box.isOnTopOf(platform.box)) grounded = true;
    }
  }
    void move() {
      if (!grounded) sy = sy +1;
      box.y = box.y + sy;

      box.x += sx;
      checkCollisions();
    }
  }
