

import 'dart:async';
import 'dart:convert';

Future<void> main() async {
  print("========== Exercise 1 ==========");
  await exercise1();

  print("\n========== Exercise 2 ==========");
  await exercise2();

  print("\n========== Exercise 3 ==========");
  exercise3();

  await Future.delayed(Duration(seconds: 1));

  print("\n========== Exercise 4 ==========");
  await exercise4();
  print("\n========== Exercise 5 ==========");
  exercise5();
}

// Exercise 1
class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);

  @override
  String toString() {
    return "Product(id: $id, name: $name, price: $price)";
  }
}

class ProductRepository {
  final List<Product> _products = [
    Product(1, "Laptop", 1200),
    Product(2, "Mouse", 25),
  ];

  final StreamController<Product> _controller =
      StreamController<Product>.broadcast();

  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(seconds: 1));
    return _products;
  }

  Stream<Product> liveAdded() {
    return _controller.stream;
  }
  void addProduct(Product product) {
    _products.add(product);
    _controller.add(product);
  }
}

Future<void> exercise1() async {
  ProductRepository repo = ProductRepository();
  repo.liveAdded().listen((product) {
    print("New Product Added: $product");
  });
  List<Product> products = await repo.getAll();

  print("All Products:");
  for (var p in products) {
    print(p);
  }
  repo.addProduct(Product(3, "Keyboard", 50));
}

// Exercise 2

class User {
  String name;
  String email;

  User({required this.name, required this.email});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      email: json["email"],
    );
  }

  @override
  String toString() {
    return "User(name: $name, email: $email)";
  }
}

class UserRepository {
  Future<List<User>> fetchUsers() async {
    await Future.delayed(Duration(seconds: 1));
    String jsonString = '''
    [
      {"name":"John","email":"john@gmail.com"},
      {"name":"Anna","email":"anna@gmail.com"}
    ]
    ''';
    List data = jsonDecode(jsonString);
    return data.map((e) => User.fromJson(e)).toList();
  }
}

Future<void> exercise2() async {
  UserRepository repo = UserRepository();

  List<User> users = await repo.fetchUsers();

  print("Users:");
  for (var user in users) {
    print(user);
  }
}

void exercise3() {
  print("Start");

  // Microtask queue
  scheduleMicrotask(() {
    print("Microtask");
  });
  Future(() {
    print("Future Event");
  });

  print("End");
}


Future<void> exercise4() async {
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4, 5]);
  Stream<int> result = numbers
      .map((number) => number * number)
      .where((square) => square % 2 == 0);
  await for (var value in result) {
    print("Value: $value");
  }
}

class Settings {
  static final Settings _instance = Settings._internal();
  Settings._internal();
  factory Settings() {
    return _instance;
  }
}

void exercise5() {
  Settings a = Settings();
  Settings b = Settings();

  print("Are same object: ${identical(a, b)}");


}