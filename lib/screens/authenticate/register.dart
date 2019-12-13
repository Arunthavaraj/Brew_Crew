import 'package:brew_crew/animation/FadeAnimation.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = ''; 
  
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        padding: EdgeInsets.all(30),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(1.2, Text("Register", 
            style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),)),
            SizedBox(height: 40,),
            FadeAnimation(1.5, Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),


              child:Form(
                key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[300]))
                    ),


                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                        hintText: "Email"
                      ),
                      validator: (val) => val.isEmpty ? 'Email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
                    ),
                  ),



                  Container(
                    decoration: BoxDecoration(
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                        hintText: "Password"
                      ),
                      obscureText: true,
              validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
                    ),
                  ),
                ],
              ),
            )),
            ),


            SizedBox(height: 40,),
            FadeAnimation(1.8, Center(
              child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.black87),
                ),
                onPressed: () async {
                if(_formKey.currentState.validate()){
                dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                if(result == null) {
                setState(() 
                => error = 'Please provide a Valid E-Mail');
                  } 
                  }
                  }
                  ),
            )),
            SizedBox(height: 12.0),
              Text(
                error,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 14.0
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 80.0, 10.0, 10.0),
              child: Text('Already an User, Just continue with Login',
            textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,
              fontSize: 20.0,
              ),
              ),
              
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Align(
                      alignment: Alignment.bottomCenter,
                   child: RaisedButton(
                   color: Colors.blue,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async {
                    widget.toggleView();
                  },
                    ),
                
                ),
            ),

          ],
        ),
      ),
    );
  }
}