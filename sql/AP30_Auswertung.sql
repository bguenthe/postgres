create table result_fit_lauf1 as (
  SELECT
    min."Test: Szenario",
    min.tnmin,
    max.tnmax,
    (SELECT "Status"
     FROM ap30_testsz_fit_lauf1
     WHERE "Test: Szenario" = min."Test: Szenario" AND "Test: Test Name" = tnmin) min_status,
    (SELECT "Status"
     FROM ap30_testsz_fit_lauf1
     WHERE "Test: Szenario" = max."Test: Szenario" AND "Test: Test Name" = tnmax) max_status
  FROM
    (SELECT
       "Test: Szenario",
       min("Test: Test Name") tnmin
     FROM ap30_testsz_fit_lauf1
     GROUP BY "Test: Szenario") min
    JOIN
    (SELECT
       "Test: Szenario",
       max("Test: Test Name") tnmax
     FROM ap30_testsz_fit_lauf1
     GROUP BY "Test: Szenario") max
      ON min."Test: Szenario" = max."Test: Szenario"
);

create table result_fit_lauf2 as (
  SELECT
    min."Test: Szenario",
    min.tnmin,
    max.tnmax,
    (SELECT "Status"
     FROM ap30_testsz_fit_lauf2
     WHERE "Test: Szenario" = min."Test: Szenario" AND "Test: Test Name" = tnmin) min_status,
    (SELECT "Status"
     FROM ap30_testsz_fit_lauf2
     WHERE "Test: Szenario" = max."Test: Szenario" AND "Test: Test Name" = tnmax) max_status
  FROM
    (SELECT
       "Test: Szenario",
       min("Test: Test Name") tnmin
     FROM ap30_testsz_fit_lauf2
     GROUP BY "Test: Szenario") min
    JOIN
    (SELECT
       "Test: Szenario",
       max("Test: Test Name") tnmax
     FROM ap30_testsz_fit_lauf2
     GROUP BY "Test: Szenario") max
      ON min."Test: Szenario" = max."Test: Szenario"
);

create table result_fit_lauf3 as (
  SELECT
    min."Test: Szenario",
    min.tnmin,
    max.tnmax,
    (SELECT "Status"
     FROM ap30_testsz_fit_lauf3
     WHERE "Test: Szenario" = min."Test: Szenario" AND "Test: Test Name" = tnmin) min_status,
    (SELECT "Status"
     FROM ap30_testsz_fit_lauf3
     WHERE "Test: Szenario" = max."Test: Szenario" AND "Test: Test Name" = tnmax) max_status
  FROM
    (SELECT
       "Test: Szenario",
       min("Test: Test Name") tnmin
     FROM ap30_testsz_fit_lauf3
     GROUP BY "Test: Szenario") min
    JOIN
    (SELECT
       "Test: Szenario",
       max("Test: Test Name") tnmax
     FROM ap30_testsz_fit_lauf3
     GROUP BY "Test: Szenario") max
      ON min."Test: Szenario" = max."Test: Szenario"
);

create table result_fint_lauf3a as (
  SELECT
    min."Test: Szenario",
    min.tnmin,
    max.tnmax,
    (SELECT "Status"
     FROM ap30_testsz_fint_lauf3a
     WHERE "Test: Szenario" = min."Test: Szenario" AND "Test: Test Name" = tnmin) min_status,
    (SELECT "Status"
     FROM ap30_testsz_fint_lauf3a
     WHERE "Test: Szenario" = max."Test: Szenario" AND "Test: Test Name" = tnmax) max_status
  FROM
    (SELECT
       "Test: Szenario",
       min("Test: Test Name") tnmin
     FROM ap30_testsz_fint_lauf3a
     GROUP BY "Test: Szenario") min
    JOIN
    (SELECT
       "Test: Szenario",
       max("Test: Test Name") tnmax
     FROM ap30_testsz_fint_lauf3a
     GROUP BY "Test: Szenario") max
      ON min."Test: Szenario" = max."Test: Szenario"
);

create table result_fint_lauf3b as (
  SELECT
    min."Test: Szenario",
    min.tnmin,
    max.tnmax,
    (SELECT "Status"
     FROM ap30_testsz_fint_lauf3b
     WHERE "Test: Szenario" = min."Test: Szenario" AND "Test: Test Name" = tnmin) min_status,
    (SELECT "Status"
     FROM ap30_testsz_fint_lauf3b
     WHERE "Test: Szenario" = max."Test: Szenario" AND "Test: Test Name" = tnmax) max_status
  FROM
    (SELECT
       "Test: Szenario",
       min("Test: Test Name") tnmin
     FROM ap30_testsz_fint_lauf3b
     GROUP BY "Test: Szenario") min
    JOIN
    (SELECT
       "Test: Szenario",
       max("Test: Test Name") tnmax
     FROM ap30_testsz_fint_lauf3b
     GROUP BY "Test: Szenario") max
      ON min."Test: Szenario" = max."Test: Szenario"
);

