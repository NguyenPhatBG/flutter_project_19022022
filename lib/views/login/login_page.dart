import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_19022022/shared/app_colors.dart';
import 'package:project_19022022/views/home/home_page.dart';

enum LoginType { email, facebook, apple, tiktok }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  void _requestCloseKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _requestToRegister() {
    Navigator.pushNamed(context, '/register');
  }

  void _requestLogin(LoginType key) {
    if (key == LoginType.email) {
      _loginFormKey.currentState!.save();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    } else if (key == LoginType.facebook) {
    } else if (key == LoginType.apple) {
    } else if (key == LoginType.tiktok) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _requestCloseKeyboard,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 70,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'log in to restore your all contacts, If you\nhaven\'t account, create one and save your\ncontacts Safe!',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: AppColors.secondary.withOpacity(0.5),
                          ),
                    ),
                    const SizedBox(height: 40),
                    Form(
                      key: _loginFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              floatingLabelStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              hintText: 'example@gmail.com',
                              hintStyle: TextStyle(
                                color: AppColors.secondary.withOpacity(0.3),
                                fontSize: 15,
                              ),
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color: AppColors.secondary.withOpacity(0.5)),   
                              ),  
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.secondary),
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.secondary),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              floatingLabelStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              hintText: 'Type your password',
                              hintStyle: TextStyle(
                                color: AppColors.secondary.withOpacity(0.3),
                                fontSize: 15,
                              ),
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color: AppColors.secondary.withOpacity(0.5)),   
                              ),  
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.secondary),
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.secondary),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            onEditingComplete: () =>
                                FocusScope.of(context).unfocus(),
                            style: const TextStyle(color: Colors.white),
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'[ ]')),
                              FilteringTextInputFormatter.allow(
                                RegExp("[0-9a-zA-Z]"),
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () => _requestLogin(LoginType.email),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              elevation: 5,
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  'Log In',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'or log in with',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () =>
                                    _requestLogin(LoginType.facebook),
                                icon: const Icon(
                                  Icons.facebook_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () => _requestLogin(LoginType.apple),
                                icon: const Icon(
                                  Icons.apple_rounded,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () =>
                                    _requestLogin(LoginType.tiktok),
                                icon: const Icon(
                                  Icons.tiktok_rounded,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Don\'t have an account?',
                              style:
                                  const TextStyle(color: AppColors.secondary),
                              children: [
                                TextSpan(
                                  text: ' Sign Up',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => _requestToRegister(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            child: Positioned(
              bottom: 10,
              child: Container(
                height: 5,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
