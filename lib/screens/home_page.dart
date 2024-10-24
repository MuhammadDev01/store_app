import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/store_cubit.dart';
import 'package:store_app/models/all_product_model.dart';
import 'package:store_app/screens/product_view_page.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController priceController = TextEditingController();
    TextEditingController imageController = TextEditingController();
    TextEditingController descController = TextEditingController();
    TextEditingController ratingController = TextEditingController();
    return BlocConsumer<StoreCubit, StoreStates>(
      listener: (context, state) {
        if (state is AddProductSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product added successfully'),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
              if (StoreCubit.get(context).isAdmin)
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  tooltip: 'add a product',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Add a product',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            child: _addProductFields(
                              nameController,
                              priceController,
                              descController,
                              ratingController,
                              imageController,
                              formKey,
                              context,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              Switch(
                value: StoreCubit.get(context).isAdmin,
                activeColor: Colors.teal,
                onChanged: (value) {
                  StoreCubit.get(context).updateAdmin();
                },
              ),
            ],
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Trend',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: BlocBuilder<StoreCubit, StoreStates>(
              builder: (context, state) {
                if (state is GetAllProductsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                } else {
                  return GridView.builder(
                    itemCount: StoreCubit.get(context).products.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 15.0,
                      mainAxisExtent: 200,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      child: CustomCard(
                        product: StoreCubit.get(context).products[index],
                        index: index,
                      ),
                      onTap: () {
                        _goToProductViewPage(context, index);
                      },
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }

  Column _addProductFields(
      TextEditingController nameController,
      TextEditingController priceController,
      TextEditingController descController,
      TextEditingController ratingController,
      TextEditingController imageController,
      GlobalKey<FormState> formKey,
      BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: nameController,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: 'Product Name',
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: priceController,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: 'Product Price',
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: descController,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: 'Product description',
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: ratingController,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: 'Product rating',
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: imageController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: 'Product image',
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          child: const Text(
            'Add',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          ontap: () {
            if (formKey.currentState!.validate()) {
              StoreCubit.get(context).addProduct(
                product: ProductModel(
                  id: StoreCubit.get(context).products.length + 1,
                  title: nameController.text,
                  price: priceController.text,
                  description: descController.text,
                  rating: RatingModel(
                    rate: ratingController.text,
                    count: '5',
                  ),
                  image: imageController.text,
                ),
              );
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }

  void _goToProductViewPage(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductViewPage(
          productModel: StoreCubit.get(context).products[index],
        ),
      ),
    );
  }
}
