/*para retirar los permisos del usuario administrador y que solo pueda hacer consultas 
 a la base de datos.*/

REVOKE ALL ON prueba5.ejemplo FROM 'administrador'@'localhost';
GRANT SELECT ON prueba5.* TO 'administrador'@'localhost';

/*revocar los permisos sobre el usuario consulta_ejemplo para que solo quede con permisos 
de consulta sobre la tabla ejemplo.*/
REVOKE ALL ON prueba5.ejemplo FROM 'consulta_ejemplo'@'localhost';

#Revocar todos los permisos del usuario Gerente
REVOKE ALL ON prueba5.* FROM 'gerente'@'localhost';

#Renombrar el tipo de usuario gerente a asesor
RENAME USER 'gerente'@'localhost' TO 'asesor'@'localhost';

#cambiar la clave del asesor.
SET PASSWORD FOR 'asesor'@'localhost'=PASSWORD('claveasesor');

#eliminar el usuario asesor.
DROP USER 'asesor'@'localhost';
