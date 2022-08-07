import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../l10n/l10n.dart';

class AddServiceView extends StatelessWidget {
  const AddServiceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // TODO(tcmhoang): Intl this view screen and fields in this

    // Initial Selected Value
    var dropdownvalue = 'Unit';
    // List of items in our dropdown menu
    final items = [
      'Unit',
      'Box',
    ];

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          l10n.addNewServiceLabel,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        l10n.servicePhotoLabel,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                ) ??
                            TextStyle(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Container(
                          height: 96,
                          width: 96,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.outline,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(Icons.add_photo_alternate_outlined),
                        ),
                      ),
                      const SizedBox(height: 10),
                      AutoSizeText(
                        l10n.serviceInforLabel,
                        style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                ) ??
                            TextStyle(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                      const SizedBox(height: 10),
                      AutoSizeText(
                        l10n.serviceNameLabel,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: 5),
                      FormBuilderTextField(
                        name: '',
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: l10n.enterServiceNameLabel,
                        ),
                        style: Theme.of(context).textTheme.labelLarge,
                        keyboardType: TextInputType.multiline,
                      ),
                      const SizedBox(height: 10),
                      AutoSizeText(
                        l10n.serviceFeeLabel,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: 5),
                      FormBuilderTextField(
                        name: '',
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: l10n.enterMountLabel,
                        ),
                        style: Theme.of(context).textTheme.labelLarge,
                        keyboardType: TextInputType.multiline,
                      ),
                      const SizedBox(height: 10),
                      AutoSizeText(
                        l10n.priceUnitLabel,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton(
                          // Initial Value
                          value: dropdownvalue,
                          isExpanded: true,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            dropdownvalue = newValue!;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      AutoSizeText(
                        l10n.serviceDescriptionLabel,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: 5),
                      FormBuilderTextField(
                        name: '',
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: l10n.enterShortDescriptionLabel,
                        ),
                        style: Theme.of(context).textTheme.labelLarge,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        maxLength: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: ElevatedButton(
                onPressed: () {
                  // TODO(namngoc231): Complete
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: AutoSizeText(
                  l10n.saveLabel,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
