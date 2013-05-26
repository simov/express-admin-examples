
truncate table `inline_one1_has_inline_one1_group1`;
truncate table `inline_one1_has_inline_one1_group2`;
truncate table `inline_one1`;
truncate table `inline_one1_choice1`;
truncate table `inline_one1_choice2`;
truncate table `inline_one1_group1`;
truncate table `inline_one1_group2`;

truncate table `inline_one2_has_inline_one2_group1`;
truncate table `inline_one2_has_inline_one2_group2`;
truncate table `inline_one2`;
truncate table `inline_one2_choice1`;
truncate table `inline_one2_choice2`;
truncate table `inline_one2_group1`;
truncate table `inline_one2_group2`;

truncate table `inline_many1_has_inline_many1_group1`;
truncate table `inline_many1_has_inline_many1_group2`;
truncate table `inline_many1`;
truncate table `inline_many1_choice1`;
truncate table `inline_many1_choice2`;
truncate table `inline_many1_group1`;
truncate table `inline_many1_group2`;

truncate table `inline_many2_has_inline_many2_group1`;
truncate table `inline_many2_has_inline_many2_group2`;
truncate table `inline_many2`;
truncate table `inline_many2_choice1`;
truncate table `inline_many2_choice2`;
truncate table `inline_many2_group1`;
truncate table `inline_many2_group2`;

truncate table `item_has_item_group1`;
truncate table `item_has_item_group2`;
truncate table `item`;
truncate table `item_choice1`;
truncate table `item_choice2`;
truncate table `item_group1`;
truncate table `item_group2`;

-- ITEM

insert into `item_choice1` () VALUES ();
insert into `item_choice1` () VALUES ();
insert into `item_choice1` () VALUES ();

insert into `item_choice2` () VALUES ();
insert into `item_choice2` () VALUES ();
insert into `item_choice2` () VALUES ();

insert into `item_group1` () VALUES ();
insert into `item_group1` () VALUES ();
insert into `item_group1` () VALUES ();

insert into `item_group2` () VALUES ();
insert into `item_group2` () VALUES ();
insert into `item_group2` () VALUES ();

insert into `item` (item_choice1_id, item_choice2_id) VALUES (1,2);
insert into `item` (item_choice1_id, item_choice2_id) VALUES (3,3);
insert into `item` (item_choice1_id, item_choice2_id) VALUES (2,3);
insert into `item` (item_choice1_id, item_choice2_id) VALUES (2,1);
insert into `item` (item_choice1_id, item_choice2_id) VALUES (2,2);

insert into `item_has_item_group1` (item_id, item_group1_id) VALUES (1,1);
insert into `item_has_item_group1` (item_id, item_group1_id) VALUES (2,1);
insert into `item_has_item_group1` (item_id, item_group1_id) VALUES (2,2);
insert into `item_has_item_group1` (item_id, item_group1_id) VALUES (2,3);
insert into `item_has_item_group1` (item_id, item_group1_id) VALUES (3,2);

insert into `item_has_item_group2` (item_id, item_group2_id) VALUES (1,2);
insert into `item_has_item_group2` (item_id, item_group2_id) VALUES (1,3);
insert into `item_has_item_group2` (item_id, item_group2_id) VALUES (2,1);
insert into `item_has_item_group2` (item_id, item_group2_id) VALUES (3,1);
insert into `item_has_item_group2` (item_id, item_group2_id) VALUES (3,2);


-- INLINE_ONE1

insert into `inline_one1_choice1` () VALUES ();
insert into `inline_one1_choice1` () VALUES ();
insert into `inline_one1_choice1` () VALUES ();

insert into `inline_one1_choice2` () VALUES ();
insert into `inline_one1_choice2` () VALUES ();
insert into `inline_one1_choice2` () VALUES ();

insert into `inline_one1_group1` () VALUES ();
insert into `inline_one1_group1` () VALUES ();
insert into `inline_one1_group1` () VALUES ();

insert into `inline_one1_group2` () VALUES ();
insert into `inline_one1_group2` () VALUES ();
insert into `inline_one1_group2` () VALUES ();

insert into `inline_one1` (item_id, inline_one1_choice1_id, inline_one1_choice2_id) VALUES (1,1,2);
insert into `inline_one1` (item_id, inline_one1_choice1_id, inline_one1_choice2_id) VALUES (3,3,1);
insert into `inline_one1` (item_id, inline_one1_choice1_id, inline_one1_choice2_id) VALUES (4,2,2);
insert into `inline_one1` (item_id, inline_one1_choice1_id, inline_one1_choice2_id) VALUES (5,3,2);

insert into `inline_one1_has_inline_one1_group1` (inline_one1_id, inline_one1_group1_id) VALUES (1,1);
insert into `inline_one1_has_inline_one1_group1` (inline_one1_id, inline_one1_group1_id) VALUES (2,1);
insert into `inline_one1_has_inline_one1_group1` (inline_one1_id, inline_one1_group1_id) VALUES (2,2);
insert into `inline_one1_has_inline_one1_group1` (inline_one1_id, inline_one1_group1_id) VALUES (2,3);
insert into `inline_one1_has_inline_one1_group1` (inline_one1_id, inline_one1_group1_id) VALUES (3,2);

