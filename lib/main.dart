import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseproject/auth/getstart.dart';
import 'package:firebaseproject/auth/loginpage.dart';
import 'package:firebaseproject/main_page.dart';
import 'package:firebaseproject/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Hive
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  // Open Hive box
  await Hive.openBox('appPreferences');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService _authService = AuthService();
  MyApp({super.key});

  Future<Widget> _getInitialPage() async {
    final box = Hive.box('appPreferences');
    final bool hasSeenGetStartedPage =
        box.get('hasSeenGetStartedPage', defaultValue: false);

    if (hasSeenGetStartedPage) {
      return const LoginPage();
    } else {
      return const GetStartPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _getInitialPage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (snapshot.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const MainPage(),
          );
        } else {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: Text('Error loading initial page')),
            ),
          );
        }
      },
    );
  }
}
