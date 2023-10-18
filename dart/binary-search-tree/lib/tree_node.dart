class Node {
  String data = '';
  Node? leftNode, rightNode;

  Node(String data) {
    this.data = data;
  }

  Node? get left => leftNode;
  set left(Node? newLeftNode) {
    leftNode = newLeftNode;
  }

  Node? get right => rightNode;
  set right(Node? newRightNode) {
    rightNode = newRightNode;
  }
}
