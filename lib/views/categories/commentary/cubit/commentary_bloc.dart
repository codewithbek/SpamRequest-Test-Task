import 'package:dio/dio.dart' as dio;

import 'package:spam_request/export_files.dart';

class CommentaryBloc extends Cubit<CommentaryState> {
  DioClient dioClient = DioClient();

  CommentaryBloc() : super(CommentaryIntialState());

  Future postCommentary(
      {required String category, required String text}) async {
    final dio.Response response = await dioClient.post(
      ApiService.baseUrl,
      data: {"to_user_id": 1, "category": category, "text": text},
      options: dio.Options(
        headers: {
          "Authorization": "Bearer ${ApiService.token}",
        },
      ),
    );
    print(response.data);
    if ((response.statusCode ?? 0) > 199 && (response.statusCode ?? 0) < 400) {
      emit(
        CommentarySuccessState(),
      );
    } else {
      emit(
        CommentaryErrorState(
          message: response.statusMessage ?? "",
          errorcode: response.statusCode ?? 0,
        ),
      );
    }
    return response.data;
  }
}
