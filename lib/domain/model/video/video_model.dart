class VideoModel {
  VideoModel({
    this.id,
    this.pageURL,
    this.type,
    this.tags,
    this.duration,
    this.pictureId,
    this.videos,
    this.views,
    this.downloads,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageURL,
  });

  VideoModel.fromJson(dynamic json) {
    id = json['id'];
    pageURL = json['pageURL'];
    type = json['type'];
    tags = json['tags'];
    duration = json['duration'];
    pictureId = json['picture_id'];
    videos = json['videos'] != null ? Videos.fromJson(json['videos']) : null;
    views = json['views'];
    downloads = json['downloads'];
    likes = json['likes'];
    comments = json['comments'];
    userId = json['user_id'];
    user = json['user'];
    userImageURL = json['userImageURL'];
  }
  num? id;
  String? pageURL;
  String? type;
  String? tags;
  num? duration;
  String? pictureId;
  Videos? videos;
  num? views;
  num? downloads;
  num? likes;
  num? comments;
  num? userId;
  String? user;
  String? userImageURL;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['pageURL'] = pageURL;
    map['type'] = type;
    map['tags'] = tags;
    map['duration'] = duration;
    map['picture_id'] = pictureId;
    if (videos != null) {
      map['videos'] = videos?.toJson();
    }
    map['views'] = views;
    map['downloads'] = downloads;
    map['likes'] = likes;
    map['comments'] = comments;
    map['user_id'] = userId;
    map['user'] = user;
    map['userImageURL'] = userImageURL;
    return map;
  }
}

class Videos {
  Videos({
    this.large,
    this.medium,
    this.small,
    this.tiny,
  });

  Videos.fromJson(dynamic json) {
    large = json['large'] != null ? Large.fromJson(json['large']) : null;
    medium = json['medium'] != null ? Medium.fromJson(json['medium']) : null;
    small = json['small'] != null ? Small.fromJson(json['small']) : null;
    tiny = json['tiny'] != null ? Tiny.fromJson(json['tiny']) : null;
  }
  Large? large;
  Medium? medium;
  Small? small;
  Tiny? tiny;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (large != null) {
      map['large'] = large?.toJson();
    }
    if (medium != null) {
      map['medium'] = medium?.toJson();
    }
    if (small != null) {
      map['small'] = small?.toJson();
    }
    if (tiny != null) {
      map['tiny'] = tiny?.toJson();
    }
    return map;
  }
}

class Tiny {
  Tiny({
    this.url,
    this.width,
    this.height,
    this.size,
  });

  Tiny.fromJson(dynamic json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
  }
  String? url;
  num? width;
  num? height;
  num? size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['width'] = width;
    map['height'] = height;
    map['size'] = size;
    return map;
  }
}

class Small {
  Small({
    this.url,
    this.width,
    this.height,
    this.size,
  });

  Small.fromJson(dynamic json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
  }
  String? url;
  num? width;
  num? height;
  num? size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['width'] = width;
    map['height'] = height;
    map['size'] = size;
    return map;
  }
}

class Medium {
  Medium({
    this.url,
    this.width,
    this.height,
    this.size,
  });

  Medium.fromJson(dynamic json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
  }
  String? url;
  num? width;
  num? height;
  num? size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['width'] = width;
    map['height'] = height;
    map['size'] = size;
    return map;
  }
}

class Large {
  Large({
    this.url,
    this.width,
    this.height,
    this.size,
  });

  Large.fromJson(dynamic json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
  }
  String? url;
  num? width;
  num? height;
  num? size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['width'] = width;
    map['height'] = height;
    map['size'] = size;
    return map;
  }
}


