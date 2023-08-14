import 'package:flutter/material.dart';
import 'package:pay7test/app/configs/constants/spacements.dart';
import 'package:pay7test/app/configs/styles/app_color_style.dart';
import 'package:pay7test/app/modules/home/home_controller.dart';
import 'package:pay7test/app/shared/components/custom_dropdown.dart';
import 'package:pay7test/app/shared/components/custom_text_form_field.dart';
import 'package:pay7test/app/shared/components/left_navbar.dart';
import 'package:pay7test/app/shared/components/primary_button.dart';
import 'package:pay7test/app/shared/components/top_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    DataColumn columnTable({required String text}) {
      return DataColumn(
        label: Expanded(
          child: Text(text),
        ),
      );
    }

    DataCell rowTable({required String text}) {
      return DataCell(
        Text(text),
      );
    }

    DataCell rowTableAction() {
      return DataCell(
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_outlined,
            color: AppColors.secondary,
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWeb = constraints.maxWidth > 768;

        return Scaffold(
          body: Row(
            children: [
              const LeftNavbar(),
              Expanded(
                child: Column(
                  children: [
                    const TopNavbar(),
                    const SizedBox(height: Spacements.XL),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Spacements.M),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Wrap(
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.end,
                              runSpacing: Spacements.S,
                              spacing: Spacements.M,
                              children: [
                                ListenableBuilder(
                                  listenable: controller,
                                  builder: (context, child) {
                                    return controller.countryStates != null
                                        ? CustomDropdown(
                                            width: isWeb ? 200 : double.maxFinite,
                                            title: 'Selecione um estado',
                                            onChanged: controller.selectState,
                                            value: controller.countryStates?.first.id,
                                            items: controller.countryStates
                                                ?.map(
                                                  (e) => CustomDropdownItem(
                                                    text: e.sigla,
                                                    value: e.id,
                                                  ),
                                                )
                                                .toList(),
                                            hintText: 'Selecione um estado',
                                          )
                                        : Container();
                                  },
                                ),
                                ListenableBuilder(
                                  listenable: controller,
                                  builder: (context, child) {
                                    return CustomDropdown(
                                      width: isWeb ? 200 : double.maxFinite,
                                      title: 'Selecione uma cidade',
                                      onChanged: controller.selectCity,
                                      value: controller.cities?.first.id,
                                      items: controller.cities
                                          ?.map(
                                            (e) => CustomDropdownItem(
                                              text: e.nome,
                                              value: e.id,
                                            ),
                                          )
                                          .toList(),
                                      hintText: 'Selecione uma cidade',
                                    );
                                  },
                                ),
                                CustomTextFormField(
                                  width: isWeb ? 300 : double.maxFinite,
                                  onChanged: controller.onChangePlaceText,
                                  hintText: 'Digite o Logradouro',
                                ),
                                CustomTextFormField(
                                  width: isWeb ? 200 : double.maxFinite,
                                  onChanged: controller.onChangeCepText,
                                  hintText: 'Digite o CEP',
                                ),
                              ],
                            ),
                            const SizedBox(height: Spacements.S),
                            Row(
                              children: [
                                PrimaryButton(
                                  text: 'Buscar',
                                  onPressed: () {
                                    controller.isCep ? controller.getAddressByCep() : controller.getAddressesByPlace();
                                  },
                                ),
                                const SizedBox(width: Spacements.S),
                                PrimaryButton(
                                  text: 'Limpar Resultado',
                                  onPressed: () {
                                    controller.clearAddresses();
                                  },
                                  bgColor: AppColors.error,
                                ),
                              ],
                            ),
                            const SizedBox(height: Spacements.M),
                            Wrap(
                              children: [
                                ListenableBuilder(
                                  listenable: controller,
                                  builder: (context, child) {
                                    return CustomDropdown(
                                      width: isWeb ? 200 : double.maxFinite,
                                      title: 'Selecione um bairro',
                                      onChanged: controller.selectNeighborhood,
                                      value: controller.neighborhood?.first,
                                      items: controller.neighborhood
                                          ?.map(
                                            (e) => CustomDropdownItem(
                                              text: e,
                                              value: e,
                                            ),
                                          )
                                          .toList(),
                                      hintText: 'Selecione um bairro',
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: Spacements.S),
                            Row(
                              children: [
                                PrimaryButton(
                                  text: 'Filtrar',
                                  onPressed: () {
                                    controller.filterNeighborhood();
                                  },
                                ),
                                const SizedBox(width: Spacements.S),
                                PrimaryButton(
                                  text: 'Limpar Filtro',
                                  onPressed: () {
                                    controller.clearFilterNeighborhood();
                                  },
                                  bgColor: AppColors.error,
                                ),
                              ],
                            ),
                            const SizedBox(height: Spacements.L),
                            ListenableBuilder(
                              listenable: controller,
                              builder: (context, child) {
                                if (controller.isLoading) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      DataTable(
                                        headingTextStyle: Theme.of(context).textTheme.titleMedium,
                                        dataTextStyle: Theme.of(context).textTheme.bodyLarge,
                                        dataRowMinHeight: 0.5,
                                        columns: [
                                          columnTable(text: 'CEP'),
                                          columnTable(text: 'Logradouro'),
                                          columnTable(text: 'Complemento'),
                                          columnTable(text: 'Bairro'),
                                          columnTable(text: 'Localidade'),
                                          columnTable(text: 'UF'),
                                          columnTable(text: 'IBGE'),
                                          columnTable(text: 'Ações'),
                                        ],
                                        rows: const [],
                                      ),
                                      const SizedBox(height: Spacements.L),
                                      const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  );
                                }

                                if (controller.addresses != null) {
                                  if (controller.addresses!.isNotEmpty) {
                                    return Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            SizedBox(
                                              width: constraints.maxWidth,
                                              child: DataTable(
                                                headingTextStyle: Theme.of(context).textTheme.titleMedium,
                                                dataTextStyle: Theme.of(context).textTheme.bodyLarge,
                                                dataRowMinHeight: 0.5,
                                                columns: [
                                                  columnTable(text: 'CEP'),
                                                  columnTable(text: 'Logradouro'),
                                                  columnTable(text: 'Complemento'),
                                                  columnTable(text: 'Bairro'),
                                                  columnTable(text: 'Localidade'),
                                                  columnTable(text: 'UF'),
                                                  columnTable(text: 'IBGE'),
                                                  columnTable(text: 'Ações'),
                                                ],
                                                rows: controller.addresses!
                                                    .map(
                                                      (e) => DataRow(
                                                        cells: [
                                                          rowTable(text: e.cep),
                                                          rowTable(text: e.logradouro),
                                                          rowTable(text: e.complemento),
                                                          rowTable(text: e.bairro),
                                                          rowTable(text: e.localidade),
                                                          rowTable(text: e.uf),
                                                          rowTable(text: e.ibge),
                                                          rowTableAction(),
                                                        ],
                                                      ),
                                                    )
                                                    .toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                }

                                return Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      DataTable(
                                        headingTextStyle: Theme.of(context).textTheme.titleMedium,
                                        dataTextStyle: Theme.of(context).textTheme.bodyLarge,
                                        dataRowMinHeight: 0.5,
                                        columns: [
                                          columnTable(text: 'CEP'),
                                          columnTable(text: 'Logradouro'),
                                          columnTable(text: 'Complemento'),
                                          columnTable(text: 'Bairro'),
                                          columnTable(text: 'Localidade'),
                                          columnTable(text: 'UF'),
                                          columnTable(text: 'IBGE'),
                                          columnTable(text: 'Ações'),
                                        ],
                                        rows: const [],
                                      ),
                                      const Spacer(),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: Spacements.M),
                                          child: Text(
                                            controller.addresses == null
                                                ? 'Selecione um estado, cidade e digite o logradouro para filtrar ou digite um CEP'
                                                : 'Nenhum resultado encontrado',
                                            textAlign: TextAlign.center,
                                            style: isWeb
                                                ? Theme.of(context).textTheme.headlineMedium?.copyWith(
                                                      color: AppColors.darkGray,
                                                    )
                                                : Theme.of(context).textTheme.headlineSmall?.copyWith(
                                                      color: AppColors.darkGray,
                                                    ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
