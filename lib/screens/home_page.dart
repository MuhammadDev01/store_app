import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/store_cubit.dart';
import 'package:store_app/screens/product_view_page.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
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
