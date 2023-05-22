import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubites/delete_user_cubit.dart';

void showDeleteAlert(BuildContext context, String id) {
  AwesomeDialog(
      btnOkColor: Colors.green,
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.warning,
      body: const Center(
        child: Text(
          'You Will Delete Your Account!',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      btnCancelOnPress: () {},
      btnCancelText: 'Cancel',
      btnOkText: " Countinue",
      btnOkOnPress: () {
        BlocProvider.of<DeleteUserCubit>(context).deleteUser(id: id);
      }).show();
}
