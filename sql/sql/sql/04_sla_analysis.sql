-- Analyse des délais de traitement et respect des SLA
-- Contexte banque / assurance France

-- Délai de traitement par dossier
SELECT
  d.dossier_id,
  d.service,
  DATE_DIFF(
    COALESCE(d.date_cloture, CURRENT_DATE()),
    d.date_ouverture,
    DAY
  ) AS delai_jours
FROM `assurance_sql.dossiers` d;

-- Délai moyen par service
SELECT
  service,
  AVG(DATE_DIFF(date_cloture, date_ouverture, DAY)) AS delai_moyen_jours
FROM `assurance_sql.dossiers`
WHERE date_cloture IS NOT NULL
GROUP BY service;

-- Dossiers hors SLA
SELECT
  d.dossier_id,
  d.service,
  DATE_DIFF(
    COALESCE(d.date_cloture, CURRENT_DATE()),
    d.date_ouverture,
    DAY
  ) AS delai_jours,
  s.sla_jours
FROM `assurance_sql.dossiers` d
JOIN `assurance_sql.sla` s
  ON d.service = s.service
WHERE DATE_DIFF(
    COALESCE(d.date_cloture, CURRENT_DATE()),
    d.date_ouverture,
    DAY
  ) > s.sla_jours;
