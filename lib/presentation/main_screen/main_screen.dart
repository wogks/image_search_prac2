import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_prac_2/presentation/main_screen/main_view_model.dart';
import 'package:provider/provider.dart';

import '../image_screen/image_screen.dart';
import '../video_screen/video_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = TextEditingController();
  int currentIndex = 0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, (() {
      final viewModel = context.read<MainViewModel>();
      viewModel.fetch('');
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.grey,
            selectedLabelStyle: null,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.photo,
                    size: 20,
                  ),
                  label: 'text'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.video_camera,
                    size: 25,
                  ),
                  label: 'text')
            ]),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.yellow,
          title:
              const Text('Search App', style: TextStyle(color: Colors.black)),
        ),
        body: [
          ImageSearch(
            controller: _controller,
          ),
          const VideoSearch(),
        ][currentIndex],
      ),
    );
  }
}
