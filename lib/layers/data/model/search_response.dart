import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  SearchResponse({required this.groupedHits});

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  @JsonKey(name: 'grouped_hits')
  final List<GroupedHit>? groupedHits;

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable()
class GroupedHit {
  GroupedHit({required this.hits});

  factory GroupedHit.fromJson(Map<String, dynamic> json) =>
      _$GroupedHitFromJson(json);

  @JsonKey(name: 'hits')
  final List<Hit>? hits;

  Map<String, dynamic> toJson() => _$GroupedHitToJson(this);
}

@JsonSerializable()
class Hit {
  Hit({required this.document});

  factory Hit.fromJson(Map<String, dynamic> json) => _$HitFromJson(json);

  @JsonKey(name: 'document')
  final Document? document;

  Map<String, dynamic> toJson() => _$HitToJson(this);
}

@JsonSerializable()
class Document {
  Document({
    required this.affiliateUrl,
    required this.brand,
    required this.brandId,
    required this.category,
    required this.category1,
    required this.category2,
    required this.description,
    required this.discountPercentage,
    required this.hasImage,
    required this.id,
    required this.image,
    required this.imageMerchant,
    required this.listPrice,
    required this.merchant,
    required this.merchantId,
    required this.newOffer,
    required this.sellingPrice,
    required this.title,
    required this.url,
    required this.isMerchantCard,
    required this.merchantToken,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  @JsonKey(name: 'affiliate_url')
  final String? affiliateUrl;
  @JsonKey(name: 'brand')
  final String? brand;
  @JsonKey(name: 'brand_id')
  final String? brandId;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'category_1')
  final String? category1;
  @JsonKey(name: 'category_2')
  final String? category2;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'discount_percentage')
  final int? discountPercentage;
  @JsonKey(name: 'has_image')
  final int? hasImage;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'image_merchant')
  final String? imageMerchant;
  @JsonKey(name: 'list_price')
  final int? listPrice;
  @JsonKey(name: 'merchant')
  final String? merchant;
  @JsonKey(name: 'merchantId')
  final String? merchantId;
  @JsonKey(name: 'new_offer')
  final bool? newOffer;
  @JsonKey(name: 'selling_price')
  final double? sellingPrice;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'isMerchantCard')
  final bool? isMerchantCard;
  @JsonKey(name: 'merchantToken')
  final String? merchantToken;

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
