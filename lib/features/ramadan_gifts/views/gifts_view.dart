import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/core/widgets/buttons/custom_button.dart';
import 'package:ramadan_guide_app/features/ramadan_gifts/views/declaration_view.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/widgets/text/custome_text.dart';
import '../ramadan_gift_list.dart';

class GiftsView extends StatelessWidget {
  const GiftsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeclarationView(),
                ),
              ),
              child: const Icon(Icons.info_outline),
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: RamadanGiftsGridview(),
      ),
    );
  }
}

class RamadanGiftsGridview extends StatelessWidget {
  const RamadanGiftsGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: ramadanGiftsList.length,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.8,
      ),
      itemBuilder: (context, index) => ProductThumbnail(
        productImage: ramadanGiftsList[index]['image'],
        productName: ramadanGiftsList[index]['name'],
        productLink: ramadanGiftsList[index]['link'],
      ),
    );
  }
}

class ProductThumbnail extends StatelessWidget {
  const ProductThumbnail({
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.secondary.withOpacity(.1),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.height * 0.5,
                productImage,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: CustomText(
              text: productName,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: CustomButton(
              title: tr('buyNow'),
              onPressed: () async {
                await launchUrl(
                  Uri.parse(productLink),
                );
              },
              background:
                  Theme.of(context).colorScheme.secondary.withOpacity(1),
              textColor: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
