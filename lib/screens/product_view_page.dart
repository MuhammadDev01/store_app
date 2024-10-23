import 'package:flutter/material.dart';
import 'package:store_app/models/all_product_model.dart';

class ProductViewPage extends StatelessWidget {
  const ProductViewPage({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.blue,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  productModel.image!,
                  scale: 3.5,
                  
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Name Product:  ${productModel.title}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Price: \$${productModel.price}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Description:  ${productModel.description}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Rating:  ${productModel.rating.rate} ⭐️',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
