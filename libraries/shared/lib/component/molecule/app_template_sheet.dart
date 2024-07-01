import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/component/atom/atom.dart';
import 'package:shared/shared.dart';

class AppTemplateSheet extends StatelessWidget {
  const AppTemplateSheet({
    super.key,
    this.onTapButton,
    this.titleButton,
    this.message,
    this.title,
    this.showButton,
    this.smallTitle,
    this.body,
  });

  final Function? onTapButton;
  final String? titleButton;
  final String? message;
  final String? title;
  final String? smallTitle;
  final bool? showButton;
  final Widget? body;

  void show(BuildContext context, {Offset? anchorPoint}) {
    showModalBottomSheet<void>(
      context: context,
      anchorPoint: const Offset(double.maxFinite, 50),
      isScrollControlled: true,
      builder: (_) {
        return build(context);
      },
    ).whenComplete(() {
      FocusScope.of(context).requestFocus(FocusNode());
      SystemChannels.textInput.invokeListMethod<void>('TextInput.hide');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 6,
            width: 70,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(.4)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if ((smallTitle ?? '').isNotEmpty)
                      Text(
                        smallTitle ?? '',
                        style: Styles.textLBold,
                      )
                    else
                      Container(),
                    const Spacer(),
                    InkWell(
                      onTap: () => context.pop(),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Icon(
                          Icons.close,
                        ),
                      ),
                    ),
                  ],
                ),
                if (title?.isNotEmpty ?? false) ...[
                  Text(
                    title!,
                    style: Styles.textLBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ] else
                  Container(),
                if (message != null)
                  Text(
                    message ?? '',
                    style: Styles.textLRegular,
                  )
                else
                  Container(),
                const SizedBox(
                  height: 10,
                ),
                body ?? Container(),
                const SizedBox(
                  height: 20,
                ),
                if (showButton ?? false)
                  AppButton(
                      title: titleButton ?? 'Tutup',
                      onPressed: () => onTapButton?.call() ?? context.pop())
                else
                  Container()
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
        ],
      ),
    );
  }
}
