/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  24/10/2020 23:01:43                      */
/*==============================================================*/


drop table if exists ALBUM;

drop table if exists ARTISTE;

drop table if exists GENRE;

drop table if exists PAYS;

drop table if exists PRODUCTEUR;

drop table if exists TRACKS;

/*==============================================================*/
/* Table : ALBUM                                                */
/*==============================================================*/
create table ALBUM
(
   ID_ALBUM             int not null,
   ID_ARTISTE           int not null,
   ID_GENRE             int not null,
   DESCRIPTION          text not null,
   TITRE_ALBUM          text not null,
   DATEPARUTION         date not null,
   primary key (ID_ALBUM)
);

/*==============================================================*/
/* Table : ARTISTE                                              */
/*==============================================================*/
create table ARTISTE
(
   ID_ARTISTE           int not null,
   ID_PAYS              int not null,
   NOM                  text not null,
   PRENOM               text not null,
   primary key (ID_ARTISTE)
);

/*==============================================================*/
/* Table : GENRE                                                */
/*==============================================================*/
create table GENRE
(
   ID_GENRE             int not null,
   NOM_GENRE            text not null,
   primary key (ID_GENRE)
);

/*==============================================================*/
/* Table : PAYS                                                 */
/*==============================================================*/
create table PAYS
(
   ID_PAYS              int not null,
   NOMPAYS              text not null,
   primary key (ID_PAYS)
);

/*==============================================================*/
/* Table : PRODUCTEUR                                           */
/*==============================================================*/
create table PRODUCTEUR
(
   ID_PRODUCTEUR        int not null,
   NOM                  text not null,
   PRENOM               text not null,
   primary key (ID_PRODUCTEUR)
);

/*==============================================================*/
/* Table : TRACKS                                               */
/*==============================================================*/
create table TRACKS
(
   ID_TRACK             int not null,
   ID_ARTISTE           int not null,
   ID_ALBUM             int not null,
   ID_PRODUCTEUR        int not null,
   NOM_TRACK            text not null,
   DUREE                int not null,
   BPM                  int not null,
   primary key (ID_TRACK)
);

alter table ALBUM add constraint FK_APPARTIENT foreign key (ID_GENRE)
      references GENRE (ID_GENRE) on delete restrict on update restrict;

alter table ALBUM add constraint FK_INTERPRETE_PAR foreign key (ID_ARTISTE)
      references ARTISTE (ID_ARTISTE) on delete restrict on update restrict;

alter table ARTISTE add constraint FK_REPRESENTE foreign key (ID_PAYS)
      references PAYS (ID_PAYS) on delete restrict on update restrict;

alter table TRACKS add constraint FK_COMPOSE foreign key (ID_ARTISTE)
      references ARTISTE (ID_ARTISTE) on delete restrict on update restrict;

alter table TRACKS add constraint FK_CONTIENT foreign key (ID_ALBUM)
      references ALBUM (ID_ALBUM) on delete restrict on update restrict;

alter table TRACKS add constraint FK_PRODUIT foreign key (ID_PRODUCTEUR)
      references PRODUCTEUR (ID_PRODUCTEUR) on delete restrict on update restrict;

