-- -- Création de la base de données et insertion des données
    -- Exercice 1 : Création de la base de données
        CREATE DATABASE centremédical;

        CREATE TABLE Utilisateurs(
            id_utilisateur INT PRIMARY KEY AUTO_INCREMENT,
            nom VARCHAR(50) NOT NULL,
            prenom VARCHAR(50) NOT NULL,
            type_utilisateur ENUM('Patient' , 'Médecin')
        );

        CREATE TABLE Rendezvous(
            id_rdv INT PRIMARY KEY AUTO_INCREMENT,
            id_patient INT NOT NULL,
            id_medecin INT NOT NULL,
            date_rdv DATETIME NOT NULL,
            status ENUM('Confirmé', 'Non confirmé') DEFAULT 'Non confirmé',
            FOREIGN KEY (id_patient) REFERENCES Utilisateurs(id_utilisateur)
            ON DELETE CASCADE,
            FOREIGN KEY (id_medecin) REFERENCES Utilisateurs(id_utilisateur)
            ON DELETE CASCADE
        );

        CREATE TABLE Factures(
            id_facture INT PRIMARY KEY AUTO_INCREMENT,
            id_rdv INT NOT NULL,
            montant DECIMAL(10,4) NOT NULL,
            date_facture DATETIME NOT NULL,
            FOREIGN KEY (id_rdv) REFERENCES Rendezvous(id_rdv)
        );

    -- Exercice 2 : Insertion des données:
    
        INSERT INTO Utilisateurs (nom, prenom, type_utilisateur) VALUES
            ('Boukhriss', 'Mouad', 'Médecin'),  -- id = 14
            ('El Amrani', 'Sara', 'Patient'),   -- id = 16
            ('Tazi', 'Zineb', 'Médecin'),       -- id = 17
            ('Jadidi', 'Yassine', 'Patient'),   -- id = 18
            ('Ben Ali', 'Ahmed', 'Patient');    -- id = 19
            
        INSERT INTO Rendezvous (id_patient, id_medecin, date_rdv, status) 
            VALUES
            (19, 17, '2024-12-25 10:00:00', 'Confirmé'), 
            (18, 14, '2024-12-26 14:30:00', 'Non confirmé'),
            (16, 14, '2024-12-27 09:00:00', 'Confirmé'),
            (19, 17, '2024-12-28 11:00:00', 'Non confirmé'),
            (18, 17, '2024-12-29 16:45:00', 'Confirmé');

-- -- Requêtes SQL pour interroger les données
    -- Exercice 3 : Sélection de données avec jointures
        -- Afficher tous les rendez-vous d'un patient particulier:
            SELECT * FROM rendezvous WHERE id_patient = 18;
        
        -- Afficher tous les rendez-vous confirmés ou non confirmés.
            -- confirmé:
                SELECT * FROM rendezvous WHERE status = 'Confirmé';
            -- Non confirmé:
                SELECT * FROM rendezvous WHERE status = 'Non confirmé';

        -- Afficher le détail des rendez-vous avec les informations sur les utilisateurs et les médecins (utilisation de jointures):
            SELECT r.id_rdv, u1.nom AS nom_patient, u1.prenom AS prenom_patient, u2.nom AS nom_medecin, u2.prenom AS prenom_medecin, r.date_rdv, r.status 
            FROM Rendezvous r JOIN Utilisateurs u1 ON r.id_patient = u1.id_utilisateur 
            JOIN Utilisateurs u2 ON r.id_medecin = u2.id_utilisateur;
    -- Exercice 4 : Mise à jour des données
        UPDATE rendezvous SET status = 'Confirmé' WHERE id_rdv = 39;
    -- Exercice 5 : Suppression des données
        DELETE FROM rendezvous WHERE id_rdv = 38;
    -- Exercice 6 : Utilisation des fonctions d'agrégation
        -- 1. Calcul du nombre total de rendez-vous par patient :
            SELECT u.* , COUNT(*) AS TotaleRender FROM utilisateurs u, rendezvous r 
            WHERE u.id_utilisateur = r.id_patient && u.type_utilisateur = 'Patient' 
            GROUP BY id_utilisateur;
        -- 2. Somme des montants des factures par patient :
            SELECT u.* , SUM(f.montant) AS SommeeMontant 
            FROM utilisateurs u, rendezvous r, factures f 
            WHERE u.id_utilisateur = r.id_patient && r.id_rdv = f.id_rdv && u.type_utilisateur = 'Patient' 
            GROUP BY u.id_utilisateur;
        -- 3. Moyenne des montants des factures pour tous les rendez-vous confirmés :
            SELECT AVG(f.montant) FROM factures f, rendezvous r 
            WHERE f.id_rdv = r.id_rdv && r.status = 'Confirmé';

        -- 4.1. Rendez-vous les plus récents :
            SELECT MAX(date_facture) FROM factures;

        -- 4.2. Rendez-vous les plus anciens :
            SELECT MIN(date_facture) FROM factures;
        
        -- 5. Top des médecins avec le plus de rendez-vous confirmés :
            SELECT u.* , COUNT(r.id_rdv) AS ToaleRenderConfermé 
            FROM utilisateurs u, rendezvous r WHERE u.id_utilisateur = r.id_patient && r.status = 'Confirme' 
            GROUP BY u.id_utilisateur ORDER BY ToaleRenderConfermé DESC;

        





