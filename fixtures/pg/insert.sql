
-- One to Many
truncate table "public"."user" restart identity cascade;
truncate table "public"."item" restart identity cascade;
truncate table "public"."purchase" restart identity cascade;
alter sequence "public"."public"."item_id_seq" restart with 1;
alter sequence "public"."public"."user_id_seq" restart with 1;
alter sequence "public"."public"."purchase_id_seq" restart with 1;

insert into "public"."user" ("firstname","lastname","created_at","updated_at") VALUES ('Jeff','Cox','2014-01-10 22:17:13','2014-01-10 22:17:13');
insert into "public"."user" ("firstname","lastname","created_at","updated_at") VALUES ('Ann','Hart','2014-01-15 14:57:00','2014-01-15 14:57:00');
insert into "public"."user" ("firstname","lastname","created_at","updated_at") VALUES ('Jack','Dean','2014-01-20 01:12:33','2014-01-20 01:12:33');

insert into "public"."item" ("name","image") VALUES ('coffee','http://i.imgur.com/aRGnsmZ.jpg');
insert into "public"."item" ("name","image") VALUES ('tea','http://i.imgur.com/Q4ifnMA.jpg');
insert into "public"."item" ("name","image") VALUES ('energy','http://i.imgur.com/MmWBoOR.jpg');
insert into "public"."item" ("name") VALUES ('cherries');
insert into "public"."item" ("name") VALUES ('chocolate');

insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (1,3,17.5,'2012-01-01');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (2,1,37.5,'2012-01-12');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (1,2,66.0,'2012-01-15');
insert into "public"."purchase" ("item_id","user_id","cache","date","deleted","deleted_at") VALUES (4,3,15.0,'2012-01-27',true,'2012-03-01 1:15');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (1,2,18.9,'2012-02-07');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (2,1,100, '2012-02-19');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (4,3,20.0,'2012-02-20');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (2,3,50.0,'2012-03-08');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (3,1,18.0,'2012-03-16');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (5,2,9.00,'2012-03-18');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (2,3,3.50,'2012-03-29');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (5,1,19.0,'2012-04-09');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (4,2,22.7,'2012-04-13');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (3,3,44.5,'2012-04-21');
insert into "public"."purchase" ("item_id","user_id","cache","date","deleted","deleted_at") VALUES (1,2,12.6,'2012-04-26',true,'2012-04-28 14:57');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (2,2,16.0,'2012-04-26');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (2,1,40.0,'2012-05-06');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (3,2,16.8,'2012-05-15');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (4,3,9.0, '2012-05-22');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (2,1,40.0,'2012-06-06');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (3,2,16.0,'2012-06-15');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (5,3,19.0,'2012-06-22');
insert into "public"."purchase" ("item_id","user_id","cache","date","deleted","deleted_at") VALUES (3,3,40.0,'2012-06-24',true,'2012-06-27 7:49');
insert into "public"."purchase" ("item_id","user_id","cache","date") VALUES (1,3,70.0,'2012-06-27');


-- Many to Many
truncate table "public"."recipe_type" restart identity cascade;
truncate table "public"."recipe_method" restart identity cascade;
truncate table "public"."recipe" restart identity cascade;
truncate table "public"."recipe_has_recipe_types" restart identity cascade;
truncate table "public"."recipe_has_recipe_methods" restart identity cascade;
alter sequence "public"."recipe_id_seq" restart with 1;
alter sequence "public"."recipe_type_id_seq" restart with 1;
alter sequence "public"."recipe_method_id_seq" restart with 1;

insert into "public"."recipe_type" ("title") VALUES ('type1');
insert into "public"."recipe_type" ("title") VALUES ('type2');
insert into "public"."recipe_type" ("title") VALUES ('type3');
insert into "public"."recipe_type" ("title") VALUES ('type4');
insert into "public"."recipe_type" ("title") VALUES ('type5');

insert into "public"."recipe_method" ("title") VALUES ('method1');
insert into "public"."recipe_method" ("title") VALUES ('method2');
insert into "public"."recipe_method" ("title") VALUES ('method3');
insert into "public"."recipe_method" ("title") VALUES ('method4');
insert into "public"."recipe_method" ("title") VALUES ('method5');

insert into "public"."recipe" ("name") VALUES ('recipe 1');
insert into "public"."recipe" ("name") VALUES ('recipe 2');
insert into "public"."recipe" ("name") VALUES ('recipe 3');
insert into "public"."recipe" ("name") VALUES ('recipe 4');
insert into "public"."recipe" ("name") VALUES ('recipe 5');
insert into "public"."recipe" ("name") VALUES ('recipe 6');
insert into "public"."recipe" ("name") VALUES ('recipe 7');
insert into "public"."recipe" ("name") VALUES ('recipe 8');
insert into "public"."recipe" ("name") VALUES ('recipe 9');

insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (1,2);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (1,4);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (1,5);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (2,3);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (2,2);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (2,1);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (3,1);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (3,2);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (5,4);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (6,5);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (6,2);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (7,4);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (7,1);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (7,3);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (8,2);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (9,2);
insert into "public"."recipe_has_recipe_types" ("recipe_id","recipe_type_id") VALUES (9,4);

insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (1,2);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (1,4);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (2,5);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (4,3);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (5,1);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (5,3);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (5,5);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (6,3);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (6,4);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (7,4);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (8,1);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (8,2);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (8,3);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (9,1);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (9,2);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (9,4);
insert into "public"."recipe_has_recipe_methods" ("recipe_id","recipe_method_id") VALUES (9,5);


-- One to One
truncate table "public"."address" restart identity cascade;
truncate table "public"."phone" restart identity cascade;
alter sequence "public"."address_id_seq" restart with 1;
alter sequence "public"."phone_id_seq" restart with 1;

insert into "public"."address" ("user_id","street") VALUES (1,'South Lake');
insert into "public"."address" ("user_id","street") VALUES (2,'Steep Hill');
insert into "public"."address" ("user_id","street") VALUES (3,'Pine Woods');

insert into "public"."phone" ("user_id","mobile") VALUES (2,'123-555-5555');
insert into "public"."phone" ("user_id","mobile") VALUES (3,'456-555-5555');

-- Many to One
truncate table "public"."car" restart identity cascade;
truncate table "public"."repair" restart identity cascade;
truncate table "public"."driver" restart identity cascade;
alter sequence "public"."car_id_seq" restart with 1;
alter sequence "public"."repair_id_seq" restart with 1;
alter sequence "public"."driver_id_seq" restart with 1;

insert into "public"."car" ("model") VALUES ('Lamborghini Diablo');
insert into "public"."car" ("model") VALUES ('Subaru Impreza');
insert into "public"."car" ("model") VALUES ('Trabant');

insert into "public"."repair" ("car_id","date") VALUES (1,'2013-01-13');
insert into "public"."repair" ("car_id","date") VALUES (1,'2013-04-07');
insert into "public"."repair" ("car_id","date") VALUES (2,'2013-02-15');
insert into "public"."repair" ("car_id","date") VALUES (2,'2013-05-18');
insert into "public"."repair" ("car_id","date") VALUES (3,'2013-03-12');
insert into "public"."repair" ("car_id","date") VALUES (3,'2013-01-02');

insert into "public"."driver" ("car_id","name") VALUES (1,'John');
insert into "public"."driver" ("car_id","name") VALUES (1,'Ross');
insert into "public"."driver" ("car_id","name") VALUES (2,'Ann');
insert into "public"."driver" ("car_id","name") VALUES (2,'Patrick');
insert into "public"."driver" ("car_id","name") VALUES (3,'David');
insert into "public"."driver" ("car_id","name") VALUES (3,'Rossie');

-- Controls
truncate table "public"."controls_mtm_single" restart identity cascade;
truncate table "public"."controls_mtm_multiple" restart identity cascade;

truncate table "public"."controls_has_controls_mtm_single" restart identity cascade;
truncate table "public"."controls_has_controls_mtm_multiple" restart identity cascade;

truncate table "public"."controls" restart identity cascade;

truncate table "public"."controls_otm_single" restart identity cascade;
truncate table "public"."controls_otm_multiple" restart identity cascade;


truncate table "public"."controls_inline_mtm_single" restart identity cascade;
truncate table "public"."controls_inline_mtm_multiple" restart identity cascade;

truncate table "public"."controls_inline_has_controls_inline_mtm_single" restart identity cascade;
truncate table "public"."controls_inline_has_controls_inline_mtm_multiple" restart identity cascade;

truncate table "public"."controls_inline" restart identity cascade;

truncate table "public"."controls_inline_otm_single" restart identity cascade;
truncate table "public"."controls_inline_otm_multiple" restart identity cascade;




alter sequence "public"."controls_otm_single_id_seq" restart with 1;
alter sequence "public"."controls_otm_multiple_id_seq" restart with 1;

alter sequence "public"."controls_id_seq" restart with 1;

alter sequence "public"."controls_mtm_single_id_seq" restart with 1;
alter sequence "public"."controls_mtm_multiple_id_seq" restart with 1;

alter sequence "public"."controls_inline_otm_single_id_seq" restart with 1;
alter sequence "public"."controls_inline_otm_multiple_id_seq" restart with 1;

alter sequence "public"."controls_inline_id_seq" restart with 1;

alter sequence "public"."controls_inline_mtm_single_id_seq" restart with 1;
alter sequence "public"."controls_inline_mtm_multiple_id_seq" restart with 1;

-- otm
insert into "public"."controls_otm_single" ("name") values ('one');
insert into "public"."controls_otm_single" ("name") values ('two');
insert into "public"."controls_otm_single" ("name") values ('three');

