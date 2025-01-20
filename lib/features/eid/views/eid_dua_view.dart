import 'package:flutter/material.dart';
import '../../../core/constants/app_images.dart';

class EidDuaView extends StatelessWidget {
  const EidDuaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AppImages.dua),
          ],
        ),
      ),
    );
  }
}
