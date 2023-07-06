
class Category {
  final int id;
  final String name;
  Category({required this.id, required this.name});
}

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final String filter;

  const Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.filter,
  });

  static List<Product> productsearch = [];
}

final List<Product> products = [
const Product(
name: "Sea Food Pizza",
price: 15,
imageUrl:
"https://tse2.mm.bing.net/th?id=OIP.MpX4rhN_udwwzM5dq-0YWAHaFP&pid=Api&P=0",
description: "Sea Food from australia with amazing ingredient",
filter: "Pizza",
),
const Product(
name: "Hot Dog with pork and chicken",
price: 3,
imageUrl:
"http://d6vrtzdlbankn.cloudfront.net/wp-content/uploads/2018/05/iStock-638615386.jpg",
description: "Chicken and Pork and many other ingredient to mix",
filter: "Hot dog",
),
const Product(
name: "Burger double meat",
price: 10,
imageUrl:
"https://tse1.mm.bing.net/th?id=OIP.euNM4HcXhF9mZMlPV8TfiAHaE7&pid=Api&P=0",
description: "Double meat and salad with cheese",
filter: "Burger",
),
const Product(
name: "Sushi and Sashimi",
price: 15,
imageUrl:
"https://img.theculturetrip.com/1440x/smart/wp-content/uploads/2020/02/p3wdfm-1.jpg",
description: "Salmon from the sea of japan come with fresh tuna",
filter: "Sushi",
),
const Product(
name: "Fried Rice cambodia",
price: 5,
imageUrl:
"https://tse1.mm.bing.net/th?id=OIP.ZsAeILQ7BTJeJkWlww3hDwHaE7&pid=Api&P=0",
description: "cambodia's fried rice and amazing food",
filter: "Fried",
),
const Product(
name: "Buffet",
price: 20,
imageUrl: "https://buzzanniebee.files.wordpress.com/2015/06/buffet-3.jpg",
description: "Pasta from pasta corner ingredient",
filter: "Buffet",
),
const Product(
name: "Curry",
price: 5,
imageUrl:
"https://www.licious.in/blog/wp-content/uploads/2020/12/Cream-of-chicken-Soup.jpg",
description: "Pasta from pasta corner ingredient",
filter: "Curry",
),
const Product(
name: "Hot Pot",
price: 40,
imageUrl:
"https://d16d7e68447e66488c8e-e1efe8cf65137bca83a51bab16a26035.ssl.cf3.rackcdn.com/live_multiserv/uploads/events/508947045059250/three1581437607.jpg",
description: "Hot Pot From Chinese",
filter: "Hot Pot",
),
const Product(
name: "Ramen",
price: 3,
imageUrl:
"https://tse1.mm.bing.net/th?id=OIP.iFtg_k_jAsHkFV9ZRW5AKQHaE8&pid=Api&P=0&h=180",
description: "Pasta from pasta corner ingredient",
filter: "Hot Pot",
),
const Product(
name: "Steak",
price: 20,
imageUrl:
"https://www.lowriesthebutchers.co.uk/wp-content/uploads/2016/11/rumpsteak.jpg",
description: "Pasta from pasta corner ingredient",
filter: "Steak",
),
const Product(
name: "Blue Berry",
price: 5,
imageUrl:
"https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2019/03/blueberry-smoothie-7.jpg",
description: "Pasta from pasta corner ingredient",
filter: "Drink",
),
const Product(
name: "Strawberry Sundae",
price: 3,
imageUrl:
"https://cmx.weightwatchers.co.uk/assets-proxy/weight-watchers/image/upload/t_WINE_EXTRALARGE/htjh2ykyzbbnujwwktis.jpg",
description: "Pasta from pasta corner ingredient",
filter: "Ice Cream",
),
const Product(
name: "Chocolate Crunch",
price: 2,
imageUrl:
"https://www.entrenamiento.com/wp-content/uploads/2016/12/frappe-chocolate-cafe-720x478.jpg",
description: "Pasta from pasta corner ingredient",
filter: "Ice Cream",
),
const Product(
name: "Donuts",
price: 1.5,
imageUrl:
"https://tse1.mm.bing.net/th?id=OIP.Ww1BKs8aHlw6JwSEDZa8LQHaE8&pid=Api&P=0&h=180",
description: "Pasta from pasta corner ingredient",
filter: "Bread",
),
const Product(
name: "Apple Pie",
price: 10,
  imageUrl:
  "https://tse1.explicit.bing.net/th?id=OIP.vSabjDb_oIRaD3J3xkl7YwHaE8&pid=Api&P=0&h=180",
  description: "Pasta from pasta corner ingredient",
  filter: "Bread",
),
  const Product(
    name: "Fried Chicken",
    price: 5,
    imageUrl:
    "http://static3.businessinsider.com/image/56be399e2e526558008b7091-1333-1000/fried-chicken.jpg",
    description: "Pasta from pasta corner ingredient",
    filter: "Fried",
  ),
  const Product(
    name: "Fried Noodle",
    price: 5,
    imageUrl:
    "https://thedumplingsisters.files.wordpress.com/2014/11/tds-noodles-2.jpg",
    description: "Pasta from pasta corner ingredient",
    filter: "Fried",
  ),
  const Product(
    name: "Best Hot Pot",
    price: 30,
    imageUrl:
    "https://tse1.mm.bing.net/th?id=OIP.H4HVBjbfe5Y_PeHYLmZpzgHaE8&pid=Api&P=0&h=180",
    description: "Pasta from pasta corner ingredient",
    filter: "Hot Pot",
  ),
  const Product(
    name: "Wine",
    price: 40,
    imageUrl:
    "https://tse2.mm.bing.net/th?id=OIP.X0QuIiMGB6kB619HoSLzggHaE8&pid=Api&P=0&h=180",
    description: "Pasta from pasta corner ingredient",
    filter: "Drink",
  ),
  const Product(
    name: "Coca-Cola",
    price: 1,
    imageUrl:
    "https://tse1.mm.bing.net/th?id=OIP.pFC1o6Nouo-j47rJ_DlhzgHaE8&pid=Api&P=0&h=180",
    description: "Pasta from pasta corner ingredient",
    filter: "Drink",
  ),
  const Product(
    name: "Australia Steak",
    price: 30,
    imageUrl:
    "https://tse2.mm.bing.net/th?id=OIP.2M5zG3BiEGzaXqskd_MKjgHaE8&pid=Api&P=0&h=180",
    description: "Pasta from pasta corner ingredient",
    filter: "Steak",
  ),
  const Product(
    name: "Special Hot Dog",
    price: 5,
    imageUrl:
    "https://1.bp.blogspot.com/-2RffC3SwUjM/WTP_nE2O1KI/AAAAAAAAAzY/4IpQwaFWehAQDggRZn6dVwt54r6DVM0GQCLcB/s1600/hotdogs.jpg",
    description: "Pasta from pasta corner ingredient",
    filter: "Hot dog",
  ),
  const Product(
    name: "Delux Burger",
    price: 10,
    imageUrl:
    "https://tse2.mm.bing.net/th?id=OIP.rfjUaFvCTwDB2CE-um2eHAHaHa&pid=Api&P=0&h=180",
    description: "Pasta from pasta corner ingredient",
    filter: "Burger",
  ),
  const Product(
    name: "Hawai Pizza",
    price: 15,
    imageUrl:
    "https://tse4.mm.bing.net/th?id=OIP.wTsIFFpHh7rrIp-MetUlYAHaE8&pid=Api&P=0&h=180",
    description: "Pasta from pasta corner ingredient",
    filter: "Pizza",
  ),
];
