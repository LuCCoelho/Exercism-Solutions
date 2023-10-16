import 'package:robot_simulator/orientation.dart';
import 'package:robot_simulator/position.dart';

class Robot {
  Position position;
  Orientation orientation;

  Robot(this.position, this.orientation);

  void move(String instructions) {
    var instructionsList = instructions.split('');
    List<Orientation> orientationsList = Orientation.values;
    for (String movement in instructionsList) {
      int orientationNum = orientationsList.indexOf(this.orientation);
      switch (movement) {
        case 'R':
          if (orientationNum >= 0 && orientationNum < 3) {
                int next = orientationNum + 1;
                this.orientation = orientationsList[next];  
          } else {
            this.orientation = orientationsList[0];
          }
          continue;
        case 'L':
          if (orientationNum > 0 && orientationNum <= 3) {
                int previous = orientationNum - 1;
                this.orientation = orientationsList[previous];  
          } else {
            this.orientation = orientationsList[3];
          }
          continue;
        default:
          switch (this.orientation) {
            case Orientation.north:
              this.position.advanceNorth();
              continue;
            case Orientation.east:
              this.position.advanceEast();
              continue;
            case Orientation.south:
              this.position.advanceSouth();
              continue;
            default:
              this.position.advanceWest();
          }
      }
    }
  }
}