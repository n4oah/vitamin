package kr.co.vitamin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.AddressMapper;
import kr.co.vitamin.repository.vo.Address;

@Service
public class AddressServiceImpl implements AddressService{
	
	@Autowired
	private AddressMapper addressMapper;
	
	@Override
	public void insertAddress(Address address) throws Exception {
		addressMapper.insertAddress(address);
	}
	
	@Override
	public Address selectCode(Address address) throws Exception {
		return addressMapper.selectCode(address);
	}

	@Override
	public void insertAddress2(Address address) throws Exception {
		addressMapper.insertAddress(address);
	}
	
	@Override
	public Address selectAddress(Address addres) throws Exception {
		// TODO Auto-generated method stub
		return addressMapper.selectAddress(addres);
	}
	
	@Override
	public int selectNextAutoIncrement() throws Exception {
		// TODO Auto-generated method stub
		return addressMapper.selectNextAutoIncrement();
	}
}
