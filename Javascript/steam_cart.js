// This script loops over each "row" in the cart page.
// Copies the name, price and URL of each game and appends it into an Array.
// Afterwards, the array is converted into a JSON, which is copied to your system's clipboard.
// In case it fails to copy the JSON, a message will be displayed on the console.
let games = [];
document.querySelectorAll('.cart_row').forEach((row) => {
  let n = row.querySelector('.cart_item_desc > a').innerText;
  let p = row.querySelector('div.cart_item_price.with_discount').children[1].innerText;
  let l = row.querySelector('.cart_item_desc > a').getAttribute('href');
  console.log(n, p, l);
  games.push({
    name: n,
    price: p,
    link: l,
  });
});

console.log(JSON.stringify(games));
navigator.clipboard.writeText(JSON.stringify(games)).then((a) => {console.log("Write successfully", a);}, (a) => {console.error("Failed", a);});
