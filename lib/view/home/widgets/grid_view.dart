import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/controller/home_bloc/product_fetch_bloc.dart';
import 'package:machine_test/view/home/widgets/detail_screen.dart';
import 'package:machine_test/view/widgets/custom_navigator.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductFetchBloc, ProductFetchState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          } else if (state is FetchSuccessFull) {
            return GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                // var chair = chairs[index];
                return InkWell(
                  onTap: () => customNavPush(
                      context,
                      DetailsScreen(
                        description:
                            state.responseData[index].description ?? "",
                        image: state.responseData[index].image ?? "",
                        prize: state.responseData[index].price.toString(),
                        rating: state.responseData[index].rating.toString(),
                        title: state.responseData[index].title ?? "",
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: NetworkImage(
                                    state.responseData[index].image ?? "")),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        width: 50,
                        height: 20,
                        child: Text(
                          state.responseData[index].title ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        state.responseData[index].price.toString(),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 6),
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
