import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:medical_prescription/presentation/components/search_result_tab.dart';
import 'package:medical_prescription/presentation/pages/search_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchQueryController;
  late SearchBloc _searchBloc;
  bool isSearchQueryFilled = false;

  @override
  void initState(){
    super.initState();
    _searchBloc = context.read<SearchBloc>();
    _searchQueryController = TextEditingController();
  }


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
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: false,
          toolbarHeight: 55,
          shape: const Border(
              bottom: BorderSide(
                  color: Colors.grey,
                  width: 1
              )
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    controller: _searchQueryController,
                    onChanged: (query) {
                      setState(() {
                        if(query.isNotEmpty){
                          isSearchQueryFilled = true;
                        }else{
                          isSearchQueryFilled = false;
                        }
                      });
                      _searchBloc.add(DynamicSearchEvent(query));
                    },
                    cursorColor: const Color(0xff069893),
                    autofocus: true,
                    textInputAction: TextInputAction.search,
                    style: Theme.of(context).textTheme.titleSmall,
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width-120,
                          maxHeight: 40
                      ),
                      hintText: "Search",
                      contentPadding: const EdgeInsets.only(top: 7),
                      suffixIcon: isSearchQueryFilled ?
                      IconButton(
                        onPressed: () {
                          _searchQueryController.clear();
                          _searchBloc.add(const DynamicSearchEvent(""));
                          setState(() {
                            isSearchQueryFilled = false;
                          });
                        },
                        icon: const Icon(Icons.close),
                      ) : null,
                      prefixIcon: const Icon(CupertinoIcons.search),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(
                              color: Color(0xff069893),
                              width: 1.0
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(
                              color: Color(0xff069893),
                              width: 1.0
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: TextButton(
                        onPressed: (){
                          searchPageScreenIndex.value = 0;
                        },
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.montserrat(
                            color: Colors.red,
                            textStyle: Theme.of(context).textTheme.titleLarge
                          ),
                        )
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5,),
              BlocBuilder<SearchBloc, SearchState>(
                  builder: (BuildContext context, SearchState state) {
                    return Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return searchResultTab(false,state.searchResults.elementAt(index), context);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Container(
                              height: .5,
                              color: Color(0xffE5E5E5),
                            );
                          },
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.searchResults.length
                      ),
                    );
                  }
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "History",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextButton(
                        onPressed: (){},
                        child: Text(
                          "Clear",
                          style: GoogleFonts.montserrat(
                              textStyle: Theme.of(context).textTheme.titleSmall,
                              color: Colors.blueAccent
                          ),
                        )
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return searchResultTab(true,"Result", context);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: .5,
                      color: Color(0xffE5E5E5),
                    );
                  },
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
