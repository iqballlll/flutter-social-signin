import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sso/screens/sign_in.dart';
import 'package:flutter_sso/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key, required User user}) : _user = user;

  final User _user;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget._user.photoURL!),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(widget._user.displayName!),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                await Authentication.signOut(context: context);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondary) {
                      return const SignIn();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = Offset(-1.0, 0.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
