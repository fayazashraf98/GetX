import 'package:get/get.dart';
import '../Model/Products.dart';

class CartController extends GetxController{
  var cartItems=<Product>[].obs;
  int get Count=>cartItems.length;
  double get totalPrice=>cartItems.fold(0, (sum, item) => sum+item.price);

  addToCart(Product product){
    cartItems.add(product);
  }
}