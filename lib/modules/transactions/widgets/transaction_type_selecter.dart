import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/transactions/controllers/transaction_controller.dart';
import 'package:gelir_gider_app/themes/app_colors.dart';
import 'package:get/get.dart';

class TransactionTypeSelecter extends GetView<TransactionController> {
  const TransactionTypeSelecter({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SegmentedButton(
        segments: [
          ButtonSegment(
            value: "expense",
            label: Text("Gider"),
            icon: Icon(Icons.remove_circle_outline),
          ),
          ButtonSegment(
            value: "income",
            label: Text("Gelir"),
            icon: Icon(Icons.add_circle_outline),
          ),
        ],
        selected: {controller.transactionType.value},
        onSelectionChanged: (selection) {
          controller.transactionType.value = selection.first;
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.darkTiffanyBlue;
            } else {
              return Colors.transparent;
            }
          }),
        ),
      ),
    );
  }
}
