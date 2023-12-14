import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderBanner extends StatefulWidget {
  SliderBanner({Key? key}) : super(key: key);

  @override
  State<SliderBanner> createState() => _SliderBannerState();
}

class _SliderBannerState extends State<SliderBanner> {
  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              viewportFraction: 1,
              onPageChanged: (index, reason){
                setState((){
                  myCurrentIndex = index;
                });
              }
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width-40.0,
                    decoration: const BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    )
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 10,),
        AnimatedSmoothIndicator(
            activeIndex: myCurrentIndex,
            count: 5,
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              dotColor: Colors.grey.shade200,
              activeDotColor: Colors.black
            ),
        )
      ],
    );;
  }
}
