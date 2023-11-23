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
    Fecha date not null,
    Hora time not null,
    Duracion time not null,

    FlavaGastiganto int not null,
    RuwaGastiganto int not null,
    CeloGastiganto int not null,
    PunktoGastiganto int not null,
    PilkoPosedoGastiganto time not null,
    
    FlavaVizitanto int not null,
    RuwaVizitanto int not null,
    CeloVizitanto int not null,
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