
"use strict";

(function() {
  var App = {
    countdown: function(i) {
      this.print(i);
      if (i <= 1) {
        return;
      } else {
        i--;
        this.countdown(i);
      }
    },
    print: function(i) {
      var li = document.createElement('li');
      i = document.createTextNode(i);
      li.appendChild(i);
      document.getElementsByClassName('countdown')[0].appendChild(li);
    }
  };

  App.countdown(5);
})();
