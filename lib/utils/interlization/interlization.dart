import 'package:get/route_manager.dart';

class Interlization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          LocalName.dogCatcher: "Dog Catcher",
          LocalName.login: "LOGIN",
          LocalName.username: "Username",
          LocalName.password: "Password",
          LocalName.or: "OR",
          LocalName.donHaveanAccount: "Don’t have an account ?",
          LocalName.siginup: "Siginup",
          LocalName.email: "Email",
          LocalName.conformPassword: "Conform password",
          LocalName.home: "Home",
          LocalName.notification: "Notification",
          LocalName.message: "message",
          LocalName.profile: "Profile",
          LocalName.reportDog : "Report dog"
        }
      };
}

class LocalName {
  static String dogCatcher = 'dog_catcher';
  static String login = 'login';
  static String username = 'username';
  static String password = 'password';
  static String or = 'or';
  static String donHaveanAccount = 'don_have_an_account';
  static String siginup = 'siginup';
  static String email = 'email';
  static String conformPassword = 'conform_password';
  static String home = 'home';
  static String notification = 'notification';
  static String message = 'message';
  static String profile = 'profile';
  static String reportDog = 'report_dog';
}
