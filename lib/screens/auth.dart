// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, unused_element, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {


TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
// ignore: unused_field
String _email;
String _password;
bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    Widget _logo(){
      return Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Container(
          child: const Align(
            // ignore: unnecessary_const
            child: Text(
              'Maxfit',style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold, color: Colors.white),
              ),
              ),
              ),
        );
    }
    Widget _input(Icon icon, String hint, TextEditingController controller, bool obsecure) {
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(fontSize: 20,color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 20, color: Colors.white30),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3),
              ),         
             enabledBorder: OutlineInputBorder(
               borderSide: BorderSide(color: Colors.white54, width: 1),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(data: IconThemeData(color: Colors.white),
                child: icon,
                ),
                ),
              ),
          ),
        
        );
    }
    

    Widget _button(String text,void func()) {
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor, 
    color: Colors.white,
    child: Text(
      text,
      style: TextStyle(
      
        fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20)
    ),
    onPressed: () {
      func ();
      },
        );

    }
    Widget _form(String label, void func()){
      return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: _input(Icon(Icons.email), 'Email', _emailController, false),
              ),
               Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _input(Icon(Icons.lock), 'password', _passwordController, true),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                 width: MediaQuery.of(context).size.width,
                 child: _button(label, func)
                 ),
                 ),
              
              ],
              ),
              );
    }
    void _buttonAction() {
      _email = _emailController.text;
       _email = _passwordController.text;

       _emailController.clear();
       _passwordController.clear();
    }

    Widget _buttomWave() {
      return Expanded(
        child: Align(
          child: ClipPath(
            child: Container(
              color: Colors.white,
              height: 300,
              ),
              clipper: BottomWaveClipper(),
          ),
          alignment: Alignment.bottomCenter,
            )
          );
    }
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
         _logo(),
         SizedBox(height: 100,),
         (
           showLogin 
           ? Column (children: <Widget>[
               _form('login', _buttonAction),
               Padding(
                 padding: EdgeInsets.all(10),
                 child: GestureDetector(
                   child: Text(
                    'No: register yet? Register!', 
                    style: TextStyle(
                      fontSize: 20, color: Colors.white
                      ),
                 ),
                 onTap: () {
                   setState(() {
                     showLogin = false;
                   });
                 },
                 ),
                 ),
           ],
           )
        : Column (
          children: <Widget>[
               _form('register', _buttonAction),
               Padding(
                 padding: EdgeInsets.all(10),
                 child: GestureDetector(
                   child: Text(
                    'Alredy registered? Login!', 
                    style: TextStyle(
                      fontSize: 20, color: Colors.white
                      ),
                 ),
                 onTap: () {
                   setState(() {
                     showLogin = true;
                  });
                },
              ),
             ),
           ],
          )
         ),
         _buttomWave()
        ],
      ),
    );
  }

}

 class  BottomWaveClipper extends CustomClipper<Path>{
   @override 
   Path getClip(Size size) {
     var path = Path();
     path.moveTo(size.width, 0.0);
     path.lineTo(size.width, size.height);
     path.lineTo(0.0, size.height);
     path.lineTo(0.0, size.height + 5);
    // ignore: unused_local_variable
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    // ignore: unused_local_variable
    var secondEndPoint = Offset(size.width, 5.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    secondEndPoint.dx, secondEndPoint.dy);
    return path;
   }
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => false;
       

 }


 


