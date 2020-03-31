import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medium/ui/shared/text_styles.dart';
import 'package:medium/ui/widgets/platform_widget.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key key,
    @required this.title,
    @required this.svgAssetPath,
    @required this.onPressed,
    this.backgroundColor,
  })  : assert(title != null),
        assert(svgAssetPath != null),
        super(key: key);

  final VoidCallback onPressed;
  final String svgAssetPath;
  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final button = Card(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              svgAssetPath,
              height: 28,
              width: 28,
            ),
            SizedBox(width: 12),
            Text(
              title,
              style: AppTextStyles.button,
            ),
          ],
        ),
      ),
    );

    return PlatformWidget(
      androidBuilder: (_) => InkWell(
        onTap: onPressed,
        child: button,
      ),
      iosBuilder: (_) => CupertinoButton(
        pressedOpacity: 0.8,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: button,
      ),
    );
  }
}
