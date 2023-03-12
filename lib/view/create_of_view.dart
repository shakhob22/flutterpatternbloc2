
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_cubit.dart';
import '../model/post_model.dart';

TextEditingController titleController = TextEditingController();
TextEditingController bodyController = TextEditingController();

Widget viewOfCreate(context, bool isLoading) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                label: Text("Body"),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                String title = titleController.text.trim();
                String body = bodyController.text.trim();
                Post post = Post(title: title, body: body, userId: 1);
                BlocProvider.of<CreatePostCubit>(context).apiPostCreate(post);
              },
              child: const Text("Create"),
            ),
          ],
        ),
        (isLoading) ?
        const Center(
          child: CircularProgressIndicator(),
        ) : const SizedBox(),
      ],
    ),
  );
}