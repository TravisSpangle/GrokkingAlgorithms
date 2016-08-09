
"use strict";

(function() {
  var App = {
    init: function(count, min, max) {
      var randArray = this.randArray(count, min, max),
        len = randArray.length,
        swapMin;

      this.displayArray(randArray);

      for (var i=0; i < len; i++) {
        swapMin = i;
        for (var j=i+1; j < len; j++) {
          if (randArray[j] < randArray[swapMin]) {
            swapMin = j;
          }
        }
        if (i != swapMin) {
          this.swap(randArray, i, swapMin);
        }
      }
      this.print(randArray);
    },
    swap: function(items, firstIndex, secondIndex){
      var temp = items[firstIndex];
      items[firstIndex] = items[secondIndex];
      items[secondIndex] = temp;
    },
    randArray: function(count, min, max, a) {
      var a = (typeof a != 'undefined') ? a : [],
        n = Math.floor(Math.random() * (max - min + 1)) + min;
      if (count > 0) {
        a.push(n);
        count--;
        this.randArray(count, min, max, a);
      }
      return a;
    },
    displayArray: function(a) {
      a = document.createTextNode(a);
      document.getElementsByClassName('selection-array')[0].appendChild(a);
    },
    print: function(a) {
      a.forEach(function(n) {
        var li = document.createElement('li');
        n = document.createTextNode(n);
        li.appendChild(n);
        document.getElementsByClassName('selection-sorted')[0].appendChild(li);
      });
    }
  };

  App.init(5, 2, 10);
})();
