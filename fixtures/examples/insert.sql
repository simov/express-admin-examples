
SET FOREIGN_KEY_CHECKS=0;

-- One to Many
truncate table `user`;
truncate table `item`;
truncate table `purchase`;

insert into `user` set `firstname` = 'Jeff', `lastname` = 'Cox';
insert into `user` set `firstname` = 'Ann', `lastname` = 'Hart';
insert into `user` set `firstname` = 'Jack', `lastname` = 'Dean';

insert into `item` set `name` = 'coffee', `description` = '', `image` = 'http://i.imgur.com/aRGnsmZ.jpg';
insert into `item` set `name` = 'tea', `description` = '', `image` = 'http://i.imgur.com/Q4ifnMA.jpg';
insert into `item` set `name` = 'energy', `description` = '', `image` = 'http://i.imgur.com/MmWBoOR.jpg';
insert into `item` set `name` = 'cherries', `description` = '';
insert into `item` set `name` = 'chocolate', `description` = '';

insert into `purchase` set `item_id` = 1, `user_id` = 3, `cache` = 17.5, `date` = '2012-01-01';
insert into `purchase` set `item_id` = 2, `user_id` = 1, `cache` = 37.5, `date` = '2012-01-12';
insert into `purchase` set `item_id` = 1, `user_id` = 2, `cache` = 66.0, `date` = '2012-01-15';
insert into `purchase` set `item_id` = 4, `user_id` = 3, `cache` = 15.0, `date` = '2012-01-27';
insert into `purchase` set `item_id` = 1, `user_id` = 2, `cache` = 18.9, `date` = '2012-02-07';
insert into `purchase` set `item_id` = 2, `user_id` = 1, `cache` = 100,  `date` = '2012-02-19';
insert into `purchase` set `item_id` = 4, `user_id` = 3, `cache` = 20.0, `date` = '2012-02-20';
insert into `purchase` set `item_id` = 2, `user_id` = 3, `cache` = 50.0, `date` = '2012-03-08';
insert into `purchase` set `item_id` = 3, `user_id` = 1, `cache` = 18.0, `date` = '2012-03-16';
insert into `purchase` set `item_id` = 5, `user_id` = 2, `cache` = 9.00, `date` = '2012-03-18';
insert into `purchase` set `item_id` = 2, `user_id` = 3, `cache` = 3.50, `date` = '2012-03-29';
insert into `purchase` set `item_id` = 5, `user_id` = 1, `cache` = 19.0, `date` = '2012-04-09';
insert into `purchase` set `item_id` = 4, `user_id` = 2, `cache` = 22.7, `date` = '2012-04-13';
insert into `purchase` set `item_id` = 3, `user_id` = 3, `cache` = 44.5, `date` = '2012-04-21';
insert into `purchase` set `item_id` = 1, `user_id` = 2, `cache` = 12.6, `date` = '2012-04-26';
insert into `purchase` set `item_id` = 2, `user_id` = 2, `cache` = 16.0, `date` = '2012-04-26';
insert into `purchase` set `item_id` = 2, `user_id` = 1, `cache` = 40.0, `date` = '2012-05-06';
insert into `purchase` set `item_id` = 3, `user_id` = 2, `cache` = 16.8, `date` = '2012-05-15';
insert into `purchase` set `item_id` = 4, `user_id` = 3, `cache` = 9.0,  `date` = '2012-05-22';
insert into `purchase` set `item_id` = 2, `user_id` = 1, `cache` = 40.0, `date` = '2012-06-06';
insert into `purchase` set `item_id` = 3, `user_id` = 2, `cache` = 16.0, `date` = '2012-06-15';
insert into `purchase` set `item_id` = 5, `user_id` = 3, `cache` = 19.0, `date` = '2012-06-22';
insert into `purchase` set `item_id` = 3, `user_id` = 3, `cache` = 40.0, `date` = '2012-06-24';
insert into `purchase` set `item_id` = 1, `user_id` = 3, `cache` = 70.0, `date` = '2012-06-27';


