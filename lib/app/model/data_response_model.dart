class DataModel {
  String? status;
  String? message;
  Data? data;

  DataModel({this.status, this.message, this.data});

  DataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Properties>? properties;
  int? count;
  List<int>? propertyIds;

  Data({this.properties, this.count, this.propertyIds});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(new Properties.fromJson(v));
      });
    }
    count = json['count'];
    propertyIds = json['property_ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.properties != null) {
      data['properties'] = this.properties!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['property_ids'] = this.propertyIds;
    return data;
  }
}

class Properties {
  int? id;
  int? userId;
  String? addressStreetName;
  String? addressArea;
  String? addressCity;
  String? addressPostcode;
  String? addressCountry;
  String? addressCityCode;
  String? addressCountryCode;
  double? latitude;
  double? longitude;
  String? propertyType;
  String? listingType;
  String? roomType;
  int? monthlyPrice;
  int? personPrice;
  int? bedrooms;
  int? bathrooms;
  String? moveInDate;
  String? lengthOfStay;
  String? type;
  int? isSuitableForStudent;
  int? depositAmount;
  int? currentFlatmates;
  String? flatmateGender;
  String? floorPlan;
  String? description;
  String? slug;
  double? nearestLatitude;
  double? nearestLongitude;
  String? nearestLocation;
  String? nearestLocationTime;
  String? nearestLocationType;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? propertyUrl;
  String? status;
  bool? isFreeToContact;
  String? freeToContact;
  String? freeWithinDays;
  User? user;
  List<PropertyVideos>? propertyVideos = [];
  List<PropertyImages>? propertyImages = [];
  List<String>? propertyFloorPlans = [];
  List<KeyFeatures>? keyFeatures;

