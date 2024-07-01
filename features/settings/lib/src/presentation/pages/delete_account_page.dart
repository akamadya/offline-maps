import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:settings/src/presentation/blocs/delete/delete_account_bloc.dart';
import 'package:shared/component/atom/atom.dart';
import 'package:shared/shared.dart';
import 'package:shared/utils/utlis.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountBloc, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountLoading) {
        } else if (state is DeleteAccountError) {
          MessageWidget.showError(context, message: state.message);
        } else if (state is DeleteAccountLoaded) {
          //context.read<ProfileBloc>().add(ClearProfile());
          context.read<AuthBloc>().add(SignOut());
          context.pop();
        }
      },
      child: AppToolbar(
        title: 'Hapus Akun',
        onback: () => context.pop(),
        content: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Text(
                'Setelah dihapus, akun anda tidak akan bisa dikembalikan dan diakses lagi, Jika anda sudah yakin, mohon konfirmasi bahwa anda bersedia kehilangan akses.',
                style: Styles.textMRegular),
            const SizedBox(height: 10),
            Text(
                'Optima tidak bertanggung jawab atas hilangnya informasi dan data setelah akun ini dihapus.',
                style: Styles.textMRegular),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Text('Saya setuju dan bersedia menghapus akun ini',
                          style: Styles.textMBold)),
                  const SizedBox(width: 10),
                  Checkbox(
                      value: isCheck,
                      onChanged: (value) {
                        setState(() {
                          isCheck = value!;
                        });
                      }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            AppButton(
                title: 'Hapus Akun',
                colorFill: isCheck ? Colors.red : Colors.grey,
                onPressed: isCheck
                    ? () {
                        context.read<DeleteAccountBloc>().add(DeleteAccount());
                      }
                    : () {}),
          ]),
        ),
      ),
    );
  }
}
