import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/services/update_product_service.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreStates> {
  StoreCubit() : super(StoreInitialState());

  static StoreCubit get(context) => BlocProvider.of(context);

  bool isAdmin = false;

  updateAdmin() {
    isAdmin = !isAdmin;
    emit(ChangeAdminStoreState());
  }

  Future<void> updateProduct({
    String? title,
    String? price,
    String? desc,
    required int id,
  }) async {
    emit(UpdateProductLoadingState());
    try {
      await UpdateProductService().updateProductService(
        id: id,
        title: title,
        price: price,
        desc: desc,
      );
      emit(UpdateProductSuccessState());
    } catch (e) {
      emit(UpdateProductFailureState());
    }
  }
}
