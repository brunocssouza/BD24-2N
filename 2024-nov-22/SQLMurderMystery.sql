/*
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
SELECT MAX(Address_Number) FROM person
WHERE address_street_name = 'Northwestern Dr'; 

SELECT * FROM person
WHERE address_number = 4919 OR (address_street_name = 'Franklin Ave' AND name LIKE '%Annabel%');

/* 
ID	    NAME		    LICENSE_ID	    ADDRESS_NUMBER	    ADDRESS_STREET_NAME     SSN
14887	Morty Schapiro	118009	        4919	            Northwestern Dr	        111564949
16371	Annabel Miller	490173	        103	                Franklin Ave            318771143
*/

select * from interview
where person_id = 14887 OR person_id = 16371;

/* 
Testemunho 1:
I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".

Testemunho 2:
I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

RESUMO:
- The guy is part of a gym, at least until 9th January, last week.
- It was a man.
- He used a gun.
- He had a "Get Fit Now Gym" bag with Gold membership number starting with "48Z".
- Has a car with the plate "H42W".
*/

SELECT * FROM get_fit_now_check_in
WHERE check_in_date = '20180109' AND membership_id LIKE '48Z%';

SELECT * FROM drivers_license
WHERE gender = 'male' AND plate_number LIKE '%H42W%';

SELECT * FROM person
WHERE license_id = 423327 OR license_id = 664760;

/*
Suspeitos:
id	    name	        license_id	address_number	address_street_name	    ssn         age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
51739	Tushar Chandra	664760	    312	            Phi St	                137882671   30	70	    brown	    brown	    male	0H42W2	        Chevrolet	Spark LS
67318	Jeremy Bowers	423327	    530	            Washington Pl, Apt 3A	871539279   21	71	    black	    black	    male	4H42WR	        Nissan	    Altima
*/

SELECT * FROM get_fit_now_member
WHERE person_id = '51739' OR person_id = '67318';

/* 
ASSASSINO: Jeremy Bowers

Tesmunho: 
I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

RESUMO:
- Uma mulher.
- Rica.
- Entre 5'5" (65") e 5'7" (67") de altura.
- Cabelo vermelho.
- Dirige um Tesla Model S.
- Foi em SQL Symphony Concert três vezes em December 2017.
*/

SELECT * FROM drivers_license
WHERE car_make = 'Tesla' AND car_model = 'Model S' AND gender = 'female' AND hair_color = 'red' AND (height >= 65 AND height <= 67);

/* 
Suspeitas drivers_license:
id	    age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
202298	68	66	    green	    red	        female	500123	        Tesla	    Model S
291182	65	66	    blue	    red	        female	08CM64	        Tesla	    Model S
918773	48	65	    black	    red	        female	917UU3	        Tesla	    Model S
*/

SELECT * FROM person
WHERE license_id = 202298 OR license_id = 291182 OR license_id = 918773;

/*
Suspeitas person:
id	    name	            license_id	address_number	address_street_name	    ssn
78881	Red Korb	        918773	    107	            Camerata Dr	            961388910
90700	Regina George	    291182	    332	            Maple Ave	            337169072
99716	Miranda Priestly	202298	    1883	        Golden Ave	            987756388
*/
SELECT * FROM facebook_event_checkin
WHERE person_id = 78881 OR person_id = 90700 OR person_id = 99716;

/*
person_id	event_id	event_name	            date
99716	    1143	    SQL Symphony Concert	20171206
99716	    1143	    SQL Symphony Concert	20171212
99716	    1143	    SQL Symphony Concert	20171229

MASTERMIND: Miranda Priestly
*/
