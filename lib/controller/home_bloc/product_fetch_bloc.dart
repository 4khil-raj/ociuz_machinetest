import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/controller/repository/product_fetch.dart';
import 'package:machine_test/model/products.dart';
import 'package:meta/meta.dart';

part 'product_fetch_event.dart';
part 'product_fetch_state.dart';

class ProductFetchBloc extends Bloc<ProductFetchEvent, ProductFetchState> {
  ProductFetchBloc() : super(ProductFetchInitial()) {
    on<ProductFetchEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<FetchDataFromServer>((event, emit) async {
      emit(HomeLoading());
      try {
        final response = await ProductRepository.fetchProduct();
        emit(FetchSuccessFull(responseData: response));
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }
}
