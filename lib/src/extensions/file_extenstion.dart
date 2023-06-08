import 'dart:io';

import 'package:dio/dio.dart';

extension FilesExtensions on List<File> {
  FormData toFormData() {
    return FormData.fromMap({
      'files[]': map(
        (file) => MultipartFile.fromFileSync(
          file.path,
          filename: file.path.split('/').last,
        ),
      ).toList(),
    });
  }
}
