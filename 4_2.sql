--Ранжирование товаров по весу в порядке его убывания (Null считать
--бесконечным   весом).   ("Production"."Product"),   Примечание   к
--ранжированию   –   ранг   может   начинаться   с   произвольного   числа
--(например, 2 или 5), главное – ранг не должен уменьшаться.

select "Name", "Weight",
       DENSE_RANK() over (order by coalesce ("Weight", 0) desc , "Weight" desc) as "rank"
from  "Production"."Product";