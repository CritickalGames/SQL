create database braiamMarcez;
use braiamMarcez;

/*GR1*/
create table Landoj(
    Id int not null AUTO_INCREMENT,
    Nombre varchar(15) not null,
    primary key (Id)
);
/*GR2*/
create table Kamusoj(
    Id int not null AUTO_INCREMENT, 
    Lando int not null,
    Nombre varchar(15) not null,
    primary key(Id),
    foreign key(Lando) references Landoj(Id)
);
create table Ekipannoj(
    Id int not null AUTO_INCREMENT,
    Lando int not null,
    Nombre varchar(40) not null,
    Eliminado BIT(1) NOT NULL DEFAULT b'0',
    primary key(Id),
    foreign key(Lando) references Landoj(Id)
);
create table Homoj(
    Id int not null AUTO_INCREMENT,
    Lando int not null,
    Nombre varchar(40) not null,
    Nacimiento date not null,
    primary key(Id),
    foreign key(Lando) references Landoj(Id)
);
/*GR3*/
create table Stadionoj(
    Id int not null AUTO_INCREMENT,
    Kamuso int not null,
    Nombre varchar(30) not null,
    primary key(Id, Kamuso),
    foreign key(Kamuso) references Kamusoj(Id)
);
create table Juwistoj(
    Homo int not null,
    primary key(Homo),
    foreign key(Homo) references Homoj(Id)
);
create table Teknikadirektoroj(
    Homo int not null,
    Ekipanno int not null,
    primary key(Homo),
    foreign key(Homo) references Homoj(Id),
    foreign key(Ekipanno) references Ekipannoj(Id)
);
create table Ludantoj(
    Homo int not null,
    Ekipanno int not null,
    primary key(Homo),
    foreign key(Homo) references Homoj(Id),
    foreign key(Ekipanno) references Ekipannoj(Id)
);
/*GR4*/
create table Matxoj(
    Id int not null AUTO_INCREMENT,
    Gastiganto int not null,
    Vizitanto int not null,
    CeloGastiganto int not null,
    CeloVizitanto int not null,
    Fecha date not null,
    Hora time not null,
    Duracion time not null,

    FlavaGastiganto int not null,
    RuwaGastiganto int not null,
    PunktoGastiganto int not null,
    PilkoPosedoGastiganto time not null,
    
    FlavaVizitanto int not null,
    RuwaVizitanto int not null,
    PunktoVizitanto int not null,
    PilkoPosedoVizitanto time not null,

    primary key(Id),
    foreign key(Gastiganto) references Ekipannoj(Id),
    foreign key(Vizitanto) references Ekipannoj(Id)
); 
/*GR5*/
create table R_JuwistojListoj(
    UnuaLinio int not null,
    DuaLinio int not null,
    Centro int not null,
    Asistanto int not null,
    primary key(UnuaLinio, DuaLinio, Centro, Asistanto),
    foreign key(UnuaLinio) references Juwistoj(Homo),
    foreign key(DuaLinio) references Juwistoj(Homo),
    foreign key(Centro) references Juwistoj(Homo),
    foreign key(Asistanto) references Juwistoj(Homo)
);
create table R_BonaKredoj(
    Matxo int not null,
    Ludanto int not null,
    Rol varchar(15) not null,
    Titular boolean not null,
    primary key(Matxo, Ludanto),
    foreign key(Matxo) references Matxoj(Id),
    foreign key(Ludanto) references Ludantoj(Homo)
);
/*GR6*/
create table R_Arbitraci(
    Matxo int not null,
    JuwistojListoUnua int not null,
    JuwistojListoDua int not null,
    JuwistojListoCentro int not null,
    JuwistojListoAsistanto int not null,
    primary key(Matxo),
    foreign key(JuwistojListoUnua, JuwistojListoDua, JuwistojListoCentro, JuwistojListoAsistanto) 
        references R_JuwistojListoj(UnuaLinio, DuaLinio, Centro, Asistanto),
    foreign key(Matxo) references Matxoj(Id)
);
use braiamMarcez;
/*GR1*/
INSERT INTO Landoj(Nombre) 
    VALUE("Argentina");
INSERT INTO Landoj(Nombre) 
    VALUE("Brasil");
INSERT INTO Landoj(Nombre) 
    VALUE("España");
