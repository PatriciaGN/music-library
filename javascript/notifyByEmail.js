const notifyByEmail = (emailAddress) => {
  return `Email sent to ${emailAddress}`;
};

const notifyByText = (phoneNumber) => {
  return `Text sent to: ${phoneNumber}`;
};

const notify = (myString, myFunction) => {
  return myFunction(myString);
};

console.log(notify('email@email.com', notifyByEmail));
