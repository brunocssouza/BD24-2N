/*
Momento do ocorrido:
Date: 20180115, Type: Murder, City: SQL City
*/
SELECT * FROM crime_scene_report
WHERE date = '20180115' AND city = 'SQL City' AND type = 'murder';

/* 
Relatorio:
Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

Witness 1: Lives at the last house on "Northwestern Dr"
Witness 2: Annabel, lives somewhere on "Franklin Ave"
*/

SELECT transcript FROM interview
JOIN person ON person.id = interview.person_id
WHERE (person.address_street_name = 'Northwestern Dr' AND person.address_number = (SELECT MAX(address_number) FROM person WHERE address_street_name = 'Northwestern Dr')) 
OR (person.address_street_name = 'Franklin Ave' AND person.name LIKE '%Annabel%');

/*
Testemunho 1:
I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".

Testemunho 2:
I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

Resumo:
- The guy is part of a gym, at least until 9th January, last week.
- It was a man.
- He used a gun.  OBS: Foi inútil - só perdi tempo.
- He had a "Get Fit Now Gym" bag with Gold membership number starting with "48Z". OBS: Foi inútil - só perdi tempo.
- Has a car with the plate "H42W".
*/

/* IDENTIDADE DO ASSASSINO: */
SELECT get_fit_now_member.name AS 'Assassino' FROM get_fit_now_member
JOIN person ON person.id = get_fit_now_member.person_id
JOIN drivers_license ON drivers_license.id = person.license_id
WHERE drivers_license.gender = 'male' AND (drivers_license.plate_number LIKE '%H42W%'); /* Resultado: Jeremy Bowers */

/* 
Tesmunho do Assassino: 
I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

Resumo:
- Uma mulher.
- Rica.  OBS: Foi inútil - só perdi tempo.
- Entre 5'5" (65") e 5'7" (67") de altura.
- Cabelo vermelho.
- Dirige um Tesla Model S.
- Foi em SQL Symphony Concert três vezes em December 2017.
*/

/* IDENTIDADE DA MASTERMIND: */
SELECT person.name AS 'Mastermind' FROM person
JOIN drivers_license ON drivers_license.id = person.license_id
JOIN facebook_event_checkin ON facebook_event_checkin.person_id = person.id
WHERE drivers_license.car_make = 'Tesla' AND drivers_license.car_model = 'Model S' AND drivers_license.gender = 'female' AND drivers_license.hair_color = 'red' AND (drivers_license.height >= 65 AND drivers_license.height <= 67) AND (facebook_event_checkin.date LIKE '201712%')
GROUP BY person.name HAVING COUNT(facebook_event_checkin.event_name = 'SQL Symphony Concert') = 3;  /* Resultado: Miranda Priestly */
