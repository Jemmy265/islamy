class zakah {
  static const String collectionName = "zakah";
  String? id;
  num? gold;
  num? silver;
  num? cash;

  zakah({this.gold, this.silver, this.cash, this.id});

  zakah.FromFireStore(Map<String, dynamic>? data)
      : this(
            id: data?["id"],
            gold: data?["GoldAmount"],
            silver: data?["SilverAmount"],
            cash: data?["CashAmount"]);

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "GoldAmount": gold,
      "SilverAmount": silver,
      "CashAmount": cash,
    };
  }
}
