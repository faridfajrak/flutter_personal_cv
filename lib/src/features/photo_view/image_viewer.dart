import 'package:flutter/material.dart';
import 'package:personalcv/src/tools/constants.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  final String imageUrl;
  final String name;

  const ImageViewer({Key key, this.imageUrl,this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainBgColor,
        appBar: AppBar(backgroundColor: Colors.blueAccent,title: Text(name,style: kTitleTextStyle.copyWith(color: Colors.white),),centerTitle: true,),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: PhotoView(
            imageProvider: NetworkImage(imageUrl),
          ) ,
        ),
      ),
    );
  }
}
