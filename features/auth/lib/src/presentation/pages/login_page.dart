import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:shared/component/atom/atom.dart';
import 'package:shared/generated/l10n.dart';
import 'package:shared/shared.dart';
import 'package:shared/utils/message_widget.dart';
import 'package:shared/utils/utlis.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          statusBarIconBrightness: Theme.of(context).brightness,
        ),
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInError) {
              LoadingWidget.hide(context);
              final message = state.message.isNotEmpty
                  ? state.message
                  : context.l10n.errorLogin;
              MessageWidget.showError(context,
                  title: context.l10n.somethingWrong, message: message);
            } else if (state is SignInSuccess) {
              LoadingWidget.hide(context);
              context.go(NamedRoutes.mainPage);
            } else if (state is SignInLoading) {
              LoadingWidget.show(context);
            }
          },
          child: const Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Header(),
                  _Body(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Stack(
      children: [
        Container(
          color: AppColors.primaryColor,
          width: double.infinity,
          height: 250,
        ),
        AppIcon(asset: MainAssets.gridEffect, height: 250),
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  MainAssets.logoWhitePng,
                  height: 80,
                ),
                const SizedBox(height: 15),
                Text(
                  l10n.titleLogin,
                  style: Styles.textLRegular.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  maxLines: 2,
                ),
                Text(
                  l10n.descLogin,
                  style: Styles.textMRegular.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late SignInBloc bloc;

  @override
  void initState() {
    bloc = context.read<SignInBloc>();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: AppColors.primaryColor,
                tabs: const [
                  Tab(text: 'Standart'),
                  Tab(text: 'SSO'),
                ]),
          ),
          const SizedBox(height: 20),
          //CustomTextFormField(controller: TextEditingController()),
          body(l10n),
        ],
      ),
    );
  }

  Widget body(AppLocalizations l10n) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.username, style: Styles.textMRegular),
          const SizedBox(
            height: 5,
          ),
          AppTextField(
            controller: _emailController,
            decoration: AppInputDecoration(hintText: l10n.enterUsername),
            prefixWidget: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                MainAssets.email,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.password,
            style: Styles.textMRegular,
          ),
          const SizedBox(
            height: 5,
          ),
          PasswordTextField(
              controller: _passwordController, hintText: '*******'),
          const SizedBox(
            height: 24,
          ),
          AppButton(
            title: l10n.login,
            onPressed: () => bloc.add(SignIn(_emailController.text,
                _passwordController.text, _tabController.index == 1)),
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () => context.push(NamedRoutes.forgotPass),
            child: Center(
              child: Text(
                l10n.forgotPass,
                style: Styles.textMBold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      );
}
