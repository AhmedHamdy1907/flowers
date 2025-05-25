import 'package:flower/presentaion/Authentication/login_screen/view_model/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../core/routsManger/routs_manger.dart';
import '../../widget/custom_Text_form_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SignInViewModel signInViewModel = SignInViewModel();
  bool iShow = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<
      FormState>(); // تم تعديل الـ GlobalKey
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign In", style: GoogleFonts.aclonica(fontSize: 23)),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ChangeNotifierProvider.value(
          value: signInViewModel,
          child: Form(
            key: _loginFormKey, // تم تعديل الـ GlobalKey
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(
                        "Welcome 😊",
                        style: GoogleFonts.alatsi(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Please enter your email and password\nor Continue With Social Media",
                        style: GoogleFonts.acme(
                          fontSize: 20,
                          color: Colors.black38,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormFiled(
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
                      formState: _loginFormKey,
                      // تم تعديل الـ GlobalKey
                      myFocusNode: emailFocusNode,
                      nextFocusNode: passwordFocusNode,
                      myController: emailController,
                      suffixIcon: Icon(Icons.email_outlined),
                      hintText: "Enter Your Email",
                      labelText: "Email",
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormFiled(
                      validatorInvalid: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      formState: _loginFormKey,
                      // تم تعديل الـ GlobalKey
                      myFocusNode: passwordFocusNode,
                      suffixIcon: InkWell(
                        onTap: () {
                          iShow = !iShow;
                          setState(() {});
                        },
                        child:
                        iShow
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      myController: passwordController,
                      obscure: iShow,
                      hintText: "Enter Your password",
                      labelText: "password",
                    ),
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Forget password?",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Consumer<SignInViewModel>(
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_loginFormKey.currentState!.validate()) {
                                  value.loginUser(email: emailController.text,
                                      password: passwordController.text);
                                  if (value.error == null &&
                                      value.token != null) {
                                    Navigator.pushReplacementNamed(
                                        context, RoutesManger.home);
                                  }
                                }
                              },
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity, 60.h),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.pink),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                elevation: MaterialStateProperty.all(10),
                              ),
                              child: value.isLoading?Center(child: CircularProgressIndicator()) : Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                            ),


                            SizedBox(height: 15.h,),
                            (!value.isLoading && value.error != null)
                                ?  Container(
                              decoration: BoxDecoration(
                                color: Colors.redAccent.withOpacity(0.15), // لون أحمر شفاف خفيف
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.r),  // نتوء مدور من فوق الشمال
                                  bottomLeft: Radius.circular(20.r),
                                  bottomRight: Radius.circular(20.r),
                                  topRight: Radius.circular(10.r),
                                ),
                                border: Border.all(
                                  color: Colors.redAccent, // حدود بلون أحمر حيوي
                                  width: 1.5,
                                ),
                              ),
                              padding: REdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                              child: Row(
                                children: [
                                  Icon(Icons.error_outline, color: Colors.redAccent, size: 24.sp),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: Text(
                                      "Hmm... that doesn’t look right. Check your email and password and try again.",
                                      style: TextStyle(
                                        color: Colors.redAccent.shade700,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ) : SizedBox.shrink(),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 15.h),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesManger.home);
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(double.infinity, 60.h),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        elevation: MaterialStateProperty.all(10),
                      ),
                      child: Text(
                        "Continue as guest",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              RoutesManger.signUp,
                            );
                          },
                          child: Text(
                            "Sign up",
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
      ),
    );
  }
}
