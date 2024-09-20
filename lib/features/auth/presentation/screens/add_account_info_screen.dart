import 'dart:developer';

import 'package:ekarma/configs/app_assets.dart';
import 'package:ekarma/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:ekarma/core/routes/paths.dart' as path;
import 'package:go_router/go_router.dart';

class AddAccountInfoScreen extends StatefulWidget {

  const AddAccountInfoScreen({super.key});

  @override
  State<AddAccountInfoScreen> createState() => _AddAccountInfoScreenState();
}

class _AddAccountInfoScreenState extends State<AddAccountInfoScreen> {

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
                height: MediaQuery.of(context).size.height*0.03,
              ),

              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Select Your Account Type",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height*0.26,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: GridView.builder(
                        itemCount: 2,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ), itemBuilder: (context, index) {
                            return Padding(
                              padding: index==0?const EdgeInsets.only(right: 8.0): const EdgeInsets.all(0.0),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.primaryColor)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(AppAssets.otpImg, height: MediaQuery.of(context).size.height*0.15,),
                                          Text("Task Taker", style: Theme.of(context).textTheme.titleSmall,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  index==0?Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      child: Icon(Icons.done, color: Colors.white,),
                                    ),
                                  ):Container(height: 0,),
                                ],
                              )
                            );
                          },),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                    const Text("Hello, Independent Task Taker. Please enter following details to start working."),

                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        "Full Name",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        isDense: true, // important line
                        hintText: "What should we call you?",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        "Birthday",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          isDense: true, // important line
                          hintText: "When is your birthday?",
                        hintStyle: Theme.of(context).textTheme.bodyMedium
                      ),
                    ),


                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                    InkWell(
                      onTap: (){
                        context.go(path.workerHome);
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
                            child: Text("GET STARTED", style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w800, color: Colors.white),),
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
