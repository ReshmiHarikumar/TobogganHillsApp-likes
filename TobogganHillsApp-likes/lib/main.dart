import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:toboggan_hills/src/features/authentication/auth_service.dart';
import 'package:toboggan_hills/src/features/authentication/registrationPage.dart';
import 'package:toboggan_hills/navigation_menu.dart';
import 'package:toboggan_hills/src/features/authentication/loginPage.dart';
import 'package:toboggan_hills/src/features/common/hill_service.dart';
import 'package:toboggan_hills/src/utils/constants/mongo_config.dart';
import 'package:toboggan_hills/src/utils/theme/theme.dart';
import 'src/features/common/hill_model.dart';
import 'src/features/listing/listing.dart';
import 'locations_map.dart'; // Import the locations_map.dart file
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong/latlong.dart';

Future<void> main() async {
  final app = App(AppConfiguration(MongoConfig.appName));
  final AuthService authService = AuthService(atlasApp: app);
  User user = await authService.anonCheck();
  final HillService hillService = HillService(user);
  runApp(MyApp(
    hillService: hillService,
    authService: authService,
    user: user,
  ));
}

class MyApp extends StatefulWidget {
  final HillService hillService;
  final AuthService authService;
  final User user;
  const MyApp(
      {super.key,
      required this.hillService,
      required this.authService,
      required this.user});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController searchController = TextEditingController();
  late RealmResults<HillSite> allItems;
  late final User user;
  @override
  void initState() {
    super.initState();
    allItems = widget.hillService.getItems();
  }

  @override
  Widget build(BuildContext context) {
    // AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
    // auth.anonLogin();
    // final currUser = auth.user!;
    // final realm = Realm(Configuration.flexibleSync(
    //     currUser, [HillSite.schema, Comment.schema]));
    // final allItems = realm.all<HillSite>();
    // realm.subscriptions.update((mutableSubscriptions) {
    //   mutableSubscriptions.add(
    //     realm.all<HillSite>(),
    //   );
    // });
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Toboggan Hills")),
          actions: [
            // Add a TextButton in the app bar to open locations_map.dart
            Builder(
              builder: (BuildContext context) => IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapSample()),
                  );
                },
                icon: const Icon(Icons.map),
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigationMenu(
          user: widget.user,
        ),
        body: Center(
          child: Listing(
            items: allItems,
            user: widget.user,
            hillService: widget.hillService
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        "/home": (context) => MyApp(
              authService: widget.authService,
              hillService: widget.hillService,
              user: widget.user,
            ),
        // Define the route for home page
        '/login': (context) => LoginPage(), // Define the route for login page
        '/registration': (context) => RegistrationPage(),
      },
    );
  }
}
