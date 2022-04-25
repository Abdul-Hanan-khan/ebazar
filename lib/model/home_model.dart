class HomeModel {
  bool? success;
  String? message;
  Data? data;

  HomeModel({this.success, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  List<Category>? category;
  List<Banner>? banner;
  List<Product>? product;

  Data({this.category, this.banner, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(new Banner.fromJson(v));
      });
    }
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.banner != null) {
      data['banner'] = this.banner!.map((v) => v.toJson()).toList();
    }
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  int? storeId;
  String? title;
  String? slug;
  String? summary;
  String? photo;
  int? isParent;
  int? parentId;
  String? addedBy;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<SubCategory>? subCategory;

  Category(
      {this.id,
        this.storeId,
        this.title,
        this.slug,
        this.summary,
        this.photo,
        this.isParent,
        this.parentId,
        this.addedBy,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.subCategory});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    storeId = json['store_id']??0;
    title = json['title']??"";
    slug = json['slug']??"";
    summary = json['summary']??"";
    photo = json['photo']??"";
    isParent = json['is_parent']??0000;
    parentId = json['parent_id']??000;
    addedBy = json['added_by']??"";
    status = json['status']??"";
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    if (json['sub_category'] != null) {
      subCategory = <SubCategory>[];
      json['sub_category'].forEach((v) {
        subCategory!.add(new SubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['summary'] = this.summary;
    data['photo'] = this.photo;
    data['is_parent'] = this.isParent;
    data['parent_id'] = this.parentId;
    data['added_by'] = this.addedBy;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategory {
  int? id;
  int? storeId;
  String? title;
  String? slug;
  String? summary;
  String? photo;
  int? isParent;
  int? parentId;
  String? addedBy;
  String? status;
  String? createdAt;
  String? updatedAt;

  SubCategory(
      {this.id,
        this.storeId,
        this.title,
        this.slug,
        this.summary,
        this.photo,
        this.isParent,
        this.parentId,
        this.addedBy,
        this.status,
        this.createdAt,
        this.updatedAt});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id']??0000;
    storeId = json['store_id']??000;
    title = json['title']??"";
    slug = json['slug']??"";
    summary = json['summary']??"";
    photo = json['photo']??"";
    isParent = json['is_parent']??0000;
    parentId = json['parent_id']??0000;
    addedBy = json['added_by']??"";
    status = json['status']??"";
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['summary'] = this.summary;
    data['photo'] = this.photo;
    data['is_parent'] = this.isParent;
    data['parent_id'] = this.parentId;
    data['added_by'] = this.addedBy;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Banner {
  int? id;
  int? storeId;
  String? title;
  String? slug;
  String? photo;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;

  Banner(
      {this.id,
        this.storeId,
        this.title,
        this.slug,
        this.photo,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id']??000;
    storeId = json['store_id']??000;
    title = json['title']??"";
    slug = json['slug']??"";
    photo = json['photo']??"";
    description = json['description']??"";
    status = json['status']??"";
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['photo'] = this.photo;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
        this.store});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id']??00;
    title = json['title']??"";
    slug = json['slug']??"";
    description = json['description']??"";
    photo = json['photo']??"";
    stock = json['stock']??000;
    condition = json['condition']??"";
    status = json['status']??"";
    purchasingPrice = json['purchasing_price']??000;
    purchasingTax = json['purchasing_tax']??00;
    purchasingGross = json['purchasing_gross']??000;
    price = json['price']??000;
    discount = json['discount']??000;
    sellingGross = json['selling_gross']??0000;
    isFeatured = json['is_featured']??000;
    catId = json['cat_id']??000;
    childCatId = json['child_cat_id']??000;
    brandId = json['brand_id']??00;
    storeId = json['store_id']??000;
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    choiceOption = json['choice_option']??00;
    sizeOption = json['size_option']??000;
    imagesOption = json['images_option']??[];
    if (json['store'] != null) {
      store = <Store>[];
      json['store'].forEach((v) {
        store!.add(new Store.fromJson(v));
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
    return data;
  }
}

class Store {
  int? id;
  int? typeId;
  String? name;
  String? email;
  String? image;
  String? phone;
  String? building;
  String? city;
  String? area;
  String? address1;
  String? address2;
  String? domainLink;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

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
    id = json['id']??0;
    typeId = json['type_id']??0;
    name = json['name']??"";
    email = json['email']??"";
    image = json['image']??"";
    phone = json['phone']??"";
    building = json['building']??"";
    city = json['city']??"";
    area = json['area']??"";
    address1 = json['address1']??"";
    address2 = json['address2']??"";
    domainLink = json['domain_link']??"";
    status = json['status']??"";
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    deletedAt = json['deleted_at']??"";
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
