import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:personalcv/src/features/main_screen/main_screen_viewmodel.dart';
import 'package:personalcv/src/features/viewmodel_provider.dart';
import 'package:personalcv/src/tools/constants.dart';
import 'package:personalcv/src/tools/loading_widget.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MainScreenViewModel>(
      viewModel: MainScreenViewModel(context: context),
      builder: (viewModel) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.pushNamed(context, '/projects');
              },
              backgroundColor: kAccentColor,
              child: Icon(FontAwesome.list),
            ),
            backgroundColor: kMainBgColor,
            body: IndexedStack(
              index: viewModel.index,
              children: [
                LoadingWidget(),
                viewModel.model != null ?
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(),
                    child: Column(
                      children: [

                        Container(
                          padding: EdgeInsets.only(top: 10,bottom: 15),
                              decoration: BoxDecoration(
                                boxShadow: [kBoxShadowReverse],
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                color: Colors.blueAccent,
                              ),

                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:  NetworkImage(
                                  viewModel.model.image,
                                ),
                                radius: 50.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                viewModel.model.name,
                                style: kTitleTextStyle.copyWith(color: Colors.white),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                viewModel.model.title,
                                style: kTitleTextStyle.copyWith(
                                  color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [kBoxShadow],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Entypo.linkedin,
                                  color: Colors.blueAccent,
                                ),
                                onPressed: () {
                                  viewModel.onLinkedInClick();
                                },
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [kBoxShadow],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(

                                icon: Icon(
                                  Entypo.skype,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  viewModel.onSkypeClick();
                                },
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [kBoxShadow],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Entypo.github,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  viewModel.onGitHubClick();
                                },
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [kBoxShadow],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Zocial.gmail,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  viewModel.onGmailClick();
                                },
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),

                     
                        Container(
                          margin: EdgeInsets.only(right: 10,left: 10),
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [kBoxShadow],
                          ),
                          child: Text(
                            viewModel.model.description,
                            style: kMessageTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Skills',
                          style: kTitleTextStyle,
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10,right: 10),
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: GridView.builder(
                            itemCount: viewModel.model.skills.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: (4),
                              childAspectRatio:
                                  MediaQuery.of(context).size.width /
                                      (MediaQuery.of(context).size.height / 3),
                            ),
                            itemBuilder: (context, i) {
                              return Container(
                                margin: EdgeInsets.all(2),
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue.shade400
                                ),
                                child: Center(
                                  child: Text(
                                    viewModel.model.skills[i].name,
                                    style: kTitleTextStyle.copyWith(
                                        color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20,),

                      ],
                    ),
                  ),
                )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
