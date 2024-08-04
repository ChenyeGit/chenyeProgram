// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract FunctionModifier{
    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor(){
        owner = msg.sender;
    }

    //修改器作用与方法上，方法调用时首先运行修改器
    modifier onlyOwner(){
        require(msg.sender==owner,"not owner");
        _;
    }

    //修改器允许设参
    modifier validAddress(address _address){
        require(_address != address(0),"not valid address");
        _;
    }

    function changeOwner(address _newOwner)
        public onlyOwner validAddress(_newOwner){
            owner = _newOwner;
        }

    modifier noReentrancy(){
        require(!locked,"No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 i) public noReentrancy{
        x-=i;
        if(i >1 ){
            decrement(i-1);
        }
    }

}