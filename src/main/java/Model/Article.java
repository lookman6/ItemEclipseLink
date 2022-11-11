/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author dell
 */
public class Article {
    private String code;
    private String designation;
    private float prix;

    public Article(String code, String designation, float prix) {
        this.code = code;
        this.designation = designation;
        this.prix = prix;
    }

    public String getCode() {
        return code;
    }

    public String getDesignation() {
        return designation;
    }

    public float getPrix() {
        return prix;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public void setPrix(float prix) {
        this.prix = prix;
    }

    public Article() {
    }
    
    
    
    @Override
    public boolean equals(Object obj) {
    if(obj instanceof Article)
    {
        return ((Article)obj).code.equals(code);
    }
    return false ;
    }
}
