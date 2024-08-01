// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Variables{

    string public text = "global";
    uint16 public u16 = 123;
    uint256 public timestamp;
    address public sender ;


    function doSometing() public{
       //全局变量
        timestamp = block.timestamp;
        sender = msg.sender;
    }


}