package kr.co.vitamin.common;

import org.springframework.stereotype.Service;


public enum ErrorMessage {
	SIGNUP_(0, "Sgsadg");
	
	private final Integer ERROR_CODE;
	private final String MESSAGE;
	
	private ErrorMessage(Integer eRROR_CODE, String mESSAGE) {
		ERROR_CODE = eRROR_CODE;
		MESSAGE = mESSAGE;
	}
}