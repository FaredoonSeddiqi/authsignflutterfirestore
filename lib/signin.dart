import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signup(BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email.text.trim(),
        password: 'dummyPassword',
      );

      // Send verification email to the user
      await userCredential.user?.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  // Future<void> sendemailvarification() async {
  //   final user = FirebaseAuth.instance.currentUser!;
  //   await user.sendEmailVerification();
  // }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 18),
      backgroundColor: Colors.blue,
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.pink,
            Colors.blue,
            // #3F5EFB
            // #FC466B
          ],
        )),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login page",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                hintText: "Email",
                suffixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "password",
                suffixIcon: Icon(Icons.password_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _email.text.trim(), password: _password.text.trim());
              },
              child: Text("Login"),
              style: style,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _email.text.trim(), password: _password.text.trim());
              },
              child: Text("sign up"),
              style: style,
            ),
            ElevatedButton(
              onPressed: passwordreset,
              child: Text("reset password"),
              style: style,
            ),
            ElevatedButton(
              onPressed: () {
                signup(context);
              },
              child: Text("varifiy email"),
              style: style,
            ),
          ],
        ),
      ),
    );
  }

  Future passwordreset() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _email.text.trim());
  }

  // Future sendemailvarification() async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser!;
  //     await user.sendEmailVerification();
  //   } catch (e) {
  //     print('varifiy email');
  //   }
  // }
}
