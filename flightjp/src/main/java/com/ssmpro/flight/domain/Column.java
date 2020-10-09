package com.ssmpro.flight.domain;

public class Column {

    private  Float jingjinji;
    private  Float beijing_shoudu;
    private  Float beijing_nanyuan;
    private  Float tianjin;
    private  Float shijiazhuang;

    public Float getJingjinji() {
        return jingjinji;
    }

    public void setJingjinji(Float jingjinji) {
        this.jingjinji = jingjinji;
    }

    public Float getBeijing_shoudu() {
        return beijing_shoudu;
    }

    public void setBeijing_shoudu(Float beijing_shoudu) {
        this.beijing_shoudu = beijing_shoudu;
    }

    public Float getBeijing_nanyuan() {
        return beijing_nanyuan;
    }

    public void setBeijing_nanyuan(Float beijing_nanyuan) {
        this.beijing_nanyuan = beijing_nanyuan;
    }

    public Float getTianjin() {
        return tianjin;
    }

    public void setTianjin(Float tianjin) {
        this.tianjin = tianjin;
    }

    public Float getShijiazhuang() {
        return shijiazhuang;
    }

    public void setShijiazhuang(Float shijiazhuang) {
        this.shijiazhuang = shijiazhuang;
    }

    @Override
    public String toString() {
        return "Column{" +
                "jingjinji=" + jingjinji +
                ", beijing_shoudu=" + beijing_shoudu +
                ", beijing_nanyuan=" + beijing_nanyuan +
                ", tianjin=" + tianjin +
                ", shijiazhuang=" + shijiazhuang +
                '}';
    }
}
