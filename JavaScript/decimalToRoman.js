const numberInput = document.getElementById("number");
const convertBtn = document.getElementById("convert-btn");
const result = document.getElementById("output");

// Number conversion function
const decimalToRomanNumber = (num) => {
    const romanNumerals = [
        { symbol: 'M', value: 1000 },
        { symbol: 'CM', value: 900 },
        { symbol: 'D', value: 500 },
        { symbol: 'CD', value: 400 },
        { symbol: 'C', value: 100 },
        { symbol: 'XC', value: 90 },
        { symbol: 'L', value: 50 },
        { symbol: 'XL', value: 40 },
        { symbol: 'X', value: 10 },
        { symbol: 'IX', value: 9 },
        { symbol: 'V', value: 5 },
        { symbol: 'IV', value: 4 },
        { symbol: 'I', value: 1 }
    ];
    let romanNum = "";
    for (const { symbol, value } of romanNumerals) {
        while (num >= value) {
            romanNum += symbol;
            num -= value;
        }
    }
    return romanNum;
};

// Input validation and conversion
const checkUserInput = () => {
    const inputInt = parseInt(numberInput.value);
    if (!numberInput.value || isNaN(inputInt)) {
        return result.innerHTML = "Please enter a valid number";
    } else if (inputInt < 1) {
        return result.innerHTML = "Please enter a number greater than or equal to 1";
    } else if (inputInt >= 4000) {
        return result.innerHTML = "Please enter a number less than or equal to 3999";
    } else {

    const romanNumber = decimalToRomanNumber(inputInt);
    showAnimation(romanNumber);
    }
    numberInput.value = "";
};

// Animation function
const showAnimation = (romanNumber) => {
    result.innerHTML = "";
    setTimeout(() => {
        result.innerHTML = `${romanNumber}`;
    }, 500);
};

// Event listeners
convertBtn.addEventListener("click", checkUserInput);
numberInput.addEventListener("keydown", (e) => {
    if (e.key === "Enter") {
        checkUserInput();
    }
})