import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/sigupPage.dart';
import 'container.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  Future loginUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _pass.text,
      );
      print("your are successfully login");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContainer(),
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Form(
                  child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, right: 10, left: 10),
                    child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          icon: Icon(Icons.email)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 10, left: 10),
                    child: TextFormField(
                      controller: _pass,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          icon: Icon(Icons.vpn_key)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, right: 30, left: 50),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          loginUser();
                        });
                      },
                      child: Container(
                        //  width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'sigin',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SigupPage()));
                    },
                    child: Text(
                      "Don't have an account ? Signup   ",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
