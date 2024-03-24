import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:toboggan_hills/main.dart';
import 'package:toboggan_hills/src/features/authentication/auth_service.dart';
import 'package:toboggan_hills/src/features/common/hill_service.dart';
import 'package:toboggan_hills/src/utils/constants/mongo_config.dart';

class LoginPage extends StatelessWidget {
  final app = App(AppConfiguration(MongoConfig.appName));

  @override
  Widget build(BuildContext context) {
    String email = '', password = '';
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Toboggan Hlls',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                // backgroundImage: AssetImage('photo.jpg'), // App photo here
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  bool exception = false;
                  AuthService auth = AuthService(atlasApp: app);
                  User user;
                  try {
                    user = await auth.loginUser(email, password);
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
                    exception = true;
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Email/Password Incorrect"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
