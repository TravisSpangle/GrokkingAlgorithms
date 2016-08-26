'use strict'

var graph = {
  "me": {'friends': ["alice", "bob", "claire"], 'checked': false, 'job': 'welder'}
};

graph["alice"] = {'friends': ["peggy"], 'checked': false, 'job': 'architect'};
graph["claire"] = {'friends': ["thom", "jonny"], 'checked': false, 'job': 'teacher'};
graph["anuj"] = {'friends': [], 'checked': false, 'job': 'athlete'};
graph["peggy"] = {'friends': [], 'checked': false, 'job': 'artist'};
graph["thom"] = {'friends': [], 'checked': false, 'job': 'mango seller'};
graph["jonny"] = {'friends': [], 'checked': false, 'job': 'accountant'};
graph["bob"] = {'friends': ["claire"], 'checked': false, 'job' : 'unemployed'};

var friendsQueue = graph["me"]['friends'];

(function findSeller() {
    while (friendsQueue.length !== 0) {
        var currentPerson = friendsQueue.shift();
            if (!graph[currentPerson].checked) {
                graph[currentPerson].checked = true;
                if (personIsSeller(currentPerson)) {
                    console.log(currentPerson + " is a mango seller!");
                    return true;
            } else {
                friendsQueue = friendsQueue.concat(graph[currentPerson]['friends']);
            }
        }
    }
    return true;
})();

function personIsSeller(currentPerson) {
    return graph[currentPerson].job === "mango seller";
}
