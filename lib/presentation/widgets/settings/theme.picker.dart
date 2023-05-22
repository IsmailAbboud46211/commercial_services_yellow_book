import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constant/themes.dart';
import '../../../logic/cubites/themes_cubit.dart';

void showThemePicker(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select The Theme"),
          content: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    context.read<ThemesCubit>().changeTheme(0);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.circle_rounded,
                    color: colorList[0],
                  )),
              IconButton(
                  onPressed: () {
                    context.read<ThemesCubit>().changeTheme(1);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.circle_rounded,
                    color: colorList[1],
                  )),
              IconButton(
                  onPressed: () {
                    context.read<ThemesCubit>().changeTheme(2);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.circle_rounded,
                    color: colorList[2],
                  )),
            ],
          ),
        );
      });
}
