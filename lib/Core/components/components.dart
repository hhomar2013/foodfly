import 'package:flutter/material.dart';
import 'package:foodfly/Core/Constants/color_management.dart';

Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType type,
  // required String label,
  String? hintText,
  IconData? prefix,
  IconData? suffix,
  Function? suffixPressed,
  String? Function(String?)?
  validate, // تعديل الـ Validator ليكون متوافق مع TextFormField
  Function(String)? onSubmit,
  Function(String)? onChange,
  VoidCallback? onTap, // الـ Tap يفضل يكون VoidCallback
  bool isPassword = false,
  bool isEnabled = true,
  Color? textColor,
  Color? hintColor,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  enabled: isEnabled,
  style: TextStyle(color: textColor ?? Colors.black), // لون الخط
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  onTap: onTap,
  validator: validate,
  decoration: InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    filled: true,
    fillColor: Colors.grey.shade200,
    // labelText: label,
    hintText: hintText,
    hintStyle: TextStyle(color: hintColor ?? Colors.grey),
    prefixIcon: prefix != null ? Icon(prefix) : null,
    suffixIcon: suffix != null
        ? IconButton(
            onPressed: () => suffixPressed?.call(),
            icon: Icon(suffix, color: Colors.grey),
          )
        : null,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
  ),
);

Widget defaultCheckBox({
  required bool value,
  required Function(bool?) onChanged,
  Color? activeColor,
  Color? checkColor,
  bool isEnabled = true,
  String? text,
}) => Row(
  children: [
    Checkbox(
      value: value,
      onChanged: isEnabled ? onChanged : null,
      activeColor: activeColor,
      checkColor: checkColor,
    ),
    Text(
      text ?? '',
      style: TextStyle(fontSize: 16, color: ColorManagement.darkBlue),
    ),
  ],
);

Widget defaultButton({
  double width = double.infinity,
  double height = 60.0,
  Color background = ColorManagement.orange,
  Color textColor = ColorManagement.white,
  double radius = 10.0,
  required VoidCallback function,
  required String text,
  bool isUpperCase = false,
}) => Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(
        color: textColor,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

Widget defaultLabel({
  required String text,
  Color color = ColorManagement.darkBlue,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.normal,
}) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text(
    text,
    style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
  ),
);

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateAndFinish(context, widget) => Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => widget),
);

Future defaultShowDialog({
  required BuildContext context,
  String title = 'Delete Item',
  String content = 'Are you sure you want to delete this item?',
  required Function() onDelete,
}) =>
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(.7),
      builder: (context) => AlertDialog(
        backgroundColor: ColorManagement.darkGray,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: Text(
          content,
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel',
                style: TextStyle(color: ColorManagement.orangeAccent)),
          ),
          TextButton(
            onPressed: () {
              onDelete();
              Navigator.pop(context);
            },
            child: Text(
              'Delete',
              style: TextStyle(color: ColorManagement.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
