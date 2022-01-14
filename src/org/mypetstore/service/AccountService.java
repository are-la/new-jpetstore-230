package org.mypetstore.service;

import org.mypetstore.persistence.AccountDAO;
import org.mypetstore.domain.Account;
import org.mypetstore.persistence.impl.AccountDAOImpl;

public class AccountService {

  private AccountDAO accountDAO;

  public AccountService(){
    accountDAO = new AccountDAOImpl();
  }

  public Account getAccount(String username) {
    return accountDAO.getAccountByUsername(username);
  }

  public Account getAccount(String username, String password) {
    Account account = new Account();
    account.setUsername(username);
    account.setPassword(password);
    System.out.println("service level account " + account.getUsername()+ " "+account.getPassword());
    return accountDAO.getAccountByUsernameAndPassword(account);
  }

  public void insertAccount(Account account) {
    accountDAO.insertAccount(account);
    accountDAO.insertSignon(account);
    accountDAO.insertProfile(account);
  }

  public void updateAccount(Account account) {
    System.out.println("service level ");
    accountDAO.updateAccount(account);
    accountDAO.updateSignon(account);
    accountDAO.updateProfile(account);
//    if (account.getPassword() != null && account.getPassword().length() > 0) {
//      accountDAO.updateSignon(account);
//    }
  }

  public boolean usernameIsExist(String username) {
    Account account = accountDAO.getAccountByUsername(username);
    if (account == null)
      return false;
    else
      return true;
  }
}
