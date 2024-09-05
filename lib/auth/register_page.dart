import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseproject/auth/loginpage.dart';
import 'package:firebaseproject/constands/constant.dart';
import 'package:flutter/material.dart';

import '../services/firebase_services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/join.png',
                          width: 200,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Join Us!',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter a valid username';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            hintText: 'enter your Fullname',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter a valid phone number';
                          }
                          return null;
                        },
                        controller: phoneController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            hintText: 'enter your phone number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter a valid email';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            hintText: 'enter your email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter a valid password';
                          }
                          return null;
                        },
                        controller: passController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue[50],
                            hintText: 'enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Forgot password ?')),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.blue[50],
                            border: Border.all(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: MaterialButton(
                              onPressed: () async {
                                await _authService.signInWithGoogle(context);
                              },
                              child: Image.asset('assets/images/google.png')),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ActionButton(
                          width: 400,
                          height: 50,
                          onpressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              signUp();
                            }
                          },
                          actionTitle: 'Create Account'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const LoginPage()));
                          },
                          child:
                              const Text('You already have an account? Login'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passController.text);
  }
}
