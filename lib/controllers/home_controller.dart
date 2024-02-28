import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newecomadmin/model/product.dart';

//a controller is created, and used in home through get builder, but inorder to use it ,register the controller before use,
//other wise get NULL check used on null value error
//register in main(get.put(controller()))

class HomeController extends GetxController {
  //textfield controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  //category,brand,offer
  String category = 'category';
  String brand = 'brand';
  bool offer = false;

  //productlist
  List<Product> productList = [];

  //firestore db ref
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //collection ref
  late CollectionReference productCollection;

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('Products');
    await fetchProducts();
    super.onInit();
  }

//addproduct
  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: nameController.text,
        description: descriptionController.text,
        image: imageController.text,
        price: double.tryParse(priceController.text),
        category: category,
        brand: brand,
        offer: offer,
      );
      final productJson = product.toJson();
      doc.set(productJson);
      //success snackbar
      Get.snackbar("Success", "product added successfully",
          colorText: Colors.green);
      //set default fields
      setDefaultValue();
      print("Success ,product added successfully");
    } on Exception catch (e) {
      Get.snackbar("ERROR", e.toString(), colorText: Colors.red);

      print(e);
    }finally{
      fetchProducts();
    }
  }

//fetch products
  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      //get the data to a templist
      final List<Product> retrievedList = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      //clear the list
      productList.clear();
      productList.assignAll(retrievedList);
      //success fetch snackbar
      Get.snackbar("Success", "fetched successfully", colorText: Colors.green);
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
      print(e);
    }
    finally{
      update();
    }
  }

  //delete product

  deleteProduct(String id) async{
    //delete
    try {
      await productCollection.doc(id).delete();
      //snackbar delete
     Get.snackbar("Success","Product Deleted succussfully");
      //refresh pro list
      fetchProducts();
    } on Exception catch (e) {
      print('product deleted');
      //error snackbar
      Get.snackbar('Error', e.toString());
    }
  }

//clear the addproduct fields
  setDefaultValue() {
    nameController.clear();
    descriptionController.clear();
    imageController.clear();
    priceController.clear();
    category = 'category';
    brand = 'brand';
    offer = false;
    update();
  }
}
