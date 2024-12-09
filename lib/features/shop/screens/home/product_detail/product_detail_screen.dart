// ignore_for_file: unused_import, unnecessary_import

import 'dart:async';

import 'package:biriyani/common/app_style.dart';
import 'package:biriyani/common/appbar/custom_appbar.dart';
import 'package:biriyani/common/custom_shapes/curved_edges_widget.dart';
import 'package:biriyani/common/heading.dart';
import 'package:biriyani/common/reusable_text.dart';
import 'package:biriyani/features/authentication/models/product.dart';
import 'package:biriyani/features/shop/screens/home/widgets/food_list.dart';
import 'package:biriyani/features/shop/screens/home/widgets/food_widget.dart';
import 'package:biriyani/features/shop/screens/home/widgets/my_dot_navigation.dart';
import 'package:biriyani/features/shop/screens/product_review/product_review.dart';
import 'package:biriyani/navigation_menu.dart';
import 'package:biriyani/utils/animation/page_transition.dart';
import 'package:biriyani/utils/constants/sizes.dart';
import 'package:biriyani/utils/helpers/box_decoration_helper.dart';
import 'package:biriyani/utils/themes/app_colors.dart';
import 'package:biriyani/utils/themes/theme_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  // ignore: library_private_types_in_public_api
  State createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;
  bool _showBottomNav = false;

  @override
  void initState() {
    super.initState();
    print("Timer started for 7 seconds...");
    // Add a delay before showing the BottomNavigationBar
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _showBottomNav = true;
      });
      print("BottomNavigationBar is now visible");
    });
  }

  @override
  Widget build(BuildContext context) {
    final playDuration = 600.ms;

    return Scaffold(
      // Bottom Navigation Bar
      bottomNavigationBar: _showBottomNav
          ? const BottomNavigationBtn().animate().slideY(
                begin: 1, // Start below the screen
                end: 0, // End at normal position
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 800),
              )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailImages(
              images: widget.product.images,
              playDuration: playDuration,
              product: widget.product,
            ),
            NoTransitionAnimation(
              child: Padding(
                padding: const EdgeInsets.symmetric(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon Row

                    const SizedBox(height: MySizes.spaceBtwItems),
                    // Product name and description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.product.itemName,
                                style: appStyle(
                                    24,
                                    ThemeUtils.dynamicTextColor(context),
                                    FontWeight.w600),
                              ),
                              const Icon(Icons.share),
                            ],
                          ),

                          // Description
                          Text(
                            widget.product.description,
                            style: appStyle(12, Colors.grey, FontWeight.normal),
                          ),
                        ],
                      )
                          .animate()
                          .fadeIn(
                              duration: 300.ms,
                              delay: playDuration,
                              curve: Curves.decelerate)
                          .slideX(begin: 0.2, end: 0),
                    ),
                    const SizedBox(height: MySizes.spaceBtwSections),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ReusableText(
                        text: 'Recommended dishes',
                        style: appStyle(
                            17,
                            ThemeUtils.dynamicTextColor(context),
                            FontWeight.w500),
                      ),
                    ).animate().scaleXY(
                        begin: 0,
                        end: 1,
                        delay: 300.ms,
                        duration: playDuration - 100.ms,
                        curve: Curves.decelerate),

                    const FoodList().animate().scaleXY(
                        begin: 0,
                        end: 1,
                        delay: 300.ms,
                        duration: playDuration - 100.ms,
                        curve: Curves.decelerate)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  final Duration playDuration;
  const IconRow({
    super.key,
    required this.playDuration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://lottie.host/8dfd4a81-7e97-4d67-a2e3-c2b41c85a4fc/YO9p60Liua.json',
                width: 40.w, // Set width to a fraction of screen width
                height: 40.h, // Set height to a fraction of screen height
                fit: BoxFit
                    .contain, // Ensure the animation scales without distortion
              ),
              SizedBox(height: 3.h),
              const Text('20-25 min'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://lottie.host/01e5a673-32f6-4567-9699-7d876f4a3520/mIMXpWSAo5.json',
                width: 40.w, // Set width to a fraction of screen width
                height: 40.h, // Set height to a fraction of screen height
                fit: BoxFit
                    .contain, // Ensure the animation scales without distortion
              ),
              SizedBox(height: 3.h),
              const Text('10-15 min'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://lottie.host/956b8811-6f7c-433d-84f2-4106dc5da4df/X2loWr48kp.json',
                width: 40.w, // Set width to match the previous Lottie width
                height: 40.h, // Set height to match the previous Lottie height
                fit: BoxFit.contain, // Ensure the animation scales properly
              ),
              SizedBox(height: 3.h),
              const Text('4.9'),
            ],
          ),
          //
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://lottie.host/f1bae17f-9cb6-4dac-8571-db15b0f011f9/nCb5tKgyIc.json',
                width: 40.w, // Set width to match the previous Lottie width
                height: 40.h, // Set height to match the previous Lottie height
                fit: BoxFit.contain, // Ensure the animation scales properly
              ),
              SizedBox(height: 3.h),
              const Text('350g  '),
            ],
          ),
        ],
      ).animate().scaleXY(
          begin: 0,
          end: 1,
          delay: 300.ms,
          duration: playDuration - 100.ms,
          curve: Curves.decelerate),
    );
  }
}

