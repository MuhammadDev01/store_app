import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/all_product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? name, desc, image, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    List<ProductModel>? product =
        ModalRoute.of(context)!.settings.arguments as List<ProductModel>?;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'UpdateProduct',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              CustomTextField(
                onChanged: (data) {
                  name = data;
                },
                hinttext: 'Product Name',
              ),
              CustomTextField(
                onChanged: (data) {
                  price = data;
                },
                hinttext: 'Product price',
                textInputType: TextInputType.number,
              ),
              CustomTextField(
                onChanged: (data) {
                  desc = data;
                },
                hinttext: 'Product description',
              ),
              CustomTextField(
                onChanged: (data) {
                  image = data;
                },
                hinttext: 'Product image',
              ),
              const SizedBox(
                height: 100,
              ),
              CustomButton(
                ontap: () async {
                  setState(() {
                    isLoading = true;
                  });
                                    await updateProduct(product as ProductModel);

                  try{

                  }catch(e){
                    debugPrint(e.toString());
                  }
                  debugPrint('success');
                  setState(() {
                    isLoading = false;
                  });
                },
                textbutton: 'Update',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProductService(
      id: product.id,
      title: name==null?product.title:name!,
      price: price==null?product.price:price!,
      desc: desc==null?product.description:desc!,
      image: image==null?product.image:image!,
      category: product.category,
    );
  }
}
