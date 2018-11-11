-- Comment [ent9]
create table `comment` (
   `oid`  integer  not null,
   `comment`  longtext,
  primary key (`oid`)
) ENGINE=InnoDB;


-- Model_Comentario [rel1]
alter table `comment`  add column  `model_oid`  integer;
alter table `comment`   add index fk_comment_model (`model_oid`), add constraint fk_comment_model foreign key (`model_oid`) references `model` (`oid`);


-- User_Comentario [rel2]
alter table `comment`  add column  `user_oid`  integer;
alter table `comment`   add index fk_comment_user (`user_oid`), add constraint fk_comment_user foreign key (`user_oid`) references `user` (`oid`);


