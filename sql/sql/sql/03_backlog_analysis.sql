
-- ============================================
-- Analyse du backlog des dossiers assurance-vie
-- Contexte : back-office bancaire / assurance
-- Objectif :
--   - Suivre le volume de dossiers non clôturés
--   - Identifier les services sous tension
-- ============================================

-- Backlog global (dossiers non clôturés)
SELECT
  COUNT(*) AS backlog_total
FROM dossiers
WHERE date_cloture IS NULL;

-- Backlog par statut
SELECT
  statut,
  COUNT(*) AS nombre_dossiers
FROM dossiers
WHERE date_cloture IS NULL
GROUP BY statut
ORDER BY nombre_dossiers DESC;

-- Backlog par service
SELECT
  service,
  COUNT(*) AS nombre_dossiers
FROM dossiers
WHERE date_cloture IS NULL
GROUP BY service
ORDER BY nombre_dossiers DESC;
