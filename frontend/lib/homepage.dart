import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import './navbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isSelected = false;
  String username = "";

  void loadUsername() {
    FlutterSession().get('username').then((value) {
      this.setState(() {
        username = value.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  // TODO: temp remove
  void logout(BuildContext context) {
    FlutterSession()
        .set('token', "")
        .then((value) => Navigator.of(context).pushNamed('/login'));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavBar(0),
        body: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Expanded(child: Image.asset('assets/Logo.png')),
          Text("Welcome " + username + "!"),
          RaisedButton(onPressed: () => logout(context), child: Text("Logout")),
          Expanded(
            child: OrientationBuilder(
              builder: (context, orientation) {
                return GridView.count(
                  padding: EdgeInsets.all(30),
                  crossAxisCount: 4,
                  primary: false,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 50.0,
                      height: 25.0,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text("The Zone"),
                        color: Colors.redAccent,
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 50.0,
                      height: 25.0,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text("Picks & Predictions"),
                        color: Colors.orangeAccent,
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 50.0,
                      height: 25.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/soloTrivia');
                        },
                        child: Text("Trivia"),
                        color: Colors.yellowAccent[100],
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 50.0,
                      height: 25.0,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text("Analyze & Debate"),
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ]));
  }
}
