-- Rating [ent8]
create table `rating` (
   `oid`  integer  not null,
   `rating`  double precision,
  primary key (`oid`)
) ENGINE=InnoDB;


-- Model_Rating [rel10]
alter table `rating`  add column  `model_oid`  integer;
alter table `rating`   add index fk_rating_model (`model_oid`), add constraint fk_rating_model foreign key (`model_oid`) references `model` (`oid`);


-- User_Rating [rel4]
alter table `rating`  add column  `user_oid`  integer;
alter table `rating`   add index fk_rating_user (`user_oid`), add constraint fk_rating_user foreign key (`user_oid`) references `user` (`oid`);


