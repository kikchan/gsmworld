-- User_Model [rel1]
alter table `model`  add column  `user_oid`  integer;
alter table `model`   add index fk_model_user (`user_oid`), add constraint fk_model_user foreign key (`user_oid`) references `user` (`oid`);


