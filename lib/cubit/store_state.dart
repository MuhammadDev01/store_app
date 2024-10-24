part of 'store_cubit.dart';

@immutable
abstract class StoreStates {}

class StoreInitialState extends StoreStates {}

class ChangeAdminStoreState extends StoreStates {}

class ChangeFavoriteStoreState extends StoreStates {}

class UpdateProductLoadingState extends StoreStates {}

class UpdateProductSuccessState extends StoreStates {}

class RemoveProductSuccessState extends StoreStates {}

class UpdateProductFailureState extends StoreStates {}

class GetAllProductsLoadingState extends StoreStates {}

class GetAllProductsSuccessState extends StoreStates {}

class GetAllProductsFailureState extends StoreStates {}

class AddProductSuccessState extends StoreStates {}
