/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     6/09/2024 8:37:59 p. m.                      */
/*==============================================================*/


drop table AVION;

drop table CIUDAD;

drop table ITINERARIO;

/*==============================================================*/
/* Table: AVION                                                 */
/*==============================================================*/
create table AVION (
   ID                   DECIMAL(10)          not null,
   CAPACIDAD            NUMERIC(15,2)        null,
   COLOR                VARCHAR(20)          null,
   MARCA                VARCHAR(20)          null,
   MODELO               VARCHAR(20)          null,
   constraint PK_AVION primary key (ID)
);

comment on table AVION is
'avion';

comment on column AVION.ID is
'id';

comment on column AVION.CAPACIDAD is
'capacidad';

comment on column AVION.COLOR is
'color';

comment on column AVION.MARCA is
'marca';

comment on column AVION.MODELO is
'modelo';

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID                   CHAR(5)              not null,
   NOMBRE               VARCHAR(20)          null,
   constraint PK_CIUDAD primary key (ID)
);

comment on table CIUDAD is
'ciudad';

comment on column CIUDAD.ID is
'id';

comment on column CIUDAD.NOMBRE is
'nombre';

/*==============================================================*/
/* Table: ITINERARIO                                            */
/*==============================================================*/
create table ITINERARIO (
   ID                   DECIMAL(10)          not null,
   NOMBRE               VARCHAR(20)          not null,
   FECHA_SALIDA         DATE                 not null,
   HORA_SALIDA          TIME WITH TIME ZONE  null,
   AVION_ID             DECIMAL(10)          not null,
   CIUDAD_SALIDA_ID     CHAR(5)              not null,
   CIUDAD_LLEGADA_ID    CHAR(5)              not null,
   constraint PK_ITINERARIO primary key (ID)
);

comment on table ITINERARIO is
'itinerario';

comment on column ITINERARIO.ID is
'id';

comment on column ITINERARIO.NOMBRE is
'nombre';

comment on column ITINERARIO.FECHA_SALIDA is
'fecha_salida';

comment on column ITINERARIO.HORA_SALIDA is
'hora_salida';

comment on column ITINERARIO.AVION_ID is
'avion_id';

comment on column ITINERARIO.CIUDAD_SALIDA_ID is
'ciudad_salida_id';

comment on column ITINERARIO.CIUDAD_LLEGADA_ID is
'ciudad_llegada_id';

alter table ITINERARIO
   add constraint FK_ITINERAR_REFERENCE_AVION foreign key (AVION_ID)
      references AVION (ID)
      on delete restrict on update restrict;

alter table ITINERARIO
   add constraint FK_ITINERAR_REF_CIUDAD_SALIDA foreign key (CIUDAD_SALIDA_ID)
      references CIUDAD (ID)
      on delete restrict on update restrict;

alter table ITINERARIO
   add constraint FK_ITINERAR_REf_CIUDAD_LLEGADA foreign key (CIUDAD_LLEGADA_ID)
      references CIUDAD (ID)
      on delete restrict on update restrict;

