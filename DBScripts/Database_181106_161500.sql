-- ROM_Model [rel11]
alter table `model`  add column  `rom_oid_2`  integer;
alter table `model`   add index fk_model_rom_2 (`rom_oid_2`), add constraint fk_model_rom_2 foreign key (`rom_oid_2`) references `rom` (`oid`);


-- RAM_Model [rel12]
alter table `model`  add column  `ram_oid_2`  integer;
alter table `model`   add index fk_model_ram_2 (`ram_oid_2`), add constraint fk_model_ram_2 foreign key (`ram_oid_2`) references `ram` (`oid`);


-- Color_Model [rel13]
alter table `model`  add column  `color_oid_2`  integer;
alter table `model`   add index fk_model_color_2 (`color_oid_2`), add constraint fk_model_color_2 foreign key (`color_oid_2`) references `color` (`oid`);


-- Maker_Model [rel7]
alter table `model`  add column  `maker_oid_2`  integer;
alter table `model`   add index fk_model_maker_2 (`maker_oid_2`), add constraint fk_model_maker_2 foreign key (`maker_oid_2`) references `maker` (`oid`);


-- Screen_Model [rel8]
alter table `model`  add column  `screen_oid_2`  integer;
alter table `model`   add index fk_model_screen_2 (`screen_oid_2`), add constraint fk_model_screen_2 foreign key (`screen_oid_2`) references `screen` (`oid`);


-- OS_Model [rel9]
alter table `model`  add column  `os_oid_2`  integer;
alter table `model`   add index fk_model_os_2 (`os_oid_2`), add constraint fk_model_os_2 foreign key (`os_oid_2`) references `os` (`oid`);


