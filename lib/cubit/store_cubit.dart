import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/all_product_model.dart';
import 'package:store_app/services/all_product_service.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreStates> {
  StoreCubit() : super(StoreInitialState());

  static StoreCubit get(context) => BlocProvider.of(context);

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

  Future<void> updateProduct({
    required String title,
    required String price,
    required String desc,
    required int id,
  }) async {
    emit(UpdateProductLoadingState());

    products[id - 1].title = title;
    products[id - 1].price = price;
    products[id - 1].description = desc;

    emit(UpdateProductSuccessState());
  }
}
