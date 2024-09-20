import 'package:ekarma/configs/app_assets.dart';
import 'package:ekarma/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:ekarma/core/routes/paths.dart' as paths;
import 'package:go_router/go_router.dart';

class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      backgroundImage: AppAssets.hireWorkerImage,
      text: 'Hire \nWorker',
    ),
    OnboardingItem(
      backgroundImage: AppAssets.getWorkDoneImage,
      text: 'Get \nWork Done',
    ),
    OnboardingItem(
      backgroundImage: AppAssets.earnMoneyImage,
      text: 'Earn \nExtra Money',
      isLastPage: true,
    ),
  ];

  int currentIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.decelerate,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _changePage() {
    _animationController.reverse().then((_) {
      setState(() {
        if (currentIndex == onboardingItems.length - 1) {
          currentIndex = 0;
        } else {
          currentIndex++;
        }
      });
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Stack(
                  children: [
                    Container(
                      color: Colors.black,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: Image.asset(
                          onboardingItems[currentIndex].backgroundImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      color: Colors.black.withOpacity(0.6),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.1, right: 6),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      context.go(paths.login);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width*0.05, vertical: MediaQuery.of(context).size.height*0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: Text('Skip',
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1),
                    child: Column(
                      children: [
                        Text(
                            maxLines: 2,
                          onboardingItems[currentIndex].text,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        if (onboardingItems[currentIndex].isLastPage) {
                          context.go(paths.login);

                        } else {
                          _changePage();
                        }
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: AppColors.bgWhiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String backgroundImage;
  final String text;
  final bool isLastPage;

  OnboardingItem({
    required this.backgroundImage,
    required this.text,
    this.isLastPage = false,
  });
}
