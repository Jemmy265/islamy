class User {
  static const String collectionName = "users";
  String? id;
  String? name;
  String? email;

  User({this.id, this.name, this.email});

  User.FromFireStore(Map<String, dynamic>? data)
      : this(
          id: data?["id"],
          name: data?["name"],
          email: data?["email"],
        );

  Map<String, dynamic> toFireStore() {
    return {"id": id, "name": name, "email": email};
  }
}
