import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/transactions/transaction_controller.dart';
import 'package:gelir_gider_app/modules/transactions/widgets/amount_input.dart';
import 'package:gelir_gider_app/modules/transactions/widgets/category_dropdown.dart';
import 'package:gelir_gider_app/modules/transactions/widgets/date_input.dart';
import 'package:gelir_gider_app/modules/transactions/widgets/description_input.dart';
import 'package:gelir_gider_app/modules/transactions/widgets/save_button.dart';
import 'package:gelir_gider_app/modules/transactions/widgets/transaction_type_selecter.dart';
import 'package:gelir_gider_app/themes/app_colors.dart';
import 'package:get/get.dart';

class TransactionPage extends GetView<TransactionController> {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transactionlar ")),
      body: Obx(
        () => controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      TransactionTypeSelecter(),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(child: CategoryDropdown()),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_circle_outline),
                            color: AppColors.darkTiffanyBlue,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      AmountInput(),
                      SizedBox(height: 16),
                      DescriptionInput(),
                      SizedBox(height: 16),
                      DateInput(),
                      SizedBox(height: 16),
                      SaveButton(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
