const candies = [
  { name: 'Aero', price: 1.99 },
  { name: 'Skitties', price: 2.99 },
  { name: 'Mars', price: 1.49 },
  { name: 'Maltesers', price: 3.49 },
  { name: 'Skittles', price: 1.49 },
  { name: 'Starburst', price: 5.99 },
  { name: 'Ricola', price: 1.99 },
  { name: 'Polkagris', price: 5.99 },
  { name: 'Pastila', price: 4.99 },
  { name: 'Mentos', price: 8.99 },
  { name: 'Raffaello', price: 7.99 },
  { name: 'Gummi bears', price: 10.99 },
  { name: 'Fraise Tagada', price: 5.99 },
];

const searchCandies = (string, maxPrice) => {
  let filteredCandies = candies.filter(function (candy) {
    return (
      candy.name.toLowerCase().startsWith(string.toLowerCase()) &&
      candy.price <= maxPrice
    );
  });
  return filteredCandies.map((candy) => candy.name);
};

module.exports = candies;
module.exports = searchCandies;

console.log(searchCandies('Ma', 10));

// Examples
// candy.name.startsWith(string) && candy.price <= maxPrice;

// var aquaticCreatures =  creatures.filter(function(creature) {
//     return creature.habitat == "Ocean";
//   });

//   console.log(aquaticCreatures);

// let numbers = [-23,-20,-17, -12, -5, 0, 1, 5, 12, 19, 20];

// let positive_array = numbers.filter(function(value) {
//     return value >= 0; });

// console.log(positive_array);

// Output = [0, 1, 5, 12, 19, 20]
