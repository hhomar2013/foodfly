import 'package:flutter/material.dart';
import 'package:foodfly/Core/Constants/color_management.dart';

class ScaffoldCart extends StatelessWidget {
  final Widget? body;
  const ScaffoldCart(this.body ,{super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorManagement.darkBlue,
        foregroundColor: ColorManagement.darkBlue,
        title: Text('Cart', style: TextStyle(color: Colors.white)),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: BoxDecoration(
              color: ColorManagement.darkGray,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new, color: ColorManagement.white),
            ),
          ),
        ),
        leadingWidth: MediaQuery.of(context).size.width * .18,
      ),
      body: body
    );
  }
}
