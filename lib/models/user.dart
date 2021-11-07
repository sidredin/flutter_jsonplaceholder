class User {
  final int id;
  final String username;
  final String name;
  final String email;
  final String phone;
  final String website;
  final Map<String, String> company;
  final Map<String, String> address;

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
      company: json['company'],
      address: json['address'],
    );
  }
}
