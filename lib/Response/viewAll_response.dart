class ViewAll_response {
  num? status;
  List<Data>? data;

  ViewAll_response({this.status, this.data});

  ViewAll_response.fromJson(Map<String, dynamic> json) {
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
  String? concern;
  num? price;
  String? image;
  num? oldPrice;

  Data(
      {this.id,
        this.name,
        this.concern,
        this.price,
        this.image,
        this.oldPrice});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    concern = json['concern'];
    price = json['price'];
    image = json['image'];
    oldPrice = json['old_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['concern'] = this.concern;
    data['price'] = this.price;
    data['image'] = this.image;
    data['old_price'] = this.oldPrice;
    return data;
  }
}
