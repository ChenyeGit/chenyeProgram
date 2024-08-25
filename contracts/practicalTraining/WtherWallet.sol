// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract WtherWallet{
    address payable public immutable owner;
    event Log(string funName,address from ,uint256 value ,bytes data);
    constructor(){
        owner = payable(msg.sender);
    }

    receive() external payable{
        emit Log("receive",msg.sender,msg.value,"");
    }

    function withdraw1() external{
        require(msg.sender == owner,"not owner");
        // owner.transfer 相比 msg.sender 更消耗Gas
        // owner.transfer(address(this).balance);
        payable(msg.sender).transfer(100);
    }
    function withdraw2() external{
        require(msg.sender == owner,"not owner");
        bool success = payable(msg.sender).send(200);
        require(success,"Send Failed");
    }

    function withdraw3() external{
        require(msg.sender == owner,"not owner");
        (bool success,) = msg.sender.call{value:address(this).banlance}("");
        require(success,"Send Failed");
    }

    function getBanlance() external view returns (uint256){
        return address(this).banlance;
    }
}