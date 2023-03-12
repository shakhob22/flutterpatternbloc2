
import 'package:equatable/equatable.dart';
import 'package:flutterpatternbloc2/model/post_model.dart';

abstract class ListPostState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListPostInit extends ListPostState {}

class ListPostLoading extends ListPostState {}

class ListPostLoaded extends ListPostState {
  List<Post>? posts;
  bool? isDeleted;
  ListPostLoaded({this.posts, this.isDeleted});
}

class ListPostError extends ListPostState {
  String? error;

  ListPostError({this.error});
}