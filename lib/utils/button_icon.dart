import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sso/screens/home.dart';
import 'package:flutter_sso/utils/utils.dart';

class ButtonIcon extends StatefulWidget {
  const ButtonIcon({
    super.key,
    required this.title,
    required this.typeLogin,
  });
  final String title;
  final TypeLogin typeLogin;
  @override
  State<ButtonIcon> createState() => _ButtonIconState();
}

class _ButtonIconState extends State<ButtonIcon> {
  Future<void> _actionGoogle() async {
    User? user = await Authentication.signInWithGoogle(context: context);

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Home(
            user: user,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        widget.typeLogin == TypeLogin.google ? _actionGoogle() : null;
      },
      icon: Image.asset(
        widget.typeLogin == TypeLogin.google
            ? 'assets/google.png'
            : 'assets/facebook.png',
        width: 20,
      ),
      label: const Text('Login'),
    );
  }
}

enum TypeLogin { google, facebook }
