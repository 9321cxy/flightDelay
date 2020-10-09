package com.ssmpro.flight.domain;

import java.io.Serializable;

public class Page implements Serializable {
    private Integer totalConut;
    private Integer pageSize = 50;
    private Integer totalPageCount;
    private Integer currPage = 1;
    private Integer startID;

    public Integer getTotalConut() {
        return totalConut;
    }

    public void setTotalConut(Integer totalConut) {
        if (totalConut != 0) {
            if (totalConut % pageSize == 0) {
                this.totalPageCount = totalConut / pageSize;
            } else {
                this.totalPageCount = (totalConut / pageSize) + 1;
            }
            System.out.println(totalPageCount);
        }

        this.totalConut = totalConut;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalPageCount() {
        return totalPageCount;
    }

    public void setTotalPageCount(Integer totalPageCount) {
        this.totalPageCount = totalPageCount;
    }

    public Integer getCurrPage() {
        return currPage;
    }

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    public Integer getStartID() {
        return startID;
    }

    public void setStartID(Integer startID) {
        this.startID = startID;
    }

    @Override
    public String toString() {
        return "Page{" +
                "totalConut=" + totalConut +
                ", pageSize=" + pageSize +
                ", totalPageCount=" + totalPageCount +
                ", currPage=" + currPage +
                ", startID=" + startID +
                '}';
    }
}
