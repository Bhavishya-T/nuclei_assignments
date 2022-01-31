import 'package:assignment3/graph.dart';
import 'package:assignment3/node.dart';

class InvalidIdException implements Exception {
  String cause;
  InvalidIdException(this.cause);
  static void main(Graph graph, int id) {
    bool contains = false;
    for (MapEntry<Node, List<Node>> entry in graph.adjList.entries) {
      if (entry.key.id == id) {
        contains = true;
        break;
      }
    }
    if (!contains) {
      throw InvalidIdException("ID entered does not exist in the graph");
    }
  }
}

class DependencyExists implements Exception {
  String cause;
  DependencyExists(this.cause);
  static void main(Graph graph, int parentId, int childId) {
    for (MapEntry<Node, List<Node>> entry in graph.adjList.entries) {
      if (entry.key.id == parentId) {
        for (Node node in entry.value) {
          if (node.id == childId) {
            throw DependencyExists("Dependency already exists");
          }
        }
        break;
      }
    }
  }
}
