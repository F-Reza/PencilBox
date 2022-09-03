

 class UserModel {
  String uid;
  String? name;
  String email;
  String? mobile;
  String? image;
  bool available;
  String? deviceToken;

  UserModel(
      {required this.uid,
      this.name,
      required this.email,
      this.mobile,
      this.image,
      this.available = true,
      this.deviceToken});

  Map<String, dynamic> toMap() {
   return <String, dynamic> {
    'uid' : uid,
    'name' : name,
    'email' : email,
    'mobile' : mobile,
    'image' : image,
    'deviceToken' : deviceToken,
    'available' : available,
   };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
   uid: map['uid'],
   name: map['name'],
   email: map['email'],
   mobile: map['mobile'],
   image: map['image'],
   deviceToken: map['deviceToken'],
   available: map['available'],
  );




}