import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class VehicleTypeItem extends StatelessWidget {
  const VehicleTypeItem({
    super.key,
    required this.vehicleName,
    required this.iconVehicle,
    required this.callback,
    required this.sorted,
  });
  final String vehicleName;
  final Icon iconVehicle;
  final VoidCallback callback;
  final bool sorted;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Chip(
          backgroundColor: sorted
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurfaceVariant,
          avatar: CircleAvatar(
            backgroundColor: sorted
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurfaceVariant,
            child: iconVehicle,
          ),
          label: AutoSizeText(
            vehicleName,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ) ??
                TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
    );
  }
}
