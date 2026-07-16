import 'package:flutter/material.dart';
import 'package:gelir_gider_app/core/base_controller.dart';
import 'package:gelir_gider_app/models/app_transaction.dart';
import 'package:gelir_gider_app/models/app_category.dart';
import 'package:gelir_gider_app/repositories/transaction_repository.dart';
import 'package:gelir_gider_app/repositories/category_repository.dart';
import 'package:get/get.dart';

class DashboardController extends BaseController {
  late final TransactionRepository _transactionRepository;
  late final CategoryRepository _categoryRepository;

  final myTransactions = <AppTransaction>[].obs;
  final myCategories = <AppCategory>[].obs;

  final aylikGelir = 0.0.obs;
  final aylikGider = 0.0.obs;

  void aylikOzet() {
    aylikGelir.value = 0;
    aylikGider.value = 0;
    var simdikiTarih = DateTime.now();
    var oankiYil = simdikiTarih.year;
    var oankiAy = simdikiTarih.month;

    if (myTransactions.isNotEmpty) {
      var filteredTransaction = myTransactions
          .where(
            (transaction) =>
                transaction.date!.year == oankiYil &&
                transaction.date!.month == oankiAy,
          )
          .toList();
      for (var tr in filteredTransaction) {
        if (tr.type == "income") {
          aylikGelir.value += tr.amount!;
        } else {
          aylikGider.value += tr.amount!;
        }
      }
    } else {
      aylikGelir.value = 0;
      aylikGider.value = 0;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    _transactionRepository = Get.find<TransactionRepository>();
    _categoryRepository = Get.find<CategoryRepository>();

    // Önce kategorileri çekiyoruz ki işlemler listelenirken elimizde hazır olsun
    await getCategories();
    await getTransacitons();
  }

  Future<void> refreshDashboard() async {
    await getCategories();
    await getTransacitons();
  }

  // Kategorileri API'den çekip listeye atayan metod
  Future getCategories() async {
    try {
      final categories = await _categoryRepository.getCategories();
      myCategories.value = categories;
    } catch (e) {
      debugPrint("Kategoriler getirilirken hata oluştu: $e");
    }
  }

  Future getTransacitons() async {
    try {
      setLoading(true);
      final transactions = await _transactionRepository.getTransactions();
      myTransactions.value = transactions;
      aylikOzet();
    } catch (e) {
      showErrorSnackbar(message: "Veriler getirilirken hata olustu");
    } finally {
      setLoading(false);
    }
  }

  Future deleteTransaction(String id) async {
    try {
      // setLoading(true);
      final transactionResult = await _transactionRepository.deleteTransaction(
        id,
      );
      if (transactionResult) {
        myTransactions.removeWhere((element) => element.id == id);
        aylikOzet();
        showSuccessSnackbar(message: "Transaction silindi");
      } else {
        showErrorSnackbar(message: "Transaction silinemedi");
      }
    } catch (e) {
      showErrorSnackbar(message: "Transaction silinemedi $e");
    } finally {
      // setLoading(false);
    }
  }

  // Arayüzde ID'yi verip Kategori nesnesini (AppCategory) geri alacağımız yardımcı fonksiyon
  AppCategory getCategory(String? categoryId) {
    if (categoryId == null) return AppCategory(name: "Bilinmeyen Kategori");

    // myCategories listesinde, id'si bizim aradığımız categoryId ile eşleşen ilk elemanı bulur
    return myCategories.firstWhere(
      (cat) => cat.id == categoryId,
      orElse: () =>
          AppCategory(name: "Bilinmeyen Kategori"), // Bulamazsa default değer
    );
  }
}
