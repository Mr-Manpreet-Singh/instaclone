import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/responsive/mobile_screen_layout.dart';
import 'package:insta_clone/responsive/responsive_layout_screen.dart';
import 'package:insta_clone/responsive/web_screen_layout.dart';
import 'package:insta_clone/screens/signup_screen.dart';
import 'package:insta_clone/utility/colors.dart';
import 'package:insta_clone/screens/login_screen.dart';
// import 'package:insta_clone/screens/home_screen.dart';
// import 'package:insta_clone/responsive/mobile_screen_layout.dart';
// import 'package:insta_clone/responsive/responsive_layout_screen.dart';
// import 'package:insta_clone/responsive/web_screen_layout.dart';
// import 'package:insta_clone/screens/signup_screen.dart';

// #TODO #BUG #HACK #FIXME
// -> 2 line in rin app widgetbing, FireBAse initialize

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResponsiveLayout(
      //     WebScreenLayout: WebScreenLayout(),
      //     mobileScreenLayout: MobileScreenLayout()),
      // home: const SignUpScreen(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            // FirebaseAuth.instance.signOut();
            debugPrint(FirebaseAuth.instance.currentUser!.uid);
            return const ResponsiveLayout(
                webScreenLayout: WebScreenLayout(),
                mobileScreenLayout: MobileScreenLayout());
          }
            // has errror or no data
          return const LoginScreen();
          // snapshot has data
        },
      ),
    );
  }
}


/* Learnings 
1> FireBase SetUp
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();   //IMP: use await before
  Android :adding snippets in build.gradle, app->build.gradle
  Web and IOS Skipped
2> Responsive Folder Structure 
3> SVg image why ?
4> Why Flexible not Expanded?
5> Run App first two lines 
6> Text_input widget is not statefull and is common
  - keyboard type is TextInputType <DataType>
  - password text to false as it will be true in min cases

7> flutter_svg package   SvgPicture.assest(),  
>  TextField -> input decor -> filled =true // automatic add faded color to text field
8> Container -> decor -> ShapeDecor -> RoundedRect...Border - >BorderRAdious.all(Radius.circular(4))
>  InkWell for buttons (inkwell give sound on tap) and gestureDetector for click-able Text
>  color:primaryColor right     color: Colors.primaryColor // Wrong

9> while passing an image location it should be string

--------------------after one hour

imagepicker package // utils folder utils.dart (no class) direct function pickImage
anything that is on dart;io package in not excessale in web Platform
XFile to Uint8list  useing redasByte method

Resources -> auth_methods and 

-------------------------------------------------------------------------
//  To presiste login state on app reload there are three methods 
// 1-> idTokenchange  2->userStateChange  3->
// he authStateChanges, idTokenChanges and userChanges streams: your listeners will receive the current User, or null if no user is authenticated:
// https://firebase.google.com/docs/auth/flutter/manage-users
// https://firebase.flutter.dev/docs/auth/password-auth




// model and method , model imported as model
// collection...doc...get; gives one time Documnetsnapshot
// getting data by using .deta() method; Data is in the form of map
// .data returns object to write as Map<String,dynamic>  or ['username'] as String

 */