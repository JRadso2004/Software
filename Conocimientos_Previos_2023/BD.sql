create table Pacientes(
PacIdentificacion char(10) not null,
PacNomrbres varchar(50) not null,
PacApellidos varchar(50) not null,
PacFechaNacimento date not null,
PacSexo enum('M','F') not null,
primary key(PacIdentificacion)
);

create table Medicos(
MedIdentificacion char(10) not null,
MedNombres varchar(50) not null,
MedApellidos varchar(50) not null,
primary key(MedIdentificacion)
);

create table Consultorios(
ConNumero int(3) not null,
ConNombre varchar(50) not null,
primary key(ConNumero)
);

create table Tratamientos(
TraNumero int AUTO_INCREMENT,
TraFechaAsignada date not null,
TraDescripcion text not null,
TraFechaIncio date not null,
TraFechaFin date not null,
TraObservaciones text not null,
TraPacientes char(10) not null,
primary key(TraNumero),
foreign key(TraPacientes) references Pacientes(PacIdentificacion)
);

create table Citas(
CitNumero int AUTO_INCREMENT,
CitFecha date not null,
CitHora varchar(10) not null,
CitPaciente char(10) not null,
CitMedico char(10) not null,
CitConsultorio int not null,
CitEstado enum('Asignada','Cumplida') default "Asignada" not null,
CitObservaciones text not null,
primary key(CitNumero),
foreign key(CitPaciente) references Pacientes(PacIdentificacion),
foreign key(CitMedico) references Medicos(MedIdentificacion),
foreign key(CitConsultorio) references Consultorios(ConNumero)
);

