import 'dart:developer';

import 'package:app_financeiro/src/common/constants/app_text_styles.dart';
import 'package:app_financeiro/src/common/widgets/app_textformfield.dart';
import 'package:app_financeiro/src/common/widgets/primary_button.dart';
import 'package:app_financeiro/src/features/value_transaction/value_transaction_controller.dart';
import 'package:app_financeiro/src/model/transaction_financeiro.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class ValueTransactionPage extends StatefulWidget {
  const ValueTransactionPage({super.key});

  @override
  State<ValueTransactionPage> createState() => _ValueTransactionPageState();
}

class _ValueTransactionPageState extends State<ValueTransactionPage> {
  Set<TransactionType> selected = {TransactionType.income};
  DateTime? _selectedDate;
  bool isSwitched = true;
  ValueTransactionController controller = Get.find();
  TextEditingController valueController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  dynamic dropdownValue;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      locale: const Locale('pt', 'BR'),
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  List<DropdownMenuItem> listExpense = const [
    DropdownMenuItem(
      value: CategoryType.house,
      child: Text('Casa'),
    ),
    DropdownMenuItem(
      value: CategoryType.health,
      child: Text('Saúde'),
    ),
    DropdownMenuItem(
      value: CategoryType.education,
      child: Text('Educação'),
    ),
    DropdownMenuItem(
      value: CategoryType.transportation,
      child: Text('Transporte'),
    ),
    DropdownMenuItem(
      value: CategoryType.food,
      child: Text('Alimentação'),
    ),
    DropdownMenuItem(
      value: CategoryType.others,
      child: Text('Outros'),
    ),
  ];
  List<DropdownMenuItem> listIncome = const [
    DropdownMenuItem(
      value: CategoryType.work,
      child: Text('Trabalho'),
    ),
    DropdownMenuItem(
      value: CategoryType.investment,
      child: Text('Investimento'),
    ),
    DropdownMenuItem(
      value: CategoryType.services,
      child: Text('Serviços'),
    ),
    DropdownMenuItem(
      value: CategoryType.business,
      child: Text('Empreendimentos'),
    ),
    DropdownMenuItem(
      value: CategoryType.others,
      child: Text('Outros'),
    ),
  ];
  //var dropdownValue = listIncome.first;


  @override
  Widget build(BuildContext context) {
    ColorScheme colorContext = Theme.of(context).colorScheme;
    var item = Get.arguments;
    if(item != null){
      log('valor transavction uid ${item.uid}');
      selected = {item.type};
      valueController.text = item.value.toString();
      descriptionController.text = item.description;
      _selectedDate = item.date;
      dropdownValue = item.category;
      isSwitched = item.received;
      
    }
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SegmentedButton(
                    segments: const [
                      ButtonSegment(
                          value: TransactionType.income,
                          label: Text('Receita'),
                          icon: Icon(Icons.arrow_upward)),
                      ButtonSegment(
                          value: TransactionType.expense,
                          label: Text('Despesa'),
                          icon: Icon(Icons.arrow_downward)),
                    ],
                    selected: selected,
                    onSelectionChanged: (Set<TransactionType> newS) {
                      selected = newS;
                      dropdownValue = null/* selected.first == TransactionType.expense ? CategoryType.house : CategoryType.work */;
                      setState(() {
                        
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextformfield(
                  label: 'Valor',
                  controller: valueController,
                  keyboardType: TextInputType.number,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly, RealInputFormatter(moeda: true)],
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextformfield(
                  label: 'Descrição',
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onTap: () => _selectDate(context),
                  //controller: widget.controller,
                  readOnly: true,
                  onTapOutside: (value) => FocusScope.of(context).unfocus(),
                  style: TextStyle(color: colorContext.tertiary, fontSize: 18),
                  decoration: InputDecoration(
                    //constraints: const BoxConstraints(maxWidth: 200, maxHeight: 100),
                      isDense: true,
                      hintText: _selectedDate == null
                          ? 'Data'
                          : 'Data: ${_selectedDate!.toLocal().toString().split(' ')[0]}',
                      hintStyle: TextStyle(color: colorContext.tertiary),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: colorContext.tertiary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: colorContext.tertiary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: colorContext.tertiary)),
                      filled: true,
                      fillColor: colorContext.secondary,
                      suffixIcon: const Icon(Icons.calendar_month)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                          borderRadius: BorderRadius.circular(5),
                          value: dropdownValue,
                          hint: const Text('Categoria'),
                          items: selected.first == TransactionType.income
                              ? listIncome
                              : listExpense,
                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value;
                            });
                          }),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Recebido: ',
                          style: AppTextStyles.mediumText18,
                        ),
                        Switch(
                            value: isSwitched,
                            onChanged: (onChanged) {
                              setState(() {
                                isSwitched = onChanged;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                    text: 'Salvar', margin: EdgeInsets.zero, function: () async {
                      var transaction = TransactionFinanceiro(
                      uid: item != null ? item.uid : '',
                      type: selected.first, 
                      value: num.parse(valueController.text), 
                      description: descriptionController.text, 
                      category: dropdownValue, 
                      date: _selectedDate!, 
                      received: isSwitched, 
                      created_at: DateTime.now());

                      if(item != null){
                        controller.editValue(transaction);
                      }
                      controller.saveValue(transaction);

                      
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
