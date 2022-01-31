import 'package:assignment3/node.dart';

class GraphMethods {
  static Map<Node, List<Node>> graphReverse(Map<Node, List<Node>> adjList) {
    Map<Node, List<Node>> result = {};
    adjList.forEach((key, value) {
      value.forEach((element) {
        if (!result.containsKey(element)) {
          result[element] = [];
        }
        result[element]?.add(key);
      });
    });
    return result;
  }

  static List<Node> dfs(Map<Node, List<Node>> adjList, int id) {
    List<Node> result = [];
    adjList.forEach((key, value) {
      if (key.id == id) {
        value.forEach((element) {
          result.addAll(dfs(adjList, element.id));
        });
        result.addAll(value);
      }
    });
    return result;
  }
}
