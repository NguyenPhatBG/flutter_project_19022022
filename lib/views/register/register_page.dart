import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_19022022/shared/app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  void _requestCloseKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _requestRegister() {
    _registerFormKey.currentState!.save();
    Navigator.pop(context);
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
          Center(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _requestCloseKeyboard,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'sign up to restore your all contacts, If you\nhaven\'t account, create one below!',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: AppColors.secondary.withOpacity(0.5),
                            ),
                      ),
                      const SizedBox(height: 40),
                      Form(
                        key: _registerFormKey,
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
                                  borderSide: BorderSide(
                                      color:
                                          AppColors.secondary.withOpacity(0.5)),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.secondary),
                                ),
                                border: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.secondary),
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
                                  borderSide: BorderSide(
                                      color:
                                          AppColors.secondary.withOpacity(0.5)),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.secondary),
                                ),
                                border: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.secondary),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              style: const TextStyle(color: Colors.white),
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'[ ]')),
                                FilteringTextInputFormatter.allow(
                                  RegExp("[0-9a-zA-Z]"),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Re-Password',
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
                                  borderSide: BorderSide(
                                      color:
                                          AppColors.secondary.withOpacity(0.5)),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.secondary),
                                ),
                                border: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.secondary),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
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
                              onPressed: () => _requestRegister(),
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
                                    'Sign Up',
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
