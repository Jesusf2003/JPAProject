package com.user.jpa.entity;

import java.io.Serializable;

import javax.persistence.*;

/**
 * @author chema
 * Modelo de la tabla PRODUCTO 
 * en JPA.
 */

@Entity
@Table(name = "PRODUCTO")
public class Producto implements Serializable{

	@Id
	@SequenceGenerator(name = "seqPROD", sequenceName = "INCPRODUCTO", allocationSize = 1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "seqPROD")
	@Column(name="CODPRO")
	private int codigo;
	
	@Column(name="NOMPRO")
	private String nombre;
	
	@Column(name="COSPRO")
	private String cosecha;
	
	@Column(name="PREPRO")
	private double precio;
	
	@Column(name="TIPPRO")
	private String tipo;
	
	@Column(name="TAMPRO")
	private String tamano;
	
	@Column(name="STOCKPRO")
	private int stock;
	
	@Column(name="ESTPRO")
	private String estado;

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
	 * @return the cosecha
	 */
	public String getCosecha() {
		return cosecha;
	}

	/**
	 * @param cosecha the cosecha to set
	 */
	public void setCosecha(String cosecha) {
		this.cosecha = cosecha;
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

	/**
	 * @return the estado
	 */
	public String getEstado() {
		return estado;
	}

	/**
	 * @param estado the estado to set
	 */
	public void setEstado(String estado) {
		this.estado = estado;
	}

	/**
	 * 
	 */
	public Producto() {
	}

	/**
	 * @param codigo
	 * @param nombre
	 * @param cosecha
	 * @param precio
	 * @param tipo
	 * @param tamano
	 * @param stock
	 * @param estado
	 */
	public Producto(int codigo, String nombre, String cosecha, double precio, String tipo, String tamano, int stock,
			String estado) {
		super();
		this.codigo = codigo;
		this.nombre = nombre;
		this.cosecha = cosecha;
		this.precio = precio;
		this.tipo = tipo;
		this.tamano = tamano;
		this.stock = stock;
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "Producto [codigo=" + codigo + ", nombre=" + nombre + ", cosecha=" + cosecha + ", precio=" + precio
				+ ", tipo=" + tipo + ", tamano=" + tamano + ", stock=" + stock + ", estado=" + estado + "]";
	}
}