import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_holistic2/Providers/Registration_provider.dart';
import 'package:test_holistic2/Screens/loginScreen.dart';
import 'package:test_holistic2/Screens/signupscreen.dart';

import 'Providers/detailprovider.dart';
import 'Providers/productprovider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (context) => RegistrationProvider(),),
          ChangeNotifierProvider(create: (context) => ProductProvider(),),
          ChangeNotifierProvider(create: (context) => DetailsProvider(),),
        ],
      child: MaterialApp(
        home:LoginScreen() ,
        debugShowCheckedModeBanner: false,
      ),
    );

  }
}


