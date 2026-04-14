import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Core/components/components.dart';
import 'package:foodfly/Core/util/size_config.dart';
import 'package:foodfly/Feature/home/logic/cubit/cart_cubit.dart';
import 'package:foodfly/Feature/home/presentation/widgets/cart_bottom.dart';
import 'package:foodfly/Feature/home/presentation/widgets/cart_list_widget.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return Center(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                decoration: BoxDecoration(color: ColorManagement.darkBlue),
              ), //background
              SizedBox(
                height: SizeConfig.defaultSize * 5.6,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize * .1,
                    vertical: SizeConfig.defaultSize * .2,
                  ),
                    child: buildCartList(cubit.cartItems, cubit),
                ),
              ),
             buildCartBottom(cubit)
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
