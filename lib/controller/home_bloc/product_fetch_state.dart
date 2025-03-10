part of 'product_fetch_bloc.dart';

@immutable
sealed class ProductFetchState {}

final class ProductFetchInitial extends ProductFetchState {}

final class HomeLoading extends ProductFetchState {}

class FetchSuccessFull extends ProductFetchState {
  List<ProductModel> responseData = [];
  FetchSuccessFull({required this.responseData});
}