INSERT INTO Landoj(Nombre) 
    VALUE("EEUU");
/*GR2*/
INSERT INTO Kamusoj(Lando, Nombre) 
    VALUE(1, "Buenos Aires");
INSERT INTO Kamusoj(Lando, Nombre) 
    VALUE(2, "Rio de Janeiro");
INSERT INTO Kamusoj(Lando, Nombre) 
    VALUE(3, "Madrid");
INSERT INTO Kamusoj(Lando, Nombre) 
    VALUE(4, "DC");


INSERT INTO Ekipannoj(Lando, Nombre) 
    VALUE(1, "Argentina");
INSERT INTO Ekipannoj(Lando, Nombre) 
    VALUE(2, "Brasil");
INSERT INTO Ekipannoj(Lando, Nombre) 
    VALUE(3, "España");
INSERT INTO Ekipannoj(Lando, Nombre) 
    VALUE(4, "EEUU");


INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg1", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg2", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg3", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg4", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg5", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg6", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg7", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg8", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg9", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg10", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg11", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg12", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg13", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg14", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg15", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg16", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg17", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg18", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg19", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg20", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg21", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg22", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg23_Dir", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg24_Jw", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg25_Jw", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg26_Jw", "1997-07-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(1, "arg27_Jw", "1997-07-7");

INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs1", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs2", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs3", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs4", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs5", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs6", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs7", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs8", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs9", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs10", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs11", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs12", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs13", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs14", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs15", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs16", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs17", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs18", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs19", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs20", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs21", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs22", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs23_Dir", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs24_Jw", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs25_Jw", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs26_Jw", "1997-07-17");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(2, "brs27_Jw", "1997-07-17");

INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp1", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp2", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp3", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp4", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp5", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp6", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp7", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp8", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp9", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp10", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp11", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp12", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp13", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp14", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp15", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp16", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp17", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp18", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp19", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp20", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp21", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp22", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp23_Dir", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp24_Jw", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp25_Jw", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp26_Jw", "1997-07-27");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(3, "esp27_Jw", "1997-07-27");

INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU1", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU2", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU3", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU4", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU5", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU6", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU7", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU8", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU9", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU10", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU11", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU12", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU13", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU14", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU15", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU16", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU17", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU18", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU19", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU20", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU21", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU22", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU23_Dir", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU24_Jw", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU25_Jw", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU26_Jw", "1997-08-7");
INSERT INTO Homoj(Lando, Nombre, Nacimiento) 
    VALUE(4, "EEUU27_Jw", "1997-08-7");

/*GR3*/
INSERT INTO Stadionoj(Kamuso, Nombre) 
    VALUE(1, "Central del Narizon");
INSERT INTO Stadionoj(Kamuso, Nombre) 
    VALUE(2, "DulMakako");
INSERT INTO Stadionoj(Kamuso, Nombre) 
    VALUE(3, "La capa roa");
INSERT INTO Stadionoj(Kamuso, Nombre) 
    VALUE(4, "EscuelaFPS");

INSERT INTO Juwistoj(Homo) 
    VALUE(24);
INSERT INTO Juwistoj(Homo) 
    VALUE(25);
INSERT INTO Juwistoj(Homo) 
    VALUE(26);
INSERT INTO Juwistoj(Homo) 
    VALUE(27);
INSERT INTO Juwistoj(Homo) 
    VALUE(51);
INSERT INTO Juwistoj(Homo) 
    VALUE(52);
INSERT INTO Juwistoj(Homo) 
    VALUE(53);
INSERT INTO Juwistoj(Homo) 
    VALUE(54);
INSERT INTO Juwistoj(Homo) 
    VALUE(78);
INSERT INTO Juwistoj(Homo) 
    VALUE(79);
INSERT INTO Juwistoj(Homo) 
    VALUE(80);
INSERT INTO Juwistoj(Homo) 
    VALUE(81);
INSERT INTO Juwistoj(Homo) 
    VALUE(105);
INSERT INTO Juwistoj(Homo) 
    VALUE(106);
INSERT INTO Juwistoj(Homo) 
    VALUE(107);
INSERT INTO Juwistoj(Homo) 
    VALUE(108);



INSERT INTO Teknikadirektoroj(Homo, Ekipanno) 
    VALUE(23, 1);
