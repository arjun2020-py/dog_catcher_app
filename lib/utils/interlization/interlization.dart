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
          LocalName.mobile: "Mobile",
          LocalName.conformPassword : "Conform password"
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
  static String mobile = 'mobile';
  static String conformPassword = 'conform_password';
}
