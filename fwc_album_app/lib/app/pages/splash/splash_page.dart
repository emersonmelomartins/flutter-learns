import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messages.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/core/ui/widgets/rounded_button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with Loader<SplashPage>, Messages<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash Page"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              style: ButtonStyles.instance.yellowButton,
              onPressed: () {},
              child: const Text("Botão"),
            ),
            OutlinedButton(
              style: ButtonStyles.instance.yellowOutlinedButton,
              onPressed: () {
                showSuccess("Erro no botão");
              },
              child: const Text("Botão Sucesso"),
            ),
            ElevatedButton(
              style: ButtonStyles.instance.primaryButton,
              onPressed: () {
                showInfo("Info no botão");
              },
              child: const Text("Botão Info"),
            ),
            OutlinedButton(
              style: ButtonStyles.instance.primaryOutlinedButton,
              onPressed: () {
                showError("Erro no botão");
              },
              child: const Text("Botão Erro"),
            ),
            const TextField(),
            Button(
              width: MediaQuery.of(context).size.width * .9,
              style: ButtonStyles.instance.yellowButton,
              labelStyle: context.textStyles.textPrimaryFontBold,
              label: "Salvar",
              onPressed: () async {
                showLoader();

                await Future.delayed(const Duration(seconds: 2));
                hideLoader();
              },
            ),
            RoundedButton(
              onPressed: () {},
              icon: Icons.abc,
            )
          ],
        ),
      ),
    );
  }
}
