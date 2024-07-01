import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:settings/settings.dart';
import 'package:shared/generated/l10n.dart';
import 'package:shared/shared.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final settings = context.select(
      (SettingsBloc bloc) => bloc.state.settings,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.helloWorld,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(GetIt.I<Dio>().options.baseUrl),
            const SizedBox(
              height: 64,
            ),
            TextButton.icon(
              label: const Text('Change To Development'),
              icon: const Icon(Icons.construction),
              onPressed: () {
                context.read<SettingsBloc>().add(const SetFlavor(Flavor.dev));
              },
            ),
            TextButton.icon(
              label: const Text('Change To Staging'),
              icon: const Icon(Icons.construction),
              onPressed: () {
                context.read<SettingsBloc>().add(const SetFlavor(Flavor.stag));
              },
            ),
            TextButton.icon(
              label: const Text('Change To Production'),
              icon: const Icon(Icons.construction),
              onPressed: () {
                context.read<SettingsBloc>().add(const SetFlavor(Flavor.prod));
              },
            ),
            const Spacer(),
            BlocBuilder<LanguageBloc, LanguageState>(
              builder: (_, state) {
                return Wrap(
                  children: List.generate(state.languages.length, (index) {
                    return TextButton.icon(
                      label: Text(
                        'Change Language ${state.languages[index].name}',
                      ),
                      icon: const Icon(Icons.language),
                      onPressed: () {
                        context
                            .read<SettingsBloc>()
                            .add(SetLanguage(state.languages[index]));
                      },
                    );
                  }),
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final bloc = context.read<SettingsBloc>();
          if (settings.appTheme == AppTheme.dark) {
            bloc.add(const SetTheme(AppTheme.light));
          } else {
            bloc.add(const SetTheme(AppTheme.dark));
          }
        },
        child: settings.appTheme == AppTheme.dark
            ? const Icon(Icons.light_mode)
            : const Icon(Icons.dark_mode),
      ),
    );
  }
}
