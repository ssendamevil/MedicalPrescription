import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/screens/patient/order_screen.dart';

class OrderScreenItem extends StatefulWidget {
  const OrderScreenItem({Key? key}) : super(key: key);

  @override
  State<OrderScreenItem> createState() => _OrderScreenItemState();
}

class _OrderScreenItemState extends State<OrderScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-40,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
              offset: Offset(4, 4),
              color: Color(0xffE7E7E7),
              blurRadius: 3
          ),
          BoxShadow(
              offset: Offset(-3, -3),
              color: Color(0xffE7E7E7),
              blurRadius: 3
          ),
        ],
        color: Colors.white,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const OrderScreen()));
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffA8FF92),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Text(
                    "Готов к выдаче",
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff177500)
                    ),
                  ),
                ),
                Text("1560₸", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18.0),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Самовывоз №945", style: GoogleFonts.montserrat(fontSize: 12.0,color: Colors.grey),),
                Text("2 товара", style: GoogleFonts.montserrat(fontSize: 12.0),)
              ],
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 65,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network("https://st.europharma.kz/cache/product/2135/x248_5f6874ea35695.png",);
                },
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 5,),
                itemCount: 1
              ),
            )
          ],
        ),
      ),
    );
  }
}
