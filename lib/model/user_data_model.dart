class UserDataFields {
  static final List<String> values = [
    id,
    name,
    emailId,
    password,
    number,
    profession
  ];
  static String id = "_id";
  static String name = "name";
  static String emailId = "emailId";
  static String password = "password";
  static String number = "number";
  static String profession = "profession";
}

class UserData {
  static String data = "userData";
  int? id;
  String? name;
  String? emailId;
  String? password;
  String? number;
  String? profession;

  UserData(
      {this.id,
      required this.name,
      required this.emailId,
      required this.password,
      required this.number,
      required this.profession});

  static UserData fromMap(Map<String, dynamic> map) {
    return UserData(
        emailId: map[UserDataFields.emailId] as String,
        id: map[UserDataFields.id] as int,
        name: map[UserDataFields.name] as String,
        number: map[UserDataFields.number] as String,
        password: map[UserDataFields.password] as String,
        profession: map[UserDataFields.profession] as String);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      UserDataFields.id: id,
      UserDataFields.name: name,
      UserDataFields.emailId: emailId,
      UserDataFields.number: number,
      UserDataFields.password: password,
      UserDataFields.profession: profession
    };
    return map;
  }

  UserData copy({
    int? id,
    String? name,
    String? emailId,
    String? password,
    String? number,
    String? profession,
  }) {
    return UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        emailId: emailId ?? this.emailId,
        password: password ?? this.password,
        number: number ?? this.number,
        profession: profession ?? this.profession);
  }
}
