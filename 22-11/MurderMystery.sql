/*
Date: 20180115, Type: Murder, City: SQL City
*/

SELECT * FROM crime_scene_report
WHERE date = '20180115' AND city = 'SQL City' AND type = 'murder';

/* 
Relatorio:
Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".
*/

/*
Witness 1. Lives at the last house on "Northwestern Dr"
*/
SELECT MAX(Address_Number) FROM person
WHERE address_street_name = 'Northwestern Dr';

SELECT * FROM person 
WHERE address_number = 4919;

/* 
ID	        NOME		LIC_ID	ADD_NUM	STREET NAME	    SSN
14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949
*/

select * from interview
where person_id = 14887;

/* 
Testemunho W.1:
I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W"

RESUMO:
- It was a man.
- He used a gun.
- He had a "Get Fit Now Gym" bag with Gold membership number starting with "48Z".
- Has a car with a plate that has "H42W".
*/

/* 
Witness 2. Annabel, lives somewhere on "Franklin Ave"
*/
SELECT * FROM person
WHERE address_street_name = 'Franklin Ave';

/*
ID	        NOME		LIC_ID	ADD_NUM	STREET NAME	    SSN
16371	Annabel Miller	490173	103	Franklin Ave	318771143
*/

select * from interview
where person_id = 16371;

/* 
Testemunho W.2:
I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

RESUMO:
- The guy is from his gym, at least until 9th January, last week.
*/

select * from get_fit_now_check_in
where check_in_date = '20180109';

select * from get_fit_now_member
where id = '48Z7A';

