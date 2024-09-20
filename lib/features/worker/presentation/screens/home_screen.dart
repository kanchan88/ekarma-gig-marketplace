import 'package:ekarma/configs/app_colors.dart';
import 'package:ekarma/features/worker/presentation/widgets/job_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                height: MediaQuery.of(context).size.height*0.25,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.03,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hi, Kanchan', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.w800),),
                              Text('Let\'s start earning!', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),

                            ],
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryOffColor,
                              borderRadius: BorderRadius.circular(8.0),

                            ),
                            child: InkWell(
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.notifications_active_outlined),
                              ),
                              onTap: (){},
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.02,
                      ),

                      TextFormField(

                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.white, width: 0.0),
                            ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white, width: 0.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          isDense: true,
                          hintText: 'Search Works',
                          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black38),
                          prefixIcon: Icon(Icons.search,size:MediaQuery.of(context).size.height*0.04, color: Colors.black38,)
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10.0),
                child: Text('Explore Tasks', style: Theme.of(context).textTheme.titleMedium),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.6,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                        child: JobWidget(),
                      );
                    },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
