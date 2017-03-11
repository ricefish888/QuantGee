package data;

import java.io.*;
import java.util.ArrayList;

import dataDao.StockDataDao;
import po.StockPO;

/**
 * Created by Mark.W on 2017/3/4.
 */
public class StockData implements StockDataDao{
	public StockPO getStockPO(String date, String stockCode) {
		String path = System.getProperty("user.dir");
		path.replace("\\\\", "/");
		File file = new File(path+"/src/股票历史数据ALL.csv");
		try {
			BufferedReader br = new BufferedReader(new FileReader(file));
			String line = "";
			line = br.readLine();
			while((line = br.readLine()) != null) {
				String[] strings = line.split("\\t");
				if (strings[1].equals(date) && strings[8].equals(stockCode)) {
					StockPO po = new StockPO(strings[1],Double.parseDouble(strings[2]),
							Double.parseDouble(strings[3]),Double.parseDouble(strings[4]),
							Double.parseDouble(strings[5]),Integer.parseInt(strings[6]),
							Double.parseDouble(strings[7]),strings[8],strings[9],strings[10]);
					return po;
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public ArrayList<StockPO> getStockPOsByDate(String date){
		ArrayList<StockPO> stockPOS = new ArrayList<StockPO>();
		String path = System.getProperty("user.dir");
		path.replace("\\\\", "/");
		File file = new File(path+"/src/股票历史数据ALL.csv");
		try {
			BufferedReader br = new BufferedReader(new FileReader(file));
			String line = "";
			line = br.readLine();
			while((line = br.readLine()) != null) {
				String[] strings = line.split("\\t");
				if (strings[1].equals(date) ) {
					StockPO po = new StockPO(strings[1],Double.parseDouble(strings[2]),
							Double.parseDouble(strings[3]),Double.parseDouble(strings[4]),
							Double.parseDouble(strings[5]),Integer.parseInt(strings[6]),
							Double.parseDouble(strings[7]),strings[8],strings[9],strings[10]);
					stockPOS.add(po);
				}
			}
			return stockPOS;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<StockPO> getStockPOsByTimeInterval(String startdate, String endDate, String stockCode) {
		ArrayList<StockPO> stockPOS = new ArrayList<StockPO>();
		String path = System.getProperty("user.dir");
		path.replace("\\\\", "/");
		File file = new File(path+"/src/股票历史数据ALL.csv");
		try {
			BufferedReader br = new BufferedReader(new FileReader(file));
			String line = "";
			line = br.readLine();
			boolean isFound = false;		//是否找到该股票
			boolean inTimeRange = false; 	//在要搜寻的时间范围内
			while((line = br.readLine()) != null) {
				String[] strings = line.split("\\t");
				if (!strings[8].equals(stockCode)) {
					if (isFound) {
						break;
					}else {
						continue;
					}
				}else {
					if (!isFound) {
						isFound = true;
					}
					if (inTimeRange) {
						if (strings[1].equals(endDate)) {
							inTimeRange = false;
						}
						StockPO po = new StockPO(strings[1],Double.parseDouble(strings[2]),
								Double.parseDouble(strings[3]),Double.parseDouble(strings[4]),
								Double.parseDouble(strings[5]),Integer.parseInt(strings[6]),
								Double.parseDouble(strings[7]),strings[8],strings[9],strings[10]);
						stockPOS.add(po);
					}else {
						if (strings[1].equals(startdate)) {
							inTimeRange = true;
							StockPO po = new StockPO(strings[1],Double.parseDouble(strings[2]),
									Double.parseDouble(strings[3]),Double.parseDouble(strings[4]),
									Double.parseDouble(strings[5]),Integer.parseInt(strings[6]),
									Double.parseDouble(strings[7]),strings[8],strings[9],strings[10]);
							stockPOS.add(po);
						}else{
							if (inTimeRange) {
								break;
							}
						}
					}
				}
				
			}
			return stockPOS;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;	
	}

	public String getStockCodeByName(String stockName) {
		String path = System.getProperty("user.dir");
		path.replace("\\\\", "/");
		File file = new File(path+"/src/股票历史数据ALL.csv");
		try {
			BufferedReader br = new BufferedReader(new FileReader(file));
			String line = "";
			line = br.readLine();
			while((line = br.readLine()) != null) {
				String[] strings = line.split("\\t");
				if (strings[9].equals(stockName) ) {
					return strings[8];
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
