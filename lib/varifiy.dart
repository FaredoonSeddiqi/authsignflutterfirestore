import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class varifyscreen extends StatefulWidget {
  const varifyscreen({super.key});

  @override
  State<varifyscreen> createState() => _varifyscreenState();
}

class _varifyscreenState extends State<varifyscreen> {
  bool isemailvarified = false;

  void initState() {
    super.initState();
    isemailvarified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isemailvarified) {
      sendemail();
    }
  }

  Future<void> sendemail() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
