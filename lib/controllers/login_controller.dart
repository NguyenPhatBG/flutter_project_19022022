import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:project_19022022/data/api_resource.dart';
import 'package:project_19022022/data/base_network.dart';
import 'package:project_19022022/data/storage/token_storage.dart';
import 'package:project_19022022/helpers/utils.dart';
import 'package:project_19022022/models/request/login_for_request.dart';
import 'package:project_19022022/models/response/login_response.dart';

enum LoginType { email, facebook, apple, tiktok }

class LoginController extends ChangeNotifier {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController =
      TextEditingController(text: kDebugMode ? 'eve.holt@reqres.in' : '');
  final TextEditingController passwordController =
      TextEditingController(text: kDebugMode ? 'cityslicka' : '');
  late String email, password;

  void requestToRegister(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }

  void requestToHome(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  void requestCloseKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void loginEmailRequest(BuildContext context) async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    try {
      var body = LoginForRequest(emailController.text, passwordController.text)
          .toJsonForAdd();
      var json =
          await BaseService().post(ApiResource.login, body).catchError((error) {
        Utils.hideLoading(context);
        Utils.showDialogMessage(
          context: context,
          title: 'Error',
          description: error.toString(),
        );
      });
      if (json != null) {
        Utils.hideLoading(context);
        final resultJson = LoginResponse.fromJson(json);
        if (resultJson.token!.isNotEmpty) {
          Utils.showDialogMessage(
            context: context,
            title: 'Success',
            description: 'Login success.',
          );
          TokenStorage().setToken(resultJson.token);
          requestToHome(context);
        } else {
          Utils.showDialogMessage(
            context: context,
            title: 'Error',
            description: resultJson.error,
          );
        }
        notifyListeners();
      }
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  void requestLogin(LoginType key, BuildContext context) {
    Utils.showLoading(context);
    if (key == LoginType.email) {
      loginEmailRequest(context);
    } else if (key == LoginType.facebook) {
      Future.delayed(const Duration(milliseconds: 1000), () async {
        Utils.hideLoading(context);
      });
    } else if (key == LoginType.apple) {
      Future.delayed(const Duration(milliseconds: 1000), () async {
        Utils.hideLoading(context);
      });
    } else if (key == LoginType.tiktok) {
      Future.delayed(const Duration(milliseconds: 1000), () async {
        Utils.hideLoading(context);
      });
    }
  }
}
