import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/dashboard/dashboard_controller.dart';
import 'package:gelir_gider_app/themes/app_colors.dart';
import 'package:gelir_gider_app/utils/icon_helper.dart';
import 'package:get/get.dart';

class TransactionList extends GetView<DashboardController> {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.myTransactions.isEmpty) {
        return Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 48,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkTiffanyBlue.withAlpha(128)
                        : AppColors.tiffanyBlue.withAlpha(128),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Henus kayitli bir transaction yok",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return Card(
        child: ListView.separated(
          itemBuilder: (context, index) {
            var oankiTransaction = controller.myTransactions[index];
            var categoryId = oankiTransaction.categoryId;

            // Controller'daki metodumuzu kullanarak ID'den İsim alıyoruz
            var categoryName = controller.getCategoryName(categoryId);

            return Dismissible(
              key: ValueKey(oankiTransaction.id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: .centerRight,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                controller.deleteTransaction(oankiTransaction.id!);
              },
              child: ListTile(
                title: Text(categoryName),
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
    });
  }
}
