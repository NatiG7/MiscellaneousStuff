/**
 * Function to count occurrences of each unique number in an array.
 * @param {Array} arr - The array of numbers to analyze.
 * @returns {Object} - An object with each unique number as a key, and the number of occurrences as its value.
 */
const countOccurrences = (arr) => {
    const counts = {};  // Initialize an empty object to store counts

    // Loop through each number in the array
    arr.forEach((num) => {
        // If the number exists in the counts object, increment by 1
        // If not, set the count to 1 (initializing the number in the object)
        counts[num] = (counts[num] || 0) + 1;
    });

    return counts;  // Return the object containing the counts of each number
};

// Test case
const numbersArray = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4];  // Sample array with repeated numbers
const occurrences = countOccurrences(numbersArray);  // Call the function to get the count

console.log(occurrences);  // Output: { '1': 1, '2': 2, '3': 3, '4': 4 }
