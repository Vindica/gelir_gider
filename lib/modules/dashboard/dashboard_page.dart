import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/dashboard/dashboard_controller.dart';
import 'package:gelir_gider_app/modules/dashboard/widgets/transaction_list.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : TransactionList(),
      ),
    );
  }
}
