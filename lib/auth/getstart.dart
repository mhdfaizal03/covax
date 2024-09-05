import 'package:firebaseproject/auth/loginpage.dart';
import 'package:firebaseproject/constands/constant.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GetStartPage extends StatefulWidget {
  const GetStartPage({super.key});

  @override
  _GetStartPageState createState() => _GetStartPageState();
}

class _GetStartPageState extends State<GetStartPage> {
  @override
  void initState() {
    super.initState();
    _checkFirstUse();
  }

  Future<void> _checkFirstUse() async {
    final box = Hive.box('appPreferences');
    final bool hasSeenGetStartedPage =
        box.get('hasSeenGetStartedPage', defaultValue: false);

    if (hasSeenGetStartedPage) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    } else {
      await box.put('hasSeenGetStartedPage', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 350,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    'Ready to Feast? \n Let\'s Begin!',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
              ActionButton(
                height: 50,
                width: 400,
                onpressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                actionTitle: 'Get Started',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
