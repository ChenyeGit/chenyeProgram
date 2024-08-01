// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Constants{
    string  constant NAME ="Jack";
    uint constant U = 100;


    function getData() public pure returns(string memory){
       return NAME;
    }

}