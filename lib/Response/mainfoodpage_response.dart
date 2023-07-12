class MainFoodPageResponse {
  List<BannerImg>? bannerImg;
  List<Products>? products;
  List<ShopByIng>? shopByIng;
  List<ShopByConcern>? shopByConcern;

  MainFoodPageResponse(
      {this.bannerImg, this.products, this.shopByIng, this.shopByConcern});

  MainFoodPageResponse.fromJson(Map<String, dynamic> json) {
    if (json['banner_img'] != null) {
      bannerImg = <BannerImg>[];
      json['banner_img'].forEach((v) {
        bannerImg!.add(new BannerImg.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['shop_by_ing'] != null) {
      shopByIng = <ShopByIng>[];
      json['shop_by_ing'].forEach((v) {
        shopByIng!.add(new ShopByIng.fromJson(v));
      });
    }
    if (json['shop_by_concern'] != null) {
      shopByConcern = <ShopByConcern>[];
      json['shop_by_concern'].forEach((v) {
        shopByConcern!.add(new ShopByConcern.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bannerImg != null) {
      data['banner_img'] = this.bannerImg!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.shopByIng != null) {
      data['shop_by_ing'] = this.shopByIng!.map((v) => v.toJson()).toList();
    }
    if (this.shopByConcern != null) {
      data['shop_by_concern'] =
          this.shopByConcern!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerImg {
  num? id;
  String? image;

  BannerImg({this.id, this.image});

  BannerImg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class Products {
  num? id;
  String? name;
  String? image;
  String? concern;
  num? price;
  num? oldPrice;

  Products(
      {this.id,
        this.name,
        this.image,
        this.concern,
        this.price,
        this.oldPrice});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    concern = json['concern'];
    price = json['price'];
    oldPrice = json['old_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['concern'] = this.concern;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    return data;
  }
}

class ShopByIng {
  num? id;
  String? name;
  String? image;

  ShopByIng({this.id, this.name, this.image});

  ShopByIng.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class ShopByConcern {
  num? id;
  String? name;
  String? images;

  ShopByConcern({this.id, this.name, this.images});

  ShopByConcern.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['images'] = this.images;
    return data;
  }
}
