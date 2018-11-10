-- Comment [ent8]
create table `comentario` (
   `oid`  integer  not null,
   `comment`  longtext,
  primary key (`oid`)
) ENGINE=InnoDB;


-- Model_Comentario [rel1]
alter table `comentario`  add column  `model_oid`  integer;
alter table `comentario`   add index fk_comentario_model (`model_oid`), add constraint fk_comentario_model foreign key (`model_oid`) references `model` (`oid`);


-- User_Comentario [rel2]
alter table `comentario`  add column  `user_oid`  integer;
alter table `comentario`   add index fk_comentario_user (`user_oid`), add constraint fk_comentario_user foreign key (`user_oid`) references `user` (`oid`);


