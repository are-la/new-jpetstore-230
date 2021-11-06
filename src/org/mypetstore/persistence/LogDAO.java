package org.mypetstore.persistence;

import org.mypetstore.domain.Account;
import org.mypetstore.domain.Log;

import java.util.List;

public interface LogDAO {
    public void insertBrowseLog(Account account,String itemid);

    public void insertAddLog(Account account,String itemid);

    public List<Log> getBrowseLogListByUsername(String username);

    public List<Log> getAddListByUsername(String username);
}
