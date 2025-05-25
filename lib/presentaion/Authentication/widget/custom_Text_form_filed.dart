import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef ValidatorInvalid = String? Function(String?);

class CustomTextFormFiled extends StatelessWidget {
  final FocusNode? myFocusNode;
  final ValidatorInvalid? validatorInvalid;
  final TextInputType? textInputType;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final TextEditingController myController;
  final bool? obscure;
  final FocusNode? nextFocusNode;
  final GlobalKey<FormState> formState;

  const CustomTextFormFiled({
    super.key,
    this.validatorInvalid,
    this.myFocusNode,
    this.textInputType,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    required this.myController,
    this.obscure,
    this.nextFocusNode,
    required this.formState,
  });

  @override
  Widget build(BuildContext context) {
    final errorMessage = ValueNotifier<String?>(null);

    return ValueListenableBuilder<String?>(
      valueListenable: errorMessage,
      builder: (context, error, child) {
        return TextFormField(
          focusNode: myFocusNode,
          validator: validatorInvalid,
          autovalidateMode: AutovalidateMode.disabled, // الـ validation يدوي
          textInputAction: TextInputAction.next,
          autofocus: true,
          keyboardType: textInputType,
          obscureText: obscure ?? false,
          controller: myController,
          onFieldSubmitted: (value) {
            // نفحص الـ validator بتاع الحقل الحالي
            String? validationError = validatorInvalid?.call(value);
            errorMessage.value = validationError; // نحدث رسالة الخطأ
            if (validationError == null) {
              // لو الـ validation نجح
              if (nextFocusNode != null) {
                FocusScope.of(context).requestFocus(nextFocusNode!);
              } else {
                FocusScope.of(context).unfocus(); // نقفل الكيبورد
              }
              print("Field validation passed ✅");
            } else {
              // لو الـ validation فشل
              print("Field validation failed ❌: $validationError");
              // الـ focus يفضل في الحقل الحالي
              if (myFocusNode != null) {
                FocusScope.of(context).requestFocus(myFocusNode!);
              }
            }
          },
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 12, color: Colors.black38),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                labelText ?? "",
                style: TextStyle(color: Colors.black54, fontSize: 12.sp),
              ),
            ),
            errorText: error, // نعرض رسالة الخطأ هنا
            errorStyle: const TextStyle(color: Colors.red),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green, width: 2),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.orange, width: 2),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        );
      },
    );
  }
}