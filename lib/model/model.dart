

class Reservation{
  String userName;
  String phoneNumber;
  String email;
  DateTime dateofBirth;

  Reservation(
      this.userName,
      this.phoneNumber,
      this.email,
      this.dateofBirth,
      );
  Map<String,dynamic> toJson()=>{
    'userName': userName,
    'phoneNumber': phoneNumber,
    'email': email,
    'dateofBirth': dateofBirth,
  };
}