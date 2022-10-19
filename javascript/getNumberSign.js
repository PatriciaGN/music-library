const getNumberSign = (a) => {
  if (a < 0) {
    return 'negative';
  } else if (a === 0) {
    return 'zero';
  } else {
    return 'positive';
  }
};

module.exports = getNumberSign;
