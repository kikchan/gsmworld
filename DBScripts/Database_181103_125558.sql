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
   `created`  longtext,
   `website`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Model [ent2]
create table `model` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `price`  varchar(255),
   `release_date`  varchar(255),
   `weight`  varchar(255),
   `sim`  varchar(255),
   `main_camera`  varchar(255),
   `secondary_camera`  varchar(255),
   `battery`  varchar(255),
   `imgurl`  varchar(255),
   `cardslot`  varchar(255),
   `cpu`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Color [ent3]
create table `color` (
   `oid`  integer  not null,
   `name`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- RAM [ent4]
create table `ram` (
   `oid`  integer  not null,
   `cuantity`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- ROM [ent5]
create table `rom` (
   `oid`  integer  not null,
   `cuantity`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- OS [ent6]
create table `os` (
   `oid`  integer  not null,
   `nameandversion`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Screen [ent7]
create table `screen` (
   `oid`  integer  not null,
   `resolution`  varchar(255),
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
alter table `model`  add column  `color_oid`  integer;
alter table `model`   add index fk_model_color (`color_oid`), add constraint fk_model_color foreign key (`color_oid`) references `color` (`oid`);


-- Screen_Model [rel3]
alter table `model`  add column  `screen_oid`  integer;
alter table `model`   add index fk_model_screen (`screen_oid`), add constraint fk_model_screen foreign key (`screen_oid`) references `screen` (`oid`);


-- Model_RAM [rel4]
alter table `model`  add column  `ram_oid`  integer;
alter table `model`   add index fk_model_ram (`ram_oid`), add constraint fk_model_ram foreign key (`ram_oid`) references `ram` (`oid`);


-- ROM_Model [rel5]
alter table `model`  add column  `rom_oid`  integer;
alter table `model`   add index fk_model_rom (`rom_oid`), add constraint fk_model_rom foreign key (`rom_oid`) references `rom` (`oid`);


-- Model_OS [rel6]
alter table `model`  add column  `os_oid`  integer;
alter table `model`   add index fk_model_os (`os_oid`), add constraint fk_model_os foreign key (`os_oid`) references `os` (`oid`);


