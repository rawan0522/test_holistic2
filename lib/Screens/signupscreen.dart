
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_holistic2/Screens/loginScreen.dart';

import '../Providers/Registration_provider.dart';
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context, listen:false );
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Sign Up" , style: TextStyle(fontSize: 20),),
        centerTitle: true,
        actions: [
          Icon(Icons.settings),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "required";
                    }
                    return null;
                  },
                  controller: username,
                  decoration: InputDecoration(
                      label: Text("username"),
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),SizedBox(height: 10,),
                TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "required";
                    }if(!value.endsWith("@gmail.com")){
                      return " must end with @gmail.com ";
                    }
                    return null;
                  },
                  controller: email,
                  decoration: InputDecoration(
                      label: Text("email"),
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),SizedBox(height: 10,),
                TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "required";
                    }if(value.length <8){
                      return "password must be >8";
                    }
                    return null;
                  },
                  controller: password,
                  decoration: InputDecoration(
                      label: Text("password"),
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),SizedBox(height: 10,),
                TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "required";
                    }if(value.length<11){
                      return "phone must be 11";
                    }
                    return null;
                  },
                  controller: phone,
                  decoration: InputDecoration(
                      label: Text("phone"),
                      icon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),SizedBox(height: 10,),
                MaterialButton(onPressed:()async{
                  if(formKey.currentState!.validate()){
                    await provider.signup(email: email.text, password: password.text, name: username.text, phone: phone.text);
                    if(provider.registrationModel?.status == true){
                      print(provider.registrationModel?.message);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    }else{
                      print(provider.registrationModel?.message);
                    }
                  }
                },
                  child: Text("Sign up") ,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    }, child: Text("Login")),
                  ],
                )
              ],
            ),////
          ),
        ),
      ),
    );
  }
}
