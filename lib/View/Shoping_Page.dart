import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/Controler/Shoping_Controller.dart';
import '../Controler/CartShoping_Controller.dart';

class ShopingPage extends StatelessWidget {
  const ShopingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shopingController = Get.put(ShopingController());
    final cartController = Get.put(CartController());
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber,
          icon: const Icon(
            Icons.add_shopping_cart,
            color: Colors.black,
          ),
          label: GetX<CartController>(builder: (controller) {
            return Text(
              controller.Count.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 20),
            );
          }),
        ),
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: const Text("Shopping Page"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GetX<ShopingController>(builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return Card(
                            margin: const EdgeInsets.all(10),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 20, right: 20),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.asset(
                                                  controller.products[index]
                                                      .productImage,
                                                  height: 70,
                                                  width: 70,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.products[index]
                                                    .productName,
                                                style: const TextStyle(fontSize: 24),
                                              ),
                                              Text(controller.products[index]
                                                  .productDescription),
                                            ],
                                          ),
                                          Text(
                                              '\$${controller.products[index].price}',
                                              style: const TextStyle(
                                                  fontSize: 24)),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          RaisedButton(
                                            onPressed: () {
                                              cartController.addToCart(
                                                  controller.products[index]);
                                            },
                                            color: Colors.orange,
                                            textColor: Colors.white,
                                            child: const Text(
                                              'Add to Cart',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ])));
                      });
                }),
              ),
              GetX<CartController>(builder: (controller) {
                return Text(
                  'Total Amount \$ ${controller.totalPrice}',
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                );
              }),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}
