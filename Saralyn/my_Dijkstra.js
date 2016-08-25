var graph = {
  'book': {'rareLP': 5, 'poster': 0},
  'rareLP': {'drumSet': 35, 'bassGuitar': 15},
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
    if (checked.indexOf(node) === -1 && costs[node] < lowestCost) {
      lowestCost = costs[node];
      lowestCostNode = node;
    }
  }
  return node;
}
// function node(itemType) {
//     this.itemType = itemType;
//     this.lowestCost = Infinity;
//     this.bestParent = null;
// }
//
// var pianoBook = new node('book');
// var rareLP = new node('rareLP');
// var poster = new node('poster');
// var bassGuitar = new node('bassGuitar');
// var drumSet = new node('drumSet');
// var piano = new node('piano');
//
// var graph = {
//     'book': {
//         'neighbors': [
//               {'item': rareLP, 'cost': 5},
//               {'item': poster, 'cost': 0}
//             ],
//         'checked': false
//     },
//     'rareLP': {
//         'neighbors': [
//             {'item': drumSet, 'cost': 20},
//             {'item': bassGuitar, 'cost': 15}
//         ],
//         'checked': false
//     },
//     'poster': {
//         'neighbors': [
//             {'item': bassGuitar, 'cost': 30},
//             {'item': drumSet, 'cost': 35}
//         ],
//         'checked': false
//     },
//     'bassGuitar': {
//         'neighbors': [
//             {'item': bassGuitar, 'cost': 30},
//             {'item': drumSet, 'cost': 35}
//         ],
//     'checked': false
//     },
//     'drumSet': {
//         'neighbors': [
//             {'item': piano, 'cost': 10}
//         ],
//         'checked': false
//         },
//     'piano': {
//         'neighbors': [],
//         'checked': false
//     }
// }
//
// function myDijkstra(graph, startNode) {
//   var node = findLowestCostNode(graph, startNode);
//   console.log(node);
//   // var neighbors = graph[node]['neighbors'];
//   // var cost = graph[node]['cost'];
//   // console.log(cost);
//   // neighbors.forEach(function(neighbor) {
//   //   console.log(neighbor['cost']);
//   // });
// }
//
// myDijkstra(graph, 'book');
//
// function findLowestCostNode(graph, startNode) {
//   var childrenOfNode = graph[startNode]['neighbors'];
//   if (childrenOfNode.length === 0) {
//     return null;
//   }
//   var lowestCostNode = childrenOfNode[0];
//   var lowestCost = childrenOfNode[0]['cost'];
//   for (i = 1; i < childrenOfNode.length; i++) {
//     if (childrenOfNode[i]['cost'] < lowestCost) {
//       lowestCostNode = childrenOfNode[i];
//       lowestCost = childrenOfNode[i]['cost'];
//     }
//   }
//   return lowestCostNode;
// }
