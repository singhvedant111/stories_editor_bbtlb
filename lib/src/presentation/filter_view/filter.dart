import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:provider/provider.dart';
import 'package:stories_editor/src/domain/models/painting_model.dart';
import 'package:stories_editor/src/domain/providers/notifiers/control_provider.dart';
import 'package:stories_editor/src/domain/providers/notifiers/filter_notifier.dart';
import 'package:stories_editor/src/domain/providers/notifiers/painting_notifier.dart';
import 'package:stories_editor/src/presentation/filter_view/widgets/top_filter_tools.dart';
import 'package:stories_editor/src/presentation/painting_view/widgets/sketcher.dart';
import 'package:stories_editor/src/presentation/painting_view/widgets/top_painting_tools.dart';
import 'package:stories_editor/src/presentation/widgets/color_selector.dart';
import 'package:stories_editor/src/presentation/widgets/size_slider_selector.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PaintingNotifier>(context, listen: false)
        ..linesStreamController =
            StreamController<List<PaintingModel>>.broadcast()
        ..currentLineStreamController =
            StreamController<PaintingModel>.broadcast();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// return Painting board
    return Consumer2<ControlNotifier, FilterNotifier>(
      builder: (context, controlNotifier, filternotifier, child) {
        return WillPopScope(
          onWillPop: () async {
            controlNotifier.isPainting = false;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              filternotifier.closeConnection();
            });
            return true;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                const SafeArea(child: TopFilterTools()),

                /// bottom color picker
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                    child: Container(child: Text('chutiya')), //Filter Selector
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
