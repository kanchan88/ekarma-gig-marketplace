import 'dart:developer';

import 'package:ekarma/configs/app_assets.dart';
import 'package:ekarma/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ekarma/core/routes/paths.dart' as path;
import 'package:go_router/go_router.dart';


class OTPScreen extends StatefulWidget {

  final PhoneNumber number;

  const OTPScreen({super.key, required this.number});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _otpController = TextEditingController();
  bool enableButton = false;


  @override
  void dispose() {
    _otpController.clear();
    super.dispose();
  }


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

              SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
              ),

              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.height*0.04,
                          vertical: MediaQuery.of(context).size.height*0.04
                      ),
                      child: Image.asset(AppAssets.otpImg),
                    ),

                    Text(
                      "Enter your OTP",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'OTP has been send to your mobile number you submitted : ',
                          style: Theme.of(context).textTheme.bodySmall,
                          children: <TextSpan>[
                            TextSpan(text: "${widget.number.countryCode}-${widget.number.number}", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: PinCodeTextField(
                        onChanged: (value) {
                          setState(() {
                            enableButton = value.length == 6;
                          });
                        },
                        textStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontSize: 20, color: AppColors.primaryColor),
                        hintCharacter: "X",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.black38, fontSize: 20),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        controller: _otpController,
                        appContext: context,
                        length: 6,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.circle,
                          activeColor: AppColors.primaryColor,
                          selectedColor: Colors.grey,
                          inactiveColor: Colors.grey,
                          disabledColor: Colors.grey,
                          fieldHeight: 54,
                          fieldWidth: 54,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                    InkWell(
                      onTap: (){
                        if(enableButton){
                          context.push(path.addAccountInfo);
                        }
                      },
                      child: enableButton==false?Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.primaryOffColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                            child: Text("CONTINUE", style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w800, color: Colors.white),),
                          ),
                        ),
                      ):Container(
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
