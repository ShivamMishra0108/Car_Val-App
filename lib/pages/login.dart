import 'package:car_val/components/button.dart';
import 'package:car_val/components/textfield.dart';
import 'package:car_val/pages/otpscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true, title: const Text('LOGIN')),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/carlogo.png', height: 80),

                  const SizedBox(height: 30),

                  const Text(
                    'WELCOME TO THE CARVALO',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),

                  const SizedBox(height: 30),

                  MyTextfield(
                    controller: phoneController,
                    hintText: 'Enter Phone',
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    icon: Icon(Icons.phone),
                  ),

                  const SizedBox(height: 30),

                  MyButton(
                    text: 'Send OTP',
                    onTap: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException ex) {},
                        codeSent: (String verificationid, int? resendtoken) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Otpscreen(verificationid: verificationid),
                            ),
                          );
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                        phoneNumber: phoneController.text.toString(),
                      );
                    },
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Not a member?'),
                      Text(
                        'Register Now',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