create table result_fint_lauf3c as (
  SELECT
    min."Test: Szenario",
    min.tnmin,
    max.tnmax,
    (SELECT "Status"
     FROM ap30_testsz_fint_lauf3c
     WHERE "Test: Szenario" = min."Test: Szenario" AND "Test: Test Name" = tnmin) min_status,
    (SELECT "Status"
     FROM ap30_testsz_fint_lauf3c
     WHERE "Test: Szenario" = max."Test: Szenario" AND "Test: Test Name" = tnmax) max_status
  FROM
    (SELECT
       "Test: Szenario",
       min("Test: Test Name") tnmin
     FROM ap30_testsz_fint_lauf3c
     GROUP BY "Test: Szenario") min
    JOIN
    (SELECT
       "Test: Szenario",
       max("Test: Test Name") tnmax
     FROM ap30_testsz_fint_lauf3c
     GROUP BY "Test: Szenario") max
      ON min."Test: Szenario" = max."Test: Szenario"
)

/* Lauf 1: Garnicht gelaufen oder nicht durchgelaufen */
select * from result_fit_lauf1 where min_status != 'Passed' or max_status != 'Passed';

/* Lauf 1: Durchgelaufen */
select * from result_fit_lauf1 where min_status = 'Passed' and max_status = 'Passed';

/* Lauf 2: Garnicht gelaufen oder nicht durchgelaufen */
(select "Test: Szenario", 'OK' from result_fit_lauf2 where min_status = 'Passed' and max_status = 'Passed')
union all
(select "Test: Szenario", 'NOK' from result_fit_lauf2 where min_status != 'Passed' or max_status != 'Passed')
order by 1;

/* Lauf 2: Durchgelaufen */
select * from result_fit_lauf2 where min_status = 'Passed' and max_status = 'Passed';

/* Lauf 3: Garnicht gelaufen oder nicht durchgelaufen */
select * from result_fit_lauf3 where min_status = 'Passed' and max_status = 'Passed';

select * from result_fit_lauf3 where min_status != 'Passed' or max_status != 'Passed';

/* Lauf 3: Durchgelaufen */
select * from result_fit_lauf3 where min_status = 'Passed' and max_status = 'Passed';

/* noch nie durchgelaufen */
select r1."Test: Szenario", r1.max_status, r2.max_status from
  (select * from result_fit_lauf1 where min_status != 'Passed' or max_status != 'Passed') r1
  join
  (select * from result_fit_lauf2 where min_status != 'Passed' or max_status != 'Passed') r2
    on r1."Test: Szenario" = r2."Test: Szenario"
  join
  (select * from result_fint_lauf3a where min_status != 'Passed' or max_status != 'Passed') r3a
  on r1."Test: Szenario" = r3a."Test: Szenario"
  join
  (select * from result_fint_lauf3b where min_status != 'Passed' or max_status != 'Passed') r3b
  on r1."Test: Szenario" = r3b."Test: Szenario"
  join
  (select * from result_fint_lauf3c where min_status != 'Passed' or max_status != 'Passed') r3c
  on r1."Test: Szenario" = r3c."Test: Szenario";

/* Alle Szenarien, die AP30 verantwortet mit Status */
select innert."#", innert."Gruppe", innert."Anzahl Szenarien / Prozent" from
(select 1 "#", 'Testfälle AP30 Verantwortung' "Gruppe", count(*) "Anzahl Szenarien / Prozent"  from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
union
select 2, 'Testfälle AP30 Verantwortung Passed gesamt', count(*) ap30_tf_passed from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Passed'
UNION
select 3, 'Testfälle AP30 Verantwortung Not Passed gesamt', count(*) ap30_tf_not_passed from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" != 'Passed'
UNION
select 4, 'Testfälle AP30 Verantwortung Passed gesamt Tag2', count(*) ap30_tf_passed_tag2 from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Passed' and substr("Test: Test Name", 1, 1) < '3'
UNION
select 5, 'Testfälle AP30 Verantwortung Not Passed gesamt Tag2', count(*) ap30_tf_not_passed_tag2 from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" != 'Passed' and substr("Test: Test Name", 1, 1) < '3') innert
UNION
select 6, 'Prozent Passed gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Passed') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 7, 'Prozent Not Passed gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" != 'Passed') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 8, 'Prozent Failed gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Failed') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 9, 'Prozent Blocked gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Blocked') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 10, 'Prozent No Run gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'No Run') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 11, 'Prozent Retest gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Retest') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 12, 'Prozent Not Completed gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Not Completed') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf3
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
ORDER BY 1;

/* vollständig durchgelaufen -- alle passed */