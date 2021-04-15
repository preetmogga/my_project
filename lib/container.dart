import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(

          color: Colors.blue[300],
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150))),

      child: Center(child: Image.asset("images/logo.png")
      ),
    );
  }
}