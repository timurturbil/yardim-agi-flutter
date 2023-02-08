import 'package:flutter/material.dart';

import '../../../shared/assets.dart';

class CustomDialog {
  static Future<void> locationPermissionDialog(BuildContext context) async {
    final imageNames = <String>[
      Assets.locationPermissionDirection1,
      Assets.locationPermissionDirection2,
      Assets.locationPermissionDirection3,
    ];

    return showDialog(
      context: context,
      builder: (context) {
        var activePage = 0;
        return AlertDialog(
          title: const Text('Konum izni vermeniz gerekiyor.'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: PageView.builder(
                      itemCount: imageNames.length,
                      itemBuilder: (context, pagePosition) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.asset(
                            imageNames[pagePosition],
                          ),
                        );
                      },
                      onPageChanged: (page) {
                        setState(() {
                          activePage = page;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: CustomDialog()
                        .indicators(imageNames.length, activePage),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  List<Widget> indicators(int imagesLength, int currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle,
        ),
      );
    });
  }
}
