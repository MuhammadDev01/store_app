import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/all_product_model.dart';
import 'package:store_app/services/all_product_service.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreStates> {
  StoreCubit() : super(StoreInitialState());

  static StoreCubit get(context) => BlocProvider.of(context);

  changeFavoriteProduct(int index) {
    products[index].isFavorite = !products[index].isFavorite;
    emit(ChangeFavoriteStoreState());
  }

  bool isAdmin = false;
  updateAdmin() {
    isAdmin = !isAdmin;
    emit(ChangeAdminStoreState());
  }

  List<ProductModel> products = [];
  getAllproducts() async {
    emit(GetAllProductsLoadingState());
    products = await AllProudctService().getallproduct();
    emit(GetAllProductsSuccessState());
  }

  GlobalKey<FormState> formKey = GlobalKey();
  addProduct({
    required ProductModel product,
  }) {
    products.add(product);
    emit(AddProductSuccessState());
  }

  updateProduct({
    required String title,
    required String price,
    required String desc,
    required int id,
  }) {
    products[id - 1].title = title;
    products[id - 1].price = price;
    products[id - 1].description = desc;
    emit(UpdateProductSuccessState());
  }

  removeProduct({
    required int index,
  }) {
    products.removeAt(index);
    emit(RemoveProductSuccessState());
  }
}
