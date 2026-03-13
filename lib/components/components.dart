import 'package:flutter/material.dart';
import '../theme.dart';

Container customCard({required Icon icon, required Text text}) {
  return Container(
    width: 180,
    height: 130,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(30, 0, 0, 0),
          offset: Offset(0, 3),
          // spreadRadius: 0.1,
          blurRadius: 5,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ThemeColor.primaryColor.withAlpha(50),
          ),
          child: icon,
        ),
        text,
      ],
    ),
  );
}

SingleChildScrollView navigationCards({
  required BuildContext context,
  required Map<Icon, String> iconsAndText,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              for (MapEntry<Icon, String> eachIconAndText
                  in iconsAndText.entries)
                customCard(
                  icon: eachIconAndText.key,
                  text: Text(eachIconAndText.value),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
