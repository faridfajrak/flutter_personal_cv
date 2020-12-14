import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:personalcv/src/features/photo_view/image_viewer.dart';
import 'package:personalcv/src/features/projects_screen/projects_screen_view_model.dart';
import 'package:personalcv/src/features/video_player/video_player_screen.dart';
import 'package:personalcv/src/features/viewmodel_provider.dart';
import 'package:personalcv/src/tools/constants.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProjectsScreenViewModel>(
      viewModel: ProjectsScreenViewModel(context: context),
      builder: (viewModel) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: kMainBgColor,
            appBar: AppBar(
              title: Text(
                'Projects',
                style: kTitleTextStyle.copyWith(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: Colors.blueAccent,
            ),
            body: Container(
              margin: EdgeInsets.all(15),
              child: ListView.builder(
                  itemCount: viewModel.projects.length,
                  itemBuilder: (context, i) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [kBoxShadow]),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            viewModel.projects[i].name,
                            style: kTitleTextStyle,
                          ), // project name
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.projects[i].screens.length,
                              itemBuilder: (context, j) {
                                return Container(
                                  margin: EdgeInsets.all(5),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ImageViewer(
                                                  imageUrl: viewModel
                                                      .projects[i].screens[j],
                                                  name: viewModel.projects[i].name,
                                                ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width/3,
                                        child: Image(
                                          image: NetworkImage(
                                              viewModel.projects[i].screens[j]),
                                        ),
                                      )),
                                );
                              },
                            ),
                          ), //slider
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              viewModel.projects[i].play_store_link == ''
                                  ? Container()
                                  : Container(
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: [kBoxShadow],
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    viewModel.onUrlsClick(viewModel
                                        .projects[i].play_store_link);
                                  },
                                  color: Colors.green,
                                  icon: Icon(Icons.android),
                                ),
                              ),
                              viewModel.projects[i].web_link == ''
                                  ? Container()
                                  : Container(
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: [kBoxShadow],
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    viewModel.onUrlsClick(viewModel
                                        .projects[i].web_link);
                                  },
                                  color: Colors.blue,
                                  icon: Icon(Entypo.browser),
                                ),
                              ),
                              viewModel.projects[i].apple_store_link == ''
                                  ? Container()
                                  : Container(
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: [kBoxShadow],
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    viewModel.onUrlsClick(viewModel
                                        .projects[i].apple_store_link);
                                  },
                                  color: Colors.black,
                                  icon: Icon(FontAwesome.apple),
                                ),
                              ),
                              viewModel.projects[i].pwa_link == ''
                                  ? Container()
                                  : Container(
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: [kBoxShadow],
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    viewModel.onUrlsClick(
                                        viewModel.projects[i].pwa_link);
                                  },
                                  icon: Image(
                                    image:
                                    AssetImage('images/flutter.png'),
                                  ),
                                ),
                              ),
                              viewModel.projects[i].video == ''
                                  ? Container()
                                  : Container(
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: [kBoxShadow],
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    viewModel.onUrlsClick(viewModel.projects[i].video);
//                                    Navigator.push(context, MaterialPageRoute(
//                                        builder: (context) =>
//                                            VideoPlayerScreen(
//                                              videoUrl: viewModel.projects[i]
//                                                  .videoUrl,
//                                              appName: viewModel.projects[i]
//                                                  .projectName,)));
                                  },
                                  color: Colors.blueAccent,
                                  icon: Icon(Entypo.video),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [kBoxShadow]),
                            child: Text(
                              viewModel.projects[i].description,
                              style: kMessageTextStyle,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Platforms:',
                              textAlign: TextAlign.left,
                              style: kTitleTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 60,
                            child: ListView.builder(
                              itemCount: viewModel.projects[i].platforms.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, j) {
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child: Text(
                                        viewModel.projects[i].platforms[j].name,
                                        style: kMessageTextStyle.copyWith(
                                            color: Colors.white),
                                      )),
                                );
                              },
                            ),
                          ), // project name
                          Divider(),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Technologies:',
                              textAlign: TextAlign.left,
                              style: kTitleTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 60,
                            child: ListView.builder(
                              itemCount: viewModel.projects[i].technology.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, j) {
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: kAccentColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child: Text(
                                        viewModel.projects[i].technology[j].name,
                                        style: kMessageTextStyle.copyWith(
                                            color: Colors.white),
                                      )),
                                );
                              },
                            ),
                          ), // project name
                        ],
                      ),
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}
