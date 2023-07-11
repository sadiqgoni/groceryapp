import 'package:flutter/material.dart';
import 'package:groceryapp/model/cart_model.dart';
import 'package:groceryapp/screens/home_page.dart';
import 'package:groceryapp/screens/pie.dart';
import 'package:groceryapp/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>CartModel(),
    builder: (context,child)=> MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    )
      ,);
  }
}

