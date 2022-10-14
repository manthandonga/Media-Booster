import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Global.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
                width: double.infinity,
              ),
              Image.asset(
                "images/Welcome.png",
                scale: 8,
              ),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Create an account and access thousand",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const Text(
                " of cool stuffs",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(
                height: 70,
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.of(context).pushNamed('login_page');
              //   },
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(horizontal: 10),
              //     height: 50,
              //     width: MediaQuery.of(context).size.width * 0.9,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(8),
              //         color: const Color(0xffFE4C66)),
              //     alignment: Alignment.center,
              //     child: Text(
              //       "Login as ${detail.fullName}",
              //       style: const TextStyle(color: Colors.white, fontSize: 18),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                  Navigator.of(context).pushReplacementNamed("/");
                },
                child:
                    const Text("Delete account", style: TextStyle(fontSize: 14)),
              )
            ]),
      ),
    );
  }
}
