import 'package:gelir_gider_app/modules/transactions/transaction_controller.dart';
import 'package:get/instance_manager.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionController());
  }
}
