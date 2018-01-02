package kr.co.vitamin.repository.mapper;

import kr.co.vitamin.repository.vo.Address;

public interface AddressMapper {
	public void insertAddress(Address address) throws Exception;
	public Address selectAddress(Address addres) throws Exception;
	public int selectNextAutoIncrement() throws Exception;
	
	public void insertAddress2(Address address) throws Exception;
	public Address selectCode(Address address) throws Exception;
}