package at.htlAnich;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

import at.htlAnich.model.Kunde;

public class KundeTest {
    EntityManagerFactory emf;
    EntityManager em;
    EntityTransaction tx;

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        (new KundeTest()).run();
    }

    void run() {
        String persistenceUnitName = "KundeTest";
        emf = Persistence.createEntityManagerFactory(persistenceUnitName);

        try {
            em = emf.createEntityManager();
            tx = em.getTransaction();
            tx.begin();

            Kunde NewKunde = new Kunde();
            NewKunde.setVorname("Markus");
            NewKunde.setNachname("Amann");
            createEntity(NewKunde);
            System.out.println(NewKunde.toString());

            NewKunde = new Kunde();
            NewKunde.setVorname("Thomas");
            NewKunde.setNachname("Hofer");
            createEntity(NewKunde);
            System.out.println(NewKunde.toString());

            tx.commit();

        } catch (PersistenceException e) {
            e.printStackTrace();
            if( tx != null && tx.isActive() ) {
                tx.rollback();
            }
            throw e;
        } finally {
            em.close();
            emf.close();
        }
    }

    public <T> void createEntity(T entity) {

        try {
            em.persist(entity);
        } catch( RuntimeException e) {
            e.printStackTrace();
            throw e;
        } finally {
        }
    }
}

