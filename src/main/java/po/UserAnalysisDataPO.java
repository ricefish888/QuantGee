package po;

import java.util.Map;

public class UserAnalysisDataPO {
	
	private Map<String, Integer> registerNumByTime;		//按时间获取注册数量

	public Map<String, Integer> getRegisterNumByTime() {
		return registerNumByTime;
	}

	public void setRegisterNumByTime(Map<String, Integer> registerNumByTime) {
		this.registerNumByTime = registerNumByTime;
	}

	
}