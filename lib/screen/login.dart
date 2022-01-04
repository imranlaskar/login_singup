import 'package:batch_d_login_singup_fiarbase/helpar/custom_button.dart';
import 'package:batch_d_login_singup_fiarbase/helpar/custom_text_from_field.dart';
import 'package:batch_d_login_singup_fiarbase/screen/home_page.dart';
import 'package:batch_d_login_singup_fiarbase/screen/singup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

final _auth = FirebaseAuth.instance;
final GlobalKey <FormState> _formKey = GlobalKey();
TextEditingController _emailController = TextEditingController();
TextEditingController _passController = TextEditingController();

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(width: 80,),
              Icon(Icons.ac_unit,size: 200,),
              SizedBox(height: 20,),
              CoustomTextFormField(
                obscureValue: false,
                emailController: _emailController,
                hintText: 'Enter Email',
                labelText: 'Email',
                ),
              SizedBox(height: 20,),
              CoustomTextFormField(
                obscureValue: true,
                emailController: _passController,
                hintText: 'Enter Password',
                labelText: 'Password',
                ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  singIn(
                      _emailController.text,
                      _passController.text, context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  child: CoustomButton(
                      buttonHight: 40,
                      buttonWidth: MediaQuery.of(context).size.width,
                      btnTextColor: Colors.white,
                      buttonText: "LogIn"
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have a account ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>SingUp()));
                    },
                    child: Text('SingUp',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo
                      ),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
void singIn(String email, String password,
    context )async{
  if(_formKey.currentState!.validate())
    {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password).then((value) =>{
            Fluttertoast.showToast(msg: "Login Successful"),
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=>HomePage()))
      }).catchError((e){
        Fluttertoast.showToast(msg: e.message);
      });

    }
}