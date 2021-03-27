class User {
   int id;
   String userName;
   String password;
   String roll;

  User({this.id, this.userName, this.password,this.roll});

   //
   // factory User.fromJson(Map<String, dynamic> json) => User(
   //  user_name: json['user_name'] as String ,
   //  password: json['password']as String,
   //  roll :json['roll']as String,
   // );

   void fromJson(dynamic json) {
     id = json['id'];
     userName = json['user_name'];
     password = json['password'];
     roll = json['roll'];
   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['password'] = this.password;
    data['roll'] = this.roll;
    data['id'] = this.id;
    return data;
  }

  @override
  String toString()=>'welcome $userName and you are $roll';

}
