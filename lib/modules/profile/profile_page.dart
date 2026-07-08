import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/profile/profile_controller.dart';
import 'package:gelir_gider_app/modules/profile/widgets/info_card.dart';
import 'package:gelir_gider_app/services/theme_service.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                controller.user.value?.profilePhoto ?? '',
              ),
            ),
            SizedBox(height: 24),
            InfoCard(
              title: "Adi",
              value: controller.user.value?.firstName ?? '',
            ),
            InfoCard(
              title: "Soyadi",
              value: controller.user.value?.lastName ?? '',
            ),
            InfoCard(title: "Mail", value: controller.user.value?.email ?? ''),
            SettinngsCard()
          ],
        ),
      ),
    );
  }
}

class SettinngsCard extends StatelessWidget {
  SettinngsCard({super.key});
  final ThemeService themeService = Get.find<ThemeService>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.brightness_6),
        title: Text("Tema"),
        trailing: Obx(
          () => Switch(
            value: themeService.isDarkMode,
            onChanged: (value) => themeService.toggleTheme(),
          ),
        ),
      ),
    );
  }
}