insert into `inline_one1_has_inline_one1_group2` (inline_one1_id, inline_one1_group2_id) VALUES (1,2);
insert into `inline_one1_has_inline_one1_group2` (inline_one1_id, inline_one1_group2_id) VALUES (1,3);
insert into `inline_one1_has_inline_one1_group2` (inline_one1_id, inline_one1_group2_id) VALUES (2,1);
insert into `inline_one1_has_inline_one1_group2` (inline_one1_id, inline_one1_group2_id) VALUES (3,1);
insert into `inline_one1_has_inline_one1_group2` (inline_one1_id, inline_one1_group2_id) VALUES (3,2);


-- INLINE_ONE2

insert into `inline_one2_choice1` () VALUES ();
insert into `inline_one2_choice1` () VALUES ();
insert into `inline_one2_choice1` () VALUES ();

insert into `inline_one2_choice2` () VALUES ();
insert into `inline_one2_choice2` () VALUES ();
insert into `inline_one2_choice2` () VALUES ();

insert into `inline_one2_group1` () VALUES ();
insert into `inline_one2_group1` () VALUES ();
insert into `inline_one2_group1` () VALUES ();

insert into `inline_one2_group2` () VALUES ();
insert into `inline_one2_group2` () VALUES ();
insert into `inline_one2_group2` () VALUES ();

insert into `inline_one2` (item_id, inline_one2_choice1_id, inline_one2_choice2_id) VALUES (1,1,2);
insert into `inline_one2` (item_id, inline_one2_choice1_id, inline_one2_choice2_id) VALUES (3,3,1);
insert into `inline_one2` (item_id, inline_one2_choice1_id, inline_one2_choice2_id) VALUES (4,2,2);
insert into `inline_one2` (item_id, inline_one2_choice1_id, inline_one2_choice2_id) VALUES (5,3,2);

insert into `inline_one2_has_inline_one2_group1` (inline_one2_id, inline_one2_group1_id) VALUES (1,1);
insert into `inline_one2_has_inline_one2_group1` (inline_one2_id, inline_one2_group1_id) VALUES (2,1);
insert into `inline_one2_has_inline_one2_group1` (inline_one2_id, inline_one2_group1_id) VALUES (2,2);
insert into `inline_one2_has_inline_one2_group1` (inline_one2_id, inline_one2_group1_id) VALUES (2,3);
insert into `inline_one2_has_inline_one2_group1` (inline_one2_id, inline_one2_group1_id) VALUES (3,2);

insert into `inline_one2_has_inline_one2_group2` (inline_one2_id, inline_one2_group2_id) VALUES (1,2);
insert into `inline_one2_has_inline_one2_group2` (inline_one2_id, inline_one2_group2_id) VALUES (1,3);
insert into `inline_one2_has_inline_one2_group2` (inline_one2_id, inline_one2_group2_id) VALUES (2,1);
insert into `inline_one2_has_inline_one2_group2` (inline_one2_id, inline_one2_group2_id) VALUES (3,1);
insert into `inline_one2_has_inline_one2_group2` (inline_one2_id, inline_one2_group2_id) VALUES (3,2);


-- INLINE_MANY1

insert into `inline_many1_choice1` () VALUES ();
insert into `inline_many1_choice1` () VALUES ();
insert into `inline_many1_choice1` () VALUES ();

insert into `inline_many1_choice2` () VALUES ();
insert into `inline_many1_choice2` () VALUES ();
insert into `inline_many1_choice2` () VALUES ();

insert into `inline_many1_group1` () VALUES ();
insert into `inline_many1_group1` () VALUES ();
insert into `inline_many1_group1` () VALUES ();

insert into `inline_many1_group2` () VALUES ();
insert into `inline_many1_group2` () VALUES ();
insert into `inline_many1_group2` () VALUES ();

insert into `inline_many1` (item_id, inline_many1_choice1_id, inline_many1_choice2_id) VALUES (1,1,2);
insert into `inline_many1` (item_id, inline_many1_choice1_id, inline_many1_choice2_id) VALUES (1,1,2);
insert into `inline_many1` (item_id, inline_many1_choice1_id, inline_many1_choice2_id) VALUES (3,1,2);
insert into `inline_many1` (item_id, inline_many1_choice1_id, inline_many1_choice2_id) VALUES (3,3,1);
insert into `inline_many1` (item_id, inline_many1_choice1_id, inline_many1_choice2_id) VALUES (4,2,2);
insert into `inline_many1` (item_id, inline_many1_choice1_id, inline_many1_choice2_id) VALUES (4,3,3);
insert into `inline_many1` (item_id, inline_many1_choice1_id, inline_many1_choice2_id) VALUES (5,3,1);
insert into `inline_many1` (item_id, inline_many1_choice1_id, inline_many1_choice2_id) VALUES (5,2,2);

