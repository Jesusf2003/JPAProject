/**
 * 
 */
package com.user.jpa.dao.Impl;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.user.jpa.dao.ProductoDao;
import com.user.jpa.entity.Productos;

/**
 * @author chema
 *
 */
class ProductoImplPrueba {
	
	private ProductoDao productoDao = new ProductoImpl();
	
	@Test
	void testGuardar() throws Exception {
		Productos prod = new Productos();
		prod.setNombre("Pera");
		prod.setPrecio(20.50);
		prod.setTipo("P");
		prod.setTamano("500 ML");
		prod.setStock(60);
		
		this.productoDao.guardar(prod);
	}

}