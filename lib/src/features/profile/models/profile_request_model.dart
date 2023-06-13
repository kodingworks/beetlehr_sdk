import 'dart:io';

import 'package:dio/dio.dart';

/// The `ProfileBodyModel` class represents a model for the body of a user profile request.
class ProfileBodyModel {
  /// The name of the user.
  final String name;

  /// The email of the user.
  final String email;

  /// The phone number of the user.
  final String phone;

  /// The address of the user (optional).
  final String? address;

  /// The account number of the user (optional).
  final String? accountNumber;

  /// The NIP (National Identification Number) of the user (optional).
  final String? nip;

  /// The image file of the user (optional).
  final File? image;

  /// Creates a new instance of the `ProfileBodyModel` class.
  ///
  /// The [name], [email], and [phone] parameters are required and represent the basic user information.
  /// The [address], [accountNumber], [nip], and [image] parameters are optional.
  ProfileBodyModel({
    required this.name,
    required this.email,
    required this.phone,
    this.address,
    this.accountNumber,
    this.nip,
    this.image,
  });

  /// Converts the `ProfileBodyModel` instance to a `FormData` object for making multipart form data requests.
  ///
  /// Returns a `FormData` object representing the `ProfileBodyModel` instance.
  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'name': name,
      'email': email,
      'phone_number': phone,
      'address': address,
      'account_number': accountNumber,
      'nip': nip,
      'image': image != null ? await MultipartFile.fromFile(image!.path) : null,
    });
  }
}
