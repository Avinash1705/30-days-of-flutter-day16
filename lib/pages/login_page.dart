import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/routes/MyRoutes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var changeButton = false;
  var name = "";
  final _formKey = GlobalKey<FormState>() ;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                              return "User name can't be empty ";
                          }
                          return null ;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Password can't be empty ";
                          }
                          else if (value.length <4){
                            return "Length can't be less then 4 ";
                          }
                          return null ;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          child: Container(
                            width: changeButton ? 120 : 50,
                            height: 40,
                            alignment: Alignment.center,
                            // color: Colors.deepPurple,
                            child: changeButton
                                ? Icon(Icons.done)
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius:
                                  BorderRadius.circular(changeButton ? 20 : 8),
                            ),
                          ),
                        ),
                        onTap: () => moveToHome()
                        ,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

   moveToHome() async{
    if(_formKey.currentState!.validate()){
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }
}
