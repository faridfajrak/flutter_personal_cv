import 'package:flutter/cupertino.dart';
import 'package:personalcv/src/features/base_viewmodel.dart';
import 'package:personalcv/src/features/projects_screen/projects_screen_model.dart';
import 'package:personalcv/src/repository/rest_handler.dart';
import 'package:personalcv/src/tools/Helper.dart';
import 'package:personalcv/src/tools/constants.dart';

class ProjectsScreenViewModel extends BaseViewModel{

  final BuildContext context;
  List<ProjectModel> projects =[];

  ProjectsScreenViewModel({this.context}) : super(context: context){
    getProjects();
  }

  void getProjects() async
  {
    var response = await RestHandler.getProjects();
    if (response != null) {
      handleRestErrors(response.httpCode, response.message,context);
    }
    if (response == null) {
      handleRestErrors(-1, kConnectionErrorMsg,context);
    } else {
      handleRestErrors(response.httpCode, response.message,context);
      if (response.data != null) {

        projects = ProjectsModel.fromJson(response.data).projects;

        notifyListeners();
      }
    }

  }

  void onUrlsClick(String url)
  {
    Helper.launchURL(url);
  }





}