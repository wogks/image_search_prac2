import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_prac_2/main.dart';
import 'package:image_search_prac_2/presentation/main_screen/components/main_components.dart';
import 'package:image_search_prac_2/presentation/main_screen/main_view_model.dart';
import 'package:provider/provider.dart';

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
    final viewModel = context.watch<MainViewModel>();
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
          title: const Text('Image Search App',
              style: TextStyle(color: Colors.black)),
        ),
        body: [
          ImageSearch(controller: _controller, viewModel: viewModel),
          const VideoSearch(),
        ][currentIndex],
      ),
    );
  }
}

class VideoSearch extends StatelessWidget {
  const VideoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ImageSearch extends StatelessWidget {
  const ImageSearch({
    Key? key,
    required this.viewModel,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final MainViewModel viewModel;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              debouncer.run(() => viewModel.fetch(_controller.text));
            },
            controller: _controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () async {
                  viewModel.fetch(_controller.text);
                },
                icon: const Icon(Icons.search),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
        viewModel.isLosading
            ? const CircularProgressIndicator()
            : Expanded(
                child: GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: viewModel.photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final photo = viewModel.photos[index];
                  return PhotoWidget(photo: photo);
                },
              ))
      ],
    );
  }
}
