import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared/component/atom/app_icon.dart';
import 'package:shared/shared.dart';

class AppToolbar extends StatelessWidget {
  const AppToolbar({
    required this.title,
    required this.onback,
    required this.content,
    this.toolbarActions,
    this.backgroundColor,
    super.key,
  });

  final String title;
  final Function()? onback;
  final Widget content;
  final List<ToolbarAction>? toolbarActions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, bottom: 10),
            color: AppColors.primaryColor,
            child: Row(
              children: [
                if (onback != null)
                  InkWell(
                    onTap: onback?.call,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SvgPicture.asset(
                        MainAssets.back,
                      ),
                    ),
                  )
                else
                  const Padding(padding: EdgeInsets.fromLTRB(20, 20, 0, 20)),
                Text(
                  title,
                  style: Styles.textLRegular.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                if ((toolbarActions ?? []).isNotEmpty)
                  ...toolbarActions!.map(
                    (e) => InkWell(
                      onTap: e.onTap,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: AppIcon(asset: e.asset),
                      ),
                    ),
                  )
                else
                  Container(),
              ],
            ),
          ),
          Expanded(child: content),
        ],
      ),
    );
  }
}

class ToolbarAction {
  ToolbarAction(this.asset, this.onTap);

  final String asset;
  final Function() onTap;
}
