-- Création des tables – assurance-vie (France)

CREATE TABLE IF NOT EXISTS `assurance_sql.dossiers` (
  dossier_id INT64,
  date_ouverture DATE,
  date_cloture DATE,
  statut STRING,
  service STRING,
  motif_blocage STRING
);

CREATE TABLE IF NOT EXISTS `assurance_sql.sla` (
  service STRING,
  sla_jours INT64
);

CREATE TABLE IF NOT EXISTS `assurance_sql.beneficiaires` (
  beneficiaire_id INT64,
  dossier_id INT64,
  lien STRING,
  statut STRING
);
