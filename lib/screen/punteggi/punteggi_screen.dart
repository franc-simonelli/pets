import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/cat_controller.dart';
import 'package:petsguide/screen/details/cat_details_screen.dart';
import 'package:petsguide/screen/details/widget/bottom_sheet.dart';
import 'package:petsguide/screen/home/widget/image_widget.dart';
import 'package:petsguide/screen/widget/app_bar_widget.dart';
import 'package:petsguide/screen/widget/loading_widget.dart';

class PunteggiScreen extends StatefulWidget {
  const PunteggiScreen({super.key});

  @override
  State<PunteggiScreen> createState() => _PunteggiScreenState();
}

class _PunteggiScreenState extends State<PunteggiScreen> {

  @override
  void dispose() {
    final CatController catController = Get.put(CatController());
    catController.listCatPunteggiUser.value = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CatController catController = Get.put(CatController());
    catController.getListPunteggiByIdUser();

    var theme = Theme.of(context);
    return Scaffold(
      // appBar: appBarPunteggi(theme),
      appBar: AppBarWidget('I tuoi punteggi'),
      body: Obx(() {
        return catController.loading.value
        ?
        const Center(
          child: LoadingWidget(100.0),
        )
        :
        catController.listCatPunteggiUser.value.isEmpty
        ?
        Center(child: Text('Non hai ancora votato nessun gatto!', style: theme.textTheme.bodyMedium,),)
        :      
        listView(catController.listCatPunteggiUser, theme);
      }),
   );
  }

  Widget listView(list, ThemeData theme) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: ((context, index) {
        final CatController catController = Get.put(CatController());
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 200,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: buildImage(context, list, index, catController),
                ),
                Expanded(
                  flex: 3,
                  child: buildDetails(list, index, theme, catController),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildDetails(list, int index, ThemeData theme, CatController catController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(list[index].razza!, style: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold), maxLines: 2,),
            
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            const Icon(
              Icons.star,
              size: 35,
              color: Color.fromARGB(255, 248, 140, 45),
            ),
            const SizedBox(width: 5),
            Text(list[index].punteggioUser!.toString(), style: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(width: 20),
            InkWell(
              onTap: () async{
                await catController.setCatSelect(list[index]);
                await catController.getPunteggioAttualeByUser();
                Get.bottomSheet( 
                  BottomSheetWidget()
                );
              },
              child: Text('Modifica voto', style: theme.textTheme.headlineSmall!.copyWith(fontSize: 18, fontWeight: FontWeight.bold))
            )
          ],
        ),
      ],
    );
  }

  Widget buildImage(BuildContext context, list, int index, CatController catController) {
    return InkWell(
      onTap: () {
        catController.setCatSelect(list[index]);
        Get.to(const CatDetailsScreen());
      },
      child: Container(
        // color: Colors.red,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 130,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 93, 132, 132),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    MediaQuery.platformBrightnessOf(context) == Brightness.light
                    ?
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset(0,0),
                      color: Colors.grey.shade400
                        
                    )
                    :
                    const BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset(0,0),
                      color: Color.fromARGB(255, 29, 29, 29)  
                    )
                  ]
                ),                    
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 130,
                height: 180,
                child: ImageWidget(list[index]),
              ),
            ),
          ]
        ),
      ),
    );
  }

  AppBar appBarPunteggi(ThemeData theme) {
    return AppBar(
      leading: GestureDetector(
        onTap: (() {
          Get.back();
        }),
        child: Icon(Icons.arrow_back_ios_new, color: theme.secondaryHeaderColor,)
      ),
      // backgroundColor: theme.backgroundColor,
      title: Text('I tuoi punteggi', style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
      centerTitle: true, 
    );
  }
}

