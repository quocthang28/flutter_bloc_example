class Restaurant {
  int? total;
  List<Data>? data;

  Restaurant({this.total, this.data});

  Restaurant.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? addressDetail;
  List<String>? openTime;
  String? phone;
  dynamic rating;
  String? shortDescription;
  List<String>? photos;
  double? lat;
  double? lng;
  List<String>? priceRange;
  int? fakeId;
  ProvinceId? provinceId;
  DistrictId? districtId;
  String? createdDate;
  String? updatedDate;
  int? iV;

  Data(
      {this.sId,
      this.name,
      this.addressDetail,
      this.openTime,
      this.phone,
      this.rating,
      this.shortDescription,
      this.photos,
      this.lat,
      this.lng,
      this.priceRange,
      this.fakeId,
      this.provinceId,
      this.districtId,
      this.createdDate,
      this.updatedDate,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    addressDetail = json['address_detail'];
    openTime = json['open_time'].cast<String>();
    phone = json['phone'];
    rating = json['rating'];
    shortDescription = json['short_description'];
    photos = json['photos'].cast<String>();
    lat = json['lat'];
    lng = json['lng'];
    priceRange = json['price_range'].cast<String>();
    fakeId = json['fake_id'];
    provinceId = json['province_id'] != null ? new ProvinceId.fromJson(json['province_id']) : null;
    districtId = json['district_id'] != null ? new DistrictId.fromJson(json['district_id']) : null;
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['address_detail'] = this.addressDetail;
    data['open_time'] = this.openTime;
    data['phone'] = this.phone;
    data['rating'] = this.rating;
    data['short_description'] = this.shortDescription;
    data['photos'] = this.photos;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['price_range'] = this.priceRange;
    data['fake_id'] = this.fakeId;
    if (this.provinceId != null) {
      data['province_id'] = this.provinceId!.toJson();
    }
    if (this.districtId != null) {
      data['district_id'] = this.districtId!.toJson();
    }
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['__v'] = this.iV;
    return data;
  }
}

class ProvinceId {
  String? sId;
  String? name;
  int? fakeId;
  String? createdDate;
  String? updatedDate;
  int? iV;

  ProvinceId({this.sId, this.name, this.fakeId, this.createdDate, this.updatedDate, this.iV});

  ProvinceId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    fakeId = json['fake_id'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['fake_id'] = this.fakeId;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['__v'] = this.iV;
    return data;
  }
}

class DistrictId {
  String? sId;
  String? provinceId;
  String? name;
  int? fakeId;
  String? createdDate;
  String? updatedDate;
  int? iV;

  DistrictId({this.sId, this.provinceId, this.name, this.fakeId, this.createdDate, this.updatedDate, this.iV});

  DistrictId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    provinceId = json['province_id'];
    name = json['name'];
    fakeId = json['fake_id'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['province_id'] = this.provinceId;
    data['name'] = this.name;
    data['fake_id'] = this.fakeId;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['__v'] = this.iV;
    return data;
  }
}
