class Player {
  PImage image;  // Bild des Spielers
  BoxCollider box;
  float sy;        // Geschwindigkeit y-Richtung

  Player() {
    image = loadImage("player.png"); // player.png = euer Bildname
    sy = 5.0;
    box = new BoxCollider(50., 50., 100., 100.);
  }
}
