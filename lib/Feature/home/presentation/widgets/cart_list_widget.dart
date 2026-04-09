import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Core/components/components.dart';
import 'package:foodfly/Core/util/size_config.dart';
import 'package:foodfly/Feature/home/data/models/cart_model.dart';
import 'package:foodfly/Feature/home/logic/cubit/cart_cubit.dart';

Widget buildCartList(List<CartModel> cartItems, CartCubit cubit) {
  return ListView.separated(
    separatorBuilder: (context, index) {
      return SizedBox(height: SizeConfig.defaultSize * .01);
    },
    itemBuilder: (context, index) {
      var cartItem = cartItems[index];
      return Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize * .1,
              vertical: SizeConfig.defaultSize * .1,
            ),
            child: Container(
              height: SizeConfig.defaultSize * 1.5,
              width: SizeConfig.defaultSize * 1.5,
              decoration: BoxDecoration(
                color: ColorManagement.darkGray,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: ColorManagement.gray.withOpacity(.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Image.asset('assets/images/Foodfly3.png'),
              clipBehavior: Clip.antiAlias,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "${cartItem.price} EGP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    if (cartItem.quantity > 1) {
                      cubit.updateQuantity(cartItem, cartItem.quantity - 1);
                    } else {
                      defaultShowDialog(
                        context: context,
                        onDelete: () {
                          cubit.removeFromCart(cartItem);
                        },
                      );
                    }
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: cartItem.quantity <= 1
                        ? ColorManagement.red
                        : ColorManagement.darkGray,
                    child: cartItem.quantity <= 1
                        ? Icon(Icons.delete, color: Colors.white)
                        : Text('-'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cartItem.quantity.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    cubit.updateQuantity(cartItem, cartItem.quantity + 1);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorManagement.darkGray,
                    child: Text('+'),
                  ),
                ),
              ],
            ),
          ), //quantity area
        ],
      );
    },
    itemCount: cartItems.length,
  );
}
