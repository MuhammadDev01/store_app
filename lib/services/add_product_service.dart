import 'package:store_app/helper/api.dart';
import 'package:store_app/models/all_product_model.dart';

class AddProduct {
  Future<ProductModel> postProductService({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromjson(data);
  }
}
