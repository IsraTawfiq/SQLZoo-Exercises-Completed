-- 1. How many stops are in the database.
SELECT COUNT(*) FROM stops;

-- 2. Find the id value for the stop 'Craiglockhart'
SELECT id FROM stops WHERE name ='Craiglockhart';

-- 3. Give the id and the name for the stops on the '4' 'LRT' service.
SELECT stops.* FROM stops JOIN route ON stops.id=route.stop WHERE num ='4' AND company='LRT';

-- 4. The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53).
--    Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

-- 5. Change the query to show the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop =149;

-- 6. Change the query to show the services between 'Craiglockhart' and 'London Road'.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name= 'London Road';

-- 7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith').
SELECT DISTINCT r1.company, r2.num
FROM route AS r1
JOIN route AS r2
ON (r1.company, r1.num) = (r2.company, r2.num)
WHERE r1.stop = 115 AND r2.stop = 137;

-- 8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'.
SELECT r1.company, r1.num
FROM route AS r1
JOIN route AS r2 ON (r1.company, r1.num) = (r2.company, r2.num)
JOIN stops AS s1 ON r1.stop = s1.id
JOIN stops AS s2 ON r2.stop = s2.id
WHERE s1.name = 'Craiglockhart' AND s2.name = 'Tollcross';

-- 9. Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company.
SELECT DISTINCT s2.name, r1.company, r1.num
FROM route AS r1
JOIN route AS r2 ON (r1.company = r2.company AND r1.num = r2.num)
JOIN stops AS s1 ON r1.stop = s1.id
JOIN stops AS s2 ON r2.stop = s2.id
WHERE s1.name = 'Craiglockhart';
