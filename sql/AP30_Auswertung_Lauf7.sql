select erg.sort "#", erg.statistikpunkt,
  case WHEN erg.statistikpunkt like '%\%%'
  THEN
    to_char(erg.anz_proz, '990.00 %')
  ELSE
    to_char(erg.anz_proz, '999990')
  end "Anzahl / %"
from (
select 10 sort, 'AP30 Testszenarien' statistikpunkt, count(*) anz_proz from
(select "Test: Szenario" from ap30_testsz_fit_lauf7 GROUP BY 1) ap30_tz
group by 1
UNION
select 20, 'AP30 Testfälle', count(*) ap30_tz from ap30_testsz_fit_lauf7
group by 1
UNION
select 30, 'AP30 Testszenarien komplett passed', count(*) from (select tz from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '4'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf7 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where status_tag."Status" = 'Passed'
and tz NOT in (select "Test: Szenario" tz from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '4' and "Status" != 'Passed')) ap30passed
UNION
select 40, 'AP30 Testszenarien komplett passed Tag 1', count(*) from (select tz from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '1'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf7 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where status_tag."Status" = 'Passed'
and tz NOT in (select "Test: Szenario" tz from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '1' and "Status" != 'Passed')) egal
UNION
select 50, 'AP30 Testszenarien komplett passed Tag 2', count(*) from (select tz from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '2'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf7 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where status_tag."Status" = 'Passed'
and tz NOT in (select "Test: Szenario" tz from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '2' and "Status" != 'Passed')) egal
UNION
select 60, 'AP30 Testszenarien nicht komplett passed', count(*) from (select tz from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '4'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf7 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where (status_tag."Status" = 'Passed' or status_tag."Status" != 'Passed')
and tz in (select "Test: Szenario" tz from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '4' and "Status" != 'Passed')) egal
UNION
select 70, 'AP30 Testszenarien nicht komplett passed Tag 1', count(*) from (select tz from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '1'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf7 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where (status_tag."Status" = 'Passed' or status_tag."Status" != 'Passed')
and tz in (select "Test: Szenario" tz from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '1' and "Status" != 'Passed')) egal
UNION
select 80, 'AP30 Testszenarien nicht komplett passed Tag 2', count(*) from (select tz from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '2'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf7 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where (status_tag."Status" = 'Passed' or status_tag."Status" != 'Passed')
and tz in (select "Test: Szenario" tz from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '2' and "Status" != 'Passed')) egal
UNION
select 85, 'AP30 Testszenarien % komplett passed', cast(count(*) as NUMERIC) / cast((select count(*) anz_proz from
(select "Test: Szenario" from ap30_testsz_fit_lauf7 GROUP BY 1) ap30_tz) as NUMERIC) * 100 from (select tz from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '4'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf7 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where status_tag."Status" = 'Passed'
and tz NOT in (select "Test: Szenario" tz from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '4' and "Status" != 'Passed')) ap30passed
UNION
select 86, 'AP30 Testszenarien % komplett passed Tag 1', cast(count(*) as NUMERIC) / cast((select count(*) anz_proz from
(select "Test: Szenario" from ap30_testsz_fit_lauf7 GROUP BY 1) ap30_tz) as NUMERIC) * 100 from (select tz from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '1'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf7 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where status_tag."Status" = 'Passed'
and tz NOT in (select "Test: Szenario" tz from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '4' and "Status" != 'Passed')) ap30passed
UNION
select 87, 'AP30 Testszenarien % komplett passed Tag 2', cast(count(*) as NUMERIC) / cast((select count(*) anz_proz from
(select "Test: Szenario" from ap30_testsz_fit_lauf7 GROUP BY 1) ap30_tz) as NUMERIC) * 100 from (select tz from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '2'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf7 l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where status_tag."Status" = 'Passed'
and tz NOT in (select "Test: Szenario" tz from ap30_testsz_fit_lauf7 where substr("Test: Test Name", 1, 1) <= '4' and "Status" != 'Passed')) ap30passed
UNION
select 90, 'Testfälle AP30 Verantwortung', count(*) from ap30_testsz_fit_lauf7
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%')))
UNION
select 100, 'Testfälle AP30 Verantwortung Tag 1', count(*) res from ap30_testsz_fit_lauf7
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%')))
and substr("Test: Test Name", 1, 1) = '1'
UNION
select 110, 'Testfälle AP30 Verantwortung Tag 2', count(*) res from ap30_testsz_fit_lauf7
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%')))
and substr("Test: Test Name", 1, 1) = '2'
UNION
select 120, 'Testfälle AP30 Verantwortung Tag 3', count(*) res from ap30_testsz_fit_lauf7
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%')))
and substr("Test: Test Name", 1, 1) in ('3', '4')
UNION
select 130, 'Testfälle AP30 Verantwortung Passed gesamt', count(*) res from ap30_testsz_fit_lauf7
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%')))
and "Status" = 'Passed'
UNION
select 140, 'Testfälle AP30 Verantwortung Passed gesamt Tag 1', count(*) res from ap30_testsz_fit_lauf7
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%')))
and "Status" = 'Passed' and substr("Test: Test Name", 1, 1) <= '1'
UNION
select 150, 'Testfälle AP30 Verantwortung Passed gesamt Tag 2', count(*) res from ap30_testsz_fit_lauf7
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%')))
and "Status" = 'Passed' and substr("Test: Test Name", 1, 1) <= '2'
UNION
select 160, 'Testfälle AP30 Verantwortung NOT Passed gesamt', count(*) res from ap30_testsz_fit_lauf7
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%')))
and "Status" != 'Passed'
UNION
select 170, 'Testfälle AP30 Verantwortung NOT Passed gesamt Tag 1', count(*) res from ap30_testsz_fit_lauf7
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%')))
and "Status" != 'Passed' and substr("Test: Test Name", 1, 1) <= '1'
UNION
select 180, 'Testfälle AP30 Verantwortung NOT Passed gesamt Tag 2', count(*) res from ap30_testsz_fit_lauf7
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%')))
and "Status" != 'Passed' and substr("Test: Test Name", 1, 1) <= '2'
UNION
select 190, 'Testfälle AP30 Verantwortung % Passed gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf7
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%')))
and "Status" = 'Passed') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf7
where (("Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%')
or ("Geplanter Tester" = 'kc_tester' and "Test: Szenario" like '%AP40_%' and ("Test: Test Name" like '%Warenjournal%' or "Test: Test Name" like '%SAP_P%'))
or ("Test: Szenario" like '%ID6692_UV_%' and ("Test: Test Name" LIKE '%BLIC_BUB%' or "Test: Test Name" LIKE '%Warenjournal%'))))
as numeric) * 100), 2)
UNION
select 200, 'Testfälle AP30 Verantwortung % Passed Tag 1', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Passed' and substr("Test: Test Name", 1, 1) <= '1') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '1' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 210, 'Testfälle AP30 Verantwortung % Passed Tag 2', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Passed' and substr("Test: Test Name", 1, 1) <= '2') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '2' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 220, 'Testfälle AP30 Verantwortung % NOT Passed gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" != 'Passed') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 230, 'Testfälle AP30 Verantwortung % NOT Passed Tag 1', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" != 'Passed' and substr("Test: Test Name", 1, 1) <= '1') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '1' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 240, 'Testfälle AP30 Verantwortung % NOT Passed Tag 2', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" != 'Passed' and substr("Test: Test Name", 1, 1) <= '2') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '2' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 260, 'Testfälle AP30 Verantwortung % Failed gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Failed') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 270, 'Testfälle AP30 Verantwortung % Blocked gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Blocked') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 280, 'Testfälle AP30 Verantwortung % No Run gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'No Run') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 290, 'Testfälle AP30 Verantwortung % Retest gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Retest') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 300, 'Testfälle AP30 Verantwortung % NOT Completed gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'NOT Completed') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 310, 'Testfälle AP30 Verantwortung % N/A gesamt', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'NOT Completed') as numeric) /
cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 320, 'Testfälle AP30 Verantwortung % Failed Tag 1', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Failed' and substr("Test: Test Name", 1, 1) <= '1') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '1' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 330, 'Testfälle AP30 Verantwortung % Blocked Tag 1', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Blocked' and substr("Test: Test Name", 1, 1) <= '1') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '1' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 340, 'Testfälle AP30 Verantwortung % No Run Tag 1', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'No Run' and substr("Test: Test Name", 1, 1) <= '1') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '1' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 350, 'Testfälle AP30 Verantwortung % Retest Tag 1', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Retest' and substr("Test: Test Name", 1, 1) <= '1') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '1' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 360, 'Testfälle AP30 Verantwortung % NOT Completed Tag 1', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Not Completed' and substr("Test: Test Name", 1, 1) <= '1') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '1' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 370, 'Testfälle AP30 Verantwortung % N/A Tag 1', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'N/A' and substr("Test: Test Name", 1, 1) <= '1') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '1' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 380, 'Testfälle AP30 Verantwortung % Failed Tag 2', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Failed' and substr("Test: Test Name", 1, 1) <= '2') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '2' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 390, 'Testfälle AP30 Verantwortung % Blocked Tag 2', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Blocked' and substr("Test: Test Name", 1, 1) <= '2') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'ossg_belegmanagement', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '2' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 400, 'Testfälle AP30 Verantwortung % No Run Tag 2', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'No Run' and substr("Test: Test Name", 1, 1) <= '2') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '2' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 410, 'Testfälle AP30 Verantwortung % Retest Tag 2', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Retest' and substr("Test: Test Name",
1, 1) <= '2') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '2' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 420, 'Testfälle AP30 Verantwortung % NOT Completed Tag 2', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'Not Completed' and substr("Test: Test Name", 1, 1) <= '2') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '2' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2)
UNION
select 430, 'Testfälle AP30 Verantwortung % N/A Tag 2', round((cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
and "Status" = 'N/A' and substr("Test: Test Name", 1, 1) <= '2') as numeric) / cast((select count(*) from ap30_testsz_fit_lauf7
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi' ) and substr("Test: Test Name", 1, 1) <= '2' and "Test: Test Name" NOT LIKE '%Kunden%') as numeric) * 100), 2))
erg ORDER by 1;

/* Testfälle, die nicht komplett passed waren */
select * from ap30_testsz_fit_lauf7 where "Test: Szenario" in (
  SELECT tz
  FROM (
         SELECT
           "Test: Szenario" tz,
           "Status"         sta,
           count(*)
         FROM ap30_testsz_fit_lauf7 where "Status" = 'Failed'
         GROUP BY 1, 2) test
  GROUP BY 1
)
ORDER BY "Test: Szenario", "Test: Test Name";

/* Testszenarien, gruppiert nach Status */
select "Test: Szenario", "Status", count(*)
from ap30_testsz_fit_lauf7
GROUP BY 1,2
order by 1,2;

/* Testszenarien, gruppiert nach Status */
select "Test: Szenario",
  count(*) "Testfälle",
  (select count(*) from ap30_testsz_fit_lauf7 i where "Status" = 'Passed' and i."Test: Szenario" = o."Test: Szenario")
from ap30_testsz_fit_lauf7 o
GROUP BY 1
order by 1;

/* Liste der Testszenarien */
SELECT "Test: Szenario" from "ap30_testsz_fit_lauf7"
GROUP BY 1
order by 1;

/* Liste der Testfälle */
SELECT "Test: Szenario", "Test: Test Name", "Test: Tag", "Status", "Geplanter Tester" from "ap30_testsz_fit_lauf7"
order by 1,2,3;

/* Problemliste */
SELECT "Test: Szenario", "Test: Test Name", "Test: Tag", "Status", "Geplanter Tester" from "ap30_testsz_fit_lauf7"
  where "Status" not in ('Passed', 'No Run')
order by 1,2,3;

/* Problemliste */
SELECT "Test: Szenario", "Test: Test Name", "Test: Tag", "Status", "Geplanter Tester" from "ap30_testsz_fit_lauf7"
where "Status" in ('Failed') --and "Test: Tag" in ('1','2')
order by 1,2,3;

/* Testszenarien aus der txt-liste nicht in der ALM */
select a."TZ" from ap30_testszenarien a where a."TZ" not in (
SELECT * from
  (SELECT "Test: Szenario" from "ap30_testsz_fit_lauf7"
  GROUP BY 1) dd);