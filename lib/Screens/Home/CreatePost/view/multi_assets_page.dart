// Copyright 2019 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by an Apache license that can be found
// in the LICENSE file.

import 'package:blackchecktech/Utils/page_mixin.dart';
import 'package:blackchecktech/Utils/picker_method.dart';
import 'package:flutter/material.dart';

class MultiAssetsPage extends StatefulWidget {
  final height;
  MultiAssetsPage(this.height);

  @override
  State<MultiAssetsPage> createState() => _MultiAssetsPageState();
}

class _MultiAssetsPageState extends State<MultiAssetsPage>
    with AutomaticKeepAliveClientMixin, ExamplePageMixin {
  @override
  int get maxAssetsCount => 10;

  /// Check each method's source code for more details.
  @override
  List<PickMethod> get pickMethods {
    return <PickMethod>[
      PickMethod.common(maxAssetsCount),
    ];
  }

  @override
  bool get wantKeepAlive => true;
  
  @override
  // TODO: implement height
  get height => widget.height;
}
