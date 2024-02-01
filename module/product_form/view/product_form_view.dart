import 'package:flutter/material.dart';
import 'package:lat_flutter_http_request/core.dart';
import '../controller/product_form_controller.dart';

class ProductFormView extends StatefulWidget {
  final Map? item;
  const ProductFormView({
    this.item,
    Key? key,
  }) : super(key: key);

  Widget build(context, ProductFormController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductForm"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: controller.productName,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "inputkan product",
                ),
                onChanged: (value) => controller.productName = value,
              ),
              TextFormField(
                initialValue: controller.price?.toString(),
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'price',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "Harga Product",
                ),
                onChanged: (value) =>
                    controller.price = double.tryParse(value) ?? 0,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
          ),
          onPressed: () => controller.save(),
          child: const Text(
            "Save",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<ProductFormView> createState() => ProductFormController();
}
