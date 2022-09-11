import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  String get _viHtmlContent => '''
<h2 style="text-align: center;">Tầm nhìn</h2>
<p> Chúng tôi mong muốn trở thành một phần không thể tách rời trong cuộc sống hằng ngày của mỗi người Việt Nam.</p>
<hr>
<h2 style="text-align: center;">Sứ mệnh</h2>
<p> Với quyết tâm trở thành người tiên phong tạo ra những chuẩn mực mới về chất lượng, chúng tôi cam kết luôn đặt sự hài lòng của khách hàng là trọng tâm trong từng hành động dù là nhỏ nhất.</p>
<hr>
<h2 style="text-align: center;">Giá trị thương hiệu</h2>
<p>Vì Cộng Đồng</p>
<p>Không Ngừng Đổi Mới</p>
<p>Tạo Điều Kiện Phát Triển</p>
  ''';

  String get _enHtmlContent => '''
<h2 style="text-align: center;">Tầm nhìn</h2>
<p> Chúng tôi mong muốn trở thành một phần không thể tách rời trong cuộc sống hằng ngày của mỗi người Việt Nam.</p>
<hr>
<h2 style="text-align: center;">Sứ mệnh</h2>
<p> Với quyết tâm trở thành người tiên phong tạo ra những chuẩn mực mới về chất lượng, chúng tôi cam kết luôn đặt sự hài lòng của khách hàng là trọng tâm trong từng hành động dù là nhỏ nhất.</p>
<hr>
<h2 style="text-align: center;">Giá trị thương hiệu</h2>
<p>Vì Cộng Đồng</p>
<p>Không Ngừng Đổi Mới</p>
<p>Tạo Điều Kiện Phát Triển</p>
''';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final content = context.read<LanguageCubit>().state.when(
          system: () => _viHtmlContent,
          vietnamese: () => _viHtmlContent,
          english: () => _enHtmlContent,
        );

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          l10n.aboutUsLabel,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 12, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Html(
                data: content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
