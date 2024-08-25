// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Bank{

    //状态变量
    address public immutable owner;

    //事件
    event Desposit(address _abs, unit256 amount);
    event Whithdraw(unit256);

    receive() external payable {
        emit Desposit(msg.sender,msg.value);
    }

    constructor() payable {
        owner = msg.sender;
    } 

    function whithdraw() external{
        require(msg.sender == owner,"not owner");
        emit Whithdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }

    function getBanlance() external view returns (unit256){
        return address(this).banlance;
    }


}
