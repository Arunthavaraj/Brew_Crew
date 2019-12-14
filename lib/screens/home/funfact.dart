import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screens/home/fact.dart';
import 'package:brew_crew/screens/home/colors.dart';
import 'package:brew_crew/screens/home/home.dart';

void main() => runApp(new MaterialApp(
      home: new Funfact(),
      debugShowCheckedModeBanner: false,
    ));

class Funfact extends StatefulWidget {
  @override
  _FunfactState createState() => new _FunfactState();
}

class _FunfactState extends State<Funfact> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  int factcounter = 0;
  int colorcounter = 0;
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation = new CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    animation.addListener(() {
      this.setState(() {});
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void showfacts() {
    setState(() {
      dispfact = facts[factcounter];
      dispcolor = bgcolors[colorcounter];
      factcounter = factcounter < facts.length - 1 ? factcounter + 1 : 0;
      colorcounter = colorcounter < bgcolors.length - 1 ? colorcounter + 1 : 0;
      animationController.reset();
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: dispcolor,
      body: new Padding(
        padding: const EdgeInsets.symmetric(vertical: 75.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Align(
                  alignment: Alignment.topLeft,
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: new Text(
                      "Did you Know About Flutter?",
                      style: new TextStyle(color: Colors.white, fontSize: 40.0, fontFamily: 'OpenSans'),
                    ),
                  )),
              new Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0,top: 60.0),
                child: new Opacity(
                  opacity: animation.value*1,
                                  child: new Transform(
                    transform: new Matrix4.translationValues(0.0,animation.value*-50.0, 0.0),
                      child: new Text(
                    dispfact,
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300),
                  )),
                ),
              ),
              new MaterialButton(
                color: Colors.white,
                minWidth: 160.0,
                child: new Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 18.0),
                  child: new Text(
                    "Show Another Fact",
                    style: new TextStyle(fontSize: 15.0,color: dispcolor,fontFamily: 'OpenSans'),
                  ),
                ),
                onPressed: showfacts,
              ),
            new MaterialButton(
              minWidth: 160.0,
              color: Colors.white,
                child: new Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 10.0),
                  child: new Text(
                    "Go To Home Page",
                    style: new TextStyle(fontSize: 15.0,color: dispcolor,fontFamily: 'OpenSans'),
                  ),
                ),
                onPressed: () async {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Home()));
                },
            ),
            
              
            ],
        
          ),
        ),
      ),
    );
  }
}