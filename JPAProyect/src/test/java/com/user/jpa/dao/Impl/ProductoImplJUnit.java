package com.user.jpa.dao.Impl;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.user.jpa.dao.ProductoDao;
import com.user.jpa.entity.Producto;

/**
 * @author chema
 *
 */
class ProductoImplJUnit {
	
	private ProductoDao prodDao = new ProductoImpl();

	/**
	 * Test method for {@link com.user.jpa.dao.Impl.ProductoImpl#guardar(com.user.jpa.entity.Producto)}.
	 * @throws Exception 
	 */
	@Test
	void testGuardar() throws Exception {
		Producto producto = new Producto();
		producto.setNombre("Tintado");
		producto.setCosecha("2018");
		producto.setPrecio(10);
		producto.setTipo("V");
		producto.setTamano("500 ML");
		producto.setStock(10);
		producto.setEstado("A");
		this.prodDao.guardar(producto);
	}

	/**
	 * Test method for {@link com.user.jpa.dao.Impl.ProductoImpl#actualizar(com.user.jpa.entity.Producto)}.
	 * @throws Exception 
	 */
	@Test
	void testActualizar() throws Exception {
		Producto prod = this.prodDao.consultarById(14);
		
		prod.setNombre("Colero");
		
		this.prodDao.actualizar(prod);
	}

	/**
	 * Test method for {@link com.user.jpa.dao.Impl.ProductoImpl#eliminar(int)}.
	 * @throws Exception 
	 */
	@Test
	void testEliminar() {
		int id = 15;
		try {
			this.prodDao.eliminar(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Test method for {@link com.user.jpa.dao.Impl.ProductoImpl#consultar()}.
	 */
	@Test
	void testConsultar() {
		List<Producto> prodConsult = this.prodDao.consultar();
		
		assertTrue(prodConsult.size() > 0);
		
		prodConsult.forEach(producto -> {
			System.out.println("Producto: "+ producto.getNombre() + "\n"
								+ "	Fecha de cosecha: "+ producto.getCosecha() + "\n"
								+ "	Precio: "+ producto.getPrecio() + "\n"
								+ "	Tamaño: "+ producto.getTamano() + "\n"
								+ "	Stock: "+ producto.getStock() + "\n");
		});
	}

}
