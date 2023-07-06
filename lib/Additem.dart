import 'package:get/get.dart';

import 'Model.dart';

class AddItemController extends GetxController{
  // RxList<Product> list = <Product>[].obs;
  // void additem(Product product){
  //   list.add(product);
  // }
  var products = {}.obs;

  void additem(Product product){
    if(products.containsKey(product)){
      products[product]+=1;
    }else{
      products[product]=1;
    };
  }

  void removeProduct(Product product){
    if(products.containsKey(product)&&products[product]==1){
      products.removeWhere((key, value) => key==product);
    }else{
      products[product]-=1;
    }
  }

  void toggleadd(Product product){
    final toggle = products.containsKey(product);
    if(toggle){
      products.remove(product);
    }else{
      products[product]=1;
    }

  }


  bool isExisted (Product product){
    final existed = products.containsKey(product);
    return existed;
  }

// get productSubtotal => products.entries
//     .map((product) => product.key.price * product.value)
//     .toList().toString();
  get Subtotal=>
      products.entries.isNotEmpty?
      products.entries.map((product)=>product.key.price*product.value).toList()
          .reduce((value, element) => value+element).toStringAsFixed(2):0.0;
}


