// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8;

contract Counter {

    uint32 public sum;

    function add() public returns (uint32){
        return sum+=1;
    }

    function sub() public returns(uint32){
        return sum-=1;
    }

    function get() public view returns (uint32){
        return sum;
    }

}