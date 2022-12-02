package Bean;

import java.util.LinkedList;
import java.util.List;
import java.io.Serializable;

public class RawBean implements Serializable{
    private List<Raw> raws;

    public RawBean() {
        raws = new LinkedList<>();
    }

    public List<Raw> getRaws() {
        return raws;
    }
}
