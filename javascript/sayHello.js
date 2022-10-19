const sayHello = (name) => {
  return 'Hello, '.concat(name); // We could also use '+' to concatenate or 'Hello ${name}'
};

module.exports = sayHello;
