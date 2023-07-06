import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching/DetailPage.dart';
import 'package:teaching/TextController.dart';

import 'Additem.dart';
import 'Model.dart';
void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final textcontroller = Get.put(TextController());
  final productcontroller = Get.put(AddItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           Obx(() {
             return  Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Item To Add",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                   GestureDetector(
                     onTap: (){
                       Get.to(CartSmall());
                     },
                     child: Badge(
                       label: Text("${productcontroller.products.length}"),
                       child: Icon(Icons.add_shopping_cart),
                     ),
                   ),
                 ],
               ),
             );
           }),
            Expanded(child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 4/5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: products.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        productcontroller.toggleadd(products[index]);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 1
                            ),
                          ],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                           Container(
                             width: MediaQuery.of(context).size.width,
                             height: 100,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(10),
                                 topRight: Radius.circular(10),
                               ),
                               image: DecorationImage(
                                 fit: BoxFit.cover,
                                 image: NetworkImage("${products[index].imageUrl}")
                               )
                             ),
                           ),
                           //  CachedNetworkImage(
                           //      imageUrl: products[index].imageUrl,
                           //      fit: BoxFit.cover,
                           //      placeholder: (context,url)=>Container(
                           //        height: 90,
                           //        width: 90,
                           //        child: CupertinoActivityIndicator(
                           //          animating: true,
                           //          radius: 5,
                           //        ),
                           //      ),
                           //      imageBuilder: (context ,imageProvider){
                           //        return Container(
                           //          height: 90,
                           //          width: 90,
                           //          decoration: BoxDecoration(
                           //              borderRadius: BorderRadius.circular(10),
                           //              image: DecorationImage(
                           //                  image: imageProvider,
                           //                  fit: BoxFit.cover
                           //              )
                           //          ),
                           //        );
                           //
                           //      }
                           //  ),
                            Text("${products[index].name}"),
                           Text("\$${products[index].price}"),
                           // Text(products[index].description)
                          ],
                        ),
                      ),
                    ),
                  );
                }))
          ],
        ),
      )
    );
  }
}

