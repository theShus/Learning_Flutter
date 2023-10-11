//https://randomuser.me/documentation#format

class Person{

  late String name;
  late String last;
  late String gender;
  late DateTime dob;
  late int age;
  late String country;
  late String city;
  late String email;
  late String phone;
  late String imageUrl;

  //The get keyword is used to define a getter called isMinor. This getter computes a boolean value based on a condition:
  // bool get isMinor => age < 18;

  bool isMinor(){
    if(age < 18) return true;
    return false;
  }

  //https://randomuser.me/
  Person.fromJson(Map json){//created a custom constructor
    this.name = json["name"]["first"];
    this.last = json["name"]["last"];
    this.gender = json["gender"];

    this.dob = DateTime.parse(json["dob"]["date"]);
    this.age = json["dob"]["age"];

    this.country = json["location"]["country"];
    this.city = json["location"]["city"];

    this.email = json["email"];
    this.phone = json["phone"];
    this.imageUrl = json["picture"]["large"];
  }

}