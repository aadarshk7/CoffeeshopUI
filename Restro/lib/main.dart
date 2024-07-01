import 'package:flutter/material.dart';
import 'beandetailscreen.dart'; // Import your BeanDetailsScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'SanFrancisco', color: Colors.white),
          bodyText2: TextStyle(fontFamily: 'SanFrancisco', color: Colors.white),
        ),
      ),
      home: CoffeeHomePage(),
    );
  }
}

class CoffeeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/imgs/profile.png'), // Replace with your profile image
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find the best coffee for you',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Find Your Coffee...',
                hintStyle: TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            DefaultTabController(
              length: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.orange,
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Cappuccino'),
                      Tab(text: 'Espresso'),
                      Tab(text: 'Americano'),
                    ],
                  ),
                  Container(
                    height: 200,
                    child: TabBarView(
                      children: [
                        CoffeeGrid(),
                        CoffeeGrid(),
                        CoffeeGrid(),
                        CoffeeGrid(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Coffee beans',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: CoffeeBeanGrid(),
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: [
        CoffeeCard(image: 'assets/imgs/img1.jpg', name: 'Cappuccino', price: 4.20, rating: 4.5),
        CoffeeCard(image: 'assets/imgs/img2.jpg', name: 'Cappuccino', price: 4.20, rating: 4.2),
      ],
    );
  }
}

class CoffeeCard extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  final double rating;

  CoffeeCard({required this.image, required this.name, required this.price, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[850],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${price.toStringAsFixed(2)}'),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Text(rating.toString(), style: TextStyle(fontSize: 12)),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CoffeeBeanGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: [
        CoffeeBeanCard(image: 'assets/imgs/img1.jpg', name: 'Robusta Beans', description: 'Medium Roasted'),
        CoffeeBeanCard(image: 'assets/imgs/img2.jpg', name: 'Cappuccino', description: 'With Steamed Milk'),
      ],
    );
  }
}

class CoffeeBeanCard extends StatelessWidget {
  final String image;
  final String name;
  final String description;

  CoffeeBeanCard({required this.image, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (image == 'assets/imgs/img1.jpg') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BeanDetailsScreen()),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey[850],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(description, style: TextStyle(fontSize: 12, color: Colors.white70)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
