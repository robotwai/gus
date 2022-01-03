class User{
  String phone;
  String id;
  UserStatus status;

  User({this.phone = '', this.id = '', this.status = UserStatus.unLogin});
}

enum UserStatus {close,unLogin,login}