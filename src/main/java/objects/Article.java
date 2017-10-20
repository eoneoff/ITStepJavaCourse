package objects;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table(name = "articles")
public class Article
{
    private int id;
    private String name;
    private float price;
    private Set<Purchase> purchases;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id)
    {
        this.id=id;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "price")
    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @OneToMany(mappedBy = "article", cascade = CascadeType.ALL)
    public Set<Purchase> getPurchases() {
        return purchases;
    }

    public void setPurchases(Set<Purchase> purchases) {
        this.purchases = purchases;
    }
}
