import 'package:flutter/material.dart';
import 'package:flutter_sso/utils/button_icon.dart';
import 'package:flutter_sso/utils/utils.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Login Using Social Media',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: Authentication.initializeFirebase(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return const ButtonIcon(
                    title: 'Login',
                    typeLogin: TypeLogin.google,
                  );
                }
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black12,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const ButtonIcon(
              title: 'Login',
              typeLogin: TypeLogin.facebook,
            ),
          ],
        ),
      ),
    );
  }
}
