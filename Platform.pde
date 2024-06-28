class Platform {

  BoxCollider box;
  color c;

  Platform(float x, float y, float w, float h, color c_) {
    box = new BoxCollider(x, y, w, h);
    c = c_;
  }  
  
  void draw() {
    fill(c);
    rect(box.x, box.y, box.w, box.h);
  }
}
