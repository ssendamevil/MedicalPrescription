import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';
import 'package:medical_prescription/presentation/components/faq_item.dart';
import 'package:medical_prescription/presentation/pages/patient/profile_page.dart';


class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: (){
              profilePageIndex.value = 0;
            },
            icon: const Icon(Iconsax.arrow_left)
        ),
        title: const Text(
          "FAQ",
        ),
        centerTitle: true,
        shape: Border(
            bottom: BorderSide(color: customBlack.shade100, width: 1)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index){
              return const FAQItem();
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemCount: 10
          ),
        ),
      ),
    );
  }
}
