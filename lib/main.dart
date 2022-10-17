import 'package:flutter/material.dart';
import 'package:image_search_prac_2/data/source/remote/api/image_api/pixabay_api_imple.dart';
import 'package:image_search_prac_2/data/source/remote/api/video_api/video_api_impl.dart';
import 'package:image_search_prac_2/presentation/main_screen/main_screen.dart';
import 'package:image_search_prac_2/presentation/main_screen/main_view_model.dart';
import 'package:image_search_prac_2/presentation/video_screen/video_search_view_model.dart';
import 'package:image_search_prac_2/util/debouncer.dart';
import 'package:provider/provider.dart';

final debouncer = Debouncer(milliseconds: 500);
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainViewModel(PixabayApiImpl()),
        ),
        ChangeNotifierProvider(
          create: (_) => VideoSearchViewModel(VideoApiImple()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen());
  }
}
