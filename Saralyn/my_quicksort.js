function myQuicksort(arr) {
  if(arr.length === 2) {
    if (arr[0] > arr[1]) {
      var temp = arr[0];
      arr[0] = arr[1];
      arr[1] = temp;
    }
    return arr;
  } else if (arr.length > 1) {
    var leftArr = [];
    var rightArr = [];
    var middleIndex = parseInt(arr.length/2);
    var pivot = arr[middleIndex];
    for (i = 0; i < arr.length; i++) {
        if(i != middleIndex) {
            if (arr[i] > pivot) {
                rightArr.push(arr[i]);
            } else {
                leftArr.push(arr[i])
            }
        }
    }
    return myQuicksort(leftArr).concat(pivot).concat(myQuicksort(rightArr));
  } else {
      return arr;
  }
}
console.log(myQuicksort([2,1,3,4,1,6, 10, -1]))
