import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/search_controllerr.dart';
import 'package:petsguide/screen/search_screen/widget/text_field_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.put(SearchController());
    searchController.getCronologia();

    var theme = Theme.of(context);
    return Obx(() {
      return Scaffold(
        appBar: app_bar_widget(theme, context),
        body: searchController.listCatByRazza.isNotEmpty
        ?
        listViewResultSearch(searchController, theme)
        :
        searchController.listCatsCronologia.isNotEmpty
        ?
        ListView.builder(
          itemCount: searchController.listCatsCronologia.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                leading: GestureDetector(
                  onTap: (){searchController.deleteFromCronologia(searchController.listCatsCronologia[index]);},
                  child: const Icon(FontAwesomeIcons.xmark)
                ),
                title: GestureDetector(
                  onTap: () {searchController.getCatByCronologia(searchController.listCatsCronologia[index].id);},
                  child: Text(searchController.listCatsCronologia[index].razza!, style: theme.textTheme.labelMedium,)
                ),
              ),
            );
          },
        )
        :Container()
      );
    });
  }

  Widget listViewResultSearch(SearchController searchController, ThemeData theme) {
    return ListView.builder(
      itemCount: searchController.listCatByRazza.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              searchController.saveSceltaInStorage(searchController.listCatByRazza[index]);
              searchController.getCatByCronologia(searchController.listCatByRazza[index].id);
            },
            child: ListTile(
              // leading: Icon(FontAwesomeIcons.xmark),
              title: Text(searchController.listCatByRazza[index].razza!, style: theme.textTheme.labelMedium,),
            ),
          ),
        );
      },
    );
  }

  AppBar app_bar_widget(ThemeData theme, BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: (() {
          Get.back();
        }),
        child: Icon(Icons.arrow_back_ios_new, color: theme.secondaryHeaderColor,)
      ),
      centerTitle: true,
      title: Container(
        width: 270,
        height: 50,
        decoration: BoxDecoration(
          color: MediaQuery.platformBrightnessOf(context) == Brightness.light ? Colors.white : Color.fromARGB(255, 29, 29, 29),
          borderRadius: BorderRadius.circular(20)
        ),
        child: TextFieldWidget(),
      ),
    );
  }
}

