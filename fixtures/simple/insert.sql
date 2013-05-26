
truncate table `purchase`;
truncate table `user`;
truncate table `property`;
truncate table `type`;
truncate table `subtype`;
truncate table `recipe_ref`;
truncate table `recipe`;
truncate table `recipe_type`;
truncate table `item`;

insert into `user` set `firstname` = 'joro', `lastname` = 'b';
insert into `user` set `firstname` = 'guess', `lastname` = 'who';
insert into `user` set `firstname` = 'simo', `lastname` = 'cool';

insert into `item` set `name` = 'coffee', `notes` = '';
insert into `item` set `name` = 'tea', `notes` = '';
insert into `item` set `name` = 'energy', `notes` = '';
insert into `item` set `name` = 'cherries', `notes` = '';
insert into `item` set `name` = 'chocolate', `notes` = '';

insert into `property` set `item_id` = 1, `name` = 'caffeine';
insert into `property` set `item_id` = 2, `name` = 'hot';
insert into `property` set `item_id` = 3, `name` = 'stimulant';

insert into `subtype` set `name` = 'sub1';
insert into `subtype` set `name` = 'sub2';
insert into `subtype` set `name` = 'sub3';
insert into `subtype` set `name` = 'sub4';
insert into `subtype` set `name` = 'sub5';

insert into `type` set `item_id` = 1, `subtype_id` = 2, `name` = 'Espresso';
insert into `type` set `item_id` = 1, `subtype_id` = 4, `name` = 'Cappuccino';
insert into `type` set `item_id` = 1, `subtype_id` = 5, `name` = 'Caffe Latte';
insert into `type` set `item_id` = 2, `subtype_id` = 2, `name` = 'Earl Grey';
insert into `type` set `item_id` = 2, `subtype_id` = 3, `name` = 'Darjeeling';
insert into `type` set `item_id` = 3, `subtype_id` = 1, `name` = 'Red Bull';
insert into `type` set `item_id` = 3, `subtype_id` = 3, `name` = 'Monster';
insert into `type` set `item_id` = 4, `subtype_id` = 4, `name` = 'Bigaro Byurla';
insert into `type` set `item_id` = 5, `subtype_id` = 5, `name` = 'Milka';

insert into `recipe_type` set `name` = 'type1', `notes` = '';
insert into `recipe_type` set `name` = 'type2', `notes` = '';
insert into `recipe_type` set `name` = 'type3', `notes` = '';
insert into `recipe_type` set `name` = 'type4', `notes` = '';
insert into `recipe_type` set `name` = 'type5', `notes` = '';

insert into `recipe` set `item_id` = 1, `name` = 'recipe 1';
insert into `recipe` set `item_id` = 1, `name` = 'recipe 2';
insert into `recipe` set `item_id` = 1, `name` = 'recipe 3';
insert into `recipe` set `item_id` = 2, `name` = 'recipe 4';
insert into `recipe` set `item_id` = 2, `name` = 'recipe 5';
insert into `recipe` set `item_id` = 3, `name` = 'recipe 6';
insert into `recipe` set `item_id` = 3, `name` = 'recipe 7';
insert into `recipe` set `item_id` = 4, `name` = 'recipe 8';
insert into `recipe` set `item_id` = 5, `name` = 'recipe 9';

insert into `recipe_ref` set `recipe_id` = 1, `recipe_type_id` = 2;
insert into `recipe_ref` set `recipe_id` = 1, `recipe_type_id` = 4;
insert into `recipe_ref` set `recipe_id` = 1, `recipe_type_id` = 5;
insert into `recipe_ref` set `recipe_id` = 2, `recipe_type_id` = 3;
insert into `recipe_ref` set `recipe_id` = 2, `recipe_type_id` = 2;
insert into `recipe_ref` set `recipe_id` = 2, `recipe_type_id` = 1;
insert into `recipe_ref` set `recipe_id` = 3, `recipe_type_id` = 1;
insert into `recipe_ref` set `recipe_id` = 3, `recipe_type_id` = 2;
insert into `recipe_ref` set `recipe_id` = 5, `recipe_type_id` = 4;
insert into `recipe_ref` set `recipe_id` = 6, `recipe_type_id` = 5;
insert into `recipe_ref` set `recipe_id` = 6, `recipe_type_id` = 2;
insert into `recipe_ref` set `recipe_id` = 7, `recipe_type_id` = 4;
insert into `recipe_ref` set `recipe_id` = 7, `recipe_type_id` = 1;
insert into `recipe_ref` set `recipe_id` = 7, `recipe_type_id` = 3;
insert into `recipe_ref` set `recipe_id` = 8, `recipe_type_id` = 2;
insert into `recipe_ref` set `recipe_id` = 9, `recipe_type_id` = 2;
insert into `recipe_ref` set `recipe_id` = 9, `recipe_type_id` = 4;

insert into `purchase` set `item_id` = 1, `user_id` = 3, `cache` = 17.5, `date` = '2012-01-27';
insert into `purchase` set `item_id` = 3, `user_id` = 2, `cache` = 18.99, `date` = '2012-05-23';
insert into `purchase` set `item_id` = 5, `user_id` = 1, `cache` = 5.4, `date` = '2012-07-06';
insert into `purchase` set `item_id` = 4, `user_id` = 2, `cache` = 20, `date` = '2012-03-09';
insert into `purchase` set `item_id` = 2, `user_id` = 3, `cache` = 50, `date` = '2012-12-29';
insert into `purchase` set `item_id` = 1, `user_id` = 1, `cache` = 18, `date` = '2012-11-16';
insert into `purchase` set `item_id` = 3, `user_id` = 2, `cache` = 9, `date` = '2012-09-18';
insert into `purchase` set `item_id` = 4, `user_id` = 3, `cache` = 3.5, `date` = '2012-08-03';
insert into `purchase` set `item_id` = 5, `user_id` = 1, `cache` = 19, `date` = '2012-10-09';
insert into `purchase` set `item_id` = 4, `user_id` = 2, `cache` = 2, `date` = '2012-05-13';
insert into `purchase` set `item_id` = 3, `user_id` = 3, `cache` = 1, `date` = '2012-09-21';
insert into `purchase` set `item_id` = 1, `user_id` = 2, `cache` = 12.6, `date` = '2012-12-26';
insert into `purchase` set `item_id` = 2, `user_id` = 1, `cache` = 40, `date` = '2012-11-18';
insert into `purchase` set `item_id` = 3, `user_id` = 2, `cache` = 16, `date` = '2012-04-15';
insert into `purchase` set `item_id` = 4, `user_id` = 3, `cache` = 9, `date` = '2012-11-06';
