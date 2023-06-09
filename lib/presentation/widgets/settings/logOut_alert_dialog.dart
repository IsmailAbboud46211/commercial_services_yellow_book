import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubites/user_cubit.dart';

void showLogOutAlertDialog(BuildContext context) {
  AwesomeDialog(
      btnOkColor: Colors.green,
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.warning,
      body: const Center(
        child: Text(
          'You Will Log Out!',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      btnCancelOnPress: () {},
      btnCancelText: 'Cancel',
      btnOkText: " Countinue",
      btnOkOnPress: () {
        BlocProvider.of<UserAuthCubit>(context).logOut();
      }).show();
}
