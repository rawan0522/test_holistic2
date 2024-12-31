
import 'package:flutter/cupertino.dart';

import '../Models/detailmodel.dart';
import '../Services/detailservice.dart';

class DetailsProvider extends ChangeNotifier{
  DetailsModel? detailsModel;
  Future<void>fetchData() async{
    detailsModel = await DetailsServices.getService();
    notifyListeners();
  }
}