class BottomNavigationBtn extends StatefulWidget {
  const BottomNavigationBtn({
    super.key,
  });

  @override
  State<BottomNavigationBtn> createState() => _BottomNavigationBtnState();
}

class _BottomNavigationBtnState extends State<BottomNavigationBtn> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 12.h),
      decoration: BoxDecoration(
        color: ThemeUtils.sameBrightness(context),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),

      // Add to Cart and price
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                '₹199.0',
                style: appStyle(
                    18, ThemeUtils.dynamicTextColor(context), FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.remove_circle_outline_outlined,
                  size: 28,
                  color: AppColors.accentColor,
                ),
                SizedBox(width: 6.w),
                Text(
                  '2',
                  style: appStyle(17, ThemeUtils.dynamicTextColor(context),
                      FontWeight.w400),
                ),
                SizedBox(width: 6.w),

                // ignore: prefer_const_constructors
                Icon(Icons.add_circle_outline_outlined,
                    size: 28, color: AppColors.accentColor),
              ],
            ),
          ),
          SizedBox(
            width: 135.w,
            height: 37.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentColor,
                  foregroundColor: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r))),
              onPressed: () {
                showVerificationSheet(context);
              },
              child: isAdded
                  ? Lottie.network(
                      'https://lottie.host/7468eb62-5726-4522-acad-799587cb5a84/CAPyRQ8Ux2.json',
                      width: 35,
                      height: 35,
                      repeat: false)
                  : const Text('Add to Cart'),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Future<dynamic> showVerificationSheet(BuildContext context) {
    bool _rememberMe = false; // Initial state
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: 280.h,
              padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 12.h),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(9.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'Chicken Biriyani',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        '₹199',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration:
                                              getDynamicBoxDecoration(context),
                                          child: const Icon(Icons.close),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                child: Column(
                                  children: [
                                    Text(
                                      'Customize as per your taste',
                                      style: appStyle(
                                        19,
                                        ThemeUtils.dynamicTextColor(context),
                                        FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Divider(
                                thickness: 0.3,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: MySizes.spaceBtwItems),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: getDynamicBoxDecoration(context),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/icons/add-to-cart.png',
                                              width: 20.w,
                                            ),
                                            const SizedBox(width: 5),
                                            const Text('Chicken Fry')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.add,
                                              size: 13,
                                            ),
                                            const Text(' 110'),
                                            Transform.scale(
                                              scale: 0.8,
                                              child: Checkbox(
                                                value: _rememberMe,
                                                side: BorderSide(
                                                  color: ThemeUtils
                                                      .dynamicTextColor(
                                                          context),
                                                ),
                                                onChanged: (value) {
                                                  setModalState(() {
                                                    _rememberMe = value!;
                                                  });
                                                },
                                                activeColor:
                                                    AppColors.primaryColor,
                                                checkColor: Colors.white,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: MySizes.spaceBtwItems),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(thickness: 0.3,color: Colors.grey,),
                  // Bottom Navigation Bar
                  Container(
                    height: 60,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left: Price
                        const Text(
                          'Total: ₹199',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        // Right: Button
                        SizedBox(
                          width: 135.w,
                          height: 37.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.accentColor,
                                foregroundColor: Colors.white.withOpacity(0.9),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r))),
                            onPressed: () {
                              Navigator.pop(context); // Example action
                            },
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

// Checkout Button
class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Checkout',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: ThemeUtils.sameBrightness(context)),
            )));
  }
}

class ProductDetailImages extends StatefulWidget {
  final Duration playDuration;
  final List<String> images;
  const ProductDetailImages({
    super.key,
    required this.product,
    required this.images,
    required this.playDuration,
  });

  final Product? product;

  @override
  State<ProductDetailImages> createState() => _ProductDetailImagesState();
}

class _ProductDetailImagesState extends State<ProductDetailImages> {
  @override
  Widget build(BuildContext context) {
    return MyCurvedWidget(
      child: Container(
        color: Colors.grey.withOpacity(0.2),
        child: Stack(
          children: [
            // Carousel Slider positioned at the base of the stack
            CarouselSlider(
              items: widget.images.map((imagePath) {
                return Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              }).toList(),
              options: CarouselOptions(
                height: 325.h,
                enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 1,
                aspectRatio: 16 / 9,
              ),
            )
                .animate(delay: 400.ms)
                .shimmer(duration: widget.playDuration - 200.ms)
                .fade(),

            // Positioning the AppBar above the CarouselSlider
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: MyAppBar(
                showBackArrow: true,
                actions: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: BoxShape.circle),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {},
                      child: Icon(
                        Iconsax.heart,
                        color: ThemeUtils.dynamicTextColor(context),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // Dot navigation at the bottom of the image
          ],
        ),
      ),
    );
  }
}
