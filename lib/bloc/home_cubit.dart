
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpatternbloc2/bloc/create_cubit.dart';
import 'package:flutterpatternbloc2/bloc/home_state.dart';
import 'package:flutterpatternbloc2/pages/create_page.dart';
import 'package:flutterpatternbloc2/service/http_service.dart';

import '../model/post_model.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit() : super(ListPostInit());

  void apiPostList() async {
    emit(ListPostLoading());
    final response = await Network.GET(Network.API_LIST, {});
    if (response != null) {
      emit(ListPostLoaded(posts: Network.parsePostList(response)));
    } else {
      emit(ListPostError(error: "No data"));
    }
  }

  void apiPostDelete(Post post) async {
    emit(ListPostLoading());
    final response = await Network.DEL(Network.API_DELETE + post.id.toString(), {});
    if (response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "Couldn't delete post"));
    }

  }

  void callCreatePage(BuildContext context, ) async {
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context) =>
        BlocProvider(
          create: (context) => CreatePostCubit(),
          child: const CreatePage(),
        )));
    if (result != null) {
      apiPostList();
    }
  }
}
