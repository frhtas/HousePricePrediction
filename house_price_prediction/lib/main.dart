import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ev Kira Tahmin Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ev Kira Tahmin Uygulaması'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var chosenCounty = "null";
  var isCountyChose = false;
  final _formKey = GlobalKey<FormBuilderState>();
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Scrollbar(
        thickness: 10,
        radius: const Radius.circular(10),
        isAlwaysShown: true,
        interactive: true,
        controller: _firstController,
        child: ListView(
          controller: _firstController,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownButtonHideUnderline(
                child: FormBuilderDropdown(
                  name: 'county',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue)),
                    labelText: 'İlçeyi seçiniz',
                  ),
                  // initialValue: counties[0],
                  allowClear: true,
                  isExpanded: true,
                  onChanged: (value) {
                    chosenCounty = value.toString();
                    if (chosenCounty == "null") {
                      isCountyChose = false;
                    } else {
                      isCountyChose = true;
                    }
                    setState(() {
                      debugPrint(chosenCounty);
                    });
                  },
                  // hint: const Text('İlçeyi seçiniz'),
                  items: counties
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                ),
              ),
            ),
            const Divider(
              thickness: 3,
              color: Colors.blue,
              indent: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Visibility(
                visible: isCountyChose,
                child: FormBuilder(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'area',
                        autovalidateMode: AutovalidateMode.always,
                        initialValue: "100",
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Alan (\u33A1)',
                        ),
                        //           validator: FormFieldValidators.compose([
                        //   FormBuilderValidators.required(context),
                        //   FormBuilderValidators.numeric(context),
                        //   FormBuilderValidators.max(context, 70),
                        // ]),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      FormBuilderFilterChip(
                        name: 'room_count',
                        maxChips: 1,
                        selectedColor: Colors.blue,
                        // initialValue: [roomCounts[chosenCounty]![0]],
                        // showCheckmark: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Oda sayısı',
                        ),
                        options: roomCounts[chosenCounty]!
                            .map((value) => FormBuilderFieldOption(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        alignment: WrapAlignment.spaceAround,
                      ),
                      const SizedBox(height: 20),
                      FormBuilderFilterChip(
                        name: 'building_age',
                        maxChips: 1,
                        selectedColor: Colors.blue,
                        // initialValue: [roomCounts[chosenCounty]![0]],
                        // showCheckmark: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Bina yaşı',
                        ),
                        options: buildingAges[chosenCounty]!
                            .map((value) => FormBuilderFieldOption(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        alignment: WrapAlignment.spaceAround,
                      ),
                      const SizedBox(height: 20),
                      FormBuilderSlider(
                        name: 'bath_count',
                        min: 0.0,
                        max: 5.0,
                        initialValue: 1.0,
                        divisions: 5,
                        activeColor: Colors.blue[600],
                        inactiveColor: Colors.blue[100],
                        displayValues: DisplayValues.all,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Banyo sayısı',
                        ),
                      ),
                      const SizedBox(height: 20),
                      DropdownButtonHideUnderline(
                        child: FormBuilderDropdown(
                          name: 'heating_type',
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            labelText: 'Isıtma tipi',
                          ),
                          // initialValue: 'Male',
                          allowClear: true,
                          // isExpanded: true,
                          // hint: const Text('Choose something'),
                          items: heatingTypes[chosenCounty]!
                              .map((value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  ))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderFilterChip(
                        name: 'balcony',
                        maxChips: 1,
                        selectedColor: Colors.blue,
                        // showCheckmark: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Balkon durumu',
                        ),
                        options: ["Var", "Yok"]
                            .map((value) => FormBuilderFieldOption(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        alignment: WrapAlignment.spaceAround,
                      ),
                      const SizedBox(height: 20),
                      FormBuilderFilterChip(
                        name: 'ware',
                        maxChips: 1,
                        selectedColor: Colors.blue,
                        // showCheckmark: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Eşya durumu',
                        ),
                        options: ["Eşyalı", "Boş"]
                            .map((value) => FormBuilderFieldOption(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        alignment: WrapAlignment.spaceAround,
                      ),
                      const SizedBox(height: 20),
                      FormBuilderFilterChip(
                        name: 'site',
                        maxChips: 1,
                        selectedColor: Colors.blue,
                        // showCheckmark: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Site içerisinde',
                        ),
                        options: ["Evet", "Hayır"]
                            .map((value) => FormBuilderFieldOption(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        alignment: WrapAlignment.spaceAround,
                      ),
                      // FormBuilderSwitch(
                      //   name: "balcony",
                      //   title: const Text("Balkon durumu"),
                      //   decoration: const InputDecoration(
                      //     border: OutlineInputBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(10.0)),
                      //         borderSide: BorderSide(color: Colors.blue)),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 50,
                        child: Center(child: Text("Tahmini kira: ----")),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          debugPrint('Received click');
                          _formKey.currentState!.save();
                          debugPrint(_formKey.currentState!.value.toString());
                        },
                        child: const Text('Predict House Price'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
