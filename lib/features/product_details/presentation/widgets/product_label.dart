import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductLabel extends StatelessWidget {
  const ProductLabel({super.key , required this.productName , required this.productPrice});
final String productName;
final String productPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
                 productName,
                  style: getMediumStyle(color: ColorManager.primary)
                      .copyWith(fontSize: 18.sp),
                )),
          ],
        ),
        SizedBox(height: 5.h,),
        Row(
          children: [
            Text(
              productPrice,
              style: getMediumStyle(color: ColorManager.primary)
                  .copyWith(fontSize: 18.sp),
            ),
          ],
        ),
      ],
    );
  }
}
