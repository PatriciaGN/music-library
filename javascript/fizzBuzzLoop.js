const fizzBuzz = (number) => {
  if (number % 5 === 0 && number % 3 === 0) {
    return 'FizzBuzz';
  } else if (number % 5 === 0) {
    return 'Buzz';
  } else if (number % 3 === 0) {
    return 'Fizz';
  } else {
    return number;
  }
};

const fizzBuzzUntil = (number) => {
  for (let i = 1; i === number; i++) {
    console.log(fizzBuzz(i));
  }
};

return fizzBuzzUntil(130);
