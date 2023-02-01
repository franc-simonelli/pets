import 'package:flutter/material.dart';

class SceltaAvatar extends StatelessWidget {
  const SceltaAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Scelta micio avatar', style: theme.textTheme.labelLarge,)
            ],
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.0
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.green[(index+1)*100],
                );

              },
            ),
          )
        ],
      ),
    );
  }
}