import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:toboggan_hills/main.dart';
import 'package:toboggan_hills/src/features/authentication/LoginPage.dart';
import 'package:toboggan_hills/src/features/authentication/RegistrationPage.dart';
import 'package:toboggan_hills/src/features/authentication/auth_service.dart';
import 'package:toboggan_hills/src/features/common/hill_service.dart';
import 'package:toboggan_hills/src/utils/constants/mongo_config.dart';
import 'package:toboggan_hills/src/utils/constants/sizes.dart';

class ProfilePage extends StatefulWidget {
  final app = App(AppConfiguration(MongoConfig.appName));

  ProfilePage({super.key, required this.user});
  final User user;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService(atlasApp: widget.app);
    var currentUser = widget.user;
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: currentUser.profile.email != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Logged In as:',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: CustomSizes.defaultSpace,
                  ),
                  Text(currentUser.profile.email!,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(
                    height: CustomSizes.defaultSpace,
                  ),
                  Tooltip(
                    message: 'Log out',
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        backgroundColor: const Color.fromARGB(255, 206, 68, 52),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        User user = await authService.logoutUser(widget.user);
                        navigator.pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return MyApp(
                            authService: authService,
                            user: user,
                            hillService: HillService(user),
                          );
                        }));
                      },
                      child: const Icon(Icons.logout),
                    ),
                  ),
                  const Text('LogOut'),
                  const SizedBox(height: 20.0),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "User not Logged In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Make text bold
                      fontSize: 20.0, // Increase font size
                      color: Colors.redAccent, // Add color (optional)
                    ),
                  ),
                  const SizedBox(
                    height: CustomSizes.defaultSpace * 3,
                  ),
                  Tooltip(
                    message: 'Register for a new account',
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        backgroundColor: Colors.blue[400],
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()),
                        );
                      },
                      child: const Icon(Icons.person_add),
                    ),
                  ),
                  const Text('Register'),
                  const SizedBox(height: 20.0), // Adjust spacing as needed
                  Tooltip(
                    message: 'Log in to your existing account',
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        backgroundColor: Colors.green[400],
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Icon(Icons.login),
                    ),
                  ),
                  const Text('Login')
                ],
              ),
      ),
    );
  }
}
