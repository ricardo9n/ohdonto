import 'package:dartz/dartz.dart' as dz;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:ohdonto/core/failure.dart';
import 'package:ohdonto/signin_signup/datasource/rest_dio_signup_datasource.dart';
import 'package:ohdonto/signin_signup/presentation/verification/signup_verification_controller.dart';
import 'package:ohdonto/signin_signup/presentation/widgets/defaul_button_widget.dart';
import 'package:ohdonto/signin_signup/presentation/widgets/text_field_widget.dart';

class SignUpVerificationPage extends StatefulWidget {
  const SignUpVerificationPage({Key? key, this.email})
      : super(key: key); //todo: email

  final String? email;

  @override
  State<SignUpVerificationPage> createState() => _SignUpVerificationPageState();
}

class _SignUpVerificationPageState extends State<SignUpVerificationPage> {
  late SignUpVerificationController controlador;
  //late ReactionDisposer errorMessageDisposer;
  late ReactionDisposer verificationCodeDisposer;
  late FocusNode b1, b2, b3, b4;

  @override
  void dispose() {
    b1.dispose();
    b2.dispose();
    b3.dispose();
    b4.dispose();
    // errorMessageDisposer();
    verificationCodeDisposer();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controlador = SignUpVerificationController();
    controlador.email = widget.email;
    controlador.setRepository(RestDioSignupDataSource());
    verificationCodeDisposer = reaction(
      (_) => controlador.verificationCodeObs!,
      verificationCodeHandler,
    );

    b1 = FocusNode();
    b2 = FocusNode();
    b3 = FocusNode();
    b4 = FocusNode();
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future showDialogMessage(String titulo, String conteudo) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              title: Text(titulo),
              content: Text(conteudo),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Ok"))
              ]);
        });
  }

  void verificationCodeHandler(dz.Either<Failure, bool> message) {
    message.fold((l) => showDialogMessage("Falha", "$l"), (r) {
      if (r) {
        showDialogMessage("Sucesso", "Codigo verificado com sucesso");
      } else {
        showDialogMessage("Falha", "Codigo invalido");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Observer(
            builder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFirstRow(),
                    const SizedBox(height: 24),
                    const Text('Verificar ', style: TextStyle(fontSize: 45)),
                    const Text('Código', style: TextStyle(fontSize: 45)),
                    const SizedBox(height: 24),
                    const Text('Um código foi enviado para'),
                    Text('${widget.email}'),
                    const SizedBox(height: 24),
                    _buildRowNumbersField(),
                    const SizedBox(height: 24),
                    Center(child: Observer(builder: (_) {
                      if (controlador.sendVerificationCodeObs != null &&
                          controlador.sendVerificationCodeObs?.status ==
                              FutureStatus.pending) {
                        return const CircularProgressIndicator();
                      } else {
                        if (controlador.sendVerificationCodeObs != null &&
                            controlador.sendVerificationCodeObs?.status ==
                                FutureStatus.fulfilled) {
                          //controlador.setErrorMessage();
                        }
                        return DefaultButton(
                            widget: const Text(
                              "Enviar código",
                            ),
                            color: Colors.blue,
                            callback: controlador.isFullFilled
                                ? () {
                                    controlador.sendVerificationCode();
                                  }
                                : null);
                      }
                    })),
                    const SizedBox(height: 24),
                    //_buildBotaoEnviarCodigo(),
                    _buildTextoReenviar(),
                  ],
                )),
      ),
    ));
  }

  Widget _buildTextoReenviar() {
    return Center(
      child: RichText(
          text: TextSpan(
              style: const TextStyle(color: Colors.grey),
              text: "Não recebi o código. ",
              children: [
            TextSpan(
              text: "Reenviar",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ])),
    );
  }

  Widget _buildFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        const Text("Vamos criar uma conta ?", style: TextStyle(fontSize: 24))
      ],
    );
  }

  Widget _buildRowNumbersField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildNumberField(b1, b2, (field) => controlador.setField1(field)),
        const SizedBox(width: 12),
        _buildNumberField(b2, b3, (field) => controlador.setField2(field)),
        const SizedBox(width: 12),
        _buildNumberField(b3, b4, (field) => controlador.setField3(field)),
        const SizedBox(width: 12),
        _buildNumberField(b4, null, (field) => controlador.setField4(field)),
      ],
    );
  }

  Widget _buildNumberField(focusNode, nextFocusNode, callback) {
    return SizedBox(
      width: 40,
      child: TextFieldWidget(
        maxLength: 1,
        keyboardType: TextInputType.number,
        //onChanged: callback,
        focusNode: focusNode,
        nextFocusNode: nextFocusNode,
        text: "",
        hint: "*",
        callback: callback,
      ),
    );
  }
}
