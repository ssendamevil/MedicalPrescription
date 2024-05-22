import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderBanner extends StatefulWidget {
  const SliderBanner({Key? key}) : super(key: key);

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
              height: 200.0,
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
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width-40.0,
                    height: 180,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(4, 4),
                            color: Color(0xffE7E7E7),
                            blurRadius: 3
                        ),
                        BoxShadow(
                            offset: Offset(-4, -4),
                            color: Color(0xffE7E7E7),
                            blurRadius: 3
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/bannerimage.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10,),
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
