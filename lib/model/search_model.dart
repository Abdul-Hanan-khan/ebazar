import 'package:get/get.dart';
class SearchModel {
  bool? success;
  String? message;
  Data? data;

  SearchModel({this.success, this.message, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    success = json['success']??false;
    message = json['message']??"";
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
  List<Brands>? brands;
  List<Size>? size;
  Product? product;

  Data({this.brands, this.size, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(new Brands.fromJson(v));
      });
    }
    if (json['size'] != null) {
      size = <Size>[];
      json['size'].forEach((v) {
        size!.add(new Size.fromJson(v));
      });
    }
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
    if (size != null) {
      data['size'] = size!.map((v) => v.toJson()).toList();
    }
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Brands {
  int? id;
  int? storeId;
  String? title;
  String? slug;
  String? status;
  String? createdAt;
  String? updatedAt;

  Brands(
      {this.id,
        this.storeId,
        this.title,
        this.slug,
        this.status,
        this.createdAt,
        this.updatedAt});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id']??000;
    storeId = json['store_id']??000;
    title = json['title']??"";
    slug = json['slug']??"";
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
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Size {
  int? id;
  int? productId;
  String? title;
  String? createdDate;
  String? updatedDate;
  int? deletedFlag;

  Size(
      {this.id,
        this.productId,
        this.title,
        this.createdDate,
        this.updatedDate,
        this.deletedFlag});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id']??000;
    productId = json['product_id']??000;
    title = json['title']??"";
    createdDate = json['created_date']??"";
    updatedDate = json['updated_date']??"";
    deletedFlag = json['deleted_flag']??000;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['title'] = this.title;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['deleted_flag'] = this.deletedFlag;
    return data;
  }
}

class Product {
  int? currentPage;
  RxList<ProductData>? data=<ProductData>[].obs;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Product(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Product.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page']??1;
    if (json['data'] != null) {
      data!.value = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(new ProductData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url']??"";
    from = json['from']??000;
    lastPage = json['last_page']??000;
    lastPageUrl = json['last_page_url']??"";
    nextPageUrl = json['next_page_url']??"";
    path = json['path']??"";
    perPage = json['per_page']??00;
    prevPageUrl = json['prev_page_url']??"";
    to = json['to']??000;
    total = json['total']??000;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class ProductData {
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

  ProductData(
      {this.id, this.title, this.slug, this.description, this.photo, this.stock, this.condition, this.status, this.purchasingPrice, this.purchasingTax, this.purchasingGross, this.price, this.discount, this.sellingGross, this.isFeatured, this.catId, this.childCatId, this.brandId, this.storeId, this.createdAt, this.updatedAt, this.choiceOption, this.sizeOption, this.imagesOption});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id']??000;
    title = json['title']??"";
    slug = json['slug']??"";
    description = json['description']??"";
    photo = json['photo']??"";
    stock = json['stock']??000;
    condition = json['condition']??"";
    status = json['status']??"";
    purchasingPrice = json['purchasing_price']??000;
    purchasingTax = json['purchasing_tax']??000;
    purchasingGross = json['purchasing_gross']??000;
    price = json['price']??000;
    discount = json['discount']??000;
    sellingGross = json['selling_gross']??000;
    isFeatured = json['is_featured']??000;
    catId = json['cat_id']??000;
    childCatId = json['child_cat_id']??000;
    brandId = json['brand_id']??000;
    storeId = json['store_id']??000;
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    choiceOption = json['choice_option']??000;
    sizeOption = json['size_option']??000;
    imagesOption = json['images_option']??000;
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
