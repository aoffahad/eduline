import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/posts_controller.dart';

class ApiCallingScreen extends StatefulWidget {
  const ApiCallingScreen({super.key});

  @override
  State<ApiCallingScreen> createState() => _ApiCallingScreenState();
}

class _ApiCallingScreenState extends State<ApiCallingScreen> {
  final PostsController postsController = Get.put(PostsController());

  @override
  void initState() {
    super.initState();
    postsController.fetchPosts();
  }

  Future<void> _onRefresh() async {
    await postsController.fetchPosts();
    // Optionally add a delay for refresh indicator
    await Future.delayed(Duration(milliseconds: 600));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff11161f),
      appBar: AppBar(title: const Text('Data From API'), centerTitle: true),
      body: Obx(() {
        if (postsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (postsController.error.value.isNotEmpty) {
          return Center(
            child: Text(
              'Error: Something went wrong while fetching data.',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        final postList = postsController.posts;

        return RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.grey,
          strokeWidth: 3.0,
          onRefresh: _onRefresh,
          child: ListView.builder(
            itemCount: postList.length,
            itemBuilder: (_, index) {
              final post = postList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(
                      post.title ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      post.body ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                    leading: Text(
                      'ID: ${post.id}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
