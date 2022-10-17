import 'package:flutter/material.dart';
import 'package:image_search_prac_2/data/source/remote/api/pixabay_api_imple.dart';
import 'package:image_search_prac_2/presentation/main_screen/main_screen.dart';
import 'package:image_search_prac_2/presentation/main_screen/main_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
          create: (_) => MainViewModel(PixabayApiImpl()),
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen()
    );
  }
}
