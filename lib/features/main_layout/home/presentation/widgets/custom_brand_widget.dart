import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBrandWidget extends StatelessWidget {
   BrandEntity brandEntity;
   CustomBrandWidget({super.key,required this.brandEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              brandEntity.image,
              fit: BoxFit.scaleDown,
              errorBuilder: (context, error, stackTrace) => Center(
                child: Text(
                  "Error loading image",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


        // CachedNetworkImage(
        //   height: 80,
        //   width: 80,
        //   fit: BoxFit.cover,
        //   imageUrl: ImageAssets.categoryHomeImage,
        //   placeholder: (context, url) =>
        //       const Center(child: CircularProgressIndicator()),
        //   errorWidget: (context, url, error) =>
        //       const Center(child: Icon(Icons.error)),
        //   imageBuilder: (context, imageProvider) {
        //     return Container(
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         image: DecorationImage(
        //           image: imageProvider,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     );
        //   },
        // ),