  Properties(
      {this.id,
      this.userId,
      this.addressStreetName,
      this.addressArea,
      this.addressCity,
      this.addressPostcode,
      this.addressCountry,
      this.addressCityCode,
      this.addressCountryCode,
      this.latitude,
      this.longitude,
      this.propertyType,
      this.listingType,
      this.roomType,
      this.monthlyPrice,
      this.personPrice,
      this.bedrooms,
      this.bathrooms,
      this.moveInDate,
      this.lengthOfStay,
      this.type,
      this.isSuitableForStudent,
      this.depositAmount,
      this.currentFlatmates,
      this.flatmateGender,
      this.floorPlan,
      this.description,
      this.slug,
      this.nearestLatitude,
      this.nearestLongitude,
      this.nearestLocation,
      this.nearestLocationTime,
      this.nearestLocationType,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.propertyUrl,
      this.status,
      this.isFreeToContact,
      this.freeToContact,
      this.freeWithinDays,
      this.user,
      this.propertyVideos,
      this.propertyImages,
      this.propertyFloorPlans,
      this.keyFeatures});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    addressStreetName = json['address_street_name'];
    addressArea = json['address_area'];
    addressCity = json['address_city'];
    addressPostcode = json['address_postcode'];
    addressCountry = json['address_country'];
    addressCityCode = json['address_city_code'];
    addressCountryCode = json['address_country_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    propertyType = json['property_type'];
    listingType = json['listing_type'];
    roomType = json['room_type'];
    monthlyPrice = json['monthly_price'];
    personPrice = json['person_price'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    moveInDate = json['move_in_date'];
    lengthOfStay = json['length_of_stay'];
    type = json['type'];
    isSuitableForStudent = json['is_suitable_for_student'];
    depositAmount = json['deposit_amount'];
    currentFlatmates = json['current_flatmates'];
    flatmateGender = json['flatmate_gender'];
    floorPlan = json['floor_plan'];
    description = json['description'];
    slug = json['slug'];
    nearestLatitude = json['nearest_latitude'];
    nearestLongitude = json['nearest_longitude'];
    nearestLocation = json['nearest_location'];
    nearestLocationTime = json['nearest_location_time'];
    nearestLocationType = json['nearest_location_type'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    propertyUrl = json['property_url'];
    status = json['status'];
    isFreeToContact = json['is_free_to_contact'];
    freeToContact = json['free_to_contact'];
    freeWithinDays = json['free_within_days'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['property_videos'] != null) {
      propertyVideos = <PropertyVideos>[];
      json['property_videos'].forEach((v) {
        propertyVideos!.add(new PropertyVideos.fromJson(v));
      });
    }
    if (json['property_images'] != null) {
      propertyImages = <PropertyImages>[];
      json['property_images'].forEach((v) {
        propertyImages!.add(new PropertyImages.fromJson(v));
      });
    }
    if (json['property_floor_plans'] != null) {
      json['property_floor_plans'].forEach((v) {
        propertyFloorPlans!.add(v);
      });
    }
    if (json['key_features'] != null) {
      keyFeatures = <KeyFeatures>[];
      json['key_features'].forEach((v) {
        keyFeatures!.add(new KeyFeatures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address_street_name'] = this.addressStreetName;
    data['address_area'] = this.addressArea;
    data['address_city'] = this.addressCity;
    data['address_postcode'] = this.addressPostcode;
    data['address_country'] = this.addressCountry;
    data['address_city_code'] = this.addressCityCode;
    data['address_country_code'] = this.addressCountryCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['property_type'] = this.propertyType;
    data['listing_type'] = this.listingType;
    data['room_type'] = this.roomType;
    data['monthly_price'] = this.monthlyPrice;
    data['person_price'] = this.personPrice;
    data['bedrooms'] = this.bedrooms;
    data['bathrooms'] = this.bathrooms;
    data['move_in_date'] = this.moveInDate;
    data['length_of_stay'] = this.lengthOfStay;
    data['type'] = this.type;
    data['is_suitable_for_student'] = this.isSuitableForStudent;
    data['deposit_amount'] = this.depositAmount;
    data['current_flatmates'] = this.currentFlatmates;
    data['flatmate_gender'] = this.flatmateGender;
    data['floor_plan'] = this.floorPlan;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['nearest_latitude'] = this.nearestLatitude;
    data['nearest_longitude'] = this.nearestLongitude;
    data['nearest_location'] = this.nearestLocation;
    data['nearest_location_time'] = this.nearestLocationTime;
    data['nearest_location_type'] = this.nearestLocationType;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['property_url'] = this.propertyUrl;
    data['status'] = this.status;
    data['is_free_to_contact'] = this.isFreeToContact;
    data['free_to_contact'] = this.freeToContact;
    data['free_within_days'] = this.freeWithinDays;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.propertyVideos != null) {
      data['property_videos'] =
          this.propertyVideos!.map((v) => v.toJson()).toList();
    }
    if (this.propertyImages != null) {
      data['property_images'] =
          this.propertyImages!.map((v) => v.toJson()).toList();
    }
    if (this.propertyFloorPlans != null) {
      data['property_floor_plans'] =
          this.propertyFloorPlans!.map((v) => v).toList();
    }
    if (this.keyFeatures != null) {
      data['key_features'] = this.keyFeatures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? profileImage;
  String? name;
  String? profileImageUrl;

  User({this.id, this.profileImage, this.name, this.profileImageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profileImage = json['profile_image'];
    name = json['name'];
    profileImageUrl = json['profile_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profile_image'] = this.profileImage;
    data['name'] = this.name;
    data['profile_image_url'] = this.profileImageUrl;
    return data;
  }
}

class PropertyVideos {
  int? id;
  int? userId;
  int? propertyId;
  String? path;
  String? type;
  String? thumbnail;

  PropertyVideos(
      {this.id,
      this.userId,
      this.propertyId,
      this.path,
      this.type,
      this.thumbnail});

  PropertyVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    propertyId = json['property_id'];
    path = json['path'];
    type = json['type'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['property_id'] = this.propertyId;
    data['path'] = this.path;
    data['type'] = this.type;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class KeyFeatures {
  int? id;
  String? type;
  String? name;
  String? darkIcon;
  String? colorIcon;
  String? darkIconUrl;
  String? colorIconUrl;
  Pivot? pivot;

  KeyFeatures(
      {this.id,
      this.type,
      this.name,
      this.darkIcon,
      this.colorIcon,
      this.darkIconUrl,
      this.colorIconUrl,
      this.pivot});

  KeyFeatures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    darkIcon = json['dark_icon'];
    colorIcon = json['color_icon'];
    darkIconUrl = json['dark_icon_url'];
    colorIconUrl = json['color_icon_url'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['dark_icon'] = this.darkIcon;
    data['color_icon'] = this.colorIcon;
    data['dark_icon_url'] = this.darkIconUrl;
    data['color_icon_url'] = this.colorIconUrl;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? propertyId;
  int? keyFeatureId;

  Pivot({this.propertyId, this.keyFeatureId});

  Pivot.fromJson(Map<String, dynamic> json) {
    propertyId = json['property_id'];
    keyFeatureId = json['key_feature_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['property_id'] = this.propertyId;
    data['key_feature_id'] = this.keyFeatureId;
    return data;
  }
}

class PropertyImages {
  int? id;
  int? userId;
  int? propertyId;
  String? path;
  String? type;
  String? thumbnail;

  PropertyImages(
      {this.id,
      this.userId,
      this.propertyId,
      this.path,
      this.type,
      this.thumbnail});

  PropertyImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    propertyId = json['property_id'];
    path = json['path'];
    type = json['type'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['property_id'] = this.propertyId;
    data['path'] = this.path;
    data['type'] = this.type;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
