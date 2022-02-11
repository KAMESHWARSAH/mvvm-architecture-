import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:mvvm_image/view_model/list_picture_viewmodel.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePgae extends StatefulWidget {
  const HomePgae({Key? key}) : super(key: key);

  @override
  _HomePgaeState createState() => _HomePgaeState();
}

class _HomePgaeState extends State<HomePgae> {
  ListPictureViewModel listPictureViewModel = new ListPictureViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Movies'),
      ),
      body: FutureBuilder(
        future: listPictureViewModel.fetchPictures(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              iteamBuilder: (BuildContext context, int index) => Container(
                color: Colors.green,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image:
                      '${listPictureViewModel.picture![index]!.picSumModel!.downloadUrl}',
                  fit: BoxFit.cover,
                ),
              ),
              staggeredTileBuilder: (inedx) =>
                  StaggeredTile.count(2, inedx.isEven ? 2 : 1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            );
          }
        },
      ),
    );
  }
}
