# Workshop : Gestion des bases de données relationnelles avec SQL

## Objectifs du workshop :
- Comprendre les bases de données relationnelles et le langage SQL.
- Manipuler une base de données en utilisant SQL pour interagir avec des données.
- Créer une base de données et travailler sur des cas pratiques de gestion de données dans un système médical.

---

## Programme du Workshop :

### 1. Introduction à SQL et aux bases de données relationnelles

#### Qu'est-ce que SQL ?
- SQL (Structured Query Language) est un langage utilisé pour interagir avec des bases de données relationnelles.
- Il permet de créer, manipuler et interroger des données stockées dans une base de données.

#### Pourquoi utiliser SQL ?
- SQL est essentiel pour travailler avec des systèmes de gestion de bases de données (SGBD) comme MySQL, PostgreSQL, ou SQLite.

#### Structure d'une base de données relationnelle :
- **Tables** : Contiennent des données sous forme de lignes (enregistrements) et de colonnes (attributs).
- **Clés primaires et étrangères** : Assurent l'intégrité des données et les relations entre les tables.
- **Relations entre les utilisateurs** : Les patients et les médecins sont considérés comme des utilisateurs, mais ils sont gérés dans des tables distinctes pour éviter les redondances.

---

### 2. Contexte du Projet - Système de gestion d'un centre médical

#### Exemple de projet basé sur un centre médical :

Les **tables principales** à créer sont les suivantes :
- **Utilisateurs** (pour les patients et les médecins) : `id_utilisateur`, `nom`, `prenom`, `type_utilisateur` (patient ou médecin).
- **Rendez-vous** : `id_rdv`, `id_patient`, `id_medecin`, `date_rdv`, `status` (ex. confirmé, non confirmé).
- **Factures** : `id_facture`, `id_rdv`, `montant`, `date_facture`.

---

### 3. Création de la base de données et insertion des données

#### Exercice 1 : Création de la base de données

**Tâche** : Créez les tables suivantes dans la base de données :

1. **Utilisateurs** : Pour stocker les informations des patients et des médecins.
2. **Rendez-vous** : Pour gérer les rendez-vous entre patients et médecins.
3. **Factures** : Pour suivre les paiements.

Reliez les tables entre elles en utilisant des **clés primaires** et **clés étrangères**.

---

#### Exercice 2 : Insertion des données

**Tâche** : Insérez au moins 5 exemples de rendez-vous avec des statuts variés (confirmé, non confirmé).

---

### 4. Requêtes SQL pour interroger les données

#### Exercice 3 : Sélection de données avec jointures

**Tâches** :
1. Écrivez une requête SQL pour afficher tous les rendez-vous d'un patient particulier.
2. Affichez tous les rendez-vous, qu'ils soient confirmés ou non confirmés.
3. Affichez le détail des rendez-vous avec des informations sur les utilisateurs et les médecins, en utilisant des jointures.

---

#### Exercice 4 : Mise à jour des données

**Tâche** : Écrivez une requête SQL pour modifier le statut d'un rendez-vous, par exemple, pour passer de "non confirmé" à "confirmé".

---

#### Exercice 5 : Suppression des données

**Tâche** : Écrivez une requête SQL pour supprimer un rendez-vous ou un utilisateur (patient ou médecin).

---

#### Exercice 6 : Utilisation des fonctions d'agrégation

**Tâches** :
1. **Calcul du nombre total de rendez-vous par patient** :
   - Écrivez une requête SQL pour compter combien de rendez-vous ont été pris par chaque patient.

2. **Somme des montants des factures par patient** :
   - Écrivez une requête SQL pour afficher la somme totale des montants facturés pour chaque patient.

3. **Moyenne des montants des factures pour tous les rendez-vous confirmés** :
   - Écrivez une requête SQL pour calculer la moyenne des montants des factures où le statut du rendez-vous est "confirmé".

4. **Rendez-vous les plus récents et les plus anciens** :
   - Écrivez une requête SQL pour trouver la date du rendez-vous le plus récent et du plus ancien.

5. **Top des médecins avec le plus de rendez-vous confirmés** :
   - Écrivez une requête SQL pour afficher les médecins ayant le plus de rendez-vous confirmés, avec un classement optionnel par ordre décroissant.

---
