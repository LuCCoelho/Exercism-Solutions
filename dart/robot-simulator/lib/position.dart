class Position {
  int x, y;

  Position(this.x, this.y);

  @override
  bool operator ==(Object other) => other is Position && other.x == this.x && other.y == this.y;

  @override
  int get hashCode {
    final int prime = 31;
    int result = 1;
    result = prime * result + x;
    result = prime * result + y;
    return result;
  }

  @override
  String toString() => "[x: $x, y: $y]";

  void advanceNorth() {
    this.y += 1;
  }

  void advanceEast() {
    this.x += 1;
  }

  void advanceSouth() {
    this.y -= 1;
  }

  void advanceWest() {
    this.x -= 1;
  }
}
