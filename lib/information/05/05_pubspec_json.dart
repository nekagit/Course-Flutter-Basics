import 'dart:convert';

// Base Entity: User
class User {
  final int id;
  final String name;
  final String email;
  final Address address;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
  });

  // Convert a User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address.toJson(),
    };
  }

  // Create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: Address.fromJson(json['address']),
    );
  }
}

// Sub-entity: Address
class Address {
  final String street;
  final String city;
  final String postalCode;

  Address({
    required this.street,
    required this.city,
    required this.postalCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'postalCode': postalCode,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      postalCode: json['postalCode'],
    );
  }
}

// Example of Serialization/Deserialization
void exampleUsage() {
  // Create a User object
  User user = User(
    id: 1,
    name: 'John Doe',
    email: 'john@example.com',
    address: Address(
      street: '123 Main St',
      city: 'Springfield',
      postalCode: '12345',
    ),
  );

  // Convert the User object to JSON
  String userJson = jsonEncode(user.toJson());
  print("Serialized User: $userJson");

  // Convert JSON back to User object
  User deserializedUser = User.fromJson(jsonDecode(userJson));
  print("Deserialized User Name: ${deserializedUser.name}");
}