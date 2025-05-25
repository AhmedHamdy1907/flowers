import 'package:flower/core/routsManger/routs_manger.dart';
import 'package:flower/presentaion/Authentication/widget/custom_Text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../data/api/api_manger/api_manger.dart';
import '../../../../data_static/provider/providerGlopal.dart';
import '../view_model/sign_up_view_model.dart';
import '../widget/build_GenderOption.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpViewModel signUpViewModel = SignUpViewModel();
  String? gender;
  String? cheakGender;
  final _signUpFormKey = GlobalKey<FormState>();
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();
  final controllerPhoneNumber = TextEditingController();

  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
   var providerGlobal= Provider.of<ProviderGlobal>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up", style: GoogleFonts.aclonica(fontSize: 23)),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider.value(
        value: signUpViewModel,
        builder: (context, child) =>
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormFiled(
                              formState: _signUpFormKey,
                              validatorInvalid: (value) {
                                if (value == null || value
                                    .trim()
                                    .isEmpty) {
                                  return 'Name is required';
                                } else if (value
                                    .trim()
                                    .length < 2) {
                                  return 'Name is too short';
                                }
                                return null;
                              },
                              myController: controllerFirstName,
                              labelText: "First name",
                              hintText: "Enter first name",
                              myFocusNode: firstNameFocusNode,
                              nextFocusNode: lastNameFocusNode,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: CustomTextFormFiled(
                              formState: _signUpFormKey,
                              validatorInvalid: (value) {
                                if (value == null || value
                                    .trim()
                                    .isEmpty) {
                                  return 'Name is required';
                                } else if (value
                                    .trim()
                                    .length < 2) {
                                  return 'Name is too short';
                                }
                                return null;
                              },
                              myController: controllerLastName,
                              labelText: "Last name",
                              hintText: "Enter last name",
                              myFocusNode: lastNameFocusNode,
                              nextFocusNode: emailFocusNode,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormFiled(
                        formState: _signUpFormKey,
                        validatorInvalid: (value) {
                          if (value == null || value
                              .trim()
                              .isEmpty) {
                            return 'Email is required';
                          }
                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          if (!emailRegex.hasMatch(value.trim())) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                        myController: controllerEmail,
                        labelText: "Email",
                        hintText: "Enter your email",
                        myFocusNode: emailFocusNode,
                        nextFocusNode: passwordFocusNode,
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormFiled(
                              formState: _signUpFormKey,
                              validatorInvalid: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                } else if (value.length < 8) {
                                  return 'Password must be at least 8 characters';
                                } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$').hasMatch(value)) {
                                  return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
                                }
                                return null;
                              },
                              obscure: true,
                              myController: controllerPassword,
                              labelText: "Password",
                              hintText: "Enter password",
                              myFocusNode: passwordFocusNode,
                              nextFocusNode: confirmPasswordFocusNode,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: CustomTextFormFiled(
                              formState: _signUpFormKey,
                              validatorInvalid: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Confirm password is required';
                                } else if (value != controllerPassword.text) {
                                  return 'Passwords do not match';
                                } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$').hasMatch(value)) {
                                  return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
                                }
                                return null;
                              },
                              obscure: true,
                              myController: controllerConfirmPassword,
                              labelText: "Confirm password",
                              hintText: "Confirm password",
                              myFocusNode: confirmPasswordFocusNode,
                              nextFocusNode: phoneFocusNode,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormFiled(
                        formState: _signUpFormKey,
                        validatorInvalid: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number is required';
                          } else if (!RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(value)) {
                            return 'Invalid phone number format for any country';
                          }
                          return null;
                        },
                        myController: controllerPhoneNumber,
                        labelText: "Phone number",
                        hintText: "Enter phone number",
                        myFocusNode: phoneFocusNode,
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 50.w),
                          BuildGenderOption(
                            title: "female",
                            selectedGender: gender,
                            onSelect: (val) {
                              setState(() {
                                gender = val;
                                cheakGender = null; // مسح الرسالة التحذيرية لما يختار الـ gender
                              });
                            },
                          ),
                          SizedBox(width: 20.w),
                          BuildGenderOption(
                            title: "male",
                            selectedGender: gender,
                            onSelect: (val) {
                              setState(() {
                                gender = val;
                                cheakGender = null; // مسح الرسالة التحذيرية لما يختار الـ gender
                              });
                            },
                          ),
                        ],
                      ),
                      Text(
                        cheakGender ?? "",
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                            "Creating an account, you agree to our",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Terms&Conditions",
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Consumer<SignUpViewModel>(
                        builder: (context, value, child) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (value.user != null && !value.isLoading) {
                              Navigator.pushNamed(context, RoutesManger.home);
                            }
                          });
                          return Column(
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  if (_signUpFormKey.currentState!.validate() && gender != null) {
                                    signUpViewModel.createAccount(
                                      email: controllerEmail.text,
                                      lastName: controllerLastName.text,
                                      firstName: controllerFirstName.text,
                                      password: controllerPassword.text,
                                      rePassword: controllerConfirmPassword.text,
                                      gender: gender!,
                                      phone: controllerPhoneNumber.text,
                                    );
                                  }
                                  else {
                                    if (gender == null) {
                                      setState(() {
                                        cheakGender = "Please enter gender";
                                      });
                                    }
                                  }

                                },
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                    Size(double.infinity, 60.h),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(Colors.pink),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                  ),
                                  elevation: MaterialStateProperty.all(10),
                                ),
                                child: value.isLoading
                                    ? SizedBox(
                                  height: 24.h,
                                  width: 24.h,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    strokeWidth: 2,
                                  ),
                                )
                                    : Text("Sign Up",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                value.error ?? "",
                                style: TextStyle(color: Colors.red, fontSize: 12.sp),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                RoutesManger.login,
                              );
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }



}
