import 'package:flutter/material.dart';
import 'package:store_app/cubit/store_cubit.dart';
import 'package:store_app/models/all_product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.product, required this.index});

  final ProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topRight,
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          product.title.substring(0, 7),
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price}',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            StoreCubit.get(context)
                                .changeFavoriteProduct(index); // أرسل index هنا
                          },
                          icon: const Icon(
                            Icons.favorite,
                          ),
                          color: product.isFavorite // تحقق من حالة المنتج المحددة
                              ? Colors.red
                              : Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 40,
              bottom: 85,
              child: Image.network(
                product.image!,
                height: 95,
                width: 100,
              ),
            ),
            if (StoreCubit.get(context).isAdmin)
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateProductPage(
                        productModel: product,
                      ),
                    ),
                  );
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  radius: 14,
                  child: Icon(
                    Icons.edit,
                    size: 16,
                  ),
                ),
              ),
            if (StoreCubit.get(context).isAdmin)
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    StoreCubit.get(context).removeProduct(index: index);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    radius: 14,
                    child: Icon(
                      Icons.remove,
                      size: 16,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
