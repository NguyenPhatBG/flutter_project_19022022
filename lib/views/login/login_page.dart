import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_19022022/controllers/login_controller.dart';
import 'package:project_19022022/shared/app_colors.dart';

final loginNotifierProvider = ChangeNotifierProvider<LoginController>((ref) {
  return LoginController();
});

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginChangeNotifier = ref.watch(loginNotifierProvider);
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
          Center(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => loginChangeNotifier.requestCloseKeyboard(context),
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
                        key: loginChangeNotifier.loginFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                hintText: 'example@gmail.com',
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              controller: loginChangeNotifier.emailController,
                              onSaved: (value) => loginChangeNotifier.email = value!,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                hintText: 'Type your password',
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              controller: loginChangeNotifier.passwordController,
                              onSaved: (value) => loginChangeNotifier.password = value!,
                              onEditingComplete: () =>
                                  FocusScope.of(context).unfocus(),
                              style: const TextStyle(color: Colors.white),
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'[ ]')),
                                FilteringTextInputFormatter.allow(
                                  RegExp("[0-9a-zA-Z]"),
                                )
                              ],
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () => loginChangeNotifier
                                  .requestLogin(LoginType.email, context),
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
                                  onPressed: () => loginChangeNotifier
                                      .requestLogin(LoginType.facebook, context),
                                  icon: const Icon(
                                    Icons.facebook_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                Visibility(
                                  visible: Platform.isIOS,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      IconButton(
                                        onPressed: () => loginChangeNotifier
                                            .requestLogin(LoginType.apple, context),
                                        icon: const Icon(
                                          Icons.apple_rounded,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () => loginChangeNotifier
                                      .requestLogin(LoginType.tiktok, context),
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
                                      ..onTap = () => loginChangeNotifier
                                          .requestToRegister(context),
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
