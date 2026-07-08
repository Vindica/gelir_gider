import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';

class TransactionList extends GetView<DashboardController> {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.separated(
        itemBuilder: (context, index) {
          var oankiTransaction = controller.myTransactions[index];
          var category = oankiTransaction.categoryId;
          return Dismissible(
            key: ValueKey(oankiTransaction.id),
            child: ListTile(
              title: Text(oankiTransaction.amount.toString()),
              subtitle: Text(oankiTransaction.description!),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1);
        },
        itemCount: controller.myTransactions.length,
      ),
    );
  }
}
