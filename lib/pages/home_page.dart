import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newecomadmin/controllers/home_controller.dart';
import 'package:newecomadmin/pages/add_product_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Admin"),
          centerTitle: true,
        ),
        //productlist view

        body: ListView.builder(
          itemCount: homeController.productList.length,
          itemBuilder: (context, index) {
            var data = homeController.productList[index];
            return ListTile(
              //productname
              title: Text(data.name ?? ''),
              //product price
              subtitle: Text((data.price ?? 0).toString()),
              //img
              leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    data.image ?? '',
                    fit: BoxFit.contain,
                  )),

              //delete buttn
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  homeController.deleteProduct(data.id ?? '');
                  print("delete");
                },
              ),
            );
          },
        ),

        //addproduct button
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Get.to(const AddProductPage());
            //  print("add new product");
          },
        ),
      );
    });
  }
}
