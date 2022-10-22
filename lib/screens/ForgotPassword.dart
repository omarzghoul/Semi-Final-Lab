import 'package:citycafe_app/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgotPasswordpage extends StatelessWidget {
  ForgotPasswordpage({super.key});
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade600,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              autofocus: true,
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Entar a email',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  FirebaseAuth.instance.sendPasswordResetEmail(
                      email: textController.text.trim());
                  show(context, "password reset link sent! Check you email");
                } on FirebaseAuthException catch (e) {
                  show(context, e.message.toString());
                }
              },
              child: Text("Reset Password"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade600),
            )
          ],
        ),
      ),
    );
  }

  void show(context, message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
        );
      },
    );
  }
}
