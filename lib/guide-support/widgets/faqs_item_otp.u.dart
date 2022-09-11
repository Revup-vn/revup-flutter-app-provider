import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';

class FAQsItemOTPPage extends StatelessWidget {
  const FAQsItemOTPPage({super.key});

  String get _viHtmlContent => '''
<div>
    <p>Nếu bạn không nhận được <strong>Mã xác minh OTP</strong> khi đăng nhập hoặc thay đổi mật khẩu tài khoản qua tin nhắn SMS, nguyên nhân có thể là do:</p>
<ol>
  <li style="color:red;">Lỗi kết nối hoặc lỗi đường truyền</li>
   <p>Trong trường hợp này, bạn có thể thử những hướng giải quyết sau:</p>
 <ul>
  <li>Kiểm tra lại sóng dịch vụ viễn thông trên điện thoại của bạn đủ mạnh</li>
  <li>Yêu cầu gửi lại Mã xác minh OTP (cho phép tối đa 04 lần)</li>
  <li>Lắp lại thẻ SIM và thử lại yêu cầu gửi lại Mã xác minh OTP</li>
 </ul>
  <li style="color:red;">Số điện thoại liên kết tài khoản không chính xác</li>
  <p> Số điện thoại đúng để nhận được mã xác 
minh phải là số điện thoại bạn đã dùng để đăng ký tài khoản REVUP. Bạn vui lòng kiểm tra lại thông tin tài khoản nhằm đảm bảo số điện thoại là chính xác.</p>
  <li style="color:red;"> Vượt quá giới hạn yêu cầu gửi mã OTP</li>
  <p> Thông báo Yêu cầu OTP không thành công sẽ được hiện thị khi banj vượt quá số lượt yêu cầu gửi lại Mã xác minh OTP cho phép (tối đa 04 lần). Trong trường hợp này bạn đợi 30 phút và thử yêu cầu gửi lại Mã xác minh OTP</p>
</ol> 
</div>
  ''';

  String get _enHtmlContent => '''
<div>
    <p>If you don't receive <strong>OTP verification code</strong> when you log in or change your account password via SMS, it could be because:</p>
<ol>
  <li style="color:red;">Connection or transmission error</li>
   <p>In this case, you can try the following workarounds:</p>
 <ul>
  <li>Check that your mobile phone service signal is strong</li>
  <li>Request to resend OTP Verification Code (maximum 04 times allowed)</li>
  <li>Reinsert SIM card and retry requesting OTP Verification Code resend</li>
 </ul>
  <li style="color:red;">Invalid account link phone number</li>
  <p> Correct phone number to receive verification code
must be the phone number you used to register your REVUP account. Please double check your account information to make sure your phone number is correct.</p>
  <li style="color:red;"> OTP request request limit exceeded</li>
  <p> The message OTP request failed will be displayed when you exceed the number of requests to resend the OTP Verification Code (maximum 04 times). In this case you wait 30 minutes and try to request resend OTP Verification Code</p>
</ol>
</div>
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
          l10n.postLabel,
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
              AutoSizeText(
                l10n.questionOTPLabel,
                style: Theme.of(context).textTheme.headline5,
              ),
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
