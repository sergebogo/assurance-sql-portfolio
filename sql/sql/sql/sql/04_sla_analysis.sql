
-- ============================================
-- Analyse des délais de traitement et des SLA
-- Contexte : banque / assurance France
-- Objectif :
--   - Calculer les délais de traitement
--   - Identifier les dossiers hors SLA
-- ============================================

-- Calcul du délai de traitement par dossier
SELECT
  d.dossier_id,
  d.service,
  d.date_creation,
  COALESCE(d.date_cloture, CURRENT_DATE()) AS date_reference,
  DATE_DIFF(
    COALESCE(d.date_cloture, CURRENT_DATE()),
    d.date_creation,
    DAY
  ) AS delai_jours
FROM dossiers d;

-- Délai moyen de traitement par service
SELECT
  service,
  AVG(
    DATE_DIFF(
      date_cloture,
      date_creation,
      DAY
    )
  ) AS delai_moyen_jours
FROM dossiers
WHERE date_cloture IS NOT NULL
GROUP BY service;

-- Identification des dossiers hors SLA
SELECT
  d.dossier_id,
  d.service,
  DATE_DIFF(
    COALESCE(d.date_cloture, CURRENT_DATE()),
    d.date_creation,
    DAY
  ) AS delai_jours,
  s.delai_sla_jours,
  'Hors SLA' AS statut_sla
FROM dossiers d
JOIN sla s
  ON d.service = s.service
WHERE DATE_DIFF(
    COALESCE(d.date_cloture, CURRENT_DATE()),
    d.date_creation,
    DAY
) > s.delai_sla_jours;
