part of 'product_fetch_bloc.dart';

@immutable
sealed class ProductFetchEvent {}

class FetchDataFromServer extends ProductFetchEvent {}
