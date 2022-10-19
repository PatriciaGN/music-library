const numbers = [
  '1763687364',
  '4763687363',
  '7867867862',
  'aaaaaaaabbbbbbbcccccdddddddd', // this element should be filtered
];

const checkLength = (number) => {
  if (number.length < 11) {
    return true;
  } else {
    return false;
  }
};

const filterLongNumbers = (numbers) => {
  return numbers.filter(checkLength);
};

console.log(filterLongNumbers(numbers));
console.log(filterLongNumbers(['4763687363', '7867867862']));
console.log(filterLongNumbers([]));

const names = ['Anna', 'Laura', 'Josh', 'Min', 'Karla'];

const generateMessages = (names) => {
  return names.map(
    (item) => `Hi ${item} 50% off our best candies for you today!`
  );
};

console.log(generateMessages(names));

const namesAndDiscounts = [
  { name: 'Anna', discount: 50 },
  { name: 'Laura', discount: 40 },
  { name: 'Josh', discount: 30 },
  { name: 'Min', discount: 50 },
  { name: 'Karla', discount: 60 },
];

const generateDiscountMessages = (namesAndDiscounts) => {
  return namesAndDiscounts.map(
    (item) =>
      `Hi ${item.name} ${item.discount}% off our best candies for you today!`
  );
};

console.log(generateDiscountMessages(namesAndDiscounts));
