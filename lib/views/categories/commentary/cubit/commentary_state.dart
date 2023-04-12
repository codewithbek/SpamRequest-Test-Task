abstract class CommentaryState {}

class CommentaryIntialState extends CommentaryState {}

class CommentaryWaitingState extends CommentaryState {}

class CommentarySuccessState extends CommentaryState {}

class CommentaryErrorState extends CommentaryState {
  String message;
  int errorcode;
  CommentaryErrorState({required this.message, required this.errorcode});
}
