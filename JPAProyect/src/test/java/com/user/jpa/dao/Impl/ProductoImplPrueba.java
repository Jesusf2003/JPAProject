/**
 * 
 */
package com.user.jpa.dao.Impl;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.user.jpa.dao.ProductoDao;
import com.user.jpa.entity.Producto;

/**
 * @author chema
 *
 */
class ProductoImplPrueba {
	
	private ProductoDao productoDao = new ProductoImpl();
	
	@Test
	void testGuardar() throws Exception {
		Producto prod = new Producto();
		prod.setNombre("Pera");
		prod.setCosecha("2008");
		prod.setPrecio(20.50);
		prod.setTipo("P");
		prod.setTamano("500 ML");
		prod.setStock(60);
		prod.setEstado("A");
		
		this.productoDao.guardar(prod);
	}
	
}