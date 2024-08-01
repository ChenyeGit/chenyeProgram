// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Immutable{

    //immutable 必须要有个默认值，string不可
    uint public immutable NUM;
    address public immutable ADDRESS;


    constructor(address _address,uint _num){
        ADDRESS = _address;
        NUM = _num;
    }






}