class User {
  User({
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"] as String?,
      username: json["username"] as String?,
      email: json["email"] as String?,
      address: Address.fromJson(json["address"] as Map<String, dynamic>),
      phone: json["phone"] as String,
      website: json["website"] as String,
      company: Company.fromJson(json["company"] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "email": email,
        "address": address?.toJson(),
        "phone": phone,
        "website": website,
        "company": company?.toJson(),
      };
}

class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo?.toJson(),
      };
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
