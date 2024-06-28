class BoxCollider {
  float x;
  float y;
  float w; // width
  float h; // height

  BoxCollider(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }

  boolean collidesWith (BoxCollider other) {
    return x < other.x + other.w && other.x < x + w &&
      y < other.y + other. h && other.y < y + h;
  }

  boolean isOnTopOf(BoxCollider other) {
    return (other.y == y + h && other.x < x + w && other.x + other.w > x);
  }
}
