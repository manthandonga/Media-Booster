import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Global.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email'
    ]
);

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


  GoogleSignInAccount? _currentUser;


  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }


  bool isPasswordShow = false;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
              width: double.infinity,
            ),
            // Image.asset(
            //   "images/signup.png",
            //   scale: 8,
            // ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Sign Up Now",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Please fill the details and create account",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Full name",
                  hintStyle: TextStyle(fontSize: 13),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 13),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: isPasswordShow,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon((isPasswordShow)
                        ? Icons.visibility
                        : Icons.visibility_off),
                    color: Colors.grey,
                    onPressed: () {
                      setState(() {
                        isPasswordShow = !isPasswordShow;
                      });
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                if (passwordController.text.isNotEmpty &&
                    fullNameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {
                  detail.fullName = fullNameController.text;
                  detail.email = emailController.text;
                  detail.password = passwordController.text;
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('username', detail.fullName);
                  await prefs.setString('email', detail.email);
                  await prefs.setString('password', detail.password);
                  await prefs.setBool('signup', true);
                  Navigator.of(context).pushReplacementNamed('login_page');
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFE4C66)),
                alignment: Alignment.center,
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            //Google Button
            InkWell(
              onTap: ()  {
                signIn();
                Navigator.of(context).pushReplacementNamed('login_page');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFE4C66)),
                alignment: Alignment.center,
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),


            const SizedBox(
              height: 20,
            ),


            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("login_page");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    "Log in",
                    style: TextStyle(color: Color(0xffFE4C66), fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signout(){
    _googleSignIn.disconnect();
  }

  Future<void> signIn() async{
    try{
      await _googleSignIn.signIn();
    }catch(e){
      print('Error signIn is $e');
    }
  }
}
