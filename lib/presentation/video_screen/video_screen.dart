import 'package:flutter/material.dart';
import 'package:image_search_prac_2/main.dart';
import 'package:image_search_prac_2/presentation/video_screen/video_widget.dart';
import 'package:image_search_prac_2/presentation/video_screen/video_search_view_model.dart';
import 'package:provider/provider.dart';

class VideoSearch extends StatefulWidget {
  const VideoSearch({super.key});

  @override
  State<VideoSearch> createState() => _VideoSearchState();
}

class _VideoSearchState extends State<VideoSearch> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<VideoSearchViewModel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              debouncer.run(() => viewModel.fetchVideos(_controller.text));
            },
            controller: _controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () async {
                  viewModel.fetchVideos(_controller.text);
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
        viewModel.isLoading
            ? const CircularProgressIndicator()
            : Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: viewModel.thumbNails.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    final thumbNail = viewModel.thumbNails[index];
                    return VideoWidget(thumbNail: thumbNail);
                  },
                ),
              ),
      ],
    );
  }
}
