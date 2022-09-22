/// code : 200
/// message : "Done"
/// data : {"data":[{"id":1,"name":"علوش","description":"سوبر ماركت","category_id":1,"area_id":1,"phone":"011111","image":"/uploads/places/166034502923218.jpeg","whatsapp":"0123123123","distance":0,"rate":0,"latitude":"30.08392775740314","longitude":"31.329268544982895","images":["/uploads/places/163882380587947.jpeg","/uploads/places/166034502945075.jpg","/uploads/places/166034502996808.jpeg"],"tags":[]},{"id":2,"name":"محل مستحضرات","description":"محل مستحضرات","category_id":2,"area_id":2,"phone":"+11115752554","image":"/uploads/places/166034516956645.jpg","whatsapp":"0123123123","distance":0,"rate":0,"latitude":"30.104943541556064","longitude":"31.343988508056626","images":["/uploads/places/163882467821514.jpeg","/uploads/places/163882467827798.jpeg","/uploads/places/166034516944051.jpg"],"tags":[]},{"id":3,"name":"أولاد رجب","description":"details","category_id":1,"area_id":1,"phone":"01115752554","image":"/uploads/places/166034668646198.jpg","whatsapp":"3123123123","distance":0,"rate":0,"latitude":"30.078506","longitude":"31.328024","images":["/uploads/places/163837781587534.jpeg","/uploads/places/163837781512804.jpeg","/uploads/places/166002121144376.png","/uploads/places/166002121183662.png","/uploads/places/166002121130928.png"],"tags":[]}],"pagination":{"total":3,"count":3,"per_page":10,"current_page":1,"total_pages":1,"next_page_url":null,"prev_page_url":null}}

class Places {
  Places({
    num? code,
    String? message,
    Data? data,
  }) {
    _code = code;
    _message = message;
    _data = data;
  }

  Places.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? _code;
  String? _message;
  Data? _data;

  Places copyWith({
    num? code,
    String? message,
    Data? data,
  }) =>
      Places(
        code: code ?? _code,
        message: message ?? _message,
        data: data ?? _data,
      );

  num? get code => _code;

  String? get message => _message;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// data : [{"id":1,"name":"علوش","description":"سوبر ماركت","category_id":1,"area_id":1,"phone":"011111","image":"/uploads/places/166034502923218.jpeg","whatsapp":"0123123123","distance":0,"rate":0,"latitude":"30.08392775740314","longitude":"31.329268544982895","images":["/uploads/places/163882380587947.jpeg","/uploads/places/166034502945075.jpg","/uploads/places/166034502996808.jpeg"],"tags":[]},{"id":2,"name":"محل مستحضرات","description":"محل مستحضرات","category_id":2,"area_id":2,"phone":"+11115752554","image":"/uploads/places/166034516956645.jpg","whatsapp":"0123123123","distance":0,"rate":0,"latitude":"30.104943541556064","longitude":"31.343988508056626","images":["/uploads/places/163882467821514.jpeg","/uploads/places/163882467827798.jpeg","/uploads/places/166034516944051.jpg"],"tags":[]},{"id":3,"name":"أولاد رجب","description":"details","category_id":1,"area_id":1,"phone":"01115752554","image":"/uploads/places/166034668646198.jpg","whatsapp":"3123123123","distance":0,"rate":0,"latitude":"30.078506","longitude":"31.328024","images":["/uploads/places/163837781587534.jpeg","/uploads/places/163837781512804.jpeg","/uploads/places/166002121144376.png","/uploads/places/166002121183662.png","/uploads/places/166002121130928.png"],"tags":[]}]
/// pagination : {"total":3,"count":3,"per_page":10,"current_page":1,"total_pages":1,"next_page_url":null,"prev_page_url":null}

class Data {
  Data({
    List<InnerData>? data,
    Pagination? pagination,
  }) {
    _data = data;
    _pagination = pagination;
  }

  Data.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(InnerData.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  List<InnerData>? _data;
  Pagination? _pagination;

  Data copyWith({
    List<InnerData>? data,
    Pagination? pagination,
  }) =>
      Data(
        data: data ?? _data,
        pagination: pagination ?? _pagination,
      );

  List<InnerData>? get data => _data;

  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }
}

/// total : 3
/// count : 3
/// per_page : 10
/// current_page : 1
/// total_pages : 1
/// next_page_url : null
/// prev_page_url : null

class Pagination {
  Pagination({
    num? total,
    num? count,
    num? perPage,
    num? currentPage,
    num? totalPages,
    dynamic nextPageUrl,
    dynamic prevPageUrl,
  }) {
    _total = total;
    _count = count;
    _perPage = perPage;
    _currentPage = currentPage;
    _totalPages = totalPages;
    _nextPageUrl = nextPageUrl;
    _prevPageUrl = prevPageUrl;
  }

