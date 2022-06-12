class RestaurantV2 {
  int? total;
  List<DataV2>? data;

  RestaurantV2({this.total, this.data});

  RestaurantV2.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <DataV2>[];
      json['data'].forEach((v) {
        data!.add(new DataV2.fromJson(v));
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

class DataV2 {
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
  String? provinceId;
  String? districtId;
  String? createdDate;
  String? updatedDate;
  int? iV;

  DataV2(
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

  DataV2.fromJson(Map<String, dynamic> json) {
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
    provinceId = json['province_id'];
    districtId = json['district_id'];
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
    data['province_id'] = this.provinceId;
    data['district_id'] = this.districtId;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['__v'] = this.iV;
    return data;
  }
}
