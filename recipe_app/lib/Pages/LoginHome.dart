import 'package:flutter/material.dart';

 class LoginHome extends StatelessWidget{
      @override
      Widget build(BuildContext context){
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/abstract_bg.jpg"), fit: BoxFit.cover),
            ),
            child: Center(child: Text('Welcome To',style: TextStyle(
              color: Colors.white,
              fontSize: 40.0
            ),)),
            )
        );
      }
    }