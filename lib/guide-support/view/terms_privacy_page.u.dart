import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:revup_core/core.dart';

import '../../gen/assets.gen.dart';
import '../../l10n/l10n.dart';

class TermsPrivacyPage extends StatelessWidget {
  const TermsPrivacyPage({super.key});

  String get _viHtmlContent => '''
<div>
    <p>  Khi sử dụng <strong>Dịch vụ</strong>, sử dụng ứng dụng REVUP, Quý khách cam kết và bảo đảm rằng:</p>
<ol>
  <li>Có năng lực hành vi dân sự đầy đủ theo quy định của pháp luật hiện hành để chấp thuận và đồng ý với Điều khoản sử dụng; có quyền, thẩm quyền và năng lực để sử dụng Dịch vụ và tuân theo Điều khoản sử dụng này</li>
  <li>Những thông tin cung cấp cho REVUP luôn đảm bảo cập nhật, đầy đủ và xác thực.</li>
  <li>Không đươc chuyển giao, chuyển nhượng tài khoản người dùng ứng dụng revup của mình cho bất kỳ cá nhân hoặc tổ chức nào</li>
  <li>Cam kết luôn tuân thủ quy định của pháp luật hiện hành liên quan được áp dụng tại các quốc gia của mình và tại Việt Nam</li>
  <li>Khi sử dụng dịch vụ của chúng tôi, bạn tin tưởng cung cấp thông tin của bạn cho chúng tôi. Chúng tôi hiểu rằng đây là một trách nhiệm lớn và chúng tôi nỗ lực bảo vệ thông tin của bạn cũng như để bạn nắm quyền kiểm soát.</li>
</ol> 
</div>
  ''';

  String get _enHtmlContent => '''
<p> When using <strong>Service</strong>, using the REVUP application, you represent and warrant that:</p>
<ol>
  <li>Having full civil act capacity as required by applicable law to accept and agree to the Terms of Use; has the right, authority and capacity to use the Service and to abide by these Terms of Use</li>
  <li>The information provided to REVUP is always updated, complete and authentic.</li>
  <li>Do not transfer, transfer your revup application user account to any person or organization</li>
  <li>Committed to always complying with relevant current laws applied in our countries and in Vietnam</li>
  <li>When using our services, you trust us with your information. We understand that this is a big responsibility and we work hard to protect your information and keep you in control.</li>
</ol>
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
          l10n.termsPrivacyLabel,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Assets.screens.termsPrivacy.svg(width: 200, height: 200),
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
