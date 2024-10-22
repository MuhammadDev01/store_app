part of 'store_cubit.dart';

@immutable
abstract class StoreStates {}

class StoreInitialState extends StoreStates {}

class ChangeAdminStoreState extends StoreStates {}

class UpdateProductLoadingState extends StoreStates {}

class UpdateProductSuccessState extends StoreStates {}

class UpdateProductFailureState extends StoreStates {}
