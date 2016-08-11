# Ch 4 Exercises
### 4.1
#### Sum Function
```javascript
(function() {
  var arr = [2,5,6,7];
  var test = {
    base: 0,
    sum: function() {
      if (arr.length == 0) {
        return this.base;
      } else {
        this.base = this.base + arr.shift();
        this.sum();
      }
      return this.base;
    }
  }
  var sum = test.sum(arr);
  console.log(sum);
})();
```
### 4.2
#### Recursive Function
```javascript
(function() {
  var arr = [2,5,6,7];
  var test = {
    base: 0,
    count: function() {
      if (arr.length == 0) {
        return this.base;
      } else {
        arr.shift();
        this.base = this.base + 1;
        this.count();
      }
      return this.base;
    }
  }
  var count = test.count(arr);
  console.log(count);
})();
```
### 4.3
#### Find Max Number
```javascript
(function() {
  var arr = [2,5,6,7];
  var test = {
    base: 0,
    max: function() {
      if (arr.length == 0) {
        return this.base;
      } else {
        var next = arr.shift();
        this.base = (this.base < next) ? next : this.base;
        this.max();
      }
      return this.base;
    }
  }
  var max = test.max(arr);
  console.log(max);
})();
```
### 4.4
#### Binary Search
Base Case = [] or [1]

Recursive Case = half of the array that matches the parameters for *x*.
##### 4.5
O(n)
##### 4.6
O(n)
##### 4.7
O(n)
##### 4.8
O(n²)
### Ch. 4 Homework
Javascript generic sort:
Array.prototype.sort()

D&Q Quicksort
```javascript
(function() {
  var numSet = [2,62,9,18,32,8,53];
  var test = {
    quicksort: function(arr) {
      if (arr.length < 2) {
        return arr;
      } else {
        var index = Math.round(arr.length / 2);
        var pivot = arr[index];
        var less = [];
        var greater = [];
        arr.forEach(function(x) {
          if (x < pivot) {
            less.push(x);
          } else if (x > pivot) {
            greater.push(x);
          }
        });
        return this.quicksort(less).concat(pivot, this.quicksort(greater));
      }
    }
  }
  var sorted = test.quicksort(numSet);
  console.log(sorted);
})();
```

User Data App
```javascript
(function() {
    var test = {
        init: function() {
          localStorage.setItem('10011', JSON.stringify(['Willow', 'Jose', 'Layla']));
          localStorage.setItem('98101', JSON.stringify(['John', 'Billy']));

        },
        getByZip: function(zip) {
          console.log('zip: ' + zip);
          console.log('Names at zip:')
          var data = JSON.parse(localStorage.getItem(zip));
          data.forEach(function(name) {
            console.log(name)
          });
        }
    }
    test.init();
    test.getByZip(10011);
})();
```

# Ch 5 Exercises
##### 5.1
Inconsistent
##### 5.2
Consistent
##### 5.3
Consistent
##### 5.4
Inconsistent
##### 5.5
Function #4
##### 5.6
Function #2
##### 5.7
Function #4
