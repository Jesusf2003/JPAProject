/**
 * 
 */
package com.user.jpa.dao;

import java.util.List;

import com.user.jpa.entity.Producto;

/**
 * @author chema
 * Interface que genera el Dao de la tabla PRODUCTO
 * en JPA.
 */
public interface ProductoDao {
	
	void guardar (Producto prod) throws Exception;
	
	void actualizar (Producto prod) throws Exception;
	
	void eliminar (int id) throws Exception;
	
	List<Producto> consultar();
	
	Producto consultarById(int id);
}