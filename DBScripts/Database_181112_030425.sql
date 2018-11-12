-- Model.averageRating [ent2#att33]
create view `model_averagerating_view` as
select AL1.`oid` as `oid`, avg(AL2.`rating`) as `der_attr`
from  `model` AL1 
               left outer join `rating` AL2 on AL1.`oid`=AL2.`model_oid`
group by AL1.`oid`;


