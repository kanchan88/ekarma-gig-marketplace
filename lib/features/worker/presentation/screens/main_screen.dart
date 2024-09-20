


import 'package:ekarma/configs/app_assets.dart';
import 'package:ekarma/configs/app_colors.dart';
import 'package:ekarma/features/worker/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class WorkerMainScreen extends StatefulWidget {
  const WorkerMainScreen({Key? key}) : super(key: key);

  @override
  State<WorkerMainScreen> createState() => _WorkerMainScreenState();
}


class _WorkerMainScreenState extends State<WorkerMainScreen> {
  int currentScreen = 0;



  Future<bool>? _onWillPop(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Close EKarma",
          style: TextStyle(color: AppColors.primaryColor),
        ),
        content: const Text("Are you sure you want to exit the app?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(color: Colors.white)),
                backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primaryColor)),
            child: const Text(
              "No",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop', true);
            },
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(color: Colors.white)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context)!,
      child: SafeArea(
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
              backgroundColor: const Color(0xFFF5F5F5),
              bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: const Color(0xFAFAFAFA),
                  selectedFontSize: 17,
                  unselectedFontSize: 16,
                  selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                  currentIndex: currentScreen,
                  onTap: (val) {
                    setState(() {
                      currentScreen = val;
                    });
                  },
                  items: [

                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          AppAssets.homeIcon,
                          color: currentScreen == 0 ? AppColors.primaryColor : Colors.black,
                          height: 32,
                        ),
                      ),
                      label: "Home",
                    ),

                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          AppAssets.chatIcon,
                          color: currentScreen == 1 ? AppColors.primaryColor : Colors.black,
                          height: 32,
                        ),
                      ),
                      label: "Chats",
                    ),

                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(AppAssets.jobsIcon,
                          color: currentScreen == 2 ? AppColors.primaryColor : Colors.black,
                          height: 32,
                        ),
                      ),
                      label: "Jobs",
                    ),

                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          AppAssets.userIcon,
                          color: currentScreen == 3 ? AppColors.primaryColor : Colors.black,
                          height: 32,
                        ),
                      ),
                      label: "Account",
                    ),
                  ],
                ),
              ),
              body: _buildScreens()[currentScreen]
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
}