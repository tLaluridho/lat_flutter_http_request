import 'package:dio/dio.dart';

class ProductService {
  Future<List> get() async {
    var response = await Dio().get(
      "https://9code.id/demo/api/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["data"];
  }

  Future create({
    required String productname,
    required double price,
  }) async {
    await Dio().post(
      "https://9code.id/demo/api/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "product": productname,
        "price": price,
      },
    );
  }

  Future update({
    required int id,
    required String productname,
    required double price,
  }) async {
    await Dio().put(
      "https://9code.id/demo/api/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "product": productname,
        "price": price,
      },
    );
  }

  Future delete(int id) async {
    await Dio().delete(
      "https://9code.id/demo/api/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  Future deleteAll() async {
    await Dio().delete(
      "https://9code.id/demo/api/products/action/delete-all",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }
}

void main() async {
  List product = await ProductService().get();
  print(product.length);

  await ProductService().update(id: 10, productname: "haihai", price: 300);

  List product2 = await ProductService().get();
  print(product2.first);
}
