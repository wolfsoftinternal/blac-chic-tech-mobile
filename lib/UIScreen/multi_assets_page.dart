// Copyright 2019 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by an Apache license that can be found
// in the LICENSE file.

import 'package:blackchecktech/Utils/page_mixin.dart';
import 'package:flutter/material.dart';

import '../Utils/picker_method.dart';

class MultiAssetsPage extends StatefulWidget {
  // const MultiAssetsPage({super.key});

  @override
  State<MultiAssetsPage> createState() => _MultiAssetsPageState();
}

class _MultiAssetsPageState extends State<MultiAssetsPage>
    with AutomaticKeepAliveClientMixin, ExamplePageMixin {
  @override
  int get maxAssetsCount => 1;

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
  get height => 40;
}
