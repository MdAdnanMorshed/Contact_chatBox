class ContactModel {
  int? userId;
  String? image;
  String? name;
  String? email;
  String? phone;
  String? lastMessage;

  ContactModel(
      {this.userId,
        this.image,
        this.name,
        this.email,
        this.phone,
        this.lastMessage});

  ContactModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    lastMessage = json['last_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['last_message'] = this.lastMessage;
    return data;
  }
}