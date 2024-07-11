class Platform {

  BoxCollider box;
  color fillColor;

  Platform (float x, float y, float w, float h, color fillC) {
    box = new BoxCollider(x, y, w, h);
    fillColor = fillC;
  }

  void draw() {
    fill(fillColor);
    rect(box.x, box.y, box.w, box.h);
  }
}
