import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mvvm_image/view_model/list_picture_viewmodel.dart';
import 'dart:html';
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
      appBar: AppBar(title: Text('My Movies'),),
      body: FutureBuilder(
          future: listPictureViewModel.fetchPictures(),
          builder: (context, snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else{
                return StaggeredGrid.count(
                    crossAxisCount: 4,

                );
            }
          }
      )
    );
  }
}
