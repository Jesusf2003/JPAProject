/**
 * 
 */
package com.user.jpa.dao.Impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.user.jpa.dao.ProductoDao;
import com.user.jpa.entity.Productos;

/**
 * @author chema
 * Clase que implementa la interface Dao
 * del modelo de la tabla PRODUCTO en JPa.
 */
public class ProductoImpl implements ProductoDao {
	
	private static final EntityManagerFactory ENTITY_MANAGER_FACTORY = Persistence.createEntityManagerFactory("JPAProyect");

	@Override
	public void guardar(Productos prod) throws Exception {
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
	public void actualizar(Productos prod) throws Exception {
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
		
		Productos productoConsulta = em.find(Productos.class, id);
		
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
	public List<Productos> consultar() {
		EntityManager em = ENTITY_MANAGER_FACTORY.createEntityManager();
		TypedQuery<Productos> queryProd = (TypedQuery<Productos>) em.createQuery("FROM PRODUCTO ORDER BY DESC");
		return queryProd.getResultList();
	}
}