insert into "public"."controls_otm_multiple" ("first","last") values ('one','two');
insert into "public"."controls_otm_multiple" ("first") values ('three');
insert into "public"."controls_otm_multiple" ("first","last") values ('four','five');

insert into "public"."controls_inline_otm_single" ("name") values ('one');
insert into "public"."controls_inline_otm_single" ("name") values ('two');
insert into "public"."controls_inline_otm_single" ("name") values ('three');

insert into "public"."controls_inline_otm_multiple" ("first","last") values ('one','two');
insert into "public"."controls_inline_otm_multiple" ("first") values ('three');
insert into "public"."controls_inline_otm_multiple" ("first","last") values ('four','five');
-- mtm
insert into "public"."controls_mtm_single" ("name") values ('one');
insert into "public"."controls_mtm_single" ("name") values ('two');
insert into "public"."controls_mtm_single" ("name") values ('three');

insert into "public"."controls_mtm_multiple" ("first","last") values ('one','two');
insert into "public"."controls_mtm_multiple" ("first") values ('three');
insert into "public"."controls_mtm_multiple" ("first","last") values ('four','five');

insert into "public"."controls_inline_mtm_single" ("name") values ('one');
insert into "public"."controls_inline_mtm_single" ("name") values ('two');
insert into "public"."controls_inline_mtm_single" ("name") values ('three');

insert into "public"."controls_inline_mtm_multiple" ("first","last") values ('one','two');
insert into "public"."controls_inline_mtm_multiple" ("first") values ('three');
insert into "public"."controls_inline_mtm_multiple" ("first","last") values ('four','five');
-- controls
insert into "public"."controls"
	("controls_otm_single_id","controls_otm_multiple_id","static","text","boolean","upload","binary","date","time","datetime","textarea")
	values (1,1,'two','text','1','file','','2013-12-10','20:36','2014-12-10 7:50','text');
insert into "public"."controls"
	("text")
	values ('all other empty');
-- controls inline
insert into "public"."controls_inline"
	("controls_id","controls_inline_otm_single_id","controls_inline_otm_multiple_id","static","text","boolean","bigint","double","upload","binary","date","time","datetime","textarea")
	values (1,2,2,'three','text','1',1000000,15.50,'file','','2013-12-10','20:36','2014-12-10 7:50','text');
insert into "public"."controls_inline"
	("controls_id","controls_inline_otm_single_id","controls_inline_otm_multiple_id","static","text","boolean","bigint","double","upload","binary","date","time","datetime","textarea")
	values (2,3,3,'one','text','0',900,16.67,'file','','2013-12-10','20:36','2014-12-10 7:50','text');
-- link
insert into "public"."controls_has_controls_mtm_single" ("controls_id","controls_mtm_single_id") values (1,1);
insert into "public"."controls_has_controls_mtm_multiple" ("controls_id","controls_mtm_multiple_id") values (1,1);
insert into "public"."controls_has_controls_mtm_multiple" ("controls_id","controls_mtm_multiple_id") values (1,2);
insert into "public"."controls_has_controls_mtm_multiple" ("controls_id","controls_mtm_multiple_id") values (1,3);
insert into "public"."controls_has_controls_mtm_single" ("controls_id","controls_mtm_single_id") values (2,1);
insert into "public"."controls_has_controls_mtm_multiple" ("controls_id","controls_mtm_multiple_id") values (2,1);
insert into "public"."controls_has_controls_mtm_multiple" ("controls_id","controls_mtm_multiple_id") values (2,2);
insert into "public"."controls_has_controls_mtm_multiple" ("controls_id","controls_mtm_multiple_id") values (2,3);
-- link inline
insert into "public"."controls_inline_has_controls_inline_mtm_single" ("controls_inline_id","controls_inline_mtm_single_id") values (1,1);
insert into "public"."controls_inline_has_controls_inline_mtm_multiple" ("controls_inline_id","controls_inline_mtm_multiple_id") values (1,1);
insert into "public"."controls_inline_has_controls_inline_mtm_multiple" ("controls_inline_id","controls_inline_mtm_multiple_id") values (1,2);
insert into "public"."controls_inline_has_controls_inline_mtm_multiple" ("controls_inline_id","controls_inline_mtm_multiple_id") values (1,3);
insert into "public"."controls_inline_has_controls_inline_mtm_single" ("controls_inline_id","controls_inline_mtm_single_id") values (2,1);
insert into "public"."controls_inline_has_controls_inline_mtm_multiple" ("controls_inline_id","controls_inline_mtm_multiple_id") values (2,1);
insert into "public"."controls_inline_has_controls_inline_mtm_multiple" ("controls_inline_id","controls_inline_mtm_multiple_id") values (2,2);
insert into "public"."controls_inline_has_controls_inline_mtm_multiple" ("controls_inline_id","controls_inline_mtm_multiple_id") values (2,3);
-- END Controls
