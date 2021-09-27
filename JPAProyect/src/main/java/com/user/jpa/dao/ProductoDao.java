/**
 * 
 */
package com.user.jpa.dao;

import java.util.List;

import com.user.jpa.entity.Productos;

/**
 * @author chema
 * Interface que genera el Dao de la tabla PRODUCTO
 * en JPA.
 */
public interface ProductoDao {
	
	void guardar (Productos prod) throws Exception;
	void actualizar (Productos prod) throws Exception;
	void eliminar (int id) throws Exception;
	List<Productos> consultar();
}