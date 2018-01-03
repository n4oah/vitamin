package kr.co.vitamin.service;

import kr.co.vitamin.repository.vo.Address;

public interface AddressService {
	public void insertAddress(Address address) throws Exception;
	public Address selectAddress(Address addres) throws Exception;
	public int selectNextAutoIncrement() throws Exception;
	
	public void insertAddress2(Address address) throws Exception;
	public Address selectCode(Address address) throws Exception;
}
