// ignore_for_file: deprecated_member_use

import 'package:exam/Loginpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Center(
          child: Text('HomePage'),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,c\

          children: [
            Image.asset('assets/zelar.jpeg'),
            Container(
              padding: const EdgeInsets.all(20),
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Loginpage()),
                  );
                },
                child: const Center(child: Text('Login Page')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
