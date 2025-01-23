import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/features/eid/view_model/eid_dua_list.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/widgets/text/custome_text.dart';

class EidDuaView extends StatelessWidget {
  const EidDuaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AppImages.dua,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            EidDuasWidgetList(),
          ],
        ),
      ),
    );
  }
}

class EidDuasWidgetList extends StatelessWidget {
  const EidDuasWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: eidDuaList.length,
          itemBuilder: (context, index) => Column(
            children: [
              CustomText(
                text: eidDuaList[index]['dua'] ?? 'dua',
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onSurface,
                textAlign: TextAlign.center,
              ),
              CustomText(
                text: eidDuaList[index]['translation'] ?? 'translation',
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onSurface,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
