
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';




class Home extends StatefulWidget {

@override

_Home createState() => _Home();
}
class _Home extends State<Home>{
  
final AuthService _auth = AuthService();


 Map data;
 List userData;

Future getData() async {
  http.Response response = await http.get("https://reqres.in/api/users?page=2");
  data = json.decode(response.body);
  setState(() {
      userData = data["data"];

    });
  }
  
  @override
    void initState() {
      super.initState();
      getData();
  
  }
  @override
  
    Widget build(BuildContext context) {
      return Scaffold(
        
        body:
        
        
        
         ListView.builder(
         itemCount: userData == null ? 0 : userData.length,
         itemBuilder: (BuildContext context, int index){
 
             
           return Card(
             child: Padding(
               padding: const EdgeInsets.all(10.0),
             child: Row(
               children: <Widget>[
                 CircleAvatar(
                   backgroundImage: NetworkImage(userData[index]["avatar"]),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Text("${userData[index]["first_name"]} ${userData[index]["last_name"]}",
                   style: TextStyle(
                     fontSize: 20.0,
                     fontWeight: FontWeight.w700,
                
                     
                   ),
                   ),
                 
                 ),
               ],
             ),
             ),
           );
  
         }
          ),
        backgroundColor: Colors.lightBlueAccent,
  appBar: AppBar(
    title: Text('Flutter'),
    centerTitle: true,
    titleSpacing: 2.0,
    backgroundColor: Colors.blue[600],
    elevation: 0.0,
    actions: <Widget>[
      FlatButton.icon(
        icon: Icon(Icons.person),
        label: Text('Sign Out'),
        onPressed: () async {
          await _auth.signOut();
        },
      )
    ],
  ),
      );
    }
  
    
}