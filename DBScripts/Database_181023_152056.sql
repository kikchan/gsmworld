-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Maker [ent1]
create table `maker` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `origin`  varchar(255),
   `created`  integer,
   `makerurl`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Model [ent2]
create table `model` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `price`  varchar(255),
   `relase_date`  varchar(255),
   `size`  varchar(255),
   `ram`  varchar(255),
   `rom`  varchar(255),
   `conectivity`  varchar(255),
   `weight`  varchar(255),
   `sim`  varchar(255),
   `os`  varchar(255),
   `main_camera`  varchar(255),
   `secondary_camera`  varchar(255),
   `sensors`  varchar(255),
   `features`  varchar(255),
   `battery`  varchar(255),
   `imgurl`  varchar(255),
   `cardslot`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Color [ent3]
create table `color` (
   `oid`  integer  not null,
   `name`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Size [ent4]
create table `size` (
   `oid`  integer  not null,
   `width`  integer,
   `height`  integer,
   `depth`  integer,
  primary key (`oid`)
) ENGINE=InnoDB;


-- CPU [ent5]
create table `cpu` (
   `oid`  integer  not null,
   `maker`  varchar(255),
   `model`  varchar(255),
   `cores`  integer,
   `lithography`  integer,
   `frequency`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Resolution [ent6]
create table `resolution` (
   `oid`  integer  not null,
   `width`  integer,
   `height`  integer,
  primary key (`oid`)
) ENGINE=InnoDB;


-- Screen [ent7]
create table `screen` (
   `oid`  integer  not null,
   `size`  double precision,
   `ppi`  integer,
   `protection`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
) ENGINE=InnoDB;
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
) ENGINE=InnoDB;
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- Maker_Model [rel1]
alter table `model`  add column  `maker_oid`  integer;
alter table `model`   add index fk_model_maker (`maker_oid`), add constraint fk_model_maker foreign key (`maker_oid`) references `maker` (`oid`);


-- Model_Color [rel2]
create table `model_color` (
   `model_oid`  integer not null,
   `color_oid`  integer not null,
  primary key (`model_oid`, `color_oid`)
) ENGINE=InnoDB;
alter table `model_color`   add index fk_model_color_model (`model_oid`), add constraint fk_model_color_model foreign key (`model_oid`) references `model` (`oid`);
alter table `model_color`   add index fk_model_color_color (`color_oid`), add constraint fk_model_color_color foreign key (`color_oid`) references `color` (`oid`);


-- Model_Size [rel3]
create table `model_size` (
   `model_oid`  integer not null,
   `size_oid`  integer not null,
  primary key (`model_oid`, `size_oid`)
) ENGINE=InnoDB;
alter table `model_size`   add index fk_model_size_model (`model_oid`), add constraint fk_model_size_model foreign key (`model_oid`) references `model` (`oid`);
alter table `model_size`   add index fk_model_size_size (`size_oid`), add constraint fk_model_size_size foreign key (`size_oid`) references `size` (`oid`);


-- Model_CPU [rel4]
create table `model_cpu` (
   `model_oid`  integer not null,
   `cpu_oid`  integer not null,
  primary key (`model_oid`, `cpu_oid`)
) ENGINE=InnoDB;
alter table `model_cpu`   add index fk_model_cpu_model (`model_oid`), add constraint fk_model_cpu_model foreign key (`model_oid`) references `model` (`oid`);
alter table `model_cpu`   add index fk_model_cpu_cpu (`cpu_oid`), add constraint fk_model_cpu_cpu foreign key (`cpu_oid`) references `cpu` (`oid`);


-- Screen_Resolution [rel5]
alter table `screen`  add column  `resolution_oid`  integer;
alter table `screen`   add index fk_screen_resolution (`resolution_oid`), add constraint fk_screen_resolution foreign key (`resolution_oid`) references `resolution` (`oid`);


-- Model_Screen [rel6]
alter table `model`  add column  `screen_oid`  integer;
alter table `model`   add index fk_model_screen (`screen_oid`), add constraint fk_model_screen foreign key (`screen_oid`) references `screen` (`oid`);


