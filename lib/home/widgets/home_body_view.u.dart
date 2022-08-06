import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Xin chào, Quang Nghĩa',
                style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold) ??
                    const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                    child: Icon(
                      const IconData(
                        0xe3ab,
                        fontFamily: 'MaterialIcons',
                      ),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  AutoSizeText(
                    'Cầu Giấy, Hà Nội',
                    style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(fontWeight: FontWeight.bold) ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  AutoSizeText(
                    'Trạng thái hoạt động',
                    style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(fontWeight: FontWeight.bold) ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(width: 10),
                  FlutterSwitch(
                    value: true,
                    width: 45,
                    height: 25,
                    activeColor: Theme.of(context).colorScheme.primary,
                    onToggle: (value) {
                      // TODO(namngoc231): change status
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              AutoSizeText(
                'Đơn hàng gần đây',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Container(
                height: 140,
                color: Theme.of(context).colorScheme.inverseSurface,
                alignment: Alignment.center, // where to position the child
              ),
              const SizedBox(height: 32),
              AutoSizeText(
                'Thời tiết hôm nay',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Container(
                height: 140,
                color: Theme.of(context).colorScheme.tertiary,
                alignment: Alignment.center, // where to position the child
              ),
              const SizedBox(height: 32),
              AutoSizeText(
                'Dịch vụ của tôi',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Container(
                height: 140,
                color: Theme.of(context).colorScheme.outline,
                alignment: Alignment.center, // where to position the child
              ),
            ],
          ),
        ),
      ),
    );
  }
}
