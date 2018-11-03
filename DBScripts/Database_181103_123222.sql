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


-- Model_RAM [rel4]
create table `model_ram` (
   `model_oid`  integer not null,
   `ram_oid`  integer not null,
  primary key (`model_oid`, `ram_oid`)
) ENGINE=InnoDB;
alter table `model_ram`   add index fk_model_ram_model (`model_oid`), add constraint fk_model_ram_model foreign key (`model_oid`) references `model` (`oid`);
alter table `model_ram`   add index fk_model_ram_ram (`ram_oid`), add constraint fk_model_ram_ram foreign key (`ram_oid`) references `ram` (`oid`);


-- ROM_Model [rel5]
create table `rom_model` (
   `rom_oid`  integer not null,
   `model_oid`  integer not null,
  primary key (`rom_oid`, `model_oid`)
) ENGINE=InnoDB;
alter table `rom_model`   add index fk_rom_model_rom (`rom_oid`), add constraint fk_rom_model_rom foreign key (`rom_oid`) references `rom` (`oid`);
alter table `rom_model`   add index fk_rom_model_model (`model_oid`), add constraint fk_rom_model_model foreign key (`model_oid`) references `model` (`oid`);


-- Model_OS [rel6]
create table `model_os` (
   `model_oid`  integer not null,
   `os_oid`  integer not null,
  primary key (`model_oid`, `os_oid`)
) ENGINE=InnoDB;
alter table `model_os`   add index fk_model_os_model (`model_oid`), add constraint fk_model_os_model foreign key (`model_oid`) references `model` (`oid`);
alter table `model_os`   add index fk_model_os_os (`os_oid`), add constraint fk_model_os_os foreign key (`os_oid`) references `os` (`oid`);


