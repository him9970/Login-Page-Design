import 'package:flutter/material.dart';

void main()=> runApp(new MyApp()) ;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: new LoginPage(),
      theme: new ThemeData(
        
        primarySwatch: Colors.green,
        brightness: Brightness.light
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeOut
    );
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.deepOrangeAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          
          new Image(
            image: new AssetImage("assets/as1.png"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              
              new Form(


                  child: new Theme(
                    data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.blue,
                      inputDecorationTheme: new InputDecorationTheme(

                        labelStyle: new TextStyle(
                          color: Colors.blue,
                          fontSize: 20
                        )
                      )
                    ),

                    child: new Container(

                      padding: const EdgeInsets.all(40),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Username",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),

                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),

                          new Padding(
                              padding: const EdgeInsets.only(
                                  top: 40
                              )
                          ),

                          new MaterialButton(

                            height:40 ,
                            minWidth: 400,
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: new Text("Login"),
                            onPressed: () => {},
                            splashColor: Colors.deepOrangeAccent,
                          )

                        ],
                      ),
                    ),
                  ),
              )
            ],
          )
        ],
      ),
    );
  }
}



