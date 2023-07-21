import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:teaching/NodeModel.dart';
class NodeController extends GetxController{
  String geturl = "http://localhost:3000/product";
  String posturl = "http://localhost:3000/product";

  NodeModel ?nodeModel ;
  List<NodeModel>?node;
  Future<List<NodeModel>?> getdata()async{
    final response = await http.get(Uri.parse(geturl));
    if(response.statusCode==200) {
       node = nodeModelFromJson(response.body);
      print(node);
      update();
      return node;
    }
  }
  void postdata(
      TextEditingController name,
      TextEditingController quantity,
      TextEditingController price,
      TextEditingController image,
      )async{
    final response = await http.post(Uri.parse(posturl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    body: jsonEncode(
        {
          "name":name.text,
          "quantity":quantity.text,
          "price":price.text,
          "image":image.text
        }
    ),
    );
    if(response.statusCode ==200){
      Get.snackbar("Success", "Success");
    }
  }
  void delete(
      TextEditingController id
      )async{
    String url ="http://localhost:3000/product/${id.text}";
    final response = await http.delete(Uri.parse(url));
    if(response.statusCode==200){
      print("Successs deleted");
    }
  }
  void Updatedata(
      TextEditingController id,
      TextEditingController name,
      TextEditingController quantity,
      TextEditingController price,
      TextEditingController image,
      )async{
    String url ="http://localhost:3000/product/${id.text}";
    final response = await http.put(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          {
            "name":name.text,
            "quantity":quantity.text,
            "price":price.text,
            "image":image.text
          }
      ),
    );
    if(response.statusCode==200){
      print("Successs Updated");
    }
  }
}