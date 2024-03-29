class UserModel {
  int idUser;
  int idClient;
  String firstName;
  String lastName;
  String? phoneNumber;
  String birthDate;
  String email;
  int? sexe;
  String? city;
  String? picture;
  static var sexeEnum = ["Homme", "Femme"];
  UserModel(
      {required this.idClient,
      required this.idUser,
      required this.firstName,
      required this.lastName,
      this.phoneNumber,
      required this.birthDate,
      required this.email,
      this.sexe,
      this.city,
      this.picture});
  factory UserModel.fromJson(Map<String, dynamic> item) {
    return UserModel(
        idUser: item["idUser"],
        idClient: item["Client"]["idClient"],
        firstName: item["firstName"].toString(),
        lastName: item["lastName"].toString(),
        phoneNumber: item["phoneNumber"].toString() == "null"
            ? null
            : item["phoneNumber"].toString(),
        email: item["AccountEmail"].toString(),
        birthDate: item["birthDate"].toString(),
        picture: item["profilePicture"].toString() == "null"
            ? null
            : item["profilePicture"].toString(),
        city:
            item["city"].toString() == "null" ? null : item["city"].toString(),
        sexe: item["sexe"].toString() == "null" ? null : item["sexe"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "birthDate": birthDate,
      "email": email,
      "sexe": sexe,
      "city": city,
      "picture": picture
    };
  }
  @override
  String toString() {
    return 'UserModel{firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, birthDate: $birthDate, email: $email, sexe: $sexe, city: $city, picture: $picture}';
  }
}
