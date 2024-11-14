import 'package:exercice_pratique_l4_2024/pages/Etudiant.dart';

import 'package:flutter/material.dart';

import '../component/cardGestature.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de Bord'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: [
            DashboardCard(
              title: 'Gestion des Étudiants',
              icon: Icons.person,
              color: Colors.blueAccent,
              EventonTap: () {
                // Naviguer vers la page de gestion des étudiants

                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return etudiant();
                }));
              },
            ),
            DashboardCard(
              title: 'Gestion des Cours',
              icon: Icons.book,
              color: Colors.green,
              EventonTap: () {
                // Naviguer vers la page de gestion des cours
              },
            ),
            DashboardCard(
              title: 'Gestion des Inscriptions',
              icon: Icons.assignment,
              color: Colors.orange,
              EventonTap: () {
                // Naviguer vers la page de gestion des inscriptions
              },
            ),
            DashboardCard(
              title: 'Rapports',
              icon: Icons.analytics,
              color: Colors.redAccent,
              EventonTap: () {
                // Naviguer vers la page des rapports
              },
            ),
            DashboardCard(
              title: 'Paramètres',
              icon: Icons.settings,
              color: Colors.purple,
              EventonTap: () {
                // Naviguer vers la page des paramètres
              },
            ),
            DashboardCard(
              title: 'Support',
              icon: Icons.support_agent,
              color: Colors.teal,
              EventonTap: () {
                // Naviguer vers la page de support
              },
            ),
          ],
        ),
      ),
    );
  }
}
