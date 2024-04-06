import 'package:flutter/material.dart';

class RecentOrderSlider extends StatelessWidget {
  const RecentOrderSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0, right: 5.0),
            child: Container(
              width: MediaQuery.of(context).size.width-40,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: MediaQuery.of(context).size.width-40,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0, right: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width-40,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
