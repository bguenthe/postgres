/* komplett passed */
(select tz from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf4_erweitert where substr("Test: Test Name", 1, 1) <= '3'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf4_erweitert l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where status_tag."Status" = 'Passed'
and tz not in (select "Test: Szenario" tz from ap30_testsz_fit_lauf4_erweitert where substr("Test: Test Name", 1, 1) <= '3' and "Status" != 'Passed'))

select tz from (
                 (select tf_tag.tz, tf_tag.tf, l3."Status" from
                   (select "Test: Szenario" tz, max("Test: Test Name") tf
                    from ap30_testsz_fit_lauf3 where substr("Test: Test Name", 1, 1) <= '3'
                    group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf4_erweitert l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where status_tag."Status" = 'Passed'


select tz from (
(select tf_tag.tz, tf_tag.tf, l3."Status" from
(select "Test: Szenario" tz, max("Test: Test Name") tf
from ap30_testsz_fit_lauf4_erweitert where substr("Test: Test Name", 1, 1) <= '3'
group by "Test: Szenario") tf_tag JOIN ap30_testsz_fit_lauf4_erweitert l3 on tf_tag.tz = l3."Test: Szenario" AND tf_tag.tf = l3."Test: Test Name")) status_tag
where (status_tag."Status" = 'Passed' or status_tag."Status" != 'Passed')
and tz in (select "Test: Szenario" tz from ap30_testsz_fit_lauf4_erweitert where substr("Test: Test Name", 1, 1) <= '3' and "Status" != 'Passed');

(select "Test: Szenario" tz from ap30_testsz_fit_lauf4_erweitert where substr("Test: Test Name", 1, 1) <= '3' and "Status" != 'Passed');


select * from ap30_testsz_fit_lauf4_erweitert
where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi' ) and "Test: Test Name" NOT LIKE '%Kunden%'
      and substr("Test: Test Name", 1, 1) in ('4')


SELECT
  "Test: Szenario" tz
FROM ap30_testsz_fit_lauf6
where "Test: Szenario" not in (select " szenario" from "waltraut_wj")
GROUP BY 1;

  SELECT " szenario" from "waltraut_wj"
  where " szenario" not in
        (select "Test: Szenario" from ap30_testsz_fit_lauf6
        GROUP BY 1);


select count(*) from ap30_testsz_fit_lauf7 where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ossg_belegmanagement', 'ov_ak_bestände', 'am_fi') and substr("Test: Test Name", 1, 1) <= '1'

select * from ap30_testsz_fit_lauf6 where "Geplanter Tester" in ('ossg_warenbuchhaltung', 'ov_ak_bestände', 'am_fi') and substr("Test: Test Name", 1, 1) <= '1'

drop table ap30_testsz_fit_lauf7;