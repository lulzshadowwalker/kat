import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../theme/kat_colors.dart';

/// e.g. "already have an account ? **Sign in**" where the second part
/// is interactable and has an accent color
class KatRichTextButton extends StatelessWidget {
  const KatRichTextButton({
    super.key,
    required this.text,
    required this.textCTA,
    required this.onTap,
    this.color,
  });

  final String text;
  final String textCTA;
  final Color? color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 35),
      child: RichText(
        text: TextSpan(
            style: Theme.of(context).textTheme.caption,
            children: <TextSpan>[
              TextSpan(text: text),
              TextSpan(
                text: ' $textCTA',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: color ?? KatColors.primary(context)),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
            ]),
      ),
    );
  }
}
