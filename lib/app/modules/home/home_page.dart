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
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      );
    }

    DataCell rowTable({required String text}) {
      return DataCell(
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const TopNavbar(),
                    const SizedBox(height: Spacements.XL),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Spacements.M),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        runSpacing: Spacements.S,
                        spacing: Spacements.M,
                        children: [
                          CustomDropdown(
                            width: isWeb ? 200 : double.maxFinite,
                            title: 'Selecione um estado',
                            onChanged: (v) {},
                            value: 1,
                            items: [
                              CustomDropdownItem(text: 'GO', value: 1),
                              CustomDropdownItem(text: 'SP', value: 2),
                              CustomDropdownItem(text: 'MG', value: 3),
                            ],
                            hintText: 'Selecione um estado',
                          ),
                          CustomDropdown(
                            width: isWeb ? 200 : double.maxFinite,
                            title: 'Selecione uma cidade',
                            onChanged: (v) {},
                            value: 1,
                            items: [
                              CustomDropdownItem(text: 'Goiânia', value: 1),
                              CustomDropdownItem(text: 'Aparecida de Goiânia', value: 2),
                              CustomDropdownItem(text: 'Senador Canedo', value: 3),
                            ],
                            hintText: 'Selecione um estado',
                          ),
                          CustomTextFormField(
                            width: isWeb ? 200 : double.maxFinite,
                            onChanged: (v) {},
                            hintText: 'Digite o CEP',
                          ),
                          CustomTextFormField(
                            width: isWeb ? 300 : double.maxFinite,
                            onChanged: (v) {},
                            hintText: 'Digite o Logradouro',
                          ),
                          PrimaryButton(
                            text: 'Filtrar',
                            onPressed: () {},
                          ),
                          PrimaryButton(
                            text: 'Limpar',
                            onPressed: () {},
                            bgColor: AppColors.error,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Spacements.L),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Spacements.M),
                        child: DataTable(
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
                          rows: [
                            DataRow(
                              cells: [
                                rowTable(text: '74000-000'),
                                rowTable(text: 'RUA 7'),
                                rowTable(text: 'EM FRENTE AO PREDIO'),
                                rowTable(text: 'JARDIM LUZ'),
                                rowTable(text: 'Goiânia'),
                                rowTable(text: 'GO'),
                                rowTable(text: '12345678'),
                                rowTableAction(),
                              ],
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
