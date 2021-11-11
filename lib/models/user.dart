import 'package:flutter_jsonplaceholder/models/address.dart';
import 'package:flutter_jsonplaceholder/models/company.dart';

class User {
  final int id;
  final String username;
  final String name;
  final String email;
  final String phone;
  final String website;
  final Company company;
  final Address address;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']),
      address: Address.fromJson(json['address']),
    );
  }
}
