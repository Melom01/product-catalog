// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      groupedHits: (json['grouped_hits'] as List<dynamic>?)
          ?.map((e) => GroupedHit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{'grouped_hits': instance.groupedHits};

GroupedHit _$GroupedHitFromJson(Map<String, dynamic> json) => GroupedHit(
  hits: (json['hits'] as List<dynamic>?)
      ?.map((e) => Hit.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GroupedHitToJson(GroupedHit instance) =>
    <String, dynamic>{'hits': instance.hits};

Hit _$HitFromJson(Map<String, dynamic> json) => Hit(
  document: json['document'] == null
      ? null
      : Document.fromJson(json['document'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HitToJson(Hit instance) => <String, dynamic>{
  'document': instance.document,
};

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
  affiliateUrl: json['affiliate_url'] as String?,
  brand: json['brand'] as String?,
  brandId: json['brand_id'] as String?,
  category: json['category'] as String?,
  category1: json['category_1'] as String?,
  category2: json['category_2'] as String?,
  description: json['description'] as String?,
  discountPercentage: (json['discount_percentage'] as num?)?.toInt(),
  hasImage: (json['has_image'] as num?)?.toInt(),
  id: json['id'] as String?,
  image: json['image'] as String?,
  imageMerchant: json['image_merchant'] as String?,
  listPrice: (json['list_price'] as num?)?.toInt(),
  merchant: json['merchant'] as String?,
  merchantId: json['merchantId'] as String?,
  newOffer: json['new_offer'] as bool?,
  sellingPrice: (json['selling_price'] as num?)?.toDouble(),
  title: json['title'] as String?,
  url: json['url'] as String?,
  isMerchantCard: json['isMerchantCard'] as bool?,
  merchantToken: json['merchantToken'] as String?,
);

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
  'affiliate_url': instance.affiliateUrl,
  'brand': instance.brand,
  'brand_id': instance.brandId,
  'category': instance.category,
  'category_1': instance.category1,
  'category_2': instance.category2,
  'description': instance.description,
  'discount_percentage': instance.discountPercentage,
  'has_image': instance.hasImage,
  'id': instance.id,
  'image': instance.image,
  'image_merchant': instance.imageMerchant,
  'list_price': instance.listPrice,
  'merchant': instance.merchant,
  'merchantId': instance.merchantId,
  'new_offer': instance.newOffer,
  'selling_price': instance.sellingPrice,
  'title': instance.title,
  'url': instance.url,
  'isMerchantCard': instance.isMerchantCard,
  'merchantToken': instance.merchantToken,
};
