import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class GallerySaver {
  // _saveLocalImage() async {
  //   RenderRepaintBoundary boundary =
  //       _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  //   ui.Image image = await boundary.toImage();
  //   ByteData? byteData =
  //       await (image.toByteData(format: ui.ImageByteFormat.png));
  //   if (byteData != null) {
  //     final result =
  //         await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
  //     print(result);
  //   }
  // }

  static saveNetworkImage() async {
    var response = await Dio().get(
        "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    print(result);
  }

  static saveNetworkGifFile({required String fileUrl}) async {
    var appDocDir = await getTemporaryDirectory();
    String savePath = "${appDocDir.path}/temp.gif";
    await Dio().download(fileUrl, savePath);
    final result = await ImageGallerySaver.saveFile(savePath,
        name: "Meeemes", isReturnPathOfIOS: true);
    print(result);
  }

  static saveNetworkVideoFile({required String fileUrl}) async {
    var appDocDir = await getTemporaryDirectory();
    String savePath = "${appDocDir.path}/temp.mp4";
    await Dio().download(fileUrl, savePath, onReceiveProgress: (count, total) {
      print("${(count / total * 100).toStringAsFixed(0)}%");
    });
    final result = await ImageGallerySaver.saveFile(savePath);
    print(result);
  }
}
