package com.iss.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.iss.beans.*;



public class JpaService {
	
	EntityManagerFactory	emf;
	EntityManager	em;
	public JpaService( ) {
		try{
         	emf=Persistence.createEntityManagerFactory("default");
         	em=emf.createEntityManager();
     	}catch(Exception	ex)
         {
         		ex.printStackTrace();
         }
	}
	public void add(com.iss.beans.Employee emp)
	{
			em.getTransaction().begin();
			em.merge(emp);
			em.getTransaction().commit();
	}
	public List<com.iss.beans.Employee>	getAll()
	{
		System.out.print(true);
		TypedQuery<Employee> query = em.createQuery("SELECT e FROM Employee e", Employee.class);
        return query.getResultList();
	}
}
