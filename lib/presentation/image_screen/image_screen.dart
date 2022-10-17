import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../main_screen/components/main_components.dart';
import '../main_screen/main_view_model.dart';

class ImageSearch extends StatelessWidget {
  const ImageSearch({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
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
