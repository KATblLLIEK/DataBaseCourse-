--Ранжирование товаров по весу в порядке его убывания (Null считать
--бесконечным   весом).   ("Production"."Product"),   Примечание   к
--ранжированию   –   ранг   может   начинаться   с   произвольного   числа
--(например, 2 или 5), главное – ранг не должен уменьшаться.

select p."Name",
       p."Weight",
       (select count(distinct "Weight") from "Production"."Product" where "Weight" is not null and "Weight" > p."Weight") + 1 as "rank"
from "Production"."Product" p
order by "rank", "Weight" desc;