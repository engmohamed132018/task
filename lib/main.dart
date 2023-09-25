import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/card_provider.dart';
import 'package:task/provider/cat_card_provider.dart';
import 'package:task/provider/cetegory_provider.dart';

import 'screens/home/main_bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<CardProvider>(
          create: (context) => CardProvider(),
        ),
        ChangeNotifierProvider<CartCardProvider>(
          create: (context) => CartCardProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'task',
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
        home: MainBottomBar(),
      ),
    );
  }
}
