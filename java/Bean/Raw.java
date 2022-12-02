package Bean;

import java.io.Serializable;

public class Raw implements Serializable {
    private double x;
    private double y;
    private double R;
    private String hitFact;

    public Raw(){

    }
    public Raw(double x, double y, double r, String res){
        this.x = x;
        this.y = y;
        this.R = r;
        hitFact = res;
    }

    public double getR() {
        return R;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public String getHitFact() {
        return hitFact;
    }



}