import 'package:assignment3/graph.dart';
import 'package:assignment3/node.dart';

class Validators {
  static bool isInvalidId(Graph graph, int id) {
    bool contains = false;
    for (MapEntry<Node, List<Node>> entry in graph.adjList.entries) {
      if (entry.key.id == id) {
        contains = true;
        break;
      }
    }
    return contains;
  }

  static bool doesDependencyExist(Graph graph, int parentId, int childId) {
    bool exist = false;
    for (MapEntry<Node, List<Node>> entry in graph.adjList.entries) {
      if (entry.key.id == parentId) {
        for (Node node in entry.value) {
          if (node.id == childId) {
            exist = true;
          }
        }
        break;
      }
    }
    return exist;
  }
}
