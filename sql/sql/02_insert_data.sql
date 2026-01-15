À QUOI SERVENT CES DONNÉES (LOGIQUE MÉTIER)

Objectif :
Simuler un back-office assurance-vie en France, comme dans une banque ou une compagnie d’assurance.

On doit retrouver :

des dossiers ouverts / en cours / bloqués

des services réalistes :

Back-office

Relation client

Service juridique

des causes de blocage crédibles :

pièces manquantes

succession complexe

des délais conformes aux SLA

-- SLA par service (contexte banque / assurance France)
INSERT INTO `assurance_sql.sla` (service, sla_jours) VALUES
('Back-office', 30),
('Relation client', 15),
('Service juridique', 60);

-- Dossiers assurance-vie
INSERT INTO `assurance_sql.dossiers`
(dossier_id, date_ouverture, date_cloture, statut, service, motif_blocage)
VALUES
(1, '2024-01-05', '2024-02-02', 'Clôturé', 'Back-office', NULL),
(2, '2024-01-12', NULL, 'En cours', 'Relation client', NULL),
(3, '2024-01-18', NULL, 'Bloqué', 'Service juridique', 'Succession complexe'),
(4, '2024-02-01', '2024-02-20', 'Clôturé', 'Relation client', NULL),
(5, '2024-02-10', NULL, 'Bloqué', 'Back-office', 'Pièces manquantes'),
(6, '2024-02-15', '2024-04-25', 'Clôturé', 'Service juridique', NULL),
(7, '2024-03-01', NULL, 'En cours', 'Back-office', NULL);

-- Bénéficiaires / ayants droit
INSERT INTO `assurance_sql.beneficiaires`
(beneficiaire_id, dossier_id, lien, statut)
VALUES
(1, 1, 'Conjoint', 'Validé'),
(2, 2, 'Enfant', 'En attente'),
(3, 3, 'Conjoint', 'Bloqué'),
(4, 5, 'Frère', 'En attente'),
(5, 6, 'Enfant', 'Validé');
