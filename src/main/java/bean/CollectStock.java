package bean;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by wangxue on 2017/5/12.
 */
@Entity
public class CollectStock {

    private String userID;
    private String stockID;
    private String userId;
    private String stockId;

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getStockID() {
        return stockID;
    }

    public void setStockID(String stockID) {
        this.stockID = stockID;
    }

    @Id
    @Column(name = "userID", nullable = false, length = 20)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "stockID", nullable = false, length = 6)
    public String getStockId() {
        return stockId;
    }

    public void setStockId(String stockId) {
        this.stockId = stockId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CollectStock that = (CollectStock) o;

        if (userId != null ? !userId.equals(that.userId) : that.userId != null) return false;
        if (stockId != null ? !stockId.equals(that.stockId) : that.stockId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId != null ? userId.hashCode() : 0;
        result = 31 * result + (stockId != null ? stockId.hashCode() : 0);
        return result;
    }
}
