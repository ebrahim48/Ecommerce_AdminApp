import 'package:ecom_admin_new13/models/order_constants_model.dart';
import 'package:flutter/material.dart';
import '../db/db_helper.dart';
class OrderProvider extends ChangeNotifier{
  OrderConstantsModel orderConstantsModel = OrderConstantsModel();

  Future<void> addOrderConstants(OrderConstantsModel model) =>
      DbHelper.addOrderConstants(model);

  Future<void> getOrderConstants() async {
    final snapshot = await DbHelper.getOrderConstants();
    orderConstantsModel = OrderConstantsModel.fromMap(snapshot.data()!);
    notifyListeners();
  }

}