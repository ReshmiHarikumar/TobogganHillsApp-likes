import 'package:flutter/material.dart';
import 'package:toboggan_hills/src/features/authentication/registrationPage.dart'; // Import the registration page

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.person_add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      RegistrationPage()), // Navigate to the registration page
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Toboggan Hills!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle other actions or navigation
              },
              child: Text(
                  'Explore Toboggan Hills'), // Sample button for further actions
            ),
          ],
        ),
      ),
    );
  }
}
