class UserSignUp {
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  List<Address>? wishlist;  // List<Address> instead of List<dynamic>
  String? id;
  List<Address>? addresses;  // List<Address> instead of List<dynamic>
  String? createdAt;
  UserSignUp({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.id,
    this.addresses,
    this.createdAt,
  });

  UserSignUp.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    role = json['role'];
    id = json['_id'];
    createdAt = json['createdAt'];


    if (json['wishlist'] != null) {
      wishlist = [];
      json['wishlist'].forEach((v) {
        wishlist?.add(Address.fromJson(v));  // Assuming Address is a class
      });
    }
    if (json['addresses'] != null) {
      addresses = [];
      json['addresses'].forEach((v) {
        addresses?.add(Address.fromJson(v));  // Assuming Address is a class
      });
    }
  }



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['gender'] = gender;
    map['phone'] = phone;
    map['photo'] = photo;
    map['role'] = role;
    if (wishlist != null) {
      map['wishlist'] = wishlist?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    if (addresses != null) {
      map['addresses'] = addresses?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    return map;
  }
}

class Address {  // Example Address class
  Address({this.street, this.city});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
  }

  String? street;
  String? city;

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
    };
  }
}
