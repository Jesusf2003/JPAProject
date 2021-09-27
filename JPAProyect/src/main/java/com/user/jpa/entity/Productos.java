/**
 * 
 */
package com.user.jpa.entity;


import java.time.LocalDate;

import javax.persistence.*;

/**
 * @author chema
 * Modelo de la tabla PRODUCTO 
 * en JPA.
 */
@Entity
@Table(name = "PRODUCTO")
public class Productos {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="CODPROD" , updatable = false, nullable = false)
	private int codigo;
	
	@Column(name="NOMPROD")
	private String nombre;
	
	@Column(name="PREPROD")
	private double precio;
	
	@Column(name="TIPPROD")
	private String tipo;
	
	@Column(name="TAMPROD")
	private String tamano;
	
	@Column(name="STOCKPROD")
	private int stock;

	/**
	 * @return the codigo
	 */
	public int getCodigo() {
		return codigo;
	}

	/**
	 * @param codigo the codigo to set
	 */
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * @return the precio
	 */
	public double getPrecio() {
		return precio;
	}

	/**
	 * @param precio the precio to set
	 */
	public void setPrecio(double precio) {
		this.precio = precio;
	}

	/**
	 * @return the tipo
	 */
	public String getTipo() {
		return tipo;
	}

	/**
	 * @param tipo the tipo to set
	 */
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	/**
	 * @return the tamano
	 */
	public String getTamano() {
		return tamano;
	}

	/**
	 * @param tamano the tamano to set
	 */
	public void setTamano(String tamano) {
		this.tamano = tamano;
	}

	/**
	 * @return the stock
	 */
	public int getStock() {
		return stock;
	}

	/**
	 * @param stock the stock to set
	 */
	public void setStock(int stock) {
		this.stock = stock;
	}
}