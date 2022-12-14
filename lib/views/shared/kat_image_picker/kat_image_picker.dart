import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../auth/auth_imports.dart';

class KatImagePicker extends StatelessWidget {
  const KatImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // gallery option
          KatExpandedElevatedButton(
            backgroundColor: KatColors.primary(context),
            foregroundColor: KatColors.primaryContainer(context),
            onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
            leading: FaIcon(
              FontAwesomeIcons.solidImage,
              color: KatColors.same(context),
              size: 16,
            ),
            text: KatTranslations.gallery.tr(),
          ),
          const SizedBox(height: 5),

          //  camera option
          KatExpandedElevatedButton(
            backgroundColor: KatColors.primary(context),
            foregroundColor: KatColors.primaryContainer(context),
            onPressed: () => Navigator.of(context).pop(ImageSource.camera),
            leading: FaIcon(
              FontAwesomeIcons.camera,
              color: KatColors.same(context),
              size: 16,
            ),
            text: KatTranslations.camera.tr(),
          ),

          // cancel
          const SizedBox(height: 15),
          KatExpandedElevatedButton(
            backgroundColor: KatColors.primaryContainer(context),
            foregroundColor: KatColors.primary(context),
            onPressed: () => Navigator.of(context).pop(),
            fontWeight: FontWeight.bold,
            text: KatTranslations.cancel.tr(),
            // color: Colors.transparent,
            // borderless: false,
            // foregroundColor: BethColors.lightPrimary1,
          ),
        ],
      ),
    );
  }
}
