import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sky_lovers/modules/settings/controllers/settings_controller.dart';
import 'package:sky_lovers/ui/theme/theme.dart';
import 'package:sky_lovers/ui/widgets/sunset_sunrise_background.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SunsetSunriseBackground(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.showLogoutDialog();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Colors.white.withOpacity(0.1), // Color del texto del botón
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: Text('Cerrar Sesión'),
            ),
            const Gap(1000),
          ],
        )),
      ),
    );
  }
}
