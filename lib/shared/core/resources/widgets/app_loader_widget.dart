import 'dart:io';

import 'package:e_commerce/shared/core/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoaderWidget extends StatelessWidget {
  final Color? color;
  const AppLoaderWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Center(
          child: CupertinoActivityIndicator(color: color ?? AppColors.primary),
        )
        : Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? AppColors.primary,
            ),
          ),
        );
  }
}
