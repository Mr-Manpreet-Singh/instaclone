import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/resources/auth_methods.dart';
import 'package:insta_clone/responsive/mobile_screen_layout.dart';
import 'package:insta_clone/responsive/responsive_layout_screen.dart';
import 'package:insta_clone/responsive/web_screen_layout.dart';
import 'package:insta_clone/screens/login_screen.dart';
import 'package:insta_clone/utility/colors.dart';
import 'package:insta_clone/utility/utils.dart';
import 'package:insta_clone/widgets/text_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});



  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _userNameController = TextEditingController();
  final _profileBioController = TextEditingController();
  Uint8List? _profileImage;
  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _goToLoginScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ));
  }

  _selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _profileImage = im;
    });
  }

  void onSignUpButtonTap() async {
    setState(() {
      _isLoading = true;
    });
    String returnedStr = "user details not upto the mark";
    if (_emailController.text.isNotEmpty &&
        _passController.text.isNotEmpty &&
        _profileBioController.text.isNotEmpty &&
        _profileImage != null &&
        _userNameController.text.isNotEmpty) {
      returnedStr = await AuthMethods().signUpUser(
          email: _emailController.text,
          password: _passController.text,
          username: _userNameController.text,
          userBio: _profileBioController.text,
          image: _profileImage!);
    }
    setState(() {
      _isLoading = false;
    });

    if (returnedStr == 'success') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout()),
      ));
    }
    showSnackBar(context: context, message: returnedStr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              //image
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    foregroundImage: (_profileImage == null)
                        ? null
                        : MemoryImage(_profileImage!),
                    backgroundImage: const NetworkImage(
                        'https://th.bing.com/th/id/OIP.VORoQXOzfnrc1yOV4anzxQHaHa?w=191&h=191&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
                  ),
                  Positioned(
                    bottom: -10,
                    right: 0,
                    child: IconButton.filled(
                      onPressed: _selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              //UserName
              TextInput(
                  hintText: "Username",
                  textInputType: TextInputType.text,
                  textEditingController: _userNameController),

              const SizedBox(height: 24),
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
              //Bio
              TextInput(
                  hintText: "Bio",
                  textInputType: TextInputType.text,
                  textEditingController: _profileBioController),
              const SizedBox(height: 24),
              //button
              InkWell(
                onTap: onSignUpButtonTap,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4)),
                  child: (_isLoading)
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text("SignUp"),
                ),
              ),

              Flexible(flex: 1, child: Container()),
              // Expanded(child: Container()),

              //row(don't have an account)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have an account? ",
                  ),
                  GestureDetector(
                    onTap: _goToLoginScreen,
                    child: const Text(
                      "Login .",
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
