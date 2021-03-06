package kr.co.vitamin.repository.vo;

public class InfiniteScrollAccount {
	private static final Integer LAST_COUNT = 5;
	
	private Integer accountNo, lastSeqNo, lastCount;
	
	public InfiniteScrollAccount() {
		this.lastCount = LAST_COUNT;
	}

	public Integer getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(Integer accountNo) {
		this.accountNo = accountNo;
	}

	public Integer getLastSeqNo() {
		return lastSeqNo;
	}

	public void setLastSeqNo(Integer lastSeqNo) {
		this.lastSeqNo = lastSeqNo;
	}

	public Integer getLastCount() {
		return lastCount;
	}

	public void setLastCount(Integer lastCount) {
		this.lastCount = lastCount;
	}

	@Override
	public String toString() {
		return "InfiniteScrollAccount [accountNo=" + accountNo + ", lastSeqNo=" + lastSeqNo + ", lastCount=" + lastCount
				+ "]";
	}
}