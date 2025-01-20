import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/features/eid/view_model/takbeerat_list.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/widgets/text/custome_text.dart';

class EidTakbeeratView extends StatelessWidget {
  const EidTakbeeratView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Image.asset(
                  AppImages.clouds,
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.fitWidth,
                  // width: double.infinity,
                ),
                Image.asset(
                  AppImages.clouds,
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.5,

                  fit: BoxFit.fitWidth,
                  // width: double.infinity,
                ),
                // Image.asset(
                //   AppImages.whiteMosque,
                //   height: MediaQuery.of(context).size.height * 0.2,
                //   fit: BoxFit.cover,
                //   // width: double.infinity,
                // ),
              ],
            ),
            EidTakbeeratWidget(),
          ],
        ),
      ),
    );
  }
}

class EidTakbeeratWidget extends StatelessWidget {
  const EidTakbeeratWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: takbeeratList.length,
          itemBuilder: (context, index) => Column(
            children: [
              CustomText(
                text: takbeeratList[index]['arabic'] ?? 'takbeerat',
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onSurface,
                textAlign: TextAlign.center,
              ),
              CustomText(
                text: takbeeratList[index]['english'] ?? 'takbeerat',
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
