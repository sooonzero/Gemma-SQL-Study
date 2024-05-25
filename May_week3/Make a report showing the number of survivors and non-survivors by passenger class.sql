select survived, sum(if(pclass = 1, 1, 0)) first_class, sum(if(pclass = 2, 1, 0)) second_class, sum(if(pclass = 3, 1, 0)) third_class
from titanic
group by survived
