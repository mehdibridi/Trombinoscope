/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  24/10/2020 23:01:43                      */
/*==============================================================*/


drop table if exists ALBUM;

drop table if exists ARTIST;

drop table if exists COUNTRY;

drop table if exists KIND;

drop table if exists PRODUCER;

drop table if exists TRACKS;

/*==============================================================*/
/* Table : ALBUM                                                */
/*==============================================================*/
create table ALBUM
(
   ID_ALBUM             int not null,
   ID_ARTIST            int not null,
   ID_KIND              int not null,
   DESCRIPTION          text not null,
   ALBUM_TITLE          text not null,
   RELEASE_DATE         date not null,
   primary key (ID_ALBUM)
);

/*==============================================================*/
/* Table : ARTIST                                               */
/*==============================================================*/
create table ARTIST
(
   ID_ARTIST            int not null,
   ID_COUNTRY           int not null,
   NAME                 text not null,
   FIRST_NAME           text not null,
   primary key (ID_ARTIST)
);

/*==============================================================*/
/* Table : COUNTRY                                              */
/*==============================================================*/
create table COUNTRY
(
   ID_COUNTRY           int not null,
   COUNTRY_NAME         text not null,
   primary key (ID_COUNTRY)
);

/*==============================================================*/
/* Table : KIND                                                 */
/*==============================================================*/
create table KIND
(
   ID_KIND              int not null,
   KIND_NAME            text not null,
   primary key (ID_KIND)
);

/*==============================================================*/
/* Table : PRODUCER                                             */
/*==============================================================*/
create table PRODUCER
(
   ID_PRODUCTEUR        int not null,
   NAME                 text not null,
   FIRST_NAME           text not null,
   primary key (ID_PRODUCTEUR)
);

/*==============================================================*/
/* Table : TRACKS                                               */
/*==============================================================*/
create table TRACKS
(
   ID_TRACK             int not null,
   ID_ARTIST            int not null,
   ID_ALBUM             int not null,
   ID_PRODUCTEUR        int not null,
   TRACK_NAME           text not null,
   DURATION             int not null,
   BPM                  int not null,
   primary key (ID_TRACK)
);

alter table ALBUM add constraint FK_BELONG foreign key (ID_KIND)
      references KIND (ID_KIND) on delete restrict on update restrict;

alter table ALBUM add constraint FK_PERFORMED_BY foreign key (ID_ARTIST)
      references ARTIST (ID_ARTIST) on delete restrict on update restrict;

alter table ARTIST add constraint FK_REPRESENT foreign key (ID_COUNTRY)
      references COUNTRY (ID_COUNTRY) on delete restrict on update restrict;

alter table TRACKS add constraint FK_COUNTAIN foreign key (ID_ALBUM)
      references ALBUM (ID_ALBUM) on delete restrict on update restrict;

alter table TRACKS add constraint FK_PRODUCED_BY foreign key (ID_PRODUCTEUR)
      references PRODUCER (ID_PRODUCTEUR) on delete restrict on update restrict;

alter table TRACKS add constraint FK_WRITE foreign key (ID_ARTIST)
      references ARTIST (ID_ARTIST) on delete restrict on update restrict;


