import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/core/widgets/buttons/custom_button.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';
import 'package:url_launcher/url_launcher.dart';

class GiftDetailsView extends StatelessWidget {
  const GiftDetailsView({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productLink,
  });

  final String productImage;
  final String productName;
  final String productLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    productImage,
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.cover,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                        vertical: 50.h,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                child: CustomText(
                  text: productName,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(
                  text: tr('productDescription'),
                  fontSize: 14.sp,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h),
            child: CustomButton(
              title: tr('buyNow'),
              onPressed: () async {
                await launchUrl(
                  Uri.parse(productLink),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
