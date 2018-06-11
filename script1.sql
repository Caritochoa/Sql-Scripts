#SCRIPT 1 
#Entrega 2 Modulo 1, administración de Bases de Datos.
#Carolina Ochoa Guzman, Estudiante de Ingniería de Software.

DROP DATABASE IF EXISTS prueba5
CREATE DATABASE prueba5;# creación de la base de datos prueba5
USE prueba5;


CREATE TABLE ejemplo (id INTEGER, name TEXT, Age INTEGER);
PRIMARY KEY ('id');

#Agregando el usuario administrador que se conecte de manera local. 
DROP USER 'administrador'@ 'localhost'IDENTIFIED BY 'claveadmin';
GRANT ALL PRIVILEGES ON prueba5.* TO 'administrador'@'localhost';
FLUSH PRIVILEGES;


#Agregando el usuario Gerente que se pueda conectar remotamente con todos los permisos
DROP USER 'gerente'@'localhost';
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'teo100';
GRANT ALL PRIVILEGES ON prueba5.* TO 'gerente'@'localhost';
DROP USER 'gerente'@'%';
CREATE USER 'gerente'@'%' IDENTIFIED BY 'clavegerente';
GRANT ALL PRIVILEGES ON prueba5.* TO 'gerente'@'%';
FLUSH PRIVILEGES;

#Creación de un usuario Consulta para la base de datos que pueda conectar remotamente
#y tener permisos de consulta sobre la base de Datos. 
DROP USER 'consulta'@'localhost';
CREATE USER 'consulta'@'localhost' IDENTIFIED BY 'claveconsulta';
GRANT SELECT ON prueba5.* TO 'consulta'@'localhost';
DROP USER 'consulta'@'%' IDENTIFIED BY 'claveconsulta';
GRANT SELECT ON prueba5.* TO 'consulta'@'%'

#Crear un usuario que se llame consulta_ejemplo que pueda conectarse localmente y que 
#pueda tener permisos de consulta sobre la base de datos. 
que solo quede con permisos de consulta de la tabla ejemplo. 
DROP USER 'consulta_ejemplo'@'localhost';
CREATE USER 'consulta_ejemplo'@'localhost' IDENTIFIED BY 'clavecon';
GRANT SELECT, INSERT, DELETE, ALTER ON prueba5.ejemplo TO 'consulta_ejemplo'@'localhost';