  Pagination.fromJson(dynamic json) {
    _total = json['total'];
    _count = json['count'];
    _perPage = json['per_page'];
    _currentPage = json['current_page'];
    _totalPages = json['total_pages'];
    _nextPageUrl = json['next_page_url'];
    _prevPageUrl = json['prev_page_url'];
  }

  num? _total;
  num? _count;
  num? _perPage;
  num? _currentPage;
  num? _totalPages;
  dynamic _nextPageUrl;
  dynamic _prevPageUrl;

  Pagination copyWith({
    num? total,
    num? count,
    num? perPage,
    num? currentPage,
    num? totalPages,
    dynamic nextPageUrl,
    dynamic prevPageUrl,
  }) =>
      Pagination(
        total: total ?? _total,
        count: count ?? _count,
        perPage: perPage ?? _perPage,
        currentPage: currentPage ?? _currentPage,
        totalPages: totalPages ?? _totalPages,
        nextPageUrl: nextPageUrl ?? _nextPageUrl,
        prevPageUrl: prevPageUrl ?? _prevPageUrl,
      );

  num? get total => _total;

  num? get count => _count;

  num? get perPage => _perPage;

  num? get currentPage => _currentPage;

  num? get totalPages => _totalPages;

  dynamic get nextPageUrl => _nextPageUrl;

  dynamic get prevPageUrl => _prevPageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['count'] = _count;
    map['per_page'] = _perPage;
    map['current_page'] = _currentPage;
    map['total_pages'] = _totalPages;
    map['next_page_url'] = _nextPageUrl;
    map['prev_page_url'] = _prevPageUrl;
    return map;
  }
}

/// id : 1
/// name : "علوش"
/// description : "سوبر ماركت"
/// category_id : 1
/// area_id : 1
/// phone : "011111"
/// image : "/uploads/places/166034502923218.jpeg"
/// whatsapp : "0123123123"
/// distance : 0
/// rate : 0
/// latitude : "30.08392775740314"
/// longitude : "31.329268544982895"
/// images : ["/uploads/places/163882380587947.jpeg","/uploads/places/166034502945075.jpg","/uploads/places/166034502996808.jpeg"]
/// tags : []

class InnerData {
  InnerData({
    num? id,
    String? name,
    String? description,
    num? categoryId,
    num? areaId,
    String? phone,
    String? image,
    String? whatsapp,
    num? distance,
    num? rate,
    String? latitude,
    String? longitude,
    List<String>? images,
    List<dynamic>? tags,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _categoryId = categoryId;
    _areaId = areaId;
    _phone = phone;
    _image = image;
    _whatsapp = whatsapp;
    _distance = distance;
    _rate = rate;
    _latitude = latitude;
    _longitude = longitude;
    _images = images;
    _tags = tags;
  }

  InnerData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _categoryId = json['category_id'];
    _areaId = json['area_id'];
    _phone = json['phone'];
    _image = json['image'];
    _whatsapp = json['whatsapp'];
    _distance = json['distance'];
    _rate = json['rate'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    // if (json['tags'] != null) {
    //   _tags = [];
    //   json['tags'].forEach((v) {
    //     _tags?.add(Dynamic.fromJson(v));
    //   });
    // }
  }

  num? _id;
  String? _name;
  String? _description;
  num? _categoryId;
  num? _areaId;
  String? _phone;
  String? _image;
  String? _whatsapp;
  num? _distance;
  num? _rate;
  String? _latitude;
  String? _longitude;
  List<String>? _images;
  List<dynamic>? _tags;

  InnerData copyWith({
    num? id,
    String? name,
    String? description,
    num? categoryId,
    num? areaId,
    String? phone,
    String? image,
    String? whatsapp,
    num? distance,
    num? rate,
    String? latitude,
    String? longitude,
    List<String>? images,
    List<dynamic>? tags,
  }) =>
      InnerData(
        id: id ?? _id,
        name: name ?? _name,
        description: description ?? _description,
        categoryId: categoryId ?? _categoryId,
        areaId: areaId ?? _areaId,
        phone: phone ?? _phone,
        image: image ?? _image,
        whatsapp: whatsapp ?? _whatsapp,
        distance: distance ?? _distance,
        rate: rate ?? _rate,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        images: images ?? _images,
        tags: tags ?? _tags,
      );

  num? get id => _id;

  String? get name => _name;

  String? get description => _description;

  num? get categoryId => _categoryId;

  num? get areaId => _areaId;

  String? get phone => _phone;

  String? get image => _image;

  String? get whatsapp => _whatsapp;

  num? get distance => _distance;

  num? get rate => _rate;

  String? get latitude => _latitude;

  String? get longitude => _longitude;

  List<String>? get images => _images;

  List<dynamic>? get tags => _tags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['category_id'] = _categoryId;
    map['area_id'] = _areaId;
    map['phone'] = _phone;
    map['image'] = _image;
    map['whatsapp'] = _whatsapp;
    map['distance'] = _distance;
    map['rate'] = _rate;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['images'] = _images;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