insert into `inline_many1_has_inline_many1_group1` (inline_many1_id, inline_many1_group1_id) VALUES (1,1);
insert into `inline_many1_has_inline_many1_group1` (inline_many1_id, inline_many1_group1_id) VALUES (2,1);
insert into `inline_many1_has_inline_many1_group1` (inline_many1_id, inline_many1_group1_id) VALUES (3,1);
insert into `inline_many1_has_inline_many1_group1` (inline_many1_id, inline_many1_group1_id) VALUES (3,2);
insert into `inline_many1_has_inline_many1_group1` (inline_many1_id, inline_many1_group1_id) VALUES (3,3);
insert into `inline_many1_has_inline_many1_group1` (inline_many1_id, inline_many1_group1_id) VALUES (4,2);

insert into `inline_many1_has_inline_many1_group2` (inline_many1_id, inline_many1_group2_id) VALUES (1,2);
insert into `inline_many1_has_inline_many1_group2` (inline_many1_id, inline_many1_group2_id) VALUES (1,3);
insert into `inline_many1_has_inline_many1_group2` (inline_many1_id, inline_many1_group2_id) VALUES (2,2);
insert into `inline_many1_has_inline_many1_group2` (inline_many1_id, inline_many1_group2_id) VALUES (2,3);
insert into `inline_many1_has_inline_many1_group2` (inline_many1_id, inline_many1_group2_id) VALUES (3,1);
insert into `inline_many1_has_inline_many1_group2` (inline_many1_id, inline_many1_group2_id) VALUES (4,1);
insert into `inline_many1_has_inline_many1_group2` (inline_many1_id, inline_many1_group2_id) VALUES (4,2);


-- INLINE_MANY2

insert into `inline_many2_choice1` () VALUES ();
insert into `inline_many2_choice1` () VALUES ();
insert into `inline_many2_choice1` () VALUES ();

insert into `inline_many2_choice2` () VALUES ();
insert into `inline_many2_choice2` () VALUES ();
insert into `inline_many2_choice2` () VALUES ();

insert into `inline_many2_group1` () VALUES ();
insert into `inline_many2_group1` () VALUES ();
insert into `inline_many2_group1` () VALUES ();

insert into `inline_many2_group2` () VALUES ();
insert into `inline_many2_group2` () VALUES ();
insert into `inline_many2_group2` () VALUES ();

insert into `inline_many2` (item_id, inline_many2_choice1_id, inline_many2_choice2_id) VALUES (1,1,2);
insert into `inline_many2` (item_id, inline_many2_choice1_id, inline_many2_choice2_id) VALUES (1,1,2);
insert into `inline_many2` (item_id, inline_many2_choice1_id, inline_many2_choice2_id) VALUES (3,1,2);
insert into `inline_many2` (item_id, inline_many2_choice1_id, inline_many2_choice2_id) VALUES (3,3,1);
insert into `inline_many2` (item_id, inline_many2_choice1_id, inline_many2_choice2_id) VALUES (4,2,2);
insert into `inline_many2` (item_id, inline_many2_choice1_id, inline_many2_choice2_id) VALUES (4,3,3);
insert into `inline_many2` (item_id, inline_many2_choice1_id, inline_many2_choice2_id) VALUES (5,3,1);
insert into `inline_many2` (item_id, inline_many2_choice1_id, inline_many2_choice2_id) VALUES (5,2,2);

insert into `inline_many2_has_inline_many2_group1` (inline_many2_id, inline_many2_group1_id) VALUES (1,1);
insert into `inline_many2_has_inline_many2_group1` (inline_many2_id, inline_many2_group1_id) VALUES (2,1);
insert into `inline_many2_has_inline_many2_group1` (inline_many2_id, inline_many2_group1_id) VALUES (3,1);
insert into `inline_many2_has_inline_many2_group1` (inline_many2_id, inline_many2_group1_id) VALUES (3,2);
insert into `inline_many2_has_inline_many2_group1` (inline_many2_id, inline_many2_group1_id) VALUES (3,3);
insert into `inline_many2_has_inline_many2_group1` (inline_many2_id, inline_many2_group1_id) VALUES (4,2);

insert into `inline_many2_has_inline_many2_group2` (inline_many2_id, inline_many2_group2_id) VALUES (1,2);
insert into `inline_many2_has_inline_many2_group2` (inline_many2_id, inline_many2_group2_id) VALUES (1,3);
insert into `inline_many2_has_inline_many2_group2` (inline_many2_id, inline_many2_group2_id) VALUES (2,2);
insert into `inline_many2_has_inline_many2_group2` (inline_many2_id, inline_many2_group2_id) VALUES (2,3);
insert into `inline_many2_has_inline_many2_group2` (inline_many2_id, inline_many2_group2_id) VALUES (3,1);
insert into `inline_many2_has_inline_many2_group2` (inline_many2_id, inline_many2_group2_id) VALUES (4,1);
insert into `inline_many2_has_inline_many2_group2` (inline_many2_id, inline_many2_group2_id) VALUES (4,2);
