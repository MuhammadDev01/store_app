import 'package:store_app/helper/api.dart';
import 'package:store_app/models/all_product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProductService({
    String? title,
    String? price,
    String? desc,
    required int id,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'id': id,
      },
    );
    return ProductModel.fromjson(data);
  }
}
