import 'dart:math';
import 'package:car_val/components/button.dart';
import 'package:car_val/components/textfield.dart';
import 'package:car_val/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Otpscreen extends StatefulWidget {
  String verificationid;
  Otpscreen({super.key, required this.verificationid});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  final otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('OTP Screen')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                MyTextfield(
                  controller: otpController,
                  hintText: 'OTP',
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  icon: Icon(Icons.password),
                ),
                const SizedBox(height: 30),

                MyButton(
                  text: ' Sign In',
                  onTap: () async {
                    try {
                      PhoneAuthCredential credential =
                          await PhoneAuthProvider.credential(
                            verificationId: widget.verificationid,
                            smsCode: otpController.text.toString(),
                          );
                      FirebaseAuth.instance
                          .signInWithCredential(credential)
                          .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          });
                    } catch (ex) {
                      log(ex.toString() as num);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
