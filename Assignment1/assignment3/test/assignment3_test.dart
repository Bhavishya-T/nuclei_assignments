import 'package:assignment3/assignment3.dart';
import 'package:assignment3/validation_utils.dart';
import 'package:assignment3/graph.dart';
import 'package:assignment3/node.dart';
import 'package:test/test.dart';

void main() {
  Graph graph = Graph();
  Node node1 = Node(1, "Node 1");
  Node node2 = Node(2, "Node 2");
  Node node3 = Node(3, "Node 3");
  Node node4 = Node(4, "Node 4");
  Node node5 = Node(5, "Node 5");
  graph.adjList[node1] = [node2, node3];
  graph.adjList[node4] = [node5, node2];
  group("Testing Validations ", () {
    group("Node ID ", () {
      test("Node not present", () {
        expect(() => InvalidIdException.main(graph, 6), throwsException);
      });
      test("Node present", () {
        expect(() => InvalidIdException.main(graph, 4), returnsNormally);
      });
    });
    group("Dependecy check", () {
      test("Dependency exists", () {
        expect(() => DependencyExists.main(graph, 4, 5), throwsException);
      });
      test("Dependency does not exist", () {
        expect(() => DependencyExists.main(graph, 5, 5), returnsNormally);
      });
    });
  });
  group("Testing Graph methods", () {
    group("Immediate Parents", () {
      test("Only 2 parents found", () {
        expect(() => graph.getImmediateParents(2), returnsNormally);
      });
    });
    group("Immediate Children", () {
      test("0 children found", () {
        expect(() => graph.getImmediateParents(5), returnsNormally);
      });
    });
    group("Ancestors ", () {
      test("2 ancestors found", () {
        expect(() => graph.getAncestors(5), returnsNormally);
      });
    });
    group("Delete Dependency ", () {
      test("4 -> 5 Dependency deleted", () {
        expect(() => graph.deleteDependency(4, 5), true);
      });
      test("5 -> 4 Dependency invalid", () {
        expect(() => graph.deleteDependency(4, 5), false);
      });
    });
    group("Adding Dependency ", () {
      test("4 -> 5 Dependency deleted", () {
        expect(() => graph.addDependency(4, 5), true);
      });
      test("4 -> 5 Dependency invalid", () {
        expect(() => graph.deleteDependency(4, 5), false);
      });
    });
  });
}
