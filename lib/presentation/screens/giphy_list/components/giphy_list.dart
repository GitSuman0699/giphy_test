import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:giphy_test/data/model/giphy_model.dart';
import 'package:giphy_test/utils/common/gallery_saver.dart';
import 'package:giphy_test/utils/common/shimmer_effect.dart';

class CustomGiphyList extends StatelessWidget {
  const CustomGiphyList({
    super.key,
    required this.data,
  });

  final List<Data> data;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () async {
                showCustomDialog(context);
              },
              child: CachedNetworkImage(
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Colors.grey.shade100,
                ),
                fit: BoxFit.fill,
                placeholder: (context, url) => const ShimmerEffect(
                  height: 80,
                  width: 80,
                ),
                imageUrl: data[index].images!.previewWebp!.url!,
              ),
            );
          },
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const CustomAlertDialog(),
  );
  // showGeneralDialog(
  //   context: context,
  //   barrierLabel: "Barrier",
  //   barrierDismissible: true,
  //   barrierColor: Colors.black.withOpacity(0.5),
  //   transitionDuration: const Duration(milliseconds: 100),
  //   pageBuilder: (_, __, ___) {
  //     return Center(
  //       child: Container(
  //         height: 240,
  //         margin: const EdgeInsets.symmetric(horizontal: 20),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(40),
  //         ),
  //         child: const SizedBox.expand(
  //           child: FlutterLogo(),
  //         ),
  //       ),
  //     );
  //   },
  //   transitionBuilder: (_, anim, __, child) {
  //     Tween<Offset> tween;
  //     if (anim.status == AnimationStatus.completed) {
  //       tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
  //     } else {
  //       tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
  //     }

  //     return SlideTransition(
  //       position: tween.animate(anim),
  //       child: FadeTransition(
  //         opacity: anim,
  //         child: child,
  //       ),
  //     );
  //   },
  // );
}

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({super.key});

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _initScaleAnimation();
  }

  _initScaleAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() => setState(() {}));

    animation = Tween<double>(begin: 0, end: -1.0).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      alignment: Alignment.topLeft, // use different alignment
      child: Center(
        child: Container(
          height: 240,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: const SizedBox.expand(
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
