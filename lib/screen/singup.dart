import 'package:batch_d_login_singup_fiarbase/helpar/custom_button.dart';
import 'package:batch_d_login_singup_fiarbase/helpar/custom_text_from_field.dart';
import 'package:batch_d_login_singup_fiarbase/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  _SingUpState createState() => _SingUpState();
}

final _auth = FirebaseAuth.instance;
TextEditingController _emailController = TextEditingController();
TextEditingController _passController = TextEditingController();
TextEditingController _conPassController = TextEditingController();
final GlobalKey <FormState> _formKeySingUp = GlobalKey();

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKeySingUp,
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
              CoustomTextFormField(
                obscureValue: true,
                emailController: _conPassController,
                hintText: 'Re-Enter Password',
                labelText: 'Conform Password',
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  singUp(
                  _emailController.text,
                      _passController.text,
                      context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  child: CoustomButton(
                      buttonHight: 40,
                      buttonWidth: MediaQuery.of(context).size.width,
                      btnTextColor: Colors.white,
                      buttonText: "SingUp"
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Alrady have a account ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>LogIn()));
                    },
                    child: Text("Login",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.cyan
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
void singUp(String email, String password, context)async{
  if(_formKeySingUp.currentState!.validate())
    {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password).then((value) => {
            Fluttertoast.showToast(
                msg: "Account Created Successfully"
            ),
              Navigator.push(context,
                 MaterialPageRoute(builder: (context)=>LogIn()))
          }).catchError((e){
        Fluttertoast.showToast(msg: e.message);
      });
    }
}