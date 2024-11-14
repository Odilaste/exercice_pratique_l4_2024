// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class etudiant extends StatefulWidget {
  @override
  _Etudiant createState() => _Etudiant();
}

class _Etudiant extends State<etudiant> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController postNomController = TextEditingController();

  String genre = 'Masculin';
  String? promotion;
  DateTime? dateNaissance;
  bool mangeCaf = false;
  bool estInterne = false;

  List<String> promotions = [
    'Licence 1',
    'Licence 2',
    'Licence 3',
    'Master 1',
    'Master 2'
  ];

  @override
  void dispose() {
    nomController.dispose();
    postNomController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != dateNaissance) {
      setState(() {
        dateNaissance = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Informations Enregistrées'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nom: ${nomController.text}'),
                Text('Post-Nom: ${postNomController.text}'),
                Text('Genre: $genre'),
                Text('Promotion: $promotion'),
                Text(
                    'Date de Naissance: ${dateNaissance != null ? dateNaissance.toString().split(' ')[0] : "Non sélectionnée"}'),
                Text('Mange à la Caf: ${mangeCaf ? "Oui" : "Non"}'),
                Text('Est Interne: ${estInterne ? "Oui" : "Non"}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enregistrement Étudiant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nomController,
                  decoration: InputDecoration(labelText: 'Nom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un nom';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: postNomController,
                  decoration: InputDecoration(labelText: 'Post-Nom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un post-nom';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Text('Genre', style: TextStyle(fontSize: 16.0)),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Masculin',
                      groupValue: genre,
                      onChanged: (value) {
                        setState(() {
                          genre = value!;
                        });
                      },
                    ),
                    Text('Masculin'),
                    Radio<String>(
                      value: 'Féminin',
                      groupValue: genre,
                      onChanged: (value) {
                        setState(() {
                          genre = value!;
                        });
                      },
                    ),
                    Text('Féminin'),
                  ],
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Promotion'),
                  items: promotions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      promotion = value;
                    });
                  },
                  validator: (value) => value == null
                      ? 'Veuillez sélectionner une promotion'
                      : null,
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text('Date de Naissance: ',
                        style: TextStyle(fontSize: 16.0)),
                    Text(dateNaissance != null
                        ? dateNaissance.toString().split(' ')[0]
                        : 'Non sélectionnée'),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                CheckboxListTile(
                  title: Text('Mange à la Caf'),
                  value: mangeCaf,
                  onChanged: (value) {
                    setState(() {
                      mangeCaf = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Est Interne'),
                  value: estInterne,
                  onChanged: (value) {
                    setState(() {
                      estInterne = value!;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Enregistrer'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
