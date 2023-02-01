import 'package:flutter/material.dart';
import 'package:petsguide/model/cat_model.dart';

class BuildListViewWidget extends StatelessWidget {
  const BuildListViewWidget(this.list,{super.key});

  final List<Cats>list;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          width: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 140,
                  height: 170,
                  // child: imageWidgetGeneric(theme, list[index]),
                )
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(list[index].razza!, style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold))),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color.fromARGB(255, 248, 140, 45), size: 19,),
                        Text('4,7', style: theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),)
                      ],
                    ),  
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('Taglia ${list[index].taglia}', style: theme.textTheme.bodySmall,),
              )
            ],
          ),
        );
      },
    );
  }

  Widget imageWidgetGeneric(theme, cat) {
    return ClipRRect(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(cat.image!),
                fit: BoxFit.cover
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black45,
                    Colors.black54,
                    Colors.black87
                  ],
                  stops: [
                    0.2,
                    0.4,
                    0.6,
                    0.8
                  ]
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
              child: Center(
                // child: Text(
                //   cat.razza!,
                //   style: theme.textTheme.headlineSmall,
                //   textAlign: TextAlign.center,
                // ),
              ),
            ),
          )
        ]
      ),
    );
  }
}