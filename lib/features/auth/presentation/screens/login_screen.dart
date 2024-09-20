import 'dart:developer';

import 'package:ekarma/configs/app_assets.dart';
import 'package:ekarma/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:go_router/go_router.dart';
import 'package:ekarma/core/routes/paths.dart' as path;

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _phoneEditingController = "";
  bool checkBoxValue = false;
  bool isPhoneValid = false;
  PhoneNumber? number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Image.asset(AppAssets.ellipseImg),

              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height*0.02,
                        vertical: MediaQuery.of(context).size.height*0.04
                      ),
                      child: Image.asset(AppAssets.loginBgImage),
                    ),

                    Text(
                      "Enter your mobile number",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Please enter your mobile number - Verify OTP & surf eKarma to get work done.",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            child: IntlPhoneField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                focusColor: AppColors.primaryColor,
                                border: OutlineInputBorder(),
                                label: Text("Mobile Number",
                                    style: Theme.of(context).textTheme.bodyMedium),
                              ),
                              initialCountryCode: 'NP',
                              flagsButtonPadding: const EdgeInsets.all(4),
                              dropdownIconPosition: IconPosition.trailing,
                              flagsButtonMargin:
                              const EdgeInsets.only(right: 20, bottom: 0, left: 10.0),

                              onChanged: (phone) {
                                // Handle phone number changes

                                setState(() {

                                  try {
                                    isPhoneValid = phone.isValidNumber();
                                  } catch (e) {
                                    log(e.toString());
                                  }

                                  number = phone!;

                                  _phoneEditingController = phone.completeNumber;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        if (!isPhoneValid) {
                          Fluttertoast.showToast(msg: "Invalid Phone Number!");
                        } else {
                          context.push(path.otp, extra: number);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                            child: Text("CONTINUE", style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w800, color: Colors.white),),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
