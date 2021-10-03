/**
 * 
 */
package com.user.jpa.dao.Impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityNotFoundException;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.user.jpa.dao.ProductoDao;
import com.user.jpa.entity.Producto;

/**
 * @author chema
 * Clase que implementa la interface Dao
 * del modelo de la tabla PRODUCTO en JPa.
 */
public class ProductoImpl implements ProductoDao {
	
	private static final EntityManagerFactory ENTITY_MANAGER_FACTORY = Persistence.createEntityManagerFactory("JPAProyect");

	@Override
	public void guardar(Producto prod) throws Exception {
		EntityManager em = ENTITY_MANAGER_FACTORY.createEntityManager();
		
		EntityTransaction et = em.getTransaction();
		et.begin();
		
		try {
			em.persist(prod);
			et.commit();
		} catch (Exception e) {
			if(et != null) {
				et.rollback();
			}
			System.out.println("Error en: "+ e.getMessage());
		} finally {
			em.close();
		}
	}

	@Override
	public void actualizar(Producto prod) throws Exception {
		EntityManager em = ENTITY_MANAGER_FACTORY.createEntityManager();
		
		EntityTransaction et = em.getTransaction();
		et.begin();
		
		try {
			em.merge(prod);
			et.commit();
		} catch (Exception e) {
			if(et != null) {
				et.rollback();
			}
			System.out.println("Error en: "+ e.getMessage());
		} finally {
			em.close();
		}
	}

	@Override
	public void eliminar(int id) throws Exception {
		EntityManager em = ENTITY_MANAGER_FACTORY.createEntityManager();
		
		Producto productoConsulta = em.find(Producto.class, id);
		
		EntityTransaction et = em.getTransaction();
		et.begin();
		
		try {
			em.remove(productoConsulta);
			et.commit();
		} catch (Exception e) {
			if(et != null) {
				et.rollback();
			}
			System.out.println("error en: "+ e.getMessage());
		} finally {
			em.close();
		}
	}

	@Override
	public List<Producto> consultar() {
		EntityManager em = ENTITY_MANAGER_FACTORY.createEntityManager();
		TypedQuery<Producto> queryProd = (TypedQuery<Producto>) em.createQuery("from Producto order by NOMPRO");
		return queryProd.getResultList();
	}

	@Override
	public Producto consultarById(int id) {
		EntityManager em = ENTITY_MANAGER_FACTORY.createEntityManager();
		
		Producto prodConsulta = em.find(Producto.class, id);
		
		if (prodConsulta == null) {
			throw new EntityNotFoundException("El producto con id "+ id +" no se econtró.");
		}
		return prodConsulta;
	}
}