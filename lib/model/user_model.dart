class User{
  String? name;
  String? email;
  String? phone;
  String? password;

  User({required this.name, required this.email, required this.phone, required this.password});

  User.from({required this.name, required this.password});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phone = json['phone'],
        email = json['email'],
        password = json ['password'];

  Map<String, dynamic>toJson() => {
    'name' : name,
    'email' : email,
    'phone' : phone,
    'password' : password,
  };
}