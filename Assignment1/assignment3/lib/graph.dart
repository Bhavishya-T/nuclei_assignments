import 'package:assignment3/node.dart';
import 'package:assignment3/graph_methods.dart';

//combining graph methods

class Graph {
  Map<Node, List<Node>> adjList = {};

  //Also use adjList for parents for better time complexity
  //Also use adjList with int -> List<Node>
  //breaking from forEach loop

  List<Node> getImmediateParents(int id) {
    List<Node> parents = [];
    // for (MapEntry<Node,List<Node>> item in adjList.entries) {

    // }
    adjList.forEach((key, value) {
      value.forEach((element) {
        if (element.id == id) {
          parents.add(key);
        }
      });
    });
    return parents;
  }

  List<Node> getImmediateChildren(int id) {
    List<Node> result = [];
    adjList.forEach((key, value) {
      if (key.id == id) {
        result.addAll(value);
      }
    });
    return result;
  }

  List<Node> getAncestors(int id) {
    List<Node> result = [];
    Map<Node, List<Node>> reversedAdjList = GraphMethods.graphReverse(adjList);
    GraphMethods.dfs(reversedAdjList, id);
    return result;
  }

  List<Node> getDescendants(int id) {
    List<Node> result = [];

    GraphMethods.dfs(adjList, id);
    return result;
  }

  bool deleteDependency(int parentId, int childId) {
    bool nodeFound = false;
    adjList.forEach((key, value) {
      if (key.id == parentId) {
        value.forEach((element) {
          if (element.id == childId) {
            adjList[key]?.remove(element);
            nodeFound = true;
          }
        });
      }
    });
    return nodeFound;
  }

  void deleteNode(int id) {
    adjList.forEach((key, value) {
      if (key.id == id) {
        value.forEach((element) {
          deleteNode(element.id);
          adjList.remove(element);
        });
      }
    });
  }

  bool addDependency(int parentId, int childId) {
    List<Node> result = GraphMethods.dfs(adjList, childId);
    if (result.contains(parentId)) {
      return false;
    }
    return true;
  }

  void addNode(int id, String name) {
    Map<Node, List<Node>> newNode = {};
    newNode[Node(id, name)] = [];
  }
}
