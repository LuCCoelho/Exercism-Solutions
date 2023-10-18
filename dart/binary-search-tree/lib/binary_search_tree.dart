import 'tree_node.dart';

class BinarySearchTree {
  Node root = new Node('');

  BinarySearchTree(String root) {
    this.root = new Node(root);
  }

  void insert(String nodeData, [Node? currentNode = null]) {
    if (currentNode == null) {
      currentNode = this.root;
    }
    int intNodeData = int.parse(nodeData);
    int intCurrentNodeData = int.parse(currentNode.data);
    if (intNodeData <= intCurrentNodeData) {
      if (currentNode.left == null) {
        currentNode.left = new Node(nodeData);
        return;
      }
      currentNode = currentNode.left!;
      this.insert(nodeData, currentNode);
    } else {
      if (currentNode.right == null) {
        currentNode.right = new Node(nodeData);
        return;
      }
      currentNode = currentNode.right!;
      this.insert(nodeData, currentNode);
    }
  }

  List<String> get sortedData {
    return this.sortData();
  }

  List<String> sortedDataList = [];
  List<String> sortData([Node? currentNode = null]) {
    if (currentNode == null) {
      currentNode = this.root;
    }
    if (currentNode.left != null) {
      this.sortData(currentNode.left!);
      sortedDataList.add(currentNode.data);
      if (currentNode.right != null) {
        this.sortData(currentNode.right!);
      }
      return sortedDataList;
    } else {
      sortedDataList.add(currentNode.data);
      if (currentNode.right != null) {
        this.sortData(currentNode.right!);
      }
      return sortedDataList;
    }
  }
}
