import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machine_test/model/products.dart';

class ProductRepository {
  static fetchProduct() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        List<ProductModel> projects = data
            .map((projectJson) => ProductModel.fromJson(projectJson))
            .toList();

        return projects;
      } else {
        throw Exception("Failed to load . Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching : $e");
    }
  }
}
