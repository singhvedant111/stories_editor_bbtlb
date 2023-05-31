import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stories_editor/src/domain/providers/notifiers/control_provider.dart';
import 'package:stories_editor/src/domain/providers/notifiers/filter_notifier.dart';
import 'package:stories_editor/src/domain/providers/notifiers/painting_notifier.dart';
import 'package:stories_editor/src/presentation/utils/constants/app_enums.dart';
import 'package:stories_editor/src/presentation/widgets/tool_button.dart';

class TopFilterTools extends StatefulWidget {
  const TopFilterTools({Key? key}) : super(key: key);

  @override
  _TopFilterToolsState createState() => _TopFilterToolsState();
}

class _TopFilterToolsState extends State<TopFilterTools> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ControlNotifier, FilterNotifier>(
      builder: (context, controlNotifier, filterNotifier, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // /// remove last line
                // if (filterNotifier.lines.isNotEmpty)
                //   ToolButton(
                //     onTap: filterNotifier.removeLast,
                //     onLongPress: filterNotifier.clearAll,
                //     padding: const EdgeInsets.symmetric(horizontal: 5),
                //     backGroundColor: Colors.black12,
                //     child: Transform.scale(
                //         scale: 0.6,
                //         child: const ImageIcon(
                //           AssetImage('assets/icons/return.png',
                //               package: 'stories_editor'),
                //           color: Colors.white,
                //         )),
                //   ),

                // /// select pen
                // ToolButton(
                //   onTap: () {
                //     filterNotifier.paintingType = PaintingType.pen;
                //   },
                //   colorBorder: filterNotifier.paintingType == PaintingType.pen
                //       ? Colors.black
                //       : Colors.white,
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   backGroundColor:
                //       filterNotifier.paintingType == PaintingType.pen
                //           ? Colors.white.withOpacity(0.9)
                //           : Colors.black12,
                //   child: Transform.scale(
                //       scale: 1.2,
                //       child: ImageIcon(
                //         const AssetImage('assets/icons/pen.png',
                //             package: 'stories_editor'),
                //         color: filterNotifier.paintingType == PaintingType.pen
                //             ? Colors.black
                //             : Colors.white,
                //       )),
                // ),

                // /// select marker
                // ToolButton(
                //   onTap: () {
                //     filterNotifier.paintingType = PaintingType.marker;
                //   },
                //   colorBorder:
                //       filterNotifier.paintingType == PaintingType.marker
                //           ? Colors.black
                //           : Colors.white,
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   backGroundColor:
                //       filterNotifier.paintingType == PaintingType.marker
                //           ? Colors.white.withOpacity(0.9)
                //           : Colors.black12,
                //   child: Transform.scale(
                //       scale: 1.2,
                //       child: ImageIcon(
                //         const AssetImage('assets/icons/marker.png',
                //             package: 'stories_editor'),
                //         color:
                //             filterNotifier.paintingType == PaintingType.marker
                //                 ? Colors.black
                //                 : Colors.white,
                //       )),
                // ),

                // /// select neon marker
                // ToolButton(
                //   onTap: () {
                //     filterNotifier.paintingType = PaintingType.neon;
                //   },
                //   colorBorder: filterNotifier.paintingType == PaintingType.neon
                //       ? Colors.black
                //       : Colors.white,
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   backGroundColor:
                //       filterNotifier.paintingType == PaintingType.neon
                //           ? Colors.white.withOpacity(0.9)
                //           : Colors.black12,
                //   child: Transform.scale(
                //       scale: 1.1,
                //       child: ImageIcon(
                //         const AssetImage('assets/icons/neon.png',
                //             package: 'stories_editor'),
                //         color: filterNotifier.paintingType == PaintingType.neon
                //             ? Colors.black
                //             : Colors.white,
                //       )),
                // ),

                // /// done button
                ToolButton(
                  onTap: () {
                    controlNotifier.isPhotoFilter =
                        !controlNotifier.isPhotoFilter;
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  backGroundColor: Colors.black12,
                  child: Transform.scale(
                      scale: 0.7,
                      child: const ImageIcon(
                        AssetImage('assets/icons/check.png',
                            package: 'stories_editor'),
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
