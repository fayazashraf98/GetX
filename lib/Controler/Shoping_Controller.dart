import 'package:get/get.dart';
import 'package:getx_state_management/Model/Products.dart';

class ShopingController extends GetxController{
 var products=<Product>[].obs;
 @override
  void onInit(){
  super.onInit();
  fetchProducts();
}

  void fetchProducts()async {
  await Future.delayed(const Duration(seconds: 1));
  var productResult=[
    Product(
      id:1,
      productName:'Apple',
      productImage:'Assets/Images/apple.jpg',
      productDescription:'Fresh Apple 1KG',
      price:20,
  ),
    Product(
      id:2,
      productName:'Mango',
      productImage:'Assets/Images/mangos.jpg',
      productDescription:'Fresh Mango 1KG',
      price:210,
    ),
    Product(
      id:3,
      productName:'Orange',
      productImage:'Assets/Images/orange.jpg',
      productDescription:'Fresh Orange 1kG',
      price:120,
    ),
  ];
  products.value=productResult;
  }
}