import 'package:assignment3/graph.dart';
import 'package:assignment3/node.dart';
import 'package:assignment3/validator.dart';

class InvalidIdException implements Exception {
  String cause;
  InvalidIdException(this.cause);
  static void main(Graph graph, int id) {
    if (!Validators.isInvalidId(graph, id)) {
      throw InvalidIdException("ID entered does not exist in the graph");
    }
  }
}

class DependencyExists implements Exception {
  String cause;
  DependencyExists(this.cause);
  static void main(Graph graph, int parentId, int childId) {
    if (Validators.doesDependencyExist(graph, parentId, childId)) {
      throw DependencyExists("Dependency already exists");
    }
  }
}
