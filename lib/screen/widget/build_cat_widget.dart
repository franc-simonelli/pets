import 'package:flutter/material.dart';
import 'package:petsguide/constants/theme.dart';
import 'package:petsguide/screen/home/widget/image_widget.dart';

class BuildCatWidget extends StatelessWidget {
  const BuildCatWidget(this.cat, {super.key});

  final cat;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isThemeLight = MediaQuery.platformBrightnessOf(context) == Brightness.light ? true : false;
    return  Container(
      // color: Colors.black,
      width: 160,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: theme.primaryColor.withOpacity(1.0),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: const [
                  0.3,
                  0.5,
                  0.8
                ],
                colors: [
                  theme.primaryColor,
                  theme.primaryColor.withOpacity(0.8),
                  theme.primaryColor.withOpacity(0.7),
                ],
              ),
              boxShadow: isThemeLight ? MyTheme.boxShadowLight : MyTheme.boxShadowDark
            ),
            width: 130,
            height: 180,
            child: ImageWidget(cat),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cat.razza, style: theme.textTheme.headlineMedium!),
              ],
            ),
          ),
          // const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text('Taglia ${cat.taglia}', style: theme.textTheme.headlineSmall,),
              ],
            ),
          ),
          // const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// return  Container(
//       color: Colors.black,
//       width: 160,
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   // width: 130,
//                   // height: 80,
//                   // decoration: BoxDecoration(
//                   //   borderRadius: BorderRadius.circular(10),
//                   //   color: theme.primaryColor.withOpacity(0.8),
//                   //   boxShadow: [
//                   //     MediaQuery.platformBrightnessOf(context) == Brightness.light
//                   //     ?
//                   //     BoxShadow(
//                   //       blurRadius: 5,
//                   //       spreadRadius: 5,
//                   //       offset: Offset(0,0),
//                   //       color: Colors.grey.shade400
                          
//                   //     )
//                   //     :
//                   //     const BoxShadow(
//                   //       blurRadius: 5,
//                   //       spreadRadius: 5,
//                   //       offset: Offset(0,0),
//                   //       color: Color.fromARGB(255, 29, 29, 29)
                          
//                   //     )
//                   //   ]
//                   // ),                    
//                 ),
//               ),   
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.only(left: 0),
//                 child: Text(cat.razza, style: theme.textTheme.headlineMedium!)
//               ),
//               const SizedBox(height: 5),
//               Padding(
//                 padding: const EdgeInsets.only(left: 0),
//                 child: Text('Taglia ${cat.taglia}', style: theme.textTheme.headlineSmall,),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: theme.primaryColor.withOpacity(1.0),
//               gradient: LinearGradient(
//                 begin: Alignment.bottomLeft,
//                 end: Alignment.topRight,
//                 stops: const [
//                   0.3,
//                   0.5,
//                   0.8
//                 ],
//                 colors: [
//                   theme.primaryColor,
//                   theme.primaryColor.withOpacity(0.8),
//                   theme.primaryColor.withOpacity(0.7),
//                 ],
//               ),
//               boxShadow: isThemeLight ? MyTheme.boxShadowLight : MyTheme.boxShadowDark
//             ),
//             width: 130,
//             height: 180,
//             child: ImageWidget(cat),
//           )
//         ]
//       ),
//     );