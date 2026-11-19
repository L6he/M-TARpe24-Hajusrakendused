const bcrypt = require('bcrypt');
const myPassword = 'MoolyFTW';

console.time('Time to generate salt');
const salt = bcrypt.genSaltSync(10); //et parool oleks piisavalt suur, et hashi ei saaks ette genereerida. Windows XP ajal seda veel ei kasutatud, et cd-l oli plaadil kõik teatud räsi, et sai seda brute-force-ida.
console.log('This is your salt: ', 10);
console.timeEnd('Time to generate salt');

console.time('Time to generate hash');
const hashedPassword = bcrypt.hashSync(myPassword, salt);
console.log(myPassword, ' is your password & this is your password after hashing it: ', hashedPassword);
console.timeEnd('Time to generate hash');