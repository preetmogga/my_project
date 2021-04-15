import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'container.dart';

class SigupPage extends StatefulWidget {
  @override
  _SigupPageState createState() => _SigupPageState();
}

class _SigupPageState extends State<SigupPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  Future registerUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _pass.text,
      );
      print("your are successfully registar");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
                        registerUser();
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
                          'sigup',
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
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Already have a account ?Sigin  ",
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
