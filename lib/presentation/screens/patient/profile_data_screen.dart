import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';
import 'package:medical_prescription/presentation/pages/patient/profile_page.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({Key? key}) : super(key: key);

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  TextEditingController dateCtl = TextEditingController();
  TextEditingController firstNameCtl = TextEditingController();
  TextEditingController lastNameCtl = TextEditingController();
  TextEditingController secondNameCtl = TextEditingController();

  @override
  void initState() {
    dateCtl.text = "18.05.2004";
    firstNameCtl.text = "Orynbassar";
    lastNameCtl.text = "Ali";
    secondNameCtl.text = "Askaruly";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark? Colors.black : const Color(0xffF0F0F0),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: (){
            profilePageIndex.value = 0;
          },
          icon: const Icon(Iconsax.arrow_left)
        ),
        title: const Text(
          "Мои данные",
        ),
        centerTitle: true,
        shape: Border(
            bottom: BorderSide(color: customBlack.shade100, width: 1)
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ElevatedButton(
                          onPressed: (){},
                          style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(EdgeInsets.zero)
                          ),
                          child: Container(
                            width: 123,
                            height: 123,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: const Color(0xff13665F), width: 3)
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/images/profile.jpeg"),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 10,
                          right: 5,
                          child: Icon(CupertinoIcons.camera_fill, color: Color(0xff13665F),)
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: (){
                        showModalBottomSheet(
                          context: context,
                          builder: ((context){
                            return Container(
                              height: 255,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(top: 20, bottom: 50, right: 15, left: 15),
                              decoration: BoxDecoration(
                                color: const Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: const EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      child: TextButton(
                                        onPressed: (){},
                                        style: ButtonStyle(
                                          foregroundColor: const MaterialStatePropertyAll(Colors.black),
                                          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                                          shape: const MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero
                                            )
                                          ),
                                          textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500
                                          ))
                                        ),
                                        child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Camera"),
                                            Icon(CupertinoIcons.camera, size: 25,)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: const Color(0xffD7D7D7),
                                      width: MediaQuery.of(context).size.width,
                                      height: 1,
                                    ),
                                    SizedBox(
                                      height: 60,
                                      child: TextButton(
                                        onPressed: (){},
                                        style: ButtonStyle(
                                            foregroundColor: const MaterialStatePropertyAll(Colors.black),
                                            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                                            shape: const MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero
                                                )
                                            ),
                                            textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500
                                            ))
                                        ),
                                        child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Choose photo"),
                                            Icon(CupertinoIcons.photo, size: 25,)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: const Color(0xffD7D7D7),
                                      width: MediaQuery.of(context).size.width,
                                      height: 1,
                                    ),
                                    SizedBox(
                                      height: 60,
                                      child: TextButton(
                                        onPressed: (){},
                                        style: ButtonStyle(
                                            foregroundColor: const MaterialStatePropertyAll(Colors.red),
                                            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                                            shape: const MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero
                                                )
                                            ),
                                            textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500
                                            ))
                                        ),
                                        child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Delete photo"),
                                            Icon(CupertinoIcons.delete, size: 25,)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                        );
                      },
                      style: ButtonStyle(
                        surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
                        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                        foregroundColor: const MaterialStatePropertyAll(Color(0xff13665F)),
                        textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(fontSize: 16.0))
                      ),
                      child: const Text("Изменить фото"),
                    )
                  ],
                ),
              ),
              Text("Фамилия", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: const Color(0xff646668)),),
              const SizedBox(height: 10,),
              TextFormField(
                controller: firstNameCtl,
                style: GoogleFonts.montserrat(fontSize: 16),
                decoration: InputDecoration(
                  isDense: true,
                  suffixIcon: const Icon(Iconsax.edit, color: Color(0xff13665F), size: 21,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Color(0xffBEBEBE),width: 2.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF9FAFB),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Color(0xff13665F),width: 2.0),
                  ),
                  contentPadding: const EdgeInsets.only(left: 20, bottom: 15, top: 15),
                ),
              ),
              const SizedBox(height: 20,),
              Text("Имя", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: const Color(0xff646668)),),
              const SizedBox(height: 10,),
              TextFormField(
                controller: lastNameCtl,
                style: GoogleFonts.montserrat(fontSize: 16),
                decoration: InputDecoration(
                  isDense: true,
                  suffixIcon: const Icon(Iconsax.edit, color: Color(0xff13665F), size: 21,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Color(0xffBEBEBE),width: 2.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF9FAFB),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Color(0xff13665F),width: 2.0),
                  ),
                  contentPadding: const EdgeInsets.only(left: 20, bottom: 15, top: 15),
                ),
              ),
              const SizedBox(height: 20,),
              Text("Отечество", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: const Color(0xff646668)),),
              const SizedBox(height: 10,),
              TextFormField(
                controller: secondNameCtl,
                style: GoogleFonts.montserrat(fontSize: 16),
                decoration: InputDecoration(
                  isDense: true,
                  suffixIcon: const Icon(Iconsax.edit, color: Color(0xff13665F), size: 21,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Color(0xffBEBEBE),width: 2.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF9FAFB),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Color(0xff13665F),width: 2.0),
                  ),
                  contentPadding: const EdgeInsets.only(left: 20, bottom: 15, top: 15),
                ),
              ),
              const SizedBox(height: 20,),
              Text("Дата рождения", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: const Color(0xff646668)),),
              const SizedBox(height: 10,),
              TextFormField(
                controller: dateCtl,
                style: GoogleFonts.montserrat(fontSize: 16),
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  isDense: true,
                  suffixIcon: const Icon(Iconsax.edit, color: Color(0xff13665F), size: 21,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Color(0xffBEBEBE),width: 2.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF9FAFB),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Color(0xff13665F),width: 2.0),
                  ),
                  contentPadding: const EdgeInsets.only(left: 20, bottom: 15, top: 15),
                ),
                onTap: () async{
                  DateTime? date = DateTime(1900);
                  FocusScope.of(context).requestFocus(FocusNode());
                  date = await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime.now());

                  dateCtl.text = '${date!.day}.${date.month < 10? '0${date.month}' : date.month }.${date.year}';
                },
              ),
              const SizedBox(height: 30,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(Color(0xff199A8E)),
                        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                        elevation: const MaterialStatePropertyAll(0),
                        foregroundColor: const MaterialStatePropertyAll(Colors.white),
                        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                    ),
                    onPressed: (){},
                    child: Text(
                      "Save",
                      style: GoogleFonts.montserrat(fontSize:16, fontWeight: FontWeight.w600),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
