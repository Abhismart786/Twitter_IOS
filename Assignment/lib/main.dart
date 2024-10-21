import 'package:flutter/material.dart';

void main() {
  runApp(HotelBookingApp());
}

class HotelBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Booking App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CreateAccountPage(),
    );
  }
}

class CreateAccountPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/hotel_a.jpg', height: 150, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String email = emailController.text;
                String password = passwordController.text;

                // Validate the inputs
                if (name.isEmpty || email.isEmpty || password.isEmpty) {
                  // Show alert dialog if any field is empty
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Missing Information'),
                      content: Text('Please fill in all details.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HotelListPage(name: name),
                    ),
                  );
                }
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelListPage extends StatelessWidget {
  final String name;

  HotelListPage({required this.name});

  final List<Map<String, dynamic>> hotels = [
    {'name': 'Hotel A', 'price': 100, 'image': 'assets/hotel_a.jpg'},
    {'name': 'Hotel B', 'price': 150, 'image': 'assets/hotel_b.jpg'},
    {'name': 'Hotel C', 'price': 200, 'image': 'assets/hotel_c.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hotels')),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(hotels[index]['image'], width: 100, fit: BoxFit.cover),
            title: Text(hotels[index]['name']),
            subtitle: Text('\$${hotels[index]['price']} per night'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelDetailPage(
                      hotel: hotels[index],
                      name: name,
                    ),
                  ),
                );
              },
              child: Text('Show Details'),
            ),
          );
        },
      ),
    );
  }
}

class HotelDetailPage extends StatelessWidget {
  final Map<String, dynamic> hotel;
  final String name;

  HotelDetailPage({required this.hotel, required this.name});

  final TextEditingController nightsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(hotel['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(hotel['image'], height: 200, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text('Price per night: \$${hotel['price']}'),
            SizedBox(height: 20),
            TextField(
              controller: nightsController,
              decoration: InputDecoration(labelText: 'Number of nights'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int nights = int.tryParse(nightsController.text) ?? 0;
                if (nights > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TotalCostPage(
                        nights: nights,
                        hotelPrice: hotel['price'],
                        name: name,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a valid number of nights')),
                  );
                }
              },
              child: Text('Calculate Total'),
            ),
          ],
        ),
      ),
    );
  }
}

class TotalCostPage extends StatelessWidget {
  final int nights;
  final int hotelPrice;
  final String name;

  TotalCostPage({required this.nights, required this.hotelPrice, required this.name});

  @override
  Widget build(BuildContext context) {
    int total = nights * hotelPrice;

    return Scaffold(
      appBar: AppBar(title: Text('Total Cost')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Hello, $name!'),
            SizedBox(height: 20),
            Text('Total Cost for $nights nights: \$${total}'),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst); // Navigate back to home page
              },
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
