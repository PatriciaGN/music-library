const lowercaseMessage = (message) => {
  return message.toLowerCase();
};

const transform = (message, myFunction) => {
  return myFunction(message);
};

console.log(transform('STOP SHOUTING!', lowercaseMessage));
