import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/store_cubit.dart';
import 'package:store_app/models/all_product_model.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? title, price, description;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreStates>(
      listener: (context, state) {
        if (state is UpdateProductSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Success'),
              backgroundColor: Colors.teal,
            ),
          );
        }
        if (state is UpdateProductFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Fail'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
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
                  height: 80,
                ),
                CustomTextField(
                  initialValue: widget.productModel.title,
                  onChanged: (p0) => title = p0,
                  hinttext: 'Product Name',
                ),
                CustomTextField(
                  initialValue: widget.productModel.price,
                  onChanged: (p0) => price = p0,
                  hinttext: 'Product price',
                  textInputType: TextInputType.number,
                ),
                CustomTextField(
                  initialValue: widget.productModel.description,
                  onChanged: (p0) => description = p0,
                  hinttext: 'Product description',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  ontap: () {
                    StoreCubit.get(context).updateProduct(
                      id: widget.productModel.id,
                      title: title,
                      price: price,
                      desc: description,
                    );
                  },
                  child: state is UpdateProductLoadingState
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
