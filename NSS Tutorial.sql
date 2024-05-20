-- The example shows the number who responded for:
-- question 1 at 'Edinburgh Napier University' studying '(8) Computer Science'
-- Show the percentage who STRONGLY AGREE
SELECT A_STRONGLY_AGREE
FROM nss
WHERE question='Q01'
  AND institution='Edinburgh Napier University'
  AND subject='(8) Computer Science';

-- Calculate how many agree or strongly agree
SELECT institution, subject
FROM nss
WHERE score >= 100 AND question='Q15';

-- Unhappy Computer Students
SELECT institution, score
FROM nss
WHERE question='Q15'
  AND score < 50
  AND subject='(8) Computer Science';

-- More Computing or Creative Students?
SELECT subject, SUM(response)
FROM nss
WHERE question='Q22'
  AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject;

-- Strongly Agree Numbers
SELECT subject, SUM(response * A_STRONGLY_AGREE / 100)
FROM nss
WHERE question='Q22'
  AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject;

-- Strongly Agree, Percentage
SELECT subject, ROUND(SUM(response * A_STRONGLY_AGREE / 100) / SUM(response) * 100, 0)
FROM nss
WHERE question='Q22'
  AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject;

-- Scores for Institutions in Manchester
SELECT institution, ROUND(SUM(score * response) / SUM(response), 0)
FROM nss
WHERE question='Q22'
  AND (institution LIKE '%Manchester%')
GROUP BY institution
ORDER BY institution;

-- Number of Computing Students in Manchester
SELECT institution, SUM(sample), (
    SELECT sample FROM nss y
    WHERE subject='(8) Computer Science'
    AND x.institution = y.institution
    AND question='Q01'
) AS comp
FROM nss x
WHERE question='Q01'
AND (institution LIKE '%Manchester%')
GROUP BY institution;
