-- Model [ent2]
alter table `model`  add column  `cpu`  varchar(255);


-- Model_Color [rel2]
create table `model_color` (
   `model_oid`  integer not null,
   `color_oid`  integer not null,
  primary key (`model_oid`, `color_oid`)
) ENGINE=InnoDB;
alter table `model_color`   add index fk_model_color_model (`model_oid`), add constraint fk_model_color_model foreign key (`model_oid`) references `model` (`oid`);
alter table `model_color`   add index fk_model_color_color (`color_oid`), add constraint fk_model_color_color foreign key (`color_oid`) references `color` (`oid`);


-- Screen_Model [rel3]
alter table `model`  add column  `screen_oid`  integer;
alter table `model`   add index fk_model_screen (`screen_oid`), add constraint fk_model_screen foreign key (`screen_oid`) references `screen` (`oid`);


