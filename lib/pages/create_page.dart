
import 'package:firebasesample/model/post_model.dart';
import 'package:firebasesample/service/rtdb_service.dart';
import 'package:flutter/material.dart';

import '../service/auth_service.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void _createPost() async {
    String title = titleController.text.trim();
    String content = contentController.text.trim();
    String userId = AuthService.currentUserId();
    String date = DateTime.now().toString();

    if (title.isEmpty || content.isEmpty) return;

    Post post = Post(userId, title, content, date);
    RTDBService.addPost(post).then((value) => {
      Navigator.pop(context),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "Title",
              ),
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                hintText: "Content",
              ),
            ),
            ElevatedButton(
              onPressed: (){
                _createPost();
              },
              child: const Text("Add post"),
            )
          ],
        ),
      ),
    );
  }
}
