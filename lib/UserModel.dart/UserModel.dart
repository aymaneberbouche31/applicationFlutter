class UserModel {
  final String email;
  final String password;
  String ?uid;

  UserModel({
    this.uid,
    required this.email, 
    required this.password, 
});

  set setUid(value) => uid = value;

  //Convertir utilisateur en JSON
  Map<String, dynamic> toJson() => {
    'uid' : uid,
    'email' : email,
    'password' : password,
  };
}