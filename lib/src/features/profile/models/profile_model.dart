import 'package:equatable/equatable.dart';

/// The `ProfileModel` class represents a model for a user profile.
///
/// It extends the `Equatable` class, allowing for easy equality comparisons.
class ProfileModel extends Equatable {
  /// Creates a new instance of the `ProfileModel` class.
  ///
  /// The [name], [email], and [phoneNumber] parameters are required and represent the basic user information.
  /// The [designation], [address], [accountNumber], [nip], and [image] parameters are optional.
  const ProfileModel({
    required this.name,
    this.designation,
    required this.email,
    required this.phoneNumber,
    this.address,
    this.accountNumber,
    this.nip,
    this.image,
  });

  /// Creates a new instance of the `ProfileModel` class from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the user profile information.
  /// The keys 'name', 'designation', 'email', 'phone_number', 'address', 'account_number', 'nip', and 'image' are used to extract the corresponding values.
  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json['name'],
        designation: json['designation'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        address: json['address'],
        accountNumber: json['account_number'],
        nip: json['nip'],
        image: json['image'],
      );

  final String name;
  final String? designation;
  final String email;
  final String phoneNumber;
  final String? address;
  final String? accountNumber;
  final String? nip;
  final String? image;

  @override
  List<Object?> get props => [
        name,
        designation,
        email,
        phoneNumber,
        address,
        accountNumber,
        nip,
        image,
      ];
}
