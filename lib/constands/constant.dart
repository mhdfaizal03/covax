import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Function() onpressed;
  final String actionTitle;
  final double? width;
  final double? height;
  const ActionButton(
      {super.key,
      required this.onpressed,
      required this.actionTitle,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: height,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.blue,
      onPressed: onpressed,
      child: Text(actionTitle),
    );
  }
}

//toast

void showWelcomeDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                color: Colors.white,
                elevation: 8.0,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Avoid the Scare of Cororna Virus',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        title: ActionButton(
                            onpressed: () {},
                            actionTitle: 'call',
                            height: 100,
                            width: 100),
                        trailing: Image.asset('assets/images/virus.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
