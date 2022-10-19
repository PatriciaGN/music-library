const fizzBuzz = (number) => {
  if (number % 3 === 0 && number % 5 === 0) {
    return 'FizzBuzz';
  } else if (number % 3 === 0) {
    return 'Fizz';
  } else if (number % 5 == 0) {
    return 'Buzz';
  } else {
    return number;
  }
};

const fizzBuzzUntil = (number) => {
  for (let i = 1; i <= number; i++) {
    console.log(fizzBuzz(i));
  }
};

module.exports = fizzBuzz;

// const fizzBuzzUntil = (number) => {
//     let i = 1;
//     while (i <= number) {
//       console.log(fizzBuzz(i));
//       i++;
//     }
//   };

//   return fizzBuzzUntil(130);
