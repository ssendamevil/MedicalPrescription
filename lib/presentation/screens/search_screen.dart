import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/pages/search_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(searchPageScreenIndex.value == 0){
          return true;
        }
        searchPageScreenIndex.value = 0;
        return false;
      },
      child: SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width-100,
                      height: 40,
                      child: TextField(
                        cursorColor: Color(0xff069893),
                        autofocus: true,
                        style: GoogleFonts.montserrat(
                          fontSize: 18
                        ),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.black45,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(
                              color: Color(0xff069893),
                              width: 2.0
                            )
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(
                                  color: Color(0xff069893),
                                  width: 2.0
                              )
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15)
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: (){
                          searchPageScreenIndex.value = 0;
                        },
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          ),
                        )
                    )
                  ],
                ),
                const SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "History",
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          color: const Color(0xff868686)
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text(
                          "Clear",
                          style: GoogleFonts.montserrat(
                          ),
                        )
                      )
                    ],
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }
}
