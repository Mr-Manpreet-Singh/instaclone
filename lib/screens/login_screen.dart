import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/resources/auth_methods.dart';
import 'package:insta_clone/responsive/mobile_screen_layout.dart';
import 'package:insta_clone/responsive/responsive_layout_screen.dart';
import 'package:insta_clone/responsive/web_screen_layout.dart';
import 'package:insta_clone/screens/signup_screen.dart';
import 'package:insta_clone/utility/colors.dart';
import 'package:insta_clone/utility/utils.dart';
import 'package:insta_clone/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  _goToSignUpScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const SignUpScreen(),
    ));
  }

  _onLoginButtonTap() async {
    final str = await AuthMethods().loginUserWithEmailPassword(
        password: _passController.text, email: _emailController.text);
    showSnackBar(context: context, message: str);
    if (str == 'success') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout()),
      ));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 1, child: Container()),
              //image
              SvgPicture.asset(
                height: 64,
                'assets/ic_instagram.svg',
                color: primaryColor,
              ),
              const SizedBox(height: 64),
              //email
              TextInput(
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailController),

              const SizedBox(height: 24),
              //pass
              TextInput(
                  hintText: "Password",
                  textInputType: TextInputType.text,
                  isPass: true,
                  textEditingController: _passController),
              const SizedBox(height: 24),
              //button
              InkWell(
                onTap: _onLoginButtonTap,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4)),
                  child: const Text("Login"),
                ),
              ),

              Flexible(flex: 1, child: Container()),
              // Expanded(child: Container()),

              //row(don't have an account)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                  ),
                  GestureDetector(
                    onTap: _goToSignUpScreen,
                    child: const Text(
                      "SignUp.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