-- Many to Many
truncate table `recipe_type`;
truncate table `recipe_method`;
truncate table `recipe`;
truncate table `recipe_has_recipe_types`;
truncate table `recipe_has_recipe_methods`;

insert into `recipe_type` set `title` = 'type1';
insert into `recipe_type` set `title` = 'type2';
insert into `recipe_type` set `title` = 'type3';
insert into `recipe_type` set `title` = 'type4';
insert into `recipe_type` set `title` = 'type5';

insert into `recipe_method` set `title` = 'method1';
insert into `recipe_method` set `title` = 'method2';
insert into `recipe_method` set `title` = 'method3';
insert into `recipe_method` set `title` = 'method4';
insert into `recipe_method` set `title` = 'method5';

insert into `recipe` set `name` = 'recipe 1';
insert into `recipe` set `name` = 'recipe 2';
insert into `recipe` set `name` = 'recipe 3';
insert into `recipe` set `name` = 'recipe 4';
insert into `recipe` set `name` = 'recipe 5';
insert into `recipe` set `name` = 'recipe 6';
insert into `recipe` set `name` = 'recipe 7';
insert into `recipe` set `name` = 'recipe 8';
insert into `recipe` set `name` = 'recipe 9';

insert into `recipe_has_recipe_types` set `recipe_id` = 1, `recipe_type_id` = 2;
insert into `recipe_has_recipe_types` set `recipe_id` = 1, `recipe_type_id` = 4;
insert into `recipe_has_recipe_types` set `recipe_id` = 1, `recipe_type_id` = 5;
insert into `recipe_has_recipe_types` set `recipe_id` = 2, `recipe_type_id` = 3;
insert into `recipe_has_recipe_types` set `recipe_id` = 2, `recipe_type_id` = 2;
insert into `recipe_has_recipe_types` set `recipe_id` = 2, `recipe_type_id` = 1;
insert into `recipe_has_recipe_types` set `recipe_id` = 3, `recipe_type_id` = 1;
insert into `recipe_has_recipe_types` set `recipe_id` = 3, `recipe_type_id` = 2;
insert into `recipe_has_recipe_types` set `recipe_id` = 5, `recipe_type_id` = 4;
insert into `recipe_has_recipe_types` set `recipe_id` = 6, `recipe_type_id` = 5;
insert into `recipe_has_recipe_types` set `recipe_id` = 6, `recipe_type_id` = 2;
insert into `recipe_has_recipe_types` set `recipe_id` = 7, `recipe_type_id` = 4;
insert into `recipe_has_recipe_types` set `recipe_id` = 7, `recipe_type_id` = 1;
insert into `recipe_has_recipe_types` set `recipe_id` = 7, `recipe_type_id` = 3;
insert into `recipe_has_recipe_types` set `recipe_id` = 8, `recipe_type_id` = 2;
insert into `recipe_has_recipe_types` set `recipe_id` = 9, `recipe_type_id` = 2;
insert into `recipe_has_recipe_types` set `recipe_id` = 9, `recipe_type_id` = 4;

insert into `recipe_has_recipe_methods` set `recipe_id` = 1, `recipe_method_id` = 2;
insert into `recipe_has_recipe_methods` set `recipe_id` = 1, `recipe_method_id` = 4;
insert into `recipe_has_recipe_methods` set `recipe_id` = 2, `recipe_method_id` = 5;
insert into `recipe_has_recipe_methods` set `recipe_id` = 4, `recipe_method_id` = 3;
insert into `recipe_has_recipe_methods` set `recipe_id` = 5, `recipe_method_id` = 1;
insert into `recipe_has_recipe_methods` set `recipe_id` = 5, `recipe_method_id` = 3;
insert into `recipe_has_recipe_methods` set `recipe_id` = 5, `recipe_method_id` = 5;
insert into `recipe_has_recipe_methods` set `recipe_id` = 6, `recipe_method_id` = 3;
insert into `recipe_has_recipe_methods` set `recipe_id` = 6, `recipe_method_id` = 4;
insert into `recipe_has_recipe_methods` set `recipe_id` = 7, `recipe_method_id` = 4;
insert into `recipe_has_recipe_methods` set `recipe_id` = 8, `recipe_method_id` = 1;
insert into `recipe_has_recipe_methods` set `recipe_id` = 8, `recipe_method_id` = 2;
insert into `recipe_has_recipe_methods` set `recipe_id` = 8, `recipe_method_id` = 3;
insert into `recipe_has_recipe_methods` set `recipe_id` = 9, `recipe_method_id` = 1;
insert into `recipe_has_recipe_methods` set `recipe_id` = 9, `recipe_method_id` = 2;
insert into `recipe_has_recipe_methods` set `recipe_id` = 9, `recipe_method_id` = 4;
insert into `recipe_has_recipe_methods` set `recipe_id` = 9, `recipe_method_id` = 5;


