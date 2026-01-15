-- ============================================
-- Données de test – Assurance-vie (France)
-- Contexte : Back-office bancaire / assurantiel
-- Objectif : Simuler des dossiers réels pour
--            analyses backlog, délais et SLA
-- ============================================

-- ======================
-- Table : sla
-- ======================
INSERT INTO sla (service, delai_sla_jours) VALUES
('Back-office', 10),
('Relation client', 5),
('Service juridique', 30);

-- ======================
-- Table : dossiers
-- ======================
INSERT INTO dossiers (
  dossier_id,
  date_creation,
  date_cloture,
  statut,
  service,
  motif_blocage
) VALUES
(1, DATE '2024-01-05', NULL, 'En cours', 'Back-office', NULL),
(2, DATE '2024-01-10', DATE '2024-01-18', 'Clôturé', 'Relation client', NULL),
(3, DATE '2024-01-15', NULL, 'En retard', 'Service juridique', 'Succession complexe'),
(4, DATE '2024-01-20', NULL, 'Bloqué', 'Back-office', 'Pièces manquantes'),
(5, DATE '2024-02-01', DATE '2024-02-06', 'Clôturé', 'Relation client', NULL),
(6, DATE '2024-02-05', NULL, 'En cours', 'Back-office', NULL),
(7, DATE '2024-02-10', NULL, 'En retard', 'Service juridique', 'Litige bénéficiaire'),
(8, DATE '2024-02-15', NULL, 'Bloqué', 'Relation client', 'Client injoignable');

-- ======================
-- Table : beneficiaires
-- ======================
INSERT INTO beneficiaires (
  beneficiaire_id,
  dossier_id,
  nom,
  lien_assure
) VALUES
(101, 1, 'Durand', 'Conjoint'),
(102, 2, 'Martin', 'Enfant'),
(103, 3, 'Bernard', 'Conjoint'),
(104, 4, 'Petit', 'Frère'),
(105, 5, 'Moreau', 'Enfant'),
(106, 6, 'Leroy', 'Conjoint'),
(107, 7, 'Roux', 'Enfant'),
(108, 8, 'Fournier', 'Conjoint');

