import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recipe_app/HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

// Used for controlling whether the user is loggin or creating an account
enum FormType { login, register }

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final background = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.red,
        end: Colors.green,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.yellow,
        end: Colors.blue,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.purple,
        end: Colors.orange,
      ),
    ),
    // TweenSequenceItem(
    //   weight: 1.0,
    //   tween: ColorTween(
    //     begin: Colors.white,
    //     end: Colors.black12,
    //   ),
    // ),
  ]);

  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  String _email = "";
  String _password = "";
  FormType _form = FormType.login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  @override
  void initState() {
    super.initState();
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      //duration: const Duration(seconds: 10),
    );
    _controller.addListener(() {
      if (_controller.isCompleted) _controller.reverse();
      if (_controller.isDismissed) _controller.forward();
    });
    _controller.forward();
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  // Swap in between our two forms, registering and logging in
  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      //appBar: _buildBar(context),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          final color = background.evaluate(_controller);

          return Container(
            color: color,
            child: child,
          );
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              padding: EdgeInsets.all(50),
              child: Column(
                children: <Widget>[
                  // CustomPaint(
                  //   painter: TrianglePainter(
                  //     strokeColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  //     strokeWidth: 10,
                  //     paintingStyle: PaintingStyle.fill,
                  //   ),
                  //   child: Container(
                  //     height: 90,
                  //     width: 100,
                  //   ),
                  // ),

                  //RandoShape(),

                  Stack(children: <Widget>[
                    RandoShape(),
                    RandoShape2(),
                  ]),
                  RandoShape3(),

                  SizedBox(height: 10),
                  Text(
                    'Anmeldung',
                    style: TextStyle(fontSize: 40, color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                  ),
                  SizedBox(),
                  _buildTextFields(),
                  _buildButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildBar(BuildContext context) {
  //   return new AppBar(
  //     backgroundColor: Colors.red,
  //     title: new Text("Simple Login Example"),
  //     centerTitle: true,
  //   );
  // }

  Widget _buildTextFields() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: TextField(
              cursorColor: Colors.red,
              controller: _emailFilter,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            child: TextField(
              cursorColor: Colors.red,
              controller: _passwordFilter,
              decoration: InputDecoration(labelText: 'Passwort'),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Anmeldung'),
              onPressed: _loginPressed,
            ),
            FlatButton(
              child: Text('Noch keinen Account? Tippen Sie hier, um sich zu registrieren.'),
              onPressed: _formChange,
            ),
            FlatButton(
              child: Text('Passwort vergessen?'),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Create an Account'),
              onPressed: _createAccountPressed,
            ),
            FlatButton(
              child: Text('Have an account? Click here to login.'),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _loginPressed() {
    print('The user wants to login with $_email and $_password');
    if (_email != '' || _email != null && _password.length >= 6) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {}
  }

  void _createAccountPressed() {
    print('The user wants to create an accoutn with $_email and $_password');
  }

  void _passwordReset() {
    print("The user wants a password reset request sent to $_email");
  }
}

class RandoShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 220,
      color: Colors.red,
    );
  }
}

class RandoShape2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 220,
      color: Colors.black,
    );
  }
}

class RandoShape3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 220,
      color: Colors.yellow,
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter({this.strokeColor = Colors.black, this.strokeWidth = 3, this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor || oldDelegate.paintingStyle != paintingStyle || oldDelegate.strokeWidth != strokeWidth;
  }
}
