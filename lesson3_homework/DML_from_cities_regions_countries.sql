use geodata;
# 1.
SELECT city.title AS title, city.region_id AS region, city.coutry_id AS country
FROM _cities as city
	LEFT JOIN _regions AS r ON city.region_id = r.id
    LEFT JOIN _countries AS c ON city.country_id = c.id
ORDER BY title;

# 2.
SELECT FROM _cities WHERE region_id = 'Московская область';
