class ProductDetailModel {
  bool? success;
  String? message;
  Data? data;

  ProductDetailModel({this.success, this.message, this.data});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Product? product;

  Data({this.product});

  Data.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? photo;
  int? stock;
  String? condition;
  String? status;
  int? purchasingPrice;
  int? purchasingTax;
  int? purchasingGross;
  int? price;
  int? discount;
  int? sellingGross;
  int? isFeatured;
  int? catId;
  int? childCatId;
  int? brandId;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  int? choiceOption;
  int? sizeOption;
  int? imagesOption;
  List<Store>? store;
  List<Size>? size;
  List<Choice>? choice;
  List<RelProds>? relProds;
  List<void>? wishlists;
  List<void>? getReview;

  Product(
      {this.id,
        this.title,
        this.slug,
        this.description,
        this.photo,
        this.stock,
        this.condition,
        this.status,
        this.purchasingPrice,
        this.purchasingTax,
        this.purchasingGross,
        this.price,
        this.discount,
        this.sellingGross,
        this.isFeatured,
        this.catId,
        this.childCatId,
        this.brandId,
        this.storeId,
        this.createdAt,
        this.updatedAt,
        this.choiceOption,
        this.sizeOption,
        this.imagesOption,
        this.store,
        this.size,
        this.choice,
        this.relProds,
        this.wishlists,
        this.getReview});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    photo = json['photo'];
    stock = json['stock'];
    condition = json['condition'];
    status = json['status'];
    purchasingPrice = json['purchasing_price'];
    purchasingTax = json['purchasing_tax'];
    purchasingGross = json['purchasing_gross'];
    price = json['price'];
    discount = json['discount'];
    sellingGross = json['selling_gross'];
    isFeatured = json['is_featured'];
    catId = json['cat_id'];
    childCatId = json['child_cat_id'];
    brandId = json['brand_id'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    choiceOption = json['choice_option'];
    sizeOption = json['size_option'];
    imagesOption = json['images_option'];
    if (json['store'] != null) {
      store = <Store>[];
      json['store'].forEach((v) {
        store!.add(new Store.fromJson(v));
      });
    }
    if (json['size'] != null) {
      size = <Size>[];
      json['size'].forEach((v) {
        size!.add(new Size.fromJson(v));
      });
    }
    if (json['choice'] != null) {
      choice = <Choice>[];
      json['choice'].forEach((v) {
        choice!.add(new Choice.fromJson(v));
      });
    }
    if (json['rel_prods'] != null) {
      relProds = <RelProds>[];
      json['rel_prods'].forEach((v) {
        relProds!.add(new RelProds.fromJson(v));
      });
    }
    if (json['wishlists'] != null) {
      wishlists = <Null>[];
      json['wishlists'].forEach((v) {
        // wishlists!.add(new Null.fromJson(v));
      });
    }
    if (json['get_review'] != null) {
      getReview = <Null>[];
      json['get_review'].forEach((v) {
        // getReview!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['stock'] = this.stock;
    data['condition'] = this.condition;
    data['status'] = this.status;
    data['purchasing_price'] = this.purchasingPrice;
    data['purchasing_tax'] = this.purchasingTax;
    data['purchasing_gross'] = this.purchasingGross;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['selling_gross'] = this.sellingGross;
    data['is_featured'] = this.isFeatured;
    data['cat_id'] = this.catId;
    data['child_cat_id'] = this.childCatId;
    data['brand_id'] = this.brandId;
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['choice_option'] = this.choiceOption;
    data['size_option'] = this.sizeOption;
    data['images_option'] = this.imagesOption;
    if (this.store != null) {
      data['store'] = this.store!.map((v) => v.toJson()).toList();
    }
    if (this.size != null) {
      data['size'] = this.size!.map((v) => v.toJson()).toList();
    }
    if (this.choice != null) {
      data['choice'] = this.choice!.map((v) => v.toJson()).toList();
    }
    if (this.relProds != null) {
      data['rel_prods'] = this.relProds!.map((v) => v.toJson()).toList();
    }
    if (this.wishlists != null) {
      // data['wishlists'] = this.wishlists!.map((v) => v!.toJson()).toList();
    }
    if (this.getReview != null) {
      // data['get_review'] = this.getReview!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Store {
  int? id;
  Null? typeId;
  String? name;
  String? email;
  Null? image;
  String? phone;
  String? building;
  String? city;
  String? area;
  String? address1;
  String? address2;
  Null? domainLink;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Store(
      {this.id,
        this.typeId,
        this.name,
        this.email,
        this.image,
        this.phone,
        this.building,
        this.city,
        this.area,
        this.address1,
        this.address2,
        this.domainLink,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    building = json['building'];
    city = json['city'];
    area = json['area'];
    address1 = json['address1'];
    address2 = json['address2'];
    domainLink = json['domain_link'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_id'] = this.typeId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['building'] = this.building;
    data['city'] = this.city;
    data['area'] = this.area;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['domain_link'] = this.domainLink;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Size {
  int? id;
  int? productId;
  String? colorName;
  String? updatedDate;
  String? createdDate;
  int? deletedFlag;

  Size(
      {this.id,
        this.productId,
        this.colorName,
        this.updatedDate,
        this.createdDate,
        this.deletedFlag});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    colorName = json['color_name'];
    updatedDate = json['updated_date'];
    createdDate = json['created_date'];
    deletedFlag = json['deleted_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['color_name'] = this.colorName;
    data['updated_date'] = this.updatedDate;
    data['created_date'] = this.createdDate;
    data['deleted_flag'] = this.deletedFlag;
    return data;
  }
}
class Choice {
  int? id;
  int? productId;
  String? colorName;
  String? updatedDate;
  String? createdDate;
  int? deletedFlag;

  Choice(
      {this.id,
        this.productId,
        this.colorName,
        this.updatedDate,
        this.createdDate,
        this.deletedFlag});

  Choice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    colorName = json['color_name'];
    updatedDate = json['updated_date'];
    createdDate = json['created_date'];
    deletedFlag = json['deleted_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['color_name'] = this.colorName;
    data['updated_date'] = this.updatedDate;
    data['created_date'] = this.createdDate;
    data['deleted_flag'] = this.deletedFlag;
    return data;
  }
}

class RelProds {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? photo;
  int? stock;
  String? condition;
  String? status;
  int? purchasingPrice;
  int? purchasingTax;
  int? purchasingGross;
  int? price;
  int? discount;
  int? sellingGross;
  int? isFeatured;
  int? catId;
  int? childCatId;
  int? brandId;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  int? choiceOption;
  int? sizeOption;
  int? imagesOption;

  RelProds(
      {this.id,
        this.title,
        this.slug,
        this.description,
        this.photo,
        this.stock,
        this.condition,
        this.status,
        this.purchasingPrice,
        this.purchasingTax,
        this.purchasingGross,
        this.price,
        this.discount,
        this.sellingGross,
        this.isFeatured,
        this.catId,
        this.childCatId,
        this.brandId,
        this.storeId,
        this.createdAt,
        this.updatedAt,
        this.choiceOption,
        this.sizeOption,
        this.imagesOption});

  RelProds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    photo = json['photo'];
    stock = json['stock'];
    condition = json['condition'];
    status = json['status'];
    purchasingPrice = json['purchasing_price'];
    purchasingTax = json['purchasing_tax'];
    purchasingGross = json['purchasing_gross'];
    price = json['price'];
    discount = json['discount'];
    sellingGross = json['selling_gross'];
    isFeatured = json['is_featured'];
    catId = json['cat_id'];
    childCatId = json['child_cat_id'];
    brandId = json['brand_id'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    choiceOption = json['choice_option'];
    sizeOption = json['size_option'];
    imagesOption = json['images_option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['stock'] = this.stock;
    data['condition'] = this.condition;
    data['status'] = this.status;
    data['purchasing_price'] = this.purchasingPrice;
    data['purchasing_tax'] = this.purchasingTax;
    data['purchasing_gross'] = this.purchasingGross;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['selling_gross'] = this.sellingGross;
    data['is_featured'] = this.isFeatured;
    data['cat_id'] = this.catId;
    data['child_cat_id'] = this.childCatId;
    data['brand_id'] = this.brandId;
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['choice_option'] = this.choiceOption;
    data['size_option'] = this.sizeOption;
    data['images_option'] = this.imagesOption;
    return data;
  }
}
