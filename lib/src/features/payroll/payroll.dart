// ignore_for_file: deprecated_member_use

import 'package:beetlehr_sdk/src/extensions/extensions.dart';
import 'package:dio/dio.dart';

import 'models/models.dart';

class PayrollBeetlerHR {
  /// The `PayrollBeetlerHR` class provides methods to interact with the Beetler HR payroll API.
  PayrollBeetlerHR(this.dio);

  final Dio dio;

  /// Retrieves a list of payrolls.
  ///
  /// The [month] and [year] parameters specify the month and year for which to retrieve payrolls.
  /// The [page] parameter specifies the page number of the results.
  /// The [perPage] parameter specifies the number of payrolls per page.
  Future<PayrollResponseModel> get({
    required int? month,
    required int? year,
    required int page,
    required int perPage,
  }) async {
    try {
      final response = await dio.get('/employee/payroll', queryParameters: {
        'month': month,
        'year': year,
        'page': page,
        'per_page': perPage,
      });

      return PayrollResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Retrieves the details of a payroll.
  ///
  /// The [id] parameter specifies the ID of the payroll to retrieve.
  Future<PayrollDetailResponse> getDetail(int id) async {
    try {
      final response = await dio.get('/employee/payroll/$id');

      return PayrollDetailResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Retrieves a list of THR (holiday allowance) payrolls.
  ///
  /// The [page] parameter specifies the page number of the results.
  /// The [perPage] parameter specifies the number of payrolls per page.
  Future<PayrollResponseModel> getTHRs({
    required int page,
    required int perPage,
  }) async {
    try {
      final response = await dio.get('/employee/thr', queryParameters: {
        'page': page,
        'per_page': perPage,
      });

      return PayrollResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  /// Retrieves the details of a THR (holiday allowance) payroll.
  ///
  /// The [id] parameter specifies the ID of the payroll to retrieve.
  Future<PayrollDetailResponse> getDetailTHR(int id) async {
    try {
      final response = await dio.get('/employee/thr/$id');

      return PayrollDetailResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }
}
