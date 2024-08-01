// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Primitive{

    //uint 无符号整型 
    int8 i8;
    uint8 u8;
    uint16 u16;
    uint256 u256;
    address add;
    bool flag;

    function u8Rs(uint8 _num ) public {
        require(_num>type(uint8).max,"the num is to lager");
        u8 = _num;
    }

    function getU8() public view returns(uint8){
        return u8;
    }

    function typeMax() public pure returns(uint8){
        return type(uint8).max;
    }

    function setAddress(address _address) public {
        add = _address;
    }

    function getAddress() public view returns (address){
        return add;
    }

    function getCompareNum(uint8 _num1,uint8 _num2) public view returns (bool){
        return _num1 > _num2 ? true : flag;
    }

}