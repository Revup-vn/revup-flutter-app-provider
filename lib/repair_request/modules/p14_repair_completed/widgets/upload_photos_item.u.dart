import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:revup_core/core.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../shared/utils/utils.dart';
import '../bloc/image_picker_bloc.dart';

class UploadPhotosItem extends StatelessWidget {
  const UploadPhotosItem({
    super.key,
    required this.onUpdatedImageTile,
  });

  final Function1<List<StorageFile>, void> onUpdatedImageTile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final blocImage = context.watch<ImagePickerBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          l10n.pictureLabel,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ) ??
              TextStyle(
                color: Theme.of(context).colorScheme.outline,
              ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            InkWell(
              onTap: () {
                showMaterialModalBottomSheet<Widget>(
                  context: context,
                  builder: (context) => SafeArea(
                    top: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: AutoSizeText(l10n.imageFromGalleryLabel),
                          leading: const Icon(Icons.photo_library_rounded),
                          onTap: () async {
                            blocImage.add(
                              const ImagePickerEvent.imageUploadSelected(
                                ImageSource.gallery,
                              ),
                            );
                            await context.router.pop();
                          },
                        ),
                        ListTile(
                          title: AutoSizeText(l10n.photoWithCameraLabel),
                          leading: const Icon(Icons.camera_alt_rounded),
                          onTap: () async {
                            blocImage.add(
                              const ImagePickerEvent.imageUploadSelected(
                                ImageSource.camera,
                              ),
                            );
                            await context.router.pop();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) => state.when(
                  initial: () => SizedBox(
                    height: 120,
                    child: DottedBorder(
                      color: Theme.of(context).colorScheme.primary,
                      borderType: BorderType.RRect,
                      dashPattern: const [6, 5],
                      radius: const Radius.circular(12),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.screens.addImage.svg(),
                            const SizedBox(
                              height: 8,
                            ),
                            AutoSizeText(
                              l10n.chooseImageLabel,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  choosePhotoSuccess: (image) {
                    onUpdatedImageTile([StorageFile.profile(file: image)]);
                    return Stack(
                      children: [
                        SizedBox(
                          height: 120,
                          child: Image.file(
                            image,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Positioned(
                          child: IconButton(
                            onPressed: () {
                              blocImage.add(const ImagePickerEvent.started());
                            },
                            icon: Icon(
                              Icons.cancel,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            // Container(
            //   height: 50,
            //   width: 50,
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).colorScheme.onInverseSurface,
            //     borderRadius: BorderRadius.circular(5),
            //   ),
            //   child: Icon(
            //     Icons.add_photo_alternate_outlined,
            //     size: 40,
            //     color: Theme.of(context).colorScheme.outline,
            //   ),
            // ),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 64,
                child: ListView.builder(
                  itemCount: 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      kFallbackImage,
                      height: 50,
                      width: 50,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
