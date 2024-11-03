import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tahadoapp/logic/login_cubit/login_cubit.dart';
import 'package:tahadoapp/model/onboarding_model.dart';
import 'package:tahadoapp/ui/auth/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController pageController = PageController();
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        itemCount: OnboardingModel.onboardingList.length,
        onPageChanged: (int index) {
          setState(() {
            indexPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(OnboardingModel.onboardingList[index].image),
                const SizedBox(height: 16),
                Text(
                  OnboardingModel.onboardingList[index].title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  OnboardingModel.onboardingList[index].description,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (indexPage !=
                          OnboardingModel.onboardingList.length - 1)
                        InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                (route) => false);
                            pageController.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn);
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      if (indexPage !=
                          OnboardingModel.onboardingList.length - 1)
                        SmoothPageIndicator(
                          axisDirection: Axis.horizontal,
                          controller: pageController,
                          count: OnboardingModel.onboardingList.length,
                          effect: const WormEffect(),
                          onDotClicked: (index) {
                            pageController.jumpToPage(index);
                          },
                        ),
                      if (indexPage !=
                          OnboardingModel.onboardingList.length - 1)
                        FloatingActionButton(
                            onPressed: () {
                              if (indexPage !=
                                  OnboardingModel.onboardingList.length - 1) {
                                pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: const Icon(
                              Icons.arrow_forward,
                              size: 30,
                            )),
                      if (indexPage ==
                          OnboardingModel.onboardingList.length - 1)
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            height: 80,
                            width: 120,
                            padding: const EdgeInsets.all(10),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                    (route) => false);
                              },
                              child: const Text(
                                "Get Started",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
