class ProductModel {
  ProductModel({
    required this.imageUrl,
    required this.title,
    required this.merchant,
    required this.sellingPrice,
    required this.installmentPrice,
  });

  final String imageUrl;
  final String title;
  final String merchant;
  final double sellingPrice;
  final double installmentPrice;
}
