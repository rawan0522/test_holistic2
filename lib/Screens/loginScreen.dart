import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_holistic2/Providers/Registration_provider.dart';
import 'package:test_holistic2/Screens/ProductScreen.dart';
import 'package:test_holistic2/Screens/signupscreen.dart';

import '../Models/registration_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController email1 = TextEditingController();
  TextEditingController password1 = TextEditingController();
  final formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context, listen:false );

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Login" , style: TextStyle(fontSize: 20),),
        centerTitle: true,
        actions: [
          Icon(Icons.settings),
        ],
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: email1,
                decoration: InputDecoration(
                    label: Text("email"),
                    icon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),SizedBox(height: 10,),
              TextFormField(
                controller: password1,
                decoration: InputDecoration(
                    label: Text("password"),
                    icon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),SizedBox(height: 10,),
              MaterialButton(onPressed: ()async {
               if(formkey.currentState!.validate()){
                 await provider.login(email: email1.text, password: password1.text);
                 if(provider.registrationModel?.status == true){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Productscreen(),));
                 }else{
                   print("invalid data");
                 }
               }
                }
              ,child: Text("Login"), ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
              }, child: Text("Sign up")),
            ],
          ),
        ),
      ),
    );
  }
}
