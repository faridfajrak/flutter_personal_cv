import 'package:flutter/cupertino.dart';
import 'package:personalcv/src/features/base_viewmodel.dart';
import 'package:personalcv/src/features/main_screen/main_screen_model.dart';
import 'package:personalcv/src/repository/rest_handler.dart';
import 'package:personalcv/src/tools/Helper.dart';
import 'package:personalcv/src/tools/constants.dart';
import 'package:personalcv/src/tools/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreenViewModel extends BaseViewModel{
  final BuildContext context;
  int index = 1;

  String imageUrl = 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png';
  MainScreenModel model= null;
  // MainScreenModel(pictureUrl: 'http://f.fajrak.barbatstudio.com/media/profile.jpg',
  //   title: 'Farid Fajrak',
  //   subTitle: 'Mobile App Developer',
  //   skills: SKILLS
  // );

  MainScreenViewModel({this.context}) : super(context: context){
    fetchData();
  }

 

  void fetchData() async
  {
    index = 0;
    notifyListeners();
    var response = await RestHandler.getMainPage();
    if (response != null) {
      handleRestErrors(response.httpCode, response.message,context);
    }
    if (response == null) {
      handleRestErrors(-1, kConnectionErrorMsg,context);
    } else {
      handleRestErrors(response.httpCode, response.message,context);
      if (response.data != null) {

         model = MainScreenModel.fromJson(response.data);
         index = 1;
        notifyListeners();
      }
    }

  }

  void onLinkedInClick()
  {
      Helper.launchURL(model.linkedin);
  }

  void onGitHubClick(){
      Helper.launchURL(model.github);
  }
  void onGmailClick(){
    Helper.launchURL(model.email);
  }
  void onSkypeClick(){
      Helper.launchURL(model.skype);
  }




}