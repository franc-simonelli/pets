// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:petsguide/controller/cat_controller.dart';
import 'package:petsguide/model/caratteristiche_model.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with TickerProviderStateMixin{
  late TabController _tabController;
  List<CaratteristicheModel> caratteristiche = [];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final CatController catController = Get.put(CatController());
    caratteristiche = catController.caratteristiche;
    // return TabBar(      
    //   labelStyle: theme.textTheme.bodySmall,
    //   unselectedLabelColor: theme.secondaryHeaderColor,
    //   labelColor: theme.primaryColor,
    //   indicatorColor: theme.primaryColor,
    //   tabs: const [
    //     Tab(text: 'Origine', icon: Icon(FontAwesomeIcons.house, size: 18,),),
    //     Tab(text: 'Descrizione', icon: Icon(FontAwesomeIcons.addressCard, size: 18,)),
    //     Tab(text: 'Personalità', icon: Icon(FontAwesomeIcons.userGroup, size: 18,),),
    //     Tab(text: 'Aspetti', icon: Icon(FontAwesomeIcons.bell, size: 18,)),
    //   ],
    //   controller: _tabController,
    // );
  // }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TabBar(           
            labelStyle: theme.textTheme.bodySmall,
            unselectedLabelColor: theme.secondaryHeaderColor,
            labelColor: theme.primaryColor,
            indicatorColor: theme.primaryColor,
            tabs: const [
              Tab(text: 'Origine', icon: Icon(FontAwesomeIcons.house, size: 18,),),
              Tab(text: 'Descrizione', icon: Icon(FontAwesomeIcons.addressCard, size: 18,)),
              Tab(text: 'Personalità', icon: Icon(FontAwesomeIcons.userGroup, size: 18,),),
              Tab(text: 'Aspetti', icon: Icon(FontAwesomeIcons.bell, size: 18,)),
            ],
            controller: _tabController,
          ),
        ),
        Center(
          child: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(catController.catSelected.value!.origine!, style: theme.textTheme.headlineMedium),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(catController.catSelected.value!.descrizione!, style: theme.textTheme.headlineMedium,),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(catController.catSelected.value!.carattere!, style: theme.textTheme.headlineMedium,),
            ),             
        
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: caratteristiche.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(caratteristiche[index].descrizione!, style: theme.textTheme.headlineMedium),
                        SizedBox(width: 10),
                        Row(
                          
                          children: [
                            for(int i=0; i<5; i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset('contents/images/logo_zampa.png', color: i < caratteristiche[index].punteggio! ? theme.primaryColor : Colors.grey,),
                                ),
                              )

                          ],
                        )
                        // getStar(caratteristiche[index].punteggio)
                        
                      ],
                    ),
                  );
                })
              )
             )  
          ]
          [_tabController.index],
        ),
      ],
    );      
  }

  Widget getStar(punteggio) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder:(context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(Icons.star, color: index >= punteggio ? Colors.amber : Colors.grey),
        );
      },
    );
  }
}