class UserModel {
  final String uid;
  final String email;
  final String? displayName;

  UserModel({
    required this.uid,
    required this.email,
    this.displayName,
  });

  factory UserModel.fromFirebase(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      displayName: data['displayName'],
    );
  }
}
