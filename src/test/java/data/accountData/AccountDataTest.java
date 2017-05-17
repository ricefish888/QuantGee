package data.accountData;

import DAO.accountDAO.AccountDAO;
import bean.*;
import data.accountData.AccountData;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.junit.Assert;
import org.junit.Test;
import po.UserAnalysisDataPO;

import java.io.*;
import java.util.List;

/**
 * Created by wangxue on 2017/5/14.
 */
public class AccountDataTest {


    AccountDAO accountDAO = new AccountData();

    @Test
    public void insertTest() {
        Account account = new Account();
        account.setPassword("abcd");
        account.setUserId("123sd45");
        account.setRegisterDate("2011");
        account.setIsLogIn(0);
        accountDAO.addAccount(account);
    }

    @Test
    public void updateTest() {
        Account account = new Account();
        account.setUserId("db");
        account.setIsLogIn(1);
        account.setPassword("acvs");
        accountDAO.updateAccount(account);
    }

    @Test
    public void findTest(){
        String userID = "db";
        Assert.assertEquals(accountDAO.getAccount(userID).getRegisterDate() , "201");
    }


}