-- One to One
truncate table `address`;
truncate table `phone`;

insert into `address` set `user_id` = 1, `street` = 'South Lake';
insert into `address` set `user_id` = 2, `street` = 'Steep Hill';
insert into `address` set `user_id` = 3, `street` = 'Pine Woods';

insert into `phone` set `user_id` = 2, `mobile` = '123-555-5555';
insert into `phone` set `user_id` = 3, `mobile` = '456-555-5555';

-- Many to One
truncate table `car`;
truncate table `repair`;
truncate table `driver`;

insert into `car` set `model` = 'Lamborghini Diablo';
insert into `car` set `model` = 'Subaru Impreza';
insert into `car` set `model` = 'Trabant';

insert into `repair` set `car_id` = 1, `date` = '2013-01-13';
insert into `repair` set `car_id` = 1, `date` = '2013-04-07';
insert into `repair` set `car_id` = 2, `date` = '2013-02-15';
insert into `repair` set `car_id` = 2, `date` = '2013-05-18';
insert into `repair` set `car_id` = 3, `date` = '2013-03-12';
insert into `repair` set `car_id` = 3, `date` = '2013-01-02';

insert into `driver` set `car_id` = 1, `name` = 'John';
insert into `driver` set `car_id` = 1, `name` = 'Ross';
insert into `driver` set `car_id` = 2, `name` = 'Ann';
insert into `driver` set `car_id` = 2, `name` = 'Patrick';
insert into `driver` set `car_id` = 3, `name` = 'David';
insert into `driver` set `car_id` = 3, `name` = 'Rossie';

-- Controls
truncate table `controls_mtm_single`;
truncate table `controls_mtm_multiple`;
truncate table `controls_has_controls_mtm_single`;
truncate table `controls_has_controls_mtm_multiple`;
truncate table `controls`;
truncate table `controls_otm_single`;
truncate table `controls_otm_multiple`;
truncate table `controls_inline_otm_single`;
truncate table `controls_inline_otm_multiple`;
-- otm
insert into `controls_otm_single` (`name`) values ('one');
insert into `controls_otm_single` (`name`) values ('two');
insert into `controls_otm_single` (`name`) values ('three');

insert into `controls_otm_multiple` (`first`,`last`) values ('one','two');
insert into `controls_otm_multiple` (`first`) values ('three');
insert into `controls_otm_multiple` (`first`,`last`) values ('four','five');

insert into `controls_inline_otm_single` (`name`) values ('one');
insert into `controls_inline_otm_single` (`name`) values ('two');
insert into `controls_inline_otm_single` (`name`) values ('three');

insert into `controls_inline_otm_multiple` (`first`,`last`) values ('one','two');
insert into `controls_inline_otm_multiple` (`first`) values ('three');
insert into `controls_inline_otm_multiple` (`first`,`last`) values ('four','five');
-- mtm
insert into `controls_mtm_single` (`name`) values ('one');
insert into `controls_mtm_single` (`name`) values ('two');
insert into `controls_mtm_single` (`name`) values ('three');

