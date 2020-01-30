-- SELF JOIN

--1 => How many stops are in the database.
SELECT COUNT(*)
FROM stops;
--2 => Find the id value for the stop 'Craiglockhart'
SELECT id
FROM stops
WHERE name = 'Craiglockhart';
--3 => Give the id and the name for the stops on the '4' 'LRT' service.
SELECT id, name
  FROM stops JOIN route
    ON id = stop
  WHERE num = '4' AND company = 'LRT';
--4 => The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route 
WHERE stop = 149 OR stop = 53
GROUP BY company, num
HAVING COUNT(*) = 2;
--5 => Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company = b.company AND a.num = b.num)
WHERE a.stop = 53 AND b.stop = 149;
--6 => Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';
--7 => Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT a.company, a.num 
FROM route a JOIN route b ON a.company = b.company AND a.num = b.num
WHERE a.stop = 115 AND b.stop = 137
GROUP BY a.company, a.num;
--8 => Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT a.company, a.num
  FROM route a JOIN route b ON a.company = b.company AND a.num = b.num
  JOIN stops stopa ON stopa.id = a.stop
  JOIN stops stopb ON stopb.id = b.stop
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross'
GROUP BY a.company, a.num;
--9 => Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company.
SELECT stopb.name, a.company, a.num
  FROM route a JOIN route b ON a.company = b.company AND a.num = b.num
  JOIN stops stopa ON a.stop = stopa.id JOIN stops stopb ON b.stop = stopb.id
 WHERE a.company = 'LRT' AND stopa.name = 'Craiglockhart';
--10 => Find the routes involving two buses that can go from Craiglockhart to Lochend.
-- Show the bus no. and company for the first bus, the name of the stop for the transfer,
-- and the bus no. and company for the second bus
SELECT distinct  a.num,a.company, stopb.name,  second.num, second.company
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
  JOIN 
(
SELECT distinct  stopaa.name, aa.num, aa.company
FROM route aa JOIN route bb ON
  (aa.company=bb.company AND aa.num=bb.num)
  JOIN stops stopaa ON (aa.stop=stopaa.id)
  JOIN stops stopbb ON (bb.stop=stopbb.id)
  where stopbb.name ='Lochend'
) second on stopb.name = second.name
WHERE stopa.name='Craiglockhart';