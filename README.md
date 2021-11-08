HTL INFI DB
====

If something is not clear, what is done here, please consider going to [this](https://blog.jetbrains.com/idea/2021/02/creating-a-simple-jpa-application/) website.

Update as of October 18th 2021:
----

If you have any trouble with your drivers, please consider checking the ``pom.xml`` file if your drivers are all downloaded onto the local machine.

On Sign-in problems, please check your credentials in the ``Configuration`` called ``Run`` and also please check out your ``META-INF/persistance.xml`` \
Inside the ``persistance.xml`` you should see these lines of code:
```XML
<property name="javax.persistence.jdbc.user" value="root"/>
<property name="javax.persistence.jdbc.password" value="DuArschloch4"/>
```
These are your credentials, so please consider it to update it for your needs.

If you have an Exception like ``No Persistence provider for EntityManager named KundeTest``, please check, if your main-class has the same name as it is listed inside of it as the ``persistenceUnitName`` AND it has to be the same inside of the ``persistence.xml`` at ``<persistence-unit name="asd">`` <br/>
So for example your class's name is ``KundeTest`` and it's subclass package-path is ``at.htlAnich.model.Kunde`` it should look like this inside of the main-class:
```JAVA
public class KundeTest{
    void run(){
        String persistenceUnitName = "KundeTest";
        ...
    }
    ...
}
```
Inside of the ``persistence.xml``:
```XML
<persistence ...>
    <persistence-unit name="KundeTest">
      <class>at.htlAnich.model.Kunde</class>
      .....
    </persistence-unit>
</persistence>
```
