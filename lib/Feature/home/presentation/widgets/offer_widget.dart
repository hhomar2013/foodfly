import 'package:flutter/material.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Core/util/size_config.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: SizeConfig.defaultSize * 5,
          decoration: BoxDecoration(
            color:  ColorManagement.darkBlue,
          ),
        )
      ],
    );
  }
}
