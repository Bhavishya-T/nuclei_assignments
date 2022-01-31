import 'dart:io';
import 'package:assignment3/node.dart';
import 'package:assignment3/graph.dart';
import 'package:assignment3/validation_utils.dart';

class Operations {
  static void getImmediateParents(Graph graph) {
    try {
      print("Enter node ID - ");
      int id = int.parse(stdin.readLineSync()!);
      InvalidIdException.main(graph, id);
      List<Node> result = graph.getImmediateParents(id);
      print("Parents obtained are - $result");
    } on InvalidIdException catch (exception) {
      print("$exception");
    } catch (exception) {
      print("ID entered should be a valid number");
    }
  }

  static void getImmediateChildren(Graph graph) {
    try {
      print("Enter node ID - ");
      int id = int.parse(stdin.readLineSync()!);
      InvalidIdException.main(graph, id);
      List<Node> result = graph.getImmediateChildren(id);
      print("Children obtained are - $result");
    } on InvalidIdException catch (exception) {
      print("$exception");
    } catch (exception) {
      print("ID entered should be a valid number");
    }
  }

  static void getAncestors(Graph graph) {
    try {
      print("Enter node ID - ");
      int id = int.parse(stdin.readLineSync()!);
      InvalidIdException.main(graph, id);
      List<Node> result = graph.getAncestors(id);
      print("Children obtained are - $result");
    } on InvalidIdException catch (exception) {
      print("$exception");
    } catch (exception) {
      print("ID entered should be a valid number");
    }
  }

  static void getDescendants(Graph graph) {
    try {
      print("Enter node ID - ");
      int id = int.parse(stdin.readLineSync()!);
      InvalidIdException.main(graph, id);
      List<Node> result = graph.getDescendants(id);
      print("Children obtained are - $result");
    } on InvalidIdException catch (exception) {
      print("$exception");
    } catch (exception) {
      print("ID entered should be a valid number");
    }
  }

  static void deleteDependency(Graph graph) {
    try {
      print("Enter parent node ID - ");
      int parentId = int.parse(stdin.readLineSync()!);
      InvalidIdException.main(graph, parentId);
      print("Enter Child node ID - ");
      int childId = int.parse(stdin.readLineSync()!);
      InvalidIdException.main(graph, childId);
      bool deleted = graph.deleteDependency(parentId, childId);
      if (deleted) {
        print("Dependency successfully deleted");
      } else {
        print("Dependency does not exist");
      }
    } on InvalidIdException catch (exception) {
      print("$exception");
    } catch (exception) {
      print("ID entered should be a valid number");
    }
  }

  static void deleteNode(Graph graph) {
    try {
      print("Enter node ID - ");
      int id = int.parse(stdin.readLineSync()!);
      InvalidIdException.main(graph, id);
      graph.deleteNode(id);
      print("Successfully deleted the node");
    } on InvalidIdException catch (exception) {
      print("$exception");
    } catch (exception) {
      print("ID entered should be a valid number");
    }
  }

  static void addDependency(Graph graph) {
    try {
      print("Enter parent node ID - ");
      int parentId = int.parse(stdin.readLineSync()!);
      InvalidIdException.main(graph, parentId);
      print("Enter Child node ID - ");
      int childId = int.parse(stdin.readLineSync()!);
      InvalidIdException.main(graph, childId);
      bool added = graph.addDependency(parentId, childId);
      DependencyExists.main(graph, parentId, childId);
      if (added) {
        print("Dependency successfully added");
      } else {
        print("Dependency creates a cycle, unable to add");
      }
    } on InvalidIdException catch (exception) {
      print("$exception");
    } on DependencyExists catch (exception) {
      print("$exception");
    } catch (exception) {
      print("ID entered should be a valid number");
    }
  }

  static void addNode(Graph graph) {
    try {
      print("Enter node ID -");
      int id = int.parse(stdin.readLineSync()!);
      InvalidIdException.main(graph, id);
      print("Enter node name -");
      String name = stdin.readLineSync()!;
      graph.addNode(id, name);
      print(
          "Node has been added, you can now choose option 7 to add dependencies");
    } on InvalidIdException catch (exception) {
      print("$exception");
    } catch (exception) {
      print("ID entered should be a valid number");
    }
  }
}
