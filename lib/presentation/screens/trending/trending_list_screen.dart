import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:giphy_test/presentation/screens/trending/trending_tab_controller.dart';
import 'package:giphy_test/utils/common/pagination_loader.dart';
import 'package:giphy_test/utils/common/shimmer_effect.dart';

class TrendingListScreen extends ConsumerStatefulWidget {
  const TrendingListScreen({
    super.key,
    // required this.data,
  });

  // final List<Data> data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TrendingListScreenState();
}

class _TrendingListScreenState extends ConsumerState<TrendingListScreen> {
  String haha = "haha";
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if (TrendingGifNotifier.currentPage <= TrendingGifNotifier.totalPage) {
          ref.watch(trendingGifsProvider.notifier).getTrendingGifs();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trendingData = ref.watch(trendingGifsProvider);
    return trendingData.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => ErrorWidget(error),
      data: (data) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            controller: controller,
            // physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: MasonryGridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: data[index].images!.fixedHeight!.url!,
                      fit: BoxFit.fill,
                      imageBuilder: (context, imageProvider) => Container(
                        height: double.parse(
                            data[index].images!.fixedWidth!.height!),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      progressIndicatorBuilder: (context, url, progress) =>
                          ShimmerEffect(
                        height: double.parse(
                            data[index].images!.fixedWidth!.height!),
                      ),
                    );
                  },
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverToBoxAdapter(
                child: Visibility(
                    visible: TrendingGifNotifier.currentPage <=
                            TrendingGifNotifier.totalPage &&
                        TrendingGifNotifier.giphyList.isNotEmpty,
                    child: const PaginationLoader()),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
            ],
          ),
        );
      },
    );
  }
}






// class CustomGiphyList extends StatelessWidget {
  

  
// }

// void showCustomDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => const CustomAlertDialog(),
//   );
//   // showGeneralDialog(
//   //   context: context,
//   //   barrierLabel: "Barrier",
//   //   barrierDismissible: true,
//   //   barrierColor: Colors.black.withOpacity(0.5),
//   //   transitionDuration: const Duration(milliseconds: 100),
//   //   pageBuilder: (_, __, ___) {
//   //     return Center(
//   //       child: Container(
//   //         height: 240,
//   //         margin: const EdgeInsets.symmetric(horizontal: 20),
//   //         decoration: BoxDecoration(
//   //           color: Colors.white,
//   //           borderRadius: BorderRadius.circular(40),
//   //         ),
//   //         child: const SizedBox.expand(
//   //           child: FlutterLogo(),
//   //         ),
//   //       ),
//   //     );
//   //   },
//   //   transitionBuilder: (_, anim, __, child) {
//   //     Tween<Offset> tween;
//   //     if (anim.status == AnimationStatus.completed) {
//   //       tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
//   //     } else {
//   //       tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
//   //     }

//   //     return SlideTransition(
//   //       position: tween.animate(anim),
//   //       child: FadeTransition(
//   //         opacity: anim,
//   //         child: child,
//   //       ),
//   //     );
//   //   },
//   // );
// }

// class CustomAlertDialog extends StatefulWidget {
//   const CustomAlertDialog({super.key});

//   @override
//   _CustomAlertDialogState createState() => _CustomAlertDialogState();
// }

// class _CustomAlertDialogState extends State<CustomAlertDialog>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> animation;

//   @override
//   void initState() {
//     super.initState();
//     _initScaleAnimation();
//   }

//   _initScaleAnimation() {
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     )..addListener(() => setState(() {}));

//     animation = Tween<double>(begin: 0, end: -1.0).animate(controller);

//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: animation,
//       alignment: Alignment.topLeft, // use different alignment
//       child: Center(
//         child: Container(
//           height: 240,
//           margin: const EdgeInsets.symmetric(horizontal: 20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(40),
//           ),
//           child: const SizedBox.expand(
//             child: FlutterLogo(),
//           ),
//         ),
//       ),
//     );
//   }
// }
