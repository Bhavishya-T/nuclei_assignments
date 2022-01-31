import 'dart:io';
import 'package:assignment3/assignment3.dart' as assignment3;
import 'package:assignment3/graph.dart';

//globalising graph object

void main(List<String> arguments) {
  try {
    int choice = 0;
    Graph graph = Graph();
    do {
      print('''
      Choose an option - 
      1. Get the immediate parents of a node
      2. Get the immediate children of a node
      3. Get the ancestors of a node
      4. Get the descendants of a node
      5. Delete dependency from a tree
      6. Delete a node from a tree
      7. Add a new dependency to a tree
      8. Add a new node to tree
      9. Exit
      ''');
      choice = int.parse(stdin.readLineSync()!);
      switch (choice) {
        case 1:
          assignment3.Operations.getImmediateParents(graph);
          break;
        case 2:
          assignment3.Operations.getImmediateChildren(graph);
          break;
        case 3:
          assignment3.Operations.getAncestors(graph);
          break;
        case 4:
          assignment3.Operations.getDescendants(graph);
          break;
        case 5:
          assignment3.Operations.deleteDependency(graph);
          break;
        case 6:
          assignment3.Operations.deleteNode(graph);
          break;
        case 7:
          assignment3.Operations.addDependency(graph);
          break;
        case 8:
          assignment3.Operations.addNode(graph);
          break;
        default:
          throw Exception("Option is invalid");
      }
    } while (choice != 9);
  } catch (exception) {
    print("$exception");
  }
}
