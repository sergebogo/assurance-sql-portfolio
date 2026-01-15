-- Analyse du backlog des dossiers assurance-vie
-- Objectif : suivre les dossiers ouverts non clôturés

-- Backlog global
SELECT COUNT(*) AS backlog_total
FROM `assurance_sql.dossiers`
WHERE date_cloture IS NULL;

-- Backlog par statut
SELECT
  statut,
  COUNT(*) AS nb_dossiers
FROM `assurance_sql.dossiers`
WHERE date_cloture IS NULL
GROUP BY statut;

-- Backlog par service
SELECT
  service,
  COUNT(*) AS nb_dossiers
FROM `assurance_sql.dossiers`
WHERE date_cloture IS NULL
GROUP BY service
ORDER BY nb_dossiers DESC;
