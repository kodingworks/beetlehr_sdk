import 'package:dio/dio.dart';

class NoticeBeetleHR {
  NoticeBeetleHR(this.dio);

  final Dio dio;

  // Future<NoticeBoardResponseModel> getBoard(
  //     {required int page, required int perPage}) async {
  //   try {
  //     final response = await dio.get(
  //       '/employee/notice-board',
  //       queryParameters: {
  //         'page': page,
  //         'per_page': perPage,
  //       },
  //     );
  //     return NoticeBoardResponseModel.fromJson(response.data);
  //   } on DioError catch (e) {
  //     throw await NetworkUtils.dioErrorToException(e);
  //   }
  // }
}
