import '../../domain/model/product_model.dart';
import '../model/search_response.dart';

class ProductMapper {
  static ProductModel fromDocument(Document document) {
    return ProductModel(
      imageUrl: document.image ?? '',
      title: document.title ?? '',
      merchant: document.merchant ?? '',
      sellingPrice: document.sellingPrice ?? 0,
      installmentPrice: (document.sellingPrice ?? 0) / 3,
    );
  }
}
