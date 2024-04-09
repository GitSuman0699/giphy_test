class EmojiModel {
  List<Data>? data;
  Pagination? pagination;
  Meta? meta;

  EmojiModel({this.data, this.pagination, this.meta});

  EmojiModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? type;
  String? id;
  String? url;
  String? slug;
  String? bitlyGifUrl;
  String? bitlyUrl;
  String? embedUrl;
  String? username;
  String? source;
  String? title;
  String? rating;
  String? contentUrl;
  String? sourceTld;
  String? sourcePostUrl;
  int? isSticker;
  String? importDatetime;
  String? trendingDatetime;
  Images? images;
  User? user;
  int? emojiGroupId;
  String? variation;
  int? variationCount;
  String? analyticsResponsePayload;
  Analytics? analytics;

  Data(
      {this.type,
      this.id,
      this.url,
      this.slug,
      this.bitlyGifUrl,
      this.bitlyUrl,
      this.embedUrl,
      this.username,
      this.source,
      this.title,
      this.rating,
      this.contentUrl,
      this.sourceTld,
      this.sourcePostUrl,
      this.isSticker,
      this.importDatetime,
      this.trendingDatetime,
      this.images,
      this.user,
      this.emojiGroupId,
      this.variation,
      this.variationCount,
      this.analyticsResponsePayload,
      this.analytics});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    url = json['url'];
    slug = json['slug'];
    bitlyGifUrl = json['bitly_gif_url'];
    bitlyUrl = json['bitly_url'];
    embedUrl = json['embed_url'];
    username = json['username'];
    source = json['source'];
    title = json['title'];
    rating = json['rating'];
    contentUrl = json['content_url'];
    sourceTld = json['source_tld'];
    sourcePostUrl = json['source_post_url'];
    isSticker = json['is_sticker'];
    importDatetime = json['import_datetime'];
    trendingDatetime = json['trending_datetime'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    emojiGroupId = json['emoji_group_id'];
    variation = json['variation'];
    variationCount = json['variation_count'];
    analyticsResponsePayload = json['analytics_response_payload'];
    analytics = json['analytics'] != null
        ? Analytics.fromJson(json['analytics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['url'] = url;
    data['slug'] = slug;
    data['bitly_gif_url'] = bitlyGifUrl;
    data['bitly_url'] = bitlyUrl;
    data['embed_url'] = embedUrl;
    data['username'] = username;
    data['source'] = source;
    data['title'] = title;
    data['rating'] = rating;
    data['content_url'] = contentUrl;
    data['source_tld'] = sourceTld;
    data['source_post_url'] = sourcePostUrl;
    data['is_sticker'] = isSticker;
    data['import_datetime'] = importDatetime;
    data['trending_datetime'] = trendingDatetime;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['emoji_group_id'] = emojiGroupId;
    data['variation'] = variation;
    data['variation_count'] = variationCount;
    data['analytics_response_payload'] = analyticsResponsePayload;
    if (analytics != null) {
      data['analytics'] = analytics!.toJson();
    }
    return data;
  }
}

class Images {
  Hd? hd;
  FixedWidthStill? fixedWidthStill;
  FixedHeightDownsampled? fixedHeightDownsampled;
  FixedWidthStill? previewGif;
  Hd? preview;
  FixedHeightSmall? fixedHeightSmall;
  FixedWidthStill? downsized;
  FixedHeightDownsampled? fixedWidthDownsampled;
  FixedHeightSmall? fixedWidth;
  FixedWidthStill? downsizedStill;
  FixedWidthStill? downsizedMedium;
  Hd? originalMp4;
  FixedWidthStill? downsizedLarge;
  FixedWidthStill? previewWebp;
  Original? original;
  FixedWidthStill? originalStill;
  FixedWidthStill? fixedHeightSmallStill;
  FixedHeightSmall? fixedWidthSmall;
  Looping? looping;
  Hd? downsizedSmall;
  FixedWidthStill? fixedWidthSmallStill;
  FixedWidthStill? fixedHeightStill;
  FixedHeightSmall? fixedHeight;

  Images({
    this.hd,
    this.fixedWidthStill,
    this.fixedHeightDownsampled,
    this.previewGif,
    this.preview,
    this.fixedHeightSmall,
    this.downsized,
    this.fixedWidthDownsampled,
    this.fixedWidth,
    this.downsizedStill,
    this.downsizedMedium,
    this.originalMp4,
    this.downsizedLarge,
    this.previewWebp,
    this.original,
    this.originalStill,
    this.fixedHeightSmallStill,
    this.fixedWidthSmall,
    this.looping,
    this.downsizedSmall,
    this.fixedWidthSmallStill,
    this.fixedHeightStill,
    this.fixedHeight,
  });

  Images.fromJson(Map<String, dynamic> json) {
    hd = json['hd'] != null ? Hd.fromJson(json['hd']) : null;
    fixedWidthStill = json['fixed_width_still'] != null
        ? FixedWidthStill.fromJson(json['fixed_width_still'])
        : null;
    fixedHeightDownsampled = json['fixed_height_downsampled'] != null
        ? FixedHeightDownsampled.fromJson(json['fixed_height_downsampled'])
        : null;
    previewGif = json['preview_gif'] != null
        ? FixedWidthStill.fromJson(json['preview_gif'])
        : null;
    preview = json['preview'] != null ? Hd.fromJson(json['preview']) : null;
    fixedHeightSmall = json['fixed_height_small'] != null
        ? FixedHeightSmall.fromJson(json['fixed_height_small'])
        : null;
    downsized = json['downsized'] != null
        ? FixedWidthStill.fromJson(json['downsized'])
        : null;
    fixedWidthDownsampled = json['fixed_width_downsampled'] != null
        ? FixedHeightDownsampled.fromJson(json['fixed_width_downsampled'])
        : null;
    fixedWidth = json['fixed_width'] != null
        ? FixedHeightSmall.fromJson(json['fixed_width'])
        : null;
    downsizedStill = json['downsized_still'] != null
        ? FixedWidthStill.fromJson(json['downsized_still'])
        : null;
    downsizedMedium = json['downsized_medium'] != null
        ? FixedWidthStill.fromJson(json['downsized_medium'])
        : null;
    originalMp4 =
        json['original_mp4'] != null ? Hd.fromJson(json['original_mp4']) : null;
    downsizedLarge = json['downsized_large'] != null
        ? FixedWidthStill.fromJson(json['downsized_large'])
        : null;
    previewWebp = json['preview_webp'] != null
        ? FixedWidthStill.fromJson(json['preview_webp'])
        : null;
    original =
        json['original'] != null ? Original.fromJson(json['original']) : null;
    originalStill = json['original_still'] != null
        ? FixedWidthStill.fromJson(json['original_still'])
        : null;
    fixedHeightSmallStill = json['fixed_height_small_still'] != null
        ? FixedWidthStill.fromJson(json['fixed_height_small_still'])
        : null;
    fixedWidthSmall = json['fixed_width_small'] != null
        ? FixedHeightSmall.fromJson(json['fixed_width_small'])
        : null;
    looping =
        json['looping'] != null ? Looping.fromJson(json['looping']) : null;
    downsizedSmall = json['downsized_small'] != null
        ? Hd.fromJson(json['downsized_small'])
        : null;
    fixedWidthSmallStill = json['fixed_width_small_still'] != null
        ? FixedWidthStill.fromJson(json['fixed_width_small_still'])
        : null;
    fixedHeightStill = json['fixed_height_still'] != null
        ? FixedWidthStill.fromJson(json['fixed_height_still'])
        : null;
    fixedHeight = json['fixed_height'] != null
        ? FixedHeightSmall.fromJson(json['fixed_height'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hd != null) {
      data['hd'] = hd!.toJson();
    }
    if (fixedWidthStill != null) {
      data['fixed_width_still'] = fixedWidthStill!.toJson();
    }
    if (fixedHeightDownsampled != null) {
      data['fixed_height_downsampled'] = fixedHeightDownsampled!.toJson();
    }
    if (previewGif != null) {
      data['preview_gif'] = previewGif!.toJson();
    }
    if (preview != null) {
      data['preview'] = preview!.toJson();
    }
    if (fixedHeightSmall != null) {
      data['fixed_height_small'] = fixedHeightSmall!.toJson();
    }
    if (downsized != null) {
      data['downsized'] = downsized!.toJson();
    }
    if (fixedWidthDownsampled != null) {
      data['fixed_width_downsampled'] = fixedWidthDownsampled!.toJson();
    }
    if (fixedWidth != null) {
      data['fixed_width'] = fixedWidth!.toJson();
    }
    if (downsizedStill != null) {
      data['downsized_still'] = downsizedStill!.toJson();
    }
    if (downsizedMedium != null) {
      data['downsized_medium'] = downsizedMedium!.toJson();
    }
    if (originalMp4 != null) {
      data['original_mp4'] = originalMp4!.toJson();
    }
    if (downsizedLarge != null) {
      data['downsized_large'] = downsizedLarge!.toJson();
    }
    if (previewWebp != null) {
      data['preview_webp'] = previewWebp!.toJson();
    }
    if (original != null) {
      data['original'] = original!.toJson();
    }
    if (originalStill != null) {
      data['original_still'] = originalStill!.toJson();
    }
    if (fixedHeightSmallStill != null) {
      data['fixed_height_small_still'] = fixedHeightSmallStill!.toJson();
    }
    if (fixedWidthSmall != null) {
      data['fixed_width_small'] = fixedWidthSmall!.toJson();
    }
    if (looping != null) {
      data['looping'] = looping!.toJson();
    }
    if (downsizedSmall != null) {
      data['downsized_small'] = downsizedSmall!.toJson();
    }
    if (fixedWidthSmallStill != null) {
      data['fixed_width_small_still'] = fixedWidthSmallStill!.toJson();
    }
    if (fixedHeightStill != null) {
      data['fixed_height_still'] = fixedHeightStill!.toJson();
    }
    if (fixedHeight != null) {
      data['fixed_height'] = fixedHeight!.toJson();
    }
    return data;
  }
}

class Hd {
  String? height;
  String? mp4;
  String? mp4Size;
  String? width;

  Hd({this.height, this.mp4, this.mp4Size, this.width});

  Hd.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    mp4 = json['mp4'];
    mp4Size = json['mp4_size'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['mp4'] = mp4;
    data['mp4_size'] = mp4Size;
    data['width'] = width;
    return data;
  }
}

class FixedWidthStill {
  String? height;
  String? size;
  String? url;
  String? width;

  FixedWidthStill({this.height, this.size, this.url, this.width});

  FixedWidthStill.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    size = json['size'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['size'] = size;
    data['url'] = url;
    data['width'] = width;
    return data;
  }
}

class FixedHeightDownsampled {
  String? height;
  String? size;
  String? url;
  String? webp;
  String? webpSize;
  String? width;

  FixedHeightDownsampled(
      {this.height, this.size, this.url, this.webp, this.webpSize, this.width});

  FixedHeightDownsampled.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    size = json['size'];
    url = json['url'];
    webp = json['webp'];
    webpSize = json['webp_size'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['size'] = size;
    data['url'] = url;
    data['webp'] = webp;
    data['webp_size'] = webpSize;
    data['width'] = width;
    return data;
  }
}

class FixedHeightSmall {
  String? height;
  String? mp4;
  String? mp4Size;
  String? size;
  String? url;
  String? webp;
  String? webpSize;
  String? width;

  FixedHeightSmall(
      {this.height,
      this.mp4,
      this.mp4Size,
      this.size,
      this.url,
      this.webp,
      this.webpSize,
      this.width});

  FixedHeightSmall.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    mp4 = json['mp4'];
    mp4Size = json['mp4_size'];
    size = json['size'];
    url = json['url'];
    webp = json['webp'];
    webpSize = json['webp_size'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['mp4'] = mp4;
    data['mp4_size'] = mp4Size;
    data['size'] = size;
    data['url'] = url;
    data['webp'] = webp;
    data['webp_size'] = webpSize;
    data['width'] = width;
    return data;
  }
}

class Original {
  String? frames;
  String? hash;
  String? height;
  String? mp4;
  String? mp4Size;
  String? size;
  String? url;
  String? webp;
  String? webpSize;
  String? width;

  Original(
      {this.frames,
      this.hash,
      this.height,
      this.mp4,
      this.mp4Size,
      this.size,
      this.url,
      this.webp,
      this.webpSize,
      this.width});

  Original.fromJson(Map<String, dynamic> json) {
    frames = json['frames'];
    hash = json['hash'];
    height = json['height'];
    mp4 = json['mp4'];
    mp4Size = json['mp4_size'];
    size = json['size'];
    url = json['url'];
    webp = json['webp'];
    webpSize = json['webp_size'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['frames'] = frames;
    data['hash'] = hash;
    data['height'] = height;
    data['mp4'] = mp4;
    data['mp4_size'] = mp4Size;
    data['size'] = size;
    data['url'] = url;
    data['webp'] = webp;
    data['webp_size'] = webpSize;
    data['width'] = width;
    return data;
  }
}

class Looping {
  String? mp4;
  String? mp4Size;

  Looping({this.mp4, this.mp4Size});

  Looping.fromJson(Map<String, dynamic> json) {
    mp4 = json['mp4'];
    mp4Size = json['mp4_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mp4'] = mp4;
    data['mp4_size'] = mp4Size;
    return data;
  }
}

class User {
  String? avatarUrl;
  String? bannerImage;
  String? bannerUrl;
  String? profileUrl;
  String? username;
  String? displayName;
  String? description;
  bool? isVerified;
  String? websiteUrl;
  String? instagramUrl;

  User(
      {this.avatarUrl,
      this.bannerImage,
      this.bannerUrl,
      this.profileUrl,
      this.username,
      this.displayName,
      this.description,
      this.isVerified,
      this.websiteUrl,
      this.instagramUrl});

  User.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
    bannerImage = json['banner_image'];
    bannerUrl = json['banner_url'];
    profileUrl = json['profile_url'];
    username = json['username'];
    displayName = json['display_name'];
    description = json['description'];
    isVerified = json['is_verified'];
    websiteUrl = json['website_url'];
    instagramUrl = json['instagram_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar_url'] = avatarUrl;
    data['banner_image'] = bannerImage;
    data['banner_url'] = bannerUrl;
    data['profile_url'] = profileUrl;
    data['username'] = username;
    data['display_name'] = displayName;
    data['description'] = description;
    data['is_verified'] = isVerified;
    data['website_url'] = websiteUrl;
    data['instagram_url'] = instagramUrl;
    return data;
  }
}

class Analytics {
  Onload? onload;
  Onload? onclick;
  Onload? onsent;
  Onload? onstart;

  Analytics({this.onload, this.onclick, this.onsent, this.onstart});

  Analytics.fromJson(Map<String, dynamic> json) {
    onload = json['onload'] != null ? Onload.fromJson(json['onload']) : null;
    onclick = json['onclick'] != null ? Onload.fromJson(json['onclick']) : null;
    onsent = json['onsent'] != null ? Onload.fromJson(json['onsent']) : null;
    onstart = json['onstart'] != null ? Onload.fromJson(json['onstart']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (onload != null) {
      data['onload'] = onload!.toJson();
    }
    if (onclick != null) {
      data['onclick'] = onclick!.toJson();
    }
    if (onsent != null) {
      data['onsent'] = onsent!.toJson();
    }
    if (onstart != null) {
      data['onstart'] = onstart!.toJson();
    }
    return data;
  }
}

class Onload {
  String? url;

  Onload({this.url});

  Onload.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class Pagination {
  int? count;
  int? offset;
  int? nextCursor;

  Pagination({this.count, this.offset, this.nextCursor});

  Pagination.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    offset = json['offset'];
    nextCursor = json['next_cursor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['offset'] = offset;
    data['next_cursor'] = nextCursor;
    return data;
  }
}

class Meta {
  String? msg;
  int? status;
  String? responseId;

  Meta({this.msg, this.status, this.responseId});

  Meta.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    responseId = json['response_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    data['response_id'] = responseId;
    return data;
  }
}