INSERT INTO Teknikadirektoroj(Homo, Ekipanno) 
    VALUE(50, 2);
INSERT INTO Teknikadirektoroj(Homo, Ekipanno) 
    VALUE(77, 3);
INSERT INTO Teknikadirektoroj(Homo, Ekipanno) 
    VALUE(104, 4);

INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(1,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(2,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(3,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(4,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(5,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(6,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(7,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(8,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(9,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(10,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(11,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(12,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(13,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(14,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(15,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(16,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(17,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(18,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(19,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(20,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(21,1);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(22,1);

INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(28,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(29,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(30,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(31,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(32,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(33,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(34,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(35,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(36,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(37,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(38,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(39,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(40,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(41,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(42,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(43,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(44,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(45,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(46,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(47,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(48,2);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(49,2);

INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(55,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(56,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(57,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(58,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(59,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(60,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(61,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(62,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(63,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(64,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(65,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(66,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(67,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(68,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(69,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(70,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(71,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(72,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(73,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(74,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(75,3);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(76,3);

INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(82,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(83,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(84,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(85,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(86,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(87,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(88,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(89,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(90,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(91,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(92,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(93,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(94,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(95,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(96,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(97,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(98,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(99,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(100,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(101,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(102,4);
INSERT INTO Ludantoj(Homo, Ekipanno) 
    VALUE(103,4);


/*GR4*/
INSERT INTO Matxoj(
    Gastiganto, Vizitanto, CeloGastiganto, CeloVizitanto,Fecha, Hora, Duracion,

    FlavaGastiganto, RuwaGastiganto, PunktoGastiganto,
    PilkoPosedoGastiganto,
    
    FlavaVizitanto, RuwaVizitanto, PunktoVizitanto,
    PilkoPosedoVizitanto) 
    VALUE(1,2,3,1, '2023-11-23', '10:00:00', '1:00:00',
    
    3, 1, 3, '00:10:10',
    5, 0, 0, '00:20:10');
INSERT INTO Matxoj(
    Gastiganto, Vizitanto, CeloGastiganto, CeloVizitanto, Fecha, Hora, Duracion,

    FlavaGastiganto, RuwaGastiganto, PunktoGastiganto,
    PilkoPosedoGastiganto,
    
    FlavaVizitanto, RuwaVizitanto, PunktoVizitanto,
    PilkoPosedoVizitanto) 
    VALUE(3,4,3,1, '2023-11-23', '10:00:00', '1:00:00',
    
    3, 1, 3, '00:10:10',
    5, 0, 0, '00:20:10');
/*GR5*/
INSERT INTO R_JuwistojListoj(UnuaLinio, DuaLinio, Centro, Asistanto) 
    VALUE(24, 25, 26, 27);
INSERT INTO R_JuwistojListoj(UnuaLinio, DuaLinio, Centro, Asistanto) 
    VALUE(81, 80, 79, 78);

INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,1, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,2, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,3, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,4, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,5, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,6, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,7, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,8, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,9, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,10, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,11, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,12, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,13, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,14, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,15, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,16, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,17, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,18, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,19, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,20, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,21, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,22, "x", 0);

INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,28, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,29, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,30, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,31, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,32, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,33, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,34, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,35, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,36, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,37, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,38, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,39, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,40, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,41, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,42, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,43, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,44, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,45, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,46, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,47, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,48, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(1,49, "x", 0);

/*SEGUNDO PARTIDO*/
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,55, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,56, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,57, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,58, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,59, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,60, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,61, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,62, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,63, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,64, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,65, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,66, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,67, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,68, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,69, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,70, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,71, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,72, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,73, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,74, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,75, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,76, "x", 0);

INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,82, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,83, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,84, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,85, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,86, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,87, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,88, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,89, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,90, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,91, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,92, "x", 1);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,93, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,94, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,95, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,96, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,97, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,98, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,99, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,100, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,101, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,102, "x", 0);
INSERT INTO R_Bonakredoj(Matxo, Ludanto, Rol, titular)
    VALUE(2,103, "x", 0);


/*GR6*/
INSERT INTO R_Arbitraci(
    Matxo, 
    JuwistojListoUnua, JuwistojListoDua,
    JuwistojListoCentro, JuwistojListoAsistanto)
    VALUE(1, 81, 80, 79, 78);
INSERT INTO R_Arbitraci(
    Matxo, 
    JuwistojListoUnua, JuwistojListoDua,
    JuwistojListoCentro, JuwistojListoAsistanto)
    VALUE(2, 24, 25, 26, 27);

/*CONSULTAS*/
/*CONSULTAS*/
/*CONSULTAS*/
/*CONSULTAS*/
select L.Homo, E.Nombre from Ludantoj as L, Ekipannoj as E
    where L.Ekipanno = E.Id;

/*RESOLUCIÓN del 5*/
SELECT e.nombre AS Equipo,
       SUM(CASE WHEN m.gastiganto = e.id THEN m.CeloGastiganto ELSE m.CeloVizitanto END) AS GolesAFavor,
       SUM(CASE WHEN m.vizitanto = e.id THEN m.CeloGastiganto ELSE m.CeloVizitanto END) AS GolesEnContra,
       SUM(CASE WHEN m.gastiganto = e.id THEN m.CeloGastiganto ELSE m.CeloVizitanto END) - SUM(CASE WHEN m.gastiganto = e.id THEN m.CeloVizitanto ELSE m.CeloGastiganto END) AS DiferenciaGoles
FROM Ekipannoj e
LEFT JOIN Matxoj m ON e.id = m.gastiganto OR e.id = m.vizitanto
GROUP BY e.nombre;

/*SOLUCIÓN del 6*/
INSERT INTO Landoj(Nombre) VALUE("Uruguay");
INSERT into Ekipannoj(Lando, Nombre) VALUE(5,"Uruguay");
/*SOLUCIÓN del 7*/
DELETE FROM R_Arbitraci 
WHERE Matxo IN (
    SELECT ID 
    FROM Matxoj as M 
    WHERE M.Gastiganto IN (
        SELECT ID FROM Ekipannoj WHERE nombre = 'Argentina'
    )
    OR M.Vizitanto IN (
        SELECT ID FROM Ekipannoj WHERE nombre = 'Argentina'
    )
);

DELETE FROM R_BonaKredoj 
WHERE Matxo IN (
    SELECT ID 
    FROM Matxoj as M 
    WHERE M.Gastiganto IN (
        SELECT ID FROM Ekipannoj WHERE nombre = 'Argentina'
    )
    OR M.Vizitanto IN (
        SELECT ID FROM Ekipannoj WHERE nombre = 'Argentina'
    )
);

DELETE FROM Matxoj 
WHERE ID IN (
    SELECT ID 
    FROM Matxoj as M 
    WHERE M.Gastiganto IN (
        SELECT ID FROM Ekipannoj WHERE nombre = 'Argentina'
    )
    OR M.Vizitanto IN (
        SELECT ID FROM Ekipannoj WHERE nombre = 'Argentina'
    )
);
DELETE FROM Ludantoj 
WHERE Ekipanno IN(
    SELECT ID
    FROM Ekipannoj WHERE nombre ="Argentina"
);
DELETE FROM Teknikadirektoroj 
WHERE Ekipanno IN(
    SELECT ID
    FROM Ekipannoj WHERE nombre ="Argentina"
);
DELETE FROM Ekipannoj WHERE nombre="Argentina";

/*SOLUCIÓN del 8*/
INSERT INTO Matxoj(
    Gastiganto, Vizitanto, CeloGastiganto, CeloVizitanto, Fecha, Hora, Duracion,

    FlavaGastiganto, RuwaGastiganto, PunktoGastiganto,
    PilkoPosedoGastiganto,
    
    FlavaVizitanto, RuwaVizitanto, PunktoVizitanto,
    PilkoPosedoVizitanto) 
    VALUE(5,4,3,1, '2023-11-23', '10:00:00', '1:00:00',
    
    3, 1, 3, '00:10:10',
    5, 0, 0, '00:20:10');

UPDATE Matxoj as M
SET M.CeloGastiganto = M.CeloGastiganto+1
WHERE M.Gastiganto IN(
	select ID FROM Ekipannoj WHERE Nombre="Uruguay"
);
UPDATE Matxoj as M
SET M.CeloVizitanto = M.CeloVizitanto+1
WHERE M.Vizitanto IN(
	select ID FROM Ekipannoj WHERE Nombre="Uruguay"
)