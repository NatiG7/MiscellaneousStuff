# MiscellaneousStuff

## Welcome to the `MiscellaneousStuff` repository!
This repository contains a collection of random code snippets and small projects.

### For example:

#### Greek Chars

```python
# Generate Greek characters from Unicode code points 945 to 969
greekChar = [chr(code) for code in range(945, 970)]

# Print each Greek letter with its corresponding code point
for char in greekChar:
    print(f"Letter: {char}, Code: {ord(char)}")
# If you need uppercase Greek letters, you can use a different Unicode range, typically from 913 to 937.
```

#### BubbleSort Js
```javascript
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
