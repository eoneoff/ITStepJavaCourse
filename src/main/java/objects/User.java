package objects;

import javax.annotation.Generated;
import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="users")
public class User
{
    private int id;
    private String name;
    private String login;
    private String password;
    private String card;
    private boolean admin;
    private Set<Order> orders;

    @Id
    @Column (name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id)
    {
        this.id=id;
    }

    @Column(name="screenname")
    public String getName() { return name; }

    public void setName(String name) {
        this.name = name;
    }


    @Column(name="login")
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    @Column(name="password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name="cardno")
    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    @Column(name="admin")
    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    public Set<Order> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }
}
