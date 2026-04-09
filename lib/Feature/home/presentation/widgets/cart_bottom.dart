import 'package:flutter/cupertino.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Core/components/components.dart';
import 'package:foodfly/Core/util/size_config.dart';
import 'package:foodfly/Feature/home/logic/cubit/cart_cubit.dart';

Widget buildCartbottom(CartCubit cubit){
  return  Positioned(
    top: SizeConfig.defaultSize * 5.5,
    bottom: 0,
    right: 0,
    left: 0,
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.defaultSize * .1,
        vertical: SizeConfig.defaultSize * .1,
      ),
      decoration: BoxDecoration(
        color: ColorManagement.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize * .1,
              vertical: SizeConfig.defaultSize * .05,
            ),
            child: defaultLabel(
              text: 'Delivery Address',
              color: ColorManagement.gray,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize * .1,
              vertical: SizeConfig.defaultSize * .01,
            ),
            child: defaultTextField(
              controller: cubit.deliveryAddressController,
              type: TextInputType.text,
              hintText: 'Cairo, Egypt',
            ),
          ),
          SizedBox(height: SizeConfig.defaultSize * .1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize * .1,
                  vertical: SizeConfig.defaultSize * .05,
                ),
                child: defaultLabel(
                  text: 'TOTAL:',
                  color: ColorManagement.gray,
                  fontSize: 16,
                ),
              ),
              defaultLabel(
                text: '${cubit.getTotalPrice()} EGP',
                color: ColorManagement.darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.defaultSize * .1,),
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize * .1,
              vertical: SizeConfig.defaultSize * .01,
            ),
            child: defaultButton(function: () {}, text: 'PLACE ORDER' ,height: 70),
          )
        ],
      ),
    ),
  );
}