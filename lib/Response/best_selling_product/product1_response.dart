class Product1_Response {
  num? status;
  List<Data>? data;

  Product1_Response({this.status, this.data});

  Product1_Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  num? id;
  String? name;
  String? image;
  num? price;
  String? concern;
  num? stock;
  String? bankOffers;
  String? weight;
  String? category;
  String? discription;

  Data(
      {this.id,
        this.name,
        this.image,
        this.price,
        this.concern,
        this.stock,
        this.bankOffers,
        this.weight,
        this.category,
        this.discription});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    concern = json['concern'];
    stock = json['stock'];
    bankOffers = json['bank_offers'];
    weight = json['weight'];
    category = json['category'];
    discription = json['discription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['concern'] = this.concern;
    data['stock'] = this.stock;
    data['bank_offers'] = this.bankOffers;
    data['weight'] = this.weight;
    data['category'] = this.category;
    data['discription'] = this.discription;
    return data;
  }
}
