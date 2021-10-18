package at.htlAnich.model;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: Kunde
 *
 */
@Entity
@Table(name = "Kunde", uniqueConstraints={@UniqueConstraint(columnNames = {"vorname", "nachname"})})
public class Kunde implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    private String id;
    private String vorname;
    private String nachname;

    public Kunde() {
        this.id = UUID.randomUUID().toString();
    }

    public Kunde(String vorname, String nachname) {
        this.id = UUID.randomUUID().toString();
        this.vorname = vorname;
        this.nachname = nachname;
    }

    public String getId() {
        return id;
    }

    public String getVorname() {
        return vorname;
    }
    public void setVorname(String vorname) {
        this.vorname = vorname;
    }

    public String getNachname() {
        return nachname;
    }
    public void setNachname(String nachname) {
        this.nachname = nachname;
    }
    public String toString() {
        return "id=[" + id + "],vorname = [" + vorname + "],nachname=[" + nachname + "]";
    }
}
