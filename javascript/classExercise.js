class User {
  constructor(name) {
    this.name = name;
  }

  getName() {
    return this.name;
  }

  getIntroduction() {
    return `Hi, my name is ${this.name}`;
  }
}

const user = new User('Uma');
console.log(user.getName());
console.log(user.getIntroduction());

module.exports = User;

const users = [new User('Uma'), new User('Josh'), new User('Ollie')];

class UserBase {
  constructor(names) {
    this.names = names;
  }

  count() {
    return this.names.length;
  }

  getNames() {
    return this.names.map((name) => name.getName());
  }

  getIntroductions() {
    return this.names.map((name) => name.getIntroduction());
  }
}

const userBase = new UserBase(users);

console.log(userBase.count());
console.log(userBase.getNames());
console.log(userBase.getIntroductions());
module.exports = UserBase;
