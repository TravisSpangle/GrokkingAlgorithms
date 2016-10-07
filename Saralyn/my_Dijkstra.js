var graph = {
  'book': {'rareLP': 5, 'poster': 0},
  'rareLP': {'drumSet': 20, 'bassGuitar': 15},
  'poster': {'bassGuitar': 30, 'drumSet': 35},
  'bassGuitar': {'piano': 20},
  'drumSet': {'piano': 10}
};

var costs = {
  'rareLP': 5,
  'poster': 0,
  'bassGuitar': Infinity,
  'drumSet': Infinity,
  'piano': Infinity
};

var parents = {
  'rareLP': 'book',
  'poster': 'book',
  'bassGuitar': null,
  'drumSet': null,
  'piano': null
};

var checked = [];

(function myDijkstra() {
  var node = findLowestCostNode(costs);
  while (node !== null) {
    var neighbors = graph[node];
    var cost = costs[node];
    for (var neighbor in neighbors) {
      var newCost = cost + neighbors[neighbor];
      if (newCost < costs[neighbor]) {
        costs[neighbor] = newCost;
        parents[neighbor] = node;
      }
    }
    checked.push(node);
    node = findLowestCostNode(costs);
  }
})();

function findLowestCostNode(costs) {
  var lowestCost = Infinity;
  var lowestCostNode = null;
  for (var node in costs) {
    var cost = costs[node];
    if (checked.indexOf(node) === -1 && cost < lowestCost) {
      lowestCost = cost;
      lowestCostNode = node;
    }
  }
  return lowestCostNode;
}
