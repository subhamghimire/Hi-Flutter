import 'package:testapp5/api/api.dart';
import 'package:testapp5/jwt/token.dart';

class Auth {
  static register(data) async {
    return await CallApi.post(data, 'register');
  }

  static login(data) async {
    ApiResponse tokenResponse = await CallApi.post(data, 'login');
    if (!tokenResponse.hasErrors()) {
      tokenResponse.printData();
      Token.setToken(tokenResponse.getData()['token']);
      await me();
    }
    return tokenResponse;
  }

  static me() async {
    ApiResponse userResponse = await CallApi.get('me');
    userResponse.printData();
    userResponse.printErrors();
    if (!userResponse.hasErrors())
      Token.setUser(userResponse.getData()['data']);
    else
      logout();
    return userResponse;
  }

  static logout() async {
    Token.destroyToken();
    Token.destroyUser();
  }

  static isAuthenticated() async {
    var token = await Token.getToken();
    print(token);
    if (token != null && token != '') {
      if (!(await me()).hasErrors()) {
        return true;
      }
    }

    return false;
  }
}
