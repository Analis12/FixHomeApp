import 'package:fixhome/src/models/establishment_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageExtended extends StatelessWidget {
  const ImageExtended({Key? key, required this.Url}) : super(key: key);
  final Url;
  @override
  Widget build(BuildContext context) {
    print(Url);

    return Container(
        child: PhotoView(
      imageProvider: NetworkImage(Url),
    ));
  }
}
