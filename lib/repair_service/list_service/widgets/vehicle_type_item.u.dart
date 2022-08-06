import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class VehicleTypeItem extends StatelessWidget {
  const VehicleTypeItem({
    super.key,
    required this.vehicleName,
    required this.iconVehicle,
    required this.callback,
  });
  final String vehicleName;
  final Icon iconVehicle;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Chip(
          backgroundColor: Theme.of(context).colorScheme.primary,
          avatar: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
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
