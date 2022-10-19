const peopleNames = ['Hattie', 'Katira', 'Pea', 'Logi', 'Miko'];

console.log(peopleNames[1]);

const morePeopleNames = peopleNames.concat('Patty');

console.log(morePeopleNames[4]);

let counter = 0;
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
numbers.forEach((number) => {
  counter += number;
});

console.log(counter);
