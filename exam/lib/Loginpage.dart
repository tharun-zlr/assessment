import 'package:exam/homepage.dart';
import 'package:exam/translate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String username = '';
  String password = '';
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          'LoginPage',
          style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formkey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login Page',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'UserName',
                      labelText: 'Enter UserName',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Valid UserName';
                    } else {
                      return null;
                    }
                  },
                  onChanged: ((value) {
                    username = value;
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter valid password';
                    } else if (value.length < 6) {
                      return 'Enter atleast 6 charectors';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      Loginpage();
                    },
                    child: Text('Login'),
                    shape: StadiumBorder(),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  // ignore: non_constant_identifier_names
  void Loginpage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => dropdown()),
    );
    if (_formkey.currentState!.validate()) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
        Fluttertoast.showToast(msg: 'Login succsussfully');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
            (Route<dynamic> route) => false);
      }).catchError((onError) {
        setState(() {
          _isLoading = false;
        });
        Fluttertoast.showToast(msg: 'Error' + onError.toString());
      });
    }
  }
}
