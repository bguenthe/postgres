select "Test: Szenario", "Test: Test Name", "Geplanter Tester"  from "alltestsz_fit_lauf5"
where lower("Test: Test Name") like '%warenjournal%' and "Geplanter Tester" not LIKE '%ossg_w%'
order by 1,2;