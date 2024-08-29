# MiscellaneousStuff

## Welcome to the `MiscellaneousStuff` repository!
This repository contains a collection of random code snippets and small projects.

### For example:

#### Python

```
greek_letterz=[chr(code) for code in range(945,970)]

for i in range(len(greek_letterz)):
    print(f"Letter : {greek_letterz[i]}, code : {ord(greek_letterz[i])}\n")
    # Prints all greek letters and their code.
```

#### BubbleSort Js
```
const bubbleSort = (array) => {
  for (let i = 0; i < array.length; i++) {
    for (let j = 0; j < array.length - 1; j++) {
      if (array[j] > array[j + 1]) {
        const temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
      }
    }
  }

  return array;
}
```
