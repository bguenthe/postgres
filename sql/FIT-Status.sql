/* Lauf 3: Groesster passed */
select min."Test: Szenario",
  min.tnmin "Erster Schritt",
  maxpassed.tnmaxpassed "Letzer Erfolgreich",
  maxfailed.tnfailed "Letzer Failed",
  max.tnmax "Letzer Schritt",
  maxpassed.cmaxpassed "passed bei",
  maxfailed.cmaxfailed "failed bei",
  max.cmax "Anzahl Schritte",
  (cast(maxpassed.cmaxpassed as float) / cast(max.cmax as float)) * 100.0 "Prozent erfolgreich",
  (select "Status" from ap30_testsz_fit_lauf3 where "Test: Szenario" = min."Test: Szenario" and "Test: Test Name" = tnmin) "Status erster Schritt",
  (select "Status" from ap30_testsz_fit_lauf3 where "Test: Szenario" = max."Test: Szenario" and "Test: Test Name" = tnmax) "Status letzter Schritt"
from
  (select "Test: Szenario", min("Test: Test Name") tnmin, count(*) cmin from ap30_testsz_fit_lauf3
  group by "Test: Szenario") min
  join
  (select "Test: Szenario", max("Test: Test Name") tnmaxpassed, count(*) cmaxpassed from ap30_testsz_fit_lauf3 WHERE "Status" = 'Passed'
  group by "Test: Szenario") maxpassed
    on min."Test: Szenario" = maxpassed."Test: Szenario"
  join
  (select "Test: Szenario", max("Test: Test Name") tnmax, count(*) cmax from ap30_testsz_fit_lauf3
  group by "Test: Szenario") max
    on min."Test: Szenario" = max."Test: Szenario"
  left join
  (select "Test: Szenario", max("Test: Test Name") tnfailed, count(*) cmaxfailed from ap30_testsz_fit_lauf3 WHERE "Status" = 'Failed'
  group by "Test: Szenario") maxfailed
    on min."Test: Szenario" = maxfailed."Test: Szenario"
order by 1, 2;

/* Lauf 2: Groesster passed */
select min."Test: Szenario",
  min.tnmin "Erster Schritt",
  maxpassed.tnmaxpassed "Letzer Erfolgreich",
  maxfailed.tnfailed "Letzer Failed",
  max.tnmax "Letzer Schritt",
  maxpassed.cmaxpassed "passed bei",
  maxfailed.cmaxfailed "failed bei",
  max.cmax "Anzahl Schritte",
  (cast(maxpassed.cmaxpassed as float) / cast(max.cmax as float)) * 100.0 "Prozent erfolgreich",
  (select "Status" from ap30_testsz_fit_lauf3 where "Test: Szenario" = min."Test: Szenario" and "Test: Test Name" = tnmin) "Status erster Schritt",
  (select "Status" from ap30_testsz_fit_lauf3 where "Test: Szenario" = max."Test: Szenario" and "Test: Test Name" = tnmax) "Status letzter Schritt"
from
  (select "Test: Szenario", min("Test: Test Name") tnmin, count(*) cmin from ap30_testsz_fit_lauf3
  group by "Test: Szenario") min
  join
  (select "Test: Szenario", max("Test: Test Name") tnmaxpassed, count(*) cmaxpassed from ap30_testsz_fit_lauf3 WHERE "Status" = 'Passed'
  group by "Test: Szenario") maxpassed
    on min."Test: Szenario" = maxpassed."Test: Szenario"
  join
  (select "Test: Szenario", max("Test: Test Name") tnmax, count(*) cmax from ap30_testsz_fit_lauf3
  group by "Test: Szenario") max
    on min."Test: Szenario" = max."Test: Szenario"
  left join
  (select "Test: Szenario", max("Test: Test Name") tnfailed, count(*) cmaxfailed from ap30_testsz_fit_lauf3 WHERE "Status" = 'Failed'
  group by "Test: Szenario") maxfailed
    on min."Test: Szenario" = maxfailed."Test: Szenario"
order by 1, 2;

/* Status des letzten Eintrages an einem Tag */
select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf3 where substr("Test: Test Name", 1, 1) <= '2'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf3 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name";

/* Komplett passed zu einem Tag */
select * from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf3 where substr("Test: Test Name", 1, 1) <= '3'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf3 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where status_tag."Status" = 'Passed'
and tz in (select "Test: Szenario" tz from ap30_testsz_fit_lauf3 where substr("Test: Test Name", 1, 1) <= '3' and "Status" = 'Passed');

/* Komplett passed zu einem Tag */
select * from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
 from ap30_testsz_fit_lauf4 where substr("Test: Test Name", 1, 1) <= '3'
 group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf3 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where status_tag."Status" = 'Passed'
and tz in (select "Test: Szenario" tz from ap30_testsz_fit_lauf4 where substr("Test: Test Name", 1, 1) <= '2' and "Status" = 'Passed');

/* nicht passed zu einem Tag */
select * from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf3 where substr("Test: Test Name", 1, 1) <= '1'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf3 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where status_tag."Status" != 'Passed' or status_tag."Status" = 'Passed'
and tz not in (select "Test: Szenario" tz from ap30_testsz_fit_lauf3 where substr("Test: Test Name", 1, 1) <= '1' and "Status" = 'Passed');

select 30, 'AP30 Testszenarien komplett passed', cast(count(*) as NUMERIC) / cast((select count(*) anz_proz from
(select "Test: Szenario" from ap30_testsz_fit_lauf5 GROUP BY 1) ap30_tz) as NUMERIC) * 100 from (select tz from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf5 where substr("Test: Test Name", 1, 1) <= '4'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf5 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where status_tag."Status" = 'Passed'
and tz NOT in (select "Test: Szenario" tz from ap30_testsz_fit_lauf5 where substr("Test: Test Name", 1, 1) <= '4' and "Status" != 'Passed')) ap30passed

select 90, 'Testfälle AP30 Verantwortung', count(*) from ap30_testsz_fit_lauf5
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%')))


select 190, 'Testfälle AP30 Verantwortung % Passed gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf5
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%')))
and "Status" = 'Passed') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf5
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%'))))
as numeric) * 100), 2)