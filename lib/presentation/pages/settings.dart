import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:shopesapp/logic/cubites/user_cubit.dart';
import '../../data/models/user.dart';
import '../../data/repositories/delete_user_repository.dart';
import '../../logic/cubites/delete_user_cubit.dart';
import '../../logic/cubites/themes_cubit.dart';
import '../widgets/dialogs/awosem_dialog.dart';
import '../widgets/settings/settings_til.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late User _user;
  late String _id;
  // ignore: constant_identifier_names

  @override
  void initState() {
    //online
    /*
    _user = context.read<UserAuthCubit>().getUser();
    _id = _user.id;*/
    //offline
    _id = "1";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: height,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
            children: [
              SettingsGroup(
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary),
                  title: "Profile",
                  children: <Widget>[buildProfile(context)]),
              SizedBox(
                height: height * 0.01,
              ),
              SettingsGroup(
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary),
                  title: "MY STORE",
                  children: <Widget>[
                    buildeEdeitMySotre(context),
                    buildSwitchSotre(context)
                  ]),
              SizedBox(
                height: height * 0.01,
              ),
              SettingsGroup(
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary),
                  title: "MODE",
                  children: <Widget>[buildLanguage(), buildThemes(context)]),
              SizedBox(
                height: height * 0.01,
              ),
              SettingsGroup(
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary),
                  title: "GENERAL",
                  children: <Widget>[
                    buildLogout(context),
                    BlocProvider<DeleteUserCubit>(
                      create: (context) =>
                          DeleteUserCubit(DeleteUserRepository()),
                      child: BlocConsumer<DeleteUserCubit, DeleteUserState>(
                        listener: (context, state) {
                          if (state is DeleteUserSucceed) {
                            buildAwrsomeDialog(
                                    context,
                                    "Succeed",
                                    "You Delete your account successfully",
                                    "OK",
                                    type: DialogType.success)
                                .show();
                            BlocProvider.of<UserAuthCubit>(context).logOut();
                          } else if (state is DeleteUserFailed) {
                            buildAwrsomeDialog(context, "Faild",
                                    state.message.toUpperCase(), "Cancle",
                                    type: DialogType.error)
                                .show();
                          }
                        },
                        builder: (context, state) {
                          if (state is DeleteUserProgress) {
                            return const CircularProgressIndicator();
                          }
                          return buildDeleteAccount(context, _id);
                        },
                      ),
                    ),
                  ]),
              SizedBox(
                height: height * 0.01,
              ),
              SettingsGroup(
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary),
                  title: "About",
                  children: <Widget>[buildAbout()]),
              SettingsGroup(
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary),
                  title: "Privacy",
                  children: <Widget>[buildPrivacy(context)])
            ],
          ),
        ),
      ),
    );
  }
}
