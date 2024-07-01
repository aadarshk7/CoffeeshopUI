import 'package:flutter/material.dart';
import 'package:institutemanagement/paymentscreen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/imgs/profile.png'), // Replace with your profile image
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CartItem(
                    image: 'assets/imgs/img1.jpg',
                    name: 'Cappuccino',
                    description: 'With Steamed Milk',
                    sizes: ['S', 'M', 'L'],
                    price: 4.20,
                  ),
                  CartItem(
                    image: 'assets/imgs/img2.jpg',
                    name: 'Cappuccino',
                    description: 'With Steamed Milk',
                    price: 6.20,
                  ),
                  CartItem(
                    image: 'assets/imgs/img1.jpg',
                    name: 'Robusta Beans',
                    description: 'From Africa',
                    weight: '250gm',
                    price: 6.20,
                  ),
                  CartItem(
                    image: 'assets/imgs/img2.jpg',
                    name: 'Liberica Coffee Beans',
                    description: 'With Steamed Milk',
                    weights: ['250gm', '500gm', '1kg'],
                    price: 4.20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price', style: TextStyle(fontSize: 18)),
                  Text('\$10.40',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Pay', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 16.0),
            BottomNavigationBar(
              backgroundColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final List<String>? sizes;
  final List<String>? weights;
  final String? weight;
  final double price;

  CartItem({
    required this.image,
    required this.name,
    required this.description,
    this.sizes,
    this.weights,
    this.weight,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(image,
                    width: 80, height: 80, fit: BoxFit.cover),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text(description, style: TextStyle(color: Colors.white70)),
                  if (sizes != null)
                    Row(
                      children: sizes!
                          .map((size) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Chip(
                                  label: Text(size),
                                  backgroundColor: Colors.grey[700],
                                ),
                              ))
                          .toList(),
                    ),
                  if (weights != null)
                    Row(
                      children: weights!
                          .map((weight) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Chip(
                                  label: Text(weight),
                                  backgroundColor: Colors.grey[700],
                                ),
                              ))
                          .toList(),
                    ),
                ],
              )
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.remove, color: Colors.white),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                  Text('1', style: TextStyle(fontSize: 16)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.white),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
