import 'dart:ui'; // Import the 'dart:ui' library for the ImageFilter class
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realm/realm.dart';
import 'package:toboggan_hills/main.dart';
import 'package:toboggan_hills/src/features/authentication/auth_service.dart';
import 'package:toboggan_hills/src/features/common/hill_service.dart';
import 'package:toboggan_hills/src/utils/constants/mongo_config.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});
  final app = App(AppConfiguration(MongoConfig.appName));
  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    Future<void> handleRegistration(String email, String password) async {
      bool exception = false;
      AuthService auth = AuthService(atlasApp: app);
      User user;
      try {
        user = await auth.createUser(email, password);
        if (!exception) {
          navigator.pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) {
            return MyApp(
              authService: auth,
              user: user,
              hillService: HillService(user),
            );
          }));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Email/Password Incorrect"),
            duration: Duration(seconds: 1),
          ),
        );
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image with blur effect and blue overlay
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/registration-bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Blur effect
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                  // Glowing overlay
                  Container(
                    color: Colors.blue.withOpacity(
                        0.5), // Adjust color and opacity for the glowing effect
                  ),
                ],
              ),
            ),
            // Content
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Toboggan Hills',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                    const SizedBox(height: 20),
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blueGrey,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        filled: true,
                        fillColor: Colors.white
                            .withOpacity(0.5), // Text field background color
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        filled: true,
                        fillColor: Colors.white
                            .withOpacity(0.5), // Text field background color
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white
                            .withOpacity(0.5), // Text field background color
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        filled: true,
                        fillColor: Colors.white
                            .withOpacity(0.5), // Text field background color
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        handleRegistration(email, password);
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
