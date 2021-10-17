document.body.innerHTML += `<button onclick="javascript:window.location.reload(true)">Reload</button>`;

const big = BigInt("371993326789901217");
let res = big;
let remainders = [];

for (let i = 1; res > 0n; i++) {
  remainders.push(res % BigInt(i));
  res = res / BigInt(i);
}
console.log(remainders, res);

let future = remainders.map((e) => {
  let x = parseInt(e.toString());
  if (x > 9) {
    return String.fromCharCode(x + 55);
  }
  return x.toString();
});

const final = future.reverse().join("");
console.log(final);
console.log(final === "311E55B5544150121110");
/*const fact = (n) => {
  let c = 1;
  for (let i = 1; i < n; n--) {
    c *= n;
  }
  return c;
};

const factString2Dec = (str) => {
  let values = str.split("").reverse().map((digit) => digit.charCodeAt(0) > 57 ? digit.charCodeAt(0) - 55 : parseInt(digit));

  let res = 0;
  let aux = 0;
  console.log(values);
  for (let i = 0; i < values.length; i++) {
    if (values[i] == 0) continue;
    console.log(values[i], fact(i));
    res += values[i] * fact(i);
  }

  return res;
}

const dec2FactString = (n) => {
  let remainders = [];
  let result = n;

  for (let i = 1; result > 0; i++) {
    let remainder = result % i;
    let aux;
    if (remainder > 9) {
      aux = String.fromCharCode(remainder + 55);
    } else {
      aux = remainder.toString();
    }
    remainders.push(aux);

    result = Math.floor(result / i);
  }

  return remainders.reverse().join("");
};


function testing() {
  
  //console.log(factString2Dec("311E55B5544150121110"));
  return {
    dec2FactString: dec2FactString(371993326789901217)
  };
}
//console.log(JSON.stringify(testing()));
testing();

f = x => {
  for (r = 0, b = j = 1, i = x.length; x | 0 ? b <= x : --i; b *= ++j)
    r += x[i] * b;
  if (x | 0)
    for (r = ''; j > 1; x %= b)
      r += x / (b /= j--) | 0;
  return r
}
addR = (r, s) => {
  var d = document.createElement('td');
  d.appendChild(document.createTextNode(s));
  r.appendChild(d)
}
test = (x, e) => {
  var y = f(x),
    r = document.createElement('tr');
  addR(r, x);
  addR(r, y);
  addR(r, e);
  addR(r, e == y ? 'Y' : 'N');
  document.getElementById('out').appendChild(r)
}
samples = {
  '349': '24201',
  '1234': '141120',
  '746': '101010',
  '719': '54321',
  '381': '30311',
  '24': '1000',
  '0': '0'
};
for (d in samples) {
  test(d, samples[d]);
  test('!' + samples[d], d)
}*/
