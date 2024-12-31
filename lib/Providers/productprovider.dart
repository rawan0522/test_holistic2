
import 'package:flutter/cupertino.dart';
import '../Models/productmodel.dart';
import '../Services/productservice.dart';

class ProductProvider extends ChangeNotifier{

  ProductModel? productModel;
  Future<void>fetchData() async{
    productModel = await ProductServices.getService();
    notifyListeners();
  }

}