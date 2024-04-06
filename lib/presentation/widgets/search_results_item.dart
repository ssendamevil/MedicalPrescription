import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SearchResultsItem extends StatefulWidget {
  const SearchResultsItem({Key? key}) : super(key: key);

  @override
  State<SearchResultsItem> createState() => _SearchResultsItemState();
}

class _SearchResultsItemState extends State<SearchResultsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color(0xffB1B0B0)
          )
        ]
      ),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(Colors.black),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )
          ),
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        ),
        onPressed: (){},
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network("https://st.europharma.kz/cache/product/2135/x248_5f6874ea35695.png"),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Но-шпа", style: Theme.of(context).textTheme.headlineSmall,),
                        SizedBox(height: 4,),
                        Row(
                          children: [
                            Icon(Iconsax.warning_2, size: 16,color: Colors.orange,),
                            SizedBox(width: 5,),
                            Text(
                              "On Prescription",
                              style: TextStyle(
                                  color: Colors.orange
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text("Flacon, 0.5g",style: Theme.of(context).textTheme.bodyLarge,),
                        SizedBox(height: 5,),
                        Text("PJSC Sintez Joint Stock Kurgan, Russia",style: Theme.of(context).textTheme.bodyLarge,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("from 354₸", style: Theme.of(context).textTheme.titleLarge,),
                        SizedBox(
                          height: 37,
                          width: 100,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(Colors.transparent),
                              foregroundColor: MaterialStatePropertyAll(Colors.black),
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                              backgroundColor: MaterialStatePropertyAll(Color(0xff39CBC6))
                            ),
                            onPressed: (){},
                            child: Text("Add", style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14))
                          ),
                        )
                      ],
                    )
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