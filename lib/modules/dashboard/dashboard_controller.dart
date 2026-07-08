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

  // Arayüzde ID'yi verip Kategori İsmini geri alacağımız yardımcı fonksiyon
  String getCategoryName(String? categoryId) {
    if (categoryId == null) return "Bilinmeyen Kategori";

    // myCategories listesinde, id'si bizim aradığımız categoryId ile eşleşen ilk elemanı bulur
    final category = myCategories.firstWhere(
      (cat) => cat.id == categoryId,
      orElse: () =>
          AppCategory(name: "Bilinmeyen Kategori"), // Bulamazsa default değer
    );

    return category.name ?? "Bilinmeyen Kategori";
  }
}
