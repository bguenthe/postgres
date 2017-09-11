select beleg_txt.beleg_von, beleg_txt.beleg_bis, beleg_txt.sus1, beleg_txt.sus2, beleg_txt.text, beleg_txt.typ, beleg_txt.firma  
from beleg_txt left outer join beleg_excel on beleg_txt.beleg_von = beleg_excel.beleg_von
group by beleg_txt.beleg_von, beleg_txt.beleg_bis, beleg_txt.sus1, beleg_txt.sus2, beleg_txt.text, beleg_txt.typ, beleg_txt.firma 
order by to_number(beleg_txt.beleg_von,'999999')

select * 
from beleg_txt left outer join beleg_excel on beleg_txt.beleg_von = beleg_excel.beleg_von order by to_number(beleg_txt.beleg_von,'999999')

select * from beleg_txt order by to_number(beleg_txt.beleg_von,'999999')

select * from beleg_excel order by beleg_von

select beleg_txt.beleg_von, beleg_txt.beleg_bis, beleg_txt.sus1, beleg_txt.sus2, beleg_txt.text, beleg_excel.typ, beleg_txt.firma, beleg_excel.text, beleg_txt.auftrag  
from beleg_txt left outer join beleg_excel on beleg_txt.beleg_von = beleg_excel.beleg_von and beleg_txt.firma = beleg_excel.firma
where beleg_txt.firma = 'Otto Germany' --'Heinrich Heine GmbH Germany' --'Corso' --
group by beleg_txt.beleg_von, beleg_txt.beleg_bis, beleg_txt.sus1, beleg_txt.sus2, beleg_txt.text, beleg_excel.typ, beleg_txt.firma, beleg_excel.text, beleg_txt.auftrag
order by to_number(beleg_txt.beleg_von,'999999')
    
select beleg_von,count(*) from beleg_excel group by beleg_von having count(*) > 1
    
select firma, count(*) from beleg_txt group by firma

select firma, count(*) from beleg_excel group by firma

delete from beleg_abnahme

select * from beleg_abnahme where id_gid = 1

select id_gid, count(*) from beleg_abnahme group by id_gid having count(*) > 1

select id_gid, name, description, enumname 
from beleg_abnahme
group by id_gid, name, description, enumname

select 
  id_gid,id_vouch,channel,id_company_customer,id_warehouse_default,retailstore,id_warehouse_source,
  buyinggroup,id_stockpostingtype,cardtype,yn_vouchernumbersingle,vouchernumber_from,vouchernumber_to,yn_intrastatrelevant,
  id_country_intrastat,yn_ekrelevant,vouchernumbertype,accountsap1,accountsap2,accountsus1,accountsus2,
  id_company_bdf,partner,profitcenter,validfrom,validto,reference    
from beleg_abnahme
order by id_gid