insert into `controls_mtm_multiple` (`first`,`last`) values ('one','two');
insert into `controls_mtm_multiple` (`first`) values ('three');
insert into `controls_mtm_multiple` (`first`,`last`) values ('four','five');

insert into `controls_inline_mtm_single` (`name`) values ('one');
insert into `controls_inline_mtm_single` (`name`) values ('two');
insert into `controls_inline_mtm_single` (`name`) values ('three');

insert into `controls_inline_mtm_multiple` (`first`,`last`) values ('one','two');
insert into `controls_inline_mtm_multiple` (`first`) values ('three');
insert into `controls_inline_mtm_multiple` (`first`,`last`) values ('four','five');
-- controls
insert into `controls`
	(`controls_otm_single_id`,`controls_otm_multiple_id`,`static`,`text`,`boolean`,`upload`,`date`,`time`,`datetime`,`year`,`textarea`)
	values (1,1,'two','text',1,'file','2013-12-10','20:36','2014-12-10 7:50','2015','text');
insert into `controls`
	(`text`)
	values ('all other empty');
-- controls inline
insert into `controls_inline`
	(`controls_id`,`controls_inline_otm_single_id`,`controls_inline_otm_multiple_id`,`static`,`text`,`boolean`,`upload`,`date`,`time`,`datetime`,`year`,`textarea`)
	values (1,2,2,'three','text',1,'file','2013-12-10','20:36','2014-12-10 7:50','2015','text');
insert into `controls_inline`
	(`controls_id`,`controls_inline_otm_single_id`,`controls_inline_otm_multiple_id`,`static`,`text`,`boolean`,`upload`,`date`,`time`,`datetime`,`year`,`textarea`)
	values (2,3,3,'one','text',0,'file','2013-12-10','20:36','2014-12-10 7:50','2015','text');
-- link
insert into `controls_has_controls_mtm_single` (`controls_id`,`controls_mtm_single_id`) values (1,1);
insert into `controls_has_controls_mtm_multiple` (`controls_id`,`controls_mtm_multiple_id`) values (1,1);
insert into `controls_has_controls_mtm_multiple` (`controls_id`,`controls_mtm_multiple_id`) values (1,2);
insert into `controls_has_controls_mtm_multiple` (`controls_id`,`controls_mtm_multiple_id`) values (1,3);
insert into `controls_has_controls_mtm_single` (`controls_id`,`controls_mtm_single_id`) values (2,1);
insert into `controls_has_controls_mtm_multiple` (`controls_id`,`controls_mtm_multiple_id`) values (2,1);
insert into `controls_has_controls_mtm_multiple` (`controls_id`,`controls_mtm_multiple_id`) values (2,2);
insert into `controls_has_controls_mtm_multiple` (`controls_id`,`controls_mtm_multiple_id`) values (2,3);
-- link inline
insert into `controls_inline_has_controls_inline_mtm_single` (`controls_inline_id`,`controls_inline_mtm_single_id`) values (1,1);
insert into `controls_inline_has_controls_inline_mtm_multiple` (`controls_inline_id`,`controls_inline_mtm_multiple_id`) values (1,1);
insert into `controls_inline_has_controls_inline_mtm_multiple` (`controls_inline_id`,`controls_inline_mtm_multiple_id`) values (1,2);
insert into `controls_inline_has_controls_inline_mtm_multiple` (`controls_inline_id`,`controls_inline_mtm_multiple_id`) values (1,3);
insert into `controls_inline_has_controls_inline_mtm_single` (`controls_inline_id`,`controls_inline_mtm_single_id`) values (2,1);
insert into `controls_inline_has_controls_inline_mtm_multiple` (`controls_inline_id`,`controls_inline_mtm_multiple_id`) values (2,1);
insert into `controls_inline_has_controls_inline_mtm_multiple` (`controls_inline_id`,`controls_inline_mtm_multiple_id`) values (2,2);
insert into `controls_inline_has_controls_inline_mtm_multiple` (`controls_inline_id`,`controls_inline_mtm_multiple_id`) values (2,3);
-- END Controls

SET FOREIGN_KEY_CHECKS=1;
