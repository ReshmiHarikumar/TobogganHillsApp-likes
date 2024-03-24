import 'package:realm/realm.dart';
import 'package:toboggan_hills/src/utils/constants/mongo_config.dart';

class AuthService {
  final App atlasApp;
  AuthService({required this.atlasApp});

  // searchUser({required String email}) {}
  Future<User> anonCheck() async {
    if (atlasApp.currentUser == null) {
      User user = await atlasApp.logIn(Credentials.anonymous());
      return user;
    } else {
      return atlasApp.currentUser!;
    }
  }

  Future<User> createUser(String email, String password) async {
    EmailPasswordAuthProvider authProvider =
        EmailPasswordAuthProvider(atlasApp);
    await authProvider.registerUser(email, password);
    return loginUser(email, password);
  }

  Future<User> loginUser(String email, String password) async {
    Credentials credentials = Credentials.emailPassword(email, password);
    return atlasApp.logIn(credentials);
  }

  Future<User> logoutUser(User user) async {
    atlasApp.currentUser!.logOut();
    return anonCheck();
  }
}
