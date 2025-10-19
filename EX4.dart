enum OrderMethod {PickUp, Delivery}
enum ProductCategory {Electronic,Clothing}

class Customer{
  final int id;
  final String name;
  final String email;
  //constructor
  Customer({
    required this.id, 
    required this.name,
    required this.email
  });
}
class Order{
  final int id;
  final Customer customer;
  final OrderMethod orderMethod;
  final List<OrderItem> item;
  
  //constructor
  Order({
    required this.id,
    required this.customer,
    required this.item,
    required this.orderMethod
  });


}
class OrderItem {
  final Product product;
  final int quantity;

  OrderItem(this.product, this.quantity);

  double getSubtotal() => product.price * quantity;
}
class Product {
  final int id;
  final String name;
  final double price;
  final ProductCategory category;

  // Named constructor
  Product.electronic({
    required this.id,
    required this.name,
    required this.price,
  }) : category = ProductCategory.Electronic;

  // Default constructor
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
  });

  String getInfo() => "$name - \$${price.toStringAsFixed(2)}";
}
void main() {
  // Create some products
  var laptop = Product.electronic(id: 1, name: "Laptop", price: 999.99);
  var tshirt = Product(id: 2, name: "T-Shirt", price: 19.99, category: ProductCategory.Clothing);

  // Create a customer
  var customer = Customer(id: 1, name: "John Doe", email: "john.doe@example.com");

  // Create an order
  var order = Order(
    id: 1,
    customer: customer,
    item: [
      OrderItem(laptop, 1),
      OrderItem(tshirt, 2),
    ],
    orderMethod: OrderMethod.Delivery,
  );

  // Print order details
  print("Order ID: ${order.id}");
  print("Customer: ${order.customer.name}");
  print("Order Method: ${order.orderMethod.name}");
  print("Items:");
  for (var item in order.item) {
    print(" - ${item.product.getInfo()} x${item.quantity}");
  }
}