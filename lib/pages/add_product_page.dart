import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newecomadmin/controllers/home_controller.dart';
import 'package:newecomadmin/core/constants.dart';
import 'package:newecomadmin/widgets/custom_drop_down.dart';

import '../widgets/custom_text_field.dart';

List<String> dropItems = ['1', '2', '3'];

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        //appbar
        appBar: AppBar(title: const Text("AddProduct")),
        //addproduct form
        body: SingleChildScrollView(
            child: Container(
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("hello"),

                //product name textfield
                CustomTextField(
                  hintText: "Product Name",
                  controller: homeController.nameController,
                ),
                kheight15,
                //description textfield
                CustomTextField(
                  hintText: "Product Description ",
                  maxline: 4,
                  controller: homeController.descriptionController,
                ),
                kheight15,

                //image url
                CustomTextField(
                  hintText: "ImageUrl",
                  controller: homeController.imageController,
                ),
                kheight15,
                //price textfield
                CustomTextField(
                  hintText: "Product Price",
                  controller: homeController.priceController,
                ),
                kheight15,

                //category dropdown  //and brand dropdown row
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //category dropdown
                    Flexible(
                      child: CustomDropDown(
                        hintText:homeController.category ,
                        
                        dropItems:const ['Boots','Sneakers','Sandals'],
                        onChanged: (selectedValue) {
                          print(selectedValue);
                          homeController.category=selectedValue??"General";
                          homeController.update();
                        },
                      ),
                    ),
                    //brand dropdown
                    Flexible(
                      child: CustomDropDown(
                        hintText: homeController.brand,
                        dropItems:const  ['Puma','Adidas','Gucci','Reebok'],
                        onChanged: (selectedValue) {
                          homeController.brand=selectedValue??"Local";
                          homeController.update();
                          print(selectedValue);
                        },
                      ),
                    ),
                  ],
                ),
                kheight15,

                //Offer -dropdown
                CustomDropDown(
                  hintText: homeController.offer.toString(),
                  dropItems:const ['true  ','false'],
                  onChanged: (selectedValue) {
                    homeController.offer=bool.tryParse(selectedValue?? 'false' )?? true;
                    homeController.update();
                    print(selectedValue);
                    
                  },
                ),
                kheight15,

                //add product button
                ElevatedButton(
                  onPressed: () {
                    homeController.addProduct();
                    //call the addproductmethod
                  },
                  child: const Text("AddProduct"),
                )
              ],
            ),
          ),
        )),
      );
    });
  }
}
