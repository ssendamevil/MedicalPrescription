import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class SliderPrescriptions extends StatelessWidget {
  const SliderPrescriptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: index==0? const EdgeInsets.only(left: 20.0, right: 5.0,top: 5.0, bottom: 5.0) :
            index==3? const EdgeInsets.only(left: 5.0, right: 20.0,top: 5.0, bottom: 5.0) : const EdgeInsets.all(5.0),
            child: Container(
              width: MediaQuery.of(context).size.width-40,
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(width: 1.0, color: Colors.grey),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      color: Color(0xffB1B0B0)
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 120,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: const Center(child: Text("Received")),
                      ),
                      const Text("19.10.2024")
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "City polyclinic No.4",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10,),
                  const Text("Doctor"),
                  const Text("Berikov Berik Berikulu"),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Discharged"),
                          Text("1 medication, 15 products"),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: (){},
                        child: const Text("Open"),
                        style: ButtonStyle(
                          surfaceTintColor: MaterialStatePropertyAll(Colors.black),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: 4,
      )
    );
  }
}
