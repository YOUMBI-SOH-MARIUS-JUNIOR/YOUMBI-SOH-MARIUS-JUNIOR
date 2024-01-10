class UserModel {
   final String email;
   final String password;
  String uid;

  UserModel({required this.uid, required this.email, required this.password});

  set setUid(value) => uid = value;

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email':email,
    'password':password,
  };
}
