package kr.co.vitamin.service;

import kr.co.vitamin.repository.vo.Address;

public interface AddressService {
	public Address selectCode(Address address) throws Exception;
	public void insertAddress(Address address) throws Exception;
}
