import 'package:gelir_gider_app/core/base_controller.dart';
import 'package:gelir_gider_app/models/app_transaction.dart';
import 'package:gelir_gider_app/repositories/transaction_repository.dart';
import 'package:get/get.dart';

class DashboardController extends BaseController {
  late final TransactionRepository _transactionRepository;

  @override
  void onInit() async {
    super.onInit();
    _transactionRepository = Get.find<TransactionRepository>();
    await getTransacitons();
  }

  final myTransactions = <AppTransaction>[].obs;

  Future getTransacitons() async {
    try {
      setLoading(true);
      final transactions = await _transactionRepository.getTransactions();
      myTransactions.value = transactions;
    } catch (e) {
      showErrorSnackbar(message: "Veriler getirilirken hata olustu");
    } finally {
      setLoading(false);
    }
  }   
}
