// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:teaching/Additem.dart';
// import 'package:teaching/Model.dart';
// class DetailPage extends StatelessWidget {
//    DetailPage({super.key,required this.product});
//    final Product product;
//   @override
//   Widget build(BuildContext context) {
//     final additemcontroller = Get.put(AddItemController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Detail Page"),
//       ),
//       body: ListView.builder(
//           itemCount: additemcontroller.products.length,
//           itemBuilder: (BuildContext context ,index){
//         return Obx(() =>
//             ListTile(
//               title:  Text("${additemcontroller.products.keys.toList()[index].name}"),
//                 subtitle:  Text("${additemcontroller.products.values.toList()[index]}"),
//               trailing: GestureDetector(
//                   onTap: (){
//                     additemcontroller.additem(product);
//                   },
//                   child: Icon(Icons.add)),
//             ),
//         );})
//     );
//   }
// }




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching/Additem.dart';
import 'package:teaching/Model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CartSmall extends StatelessWidget {

  const CartSmall({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "My Cart".tr,
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CartProducts(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CartTotal(),
                ProcessButton()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartProducts extends StatelessWidget {

  final AddItemController cartController = Get.find();
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return
        cartController.products.length>0?
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: cartController.products.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = cartController.products.keys.toList()[index];
              final itemqty= cartController.products.values.toList()[index];
              return Column(
                children: [
                  CartProductCard(
                    quantity: itemqty,
                    cartController: cartController,
                    product: item,

                  ),
                ],
              );
            },
          ),
        )
            : SizedBox(
          height: 800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Cart empty".tr),
              const Text("Please Add Item"),
            ],
          ),
        );

    });

  }
}

class CartProductCard extends StatelessWidget {

  final Product product;
  final int quantity;
  final AddItemController cartController;
  const CartProductCard({
    super.key,
    required this.quantity,
    required this.product,
    required this.cartController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // CachedNetworkImage(
                  //     imageUrl: product.imageUrl,
                  //     fit: BoxFit.cover,
                  //     placeholder: (context,url)=>Container(
                  //       height: 90,
                  //       width: 90,
                  //       child: CupertinoActivityIndicator(
                  //         animating: true,
                  //         radius: 5,
                  //       ),
                  //     ),
                  //     imageBuilder: (context ,imageProvider){
                  //       return Container(
                  //         height: 90,
                  //         width: 90,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             image: DecorationImage(
                  //                 image: imageProvider,
                  //                 fit: BoxFit.cover
                  //             )
                  //         ),
                  //       );
                  //
                  //     }
                  // ),
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),

                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("${product.imageUrl}")
                      )
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        //width: MediaQuery.of(context).size.width * 0.65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    overflow: TextOverflow.visible,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "roboto"),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width*0.6,child:  Text(product.description,overflow: TextOverflow.ellipsis,),)
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "\$${product.price}",
                                    style: const TextStyle(
                                        fontFamily: "roboto",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                     // onTap: (){cartController.removeallproduct(product);},
                                      child: const Icon(CupertinoIcons.trash,color: Colors.red,))
                                ],
                              ),

                            ],
                          )),
                      Row(
                        children: [
                          IconButton(
                            color: Colors.blue,
                            onPressed: () {
                              cartController.removeProduct(product);
                            },
                            icon: const Icon(Icons.remove_circle),
                          ),
                          Text("$quantity"),
                          IconButton(
                            color: Colors.blue,
                            onPressed: () {
                              cartController.additem(product);
                            },
                            icon: const Icon(Icons.add_circle),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  final AddItemController cartController = Get.find();
  CartTotal({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width * 1,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal".tr,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: "roboto"),
                        ),
                        // Obx(
                        //       () => Text(
                        //     '\$ ${cartController.Subtotal}',
                        //     style: const TextStyle(
                        //         fontSize: 15,
                        //         fontFamily: 'roboto',
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text("Tax",style: TextStyle(color: Colors.black,fontSize: 15,fontFamily: 'roboto'),),
                        // Obx(() {
                        //   return Text("\$${cartController.Tax}",style: const TextStyle(fontSize: 15,fontFamily: 'roboto',fontWeight: FontWeight.bold),);
                        // }),
                      ],
                    ),
                    const Divider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ប្រាក់សរុប".tr,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        // Obx(
                        //       () => Text("${cartController.khtotal}R",
                        //     style: const TextStyle(
                        //         fontWeight: FontWeight.bold, fontSize: 18),
                        //   ),
                        // )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total".tr,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Obx(
                              () => Text("\$${cartController.Subtotal}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class ProcessButton extends StatelessWidget {
  final cartController = Get.put(AddItemController());
  ProcessButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: 50,
        decoration: BoxDecoration(
            boxShadow: const [BoxShadow(blurRadius: 0)],
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue
        ),
        child: TextButton(
          onPressed: (){
            if(cartController.products.length>0){
              //Get.to(bluetoothprint());
            }else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar
                (backgroundColor: Colors.green,content: Text("Please Add An Item"),
                duration: Duration(seconds: 1),));
            }
          },
          child: const Text("Payment",style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

