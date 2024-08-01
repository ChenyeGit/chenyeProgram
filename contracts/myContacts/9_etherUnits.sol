
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract EtherUints{

    uint256 public oneWei = 1 wei;

    uint256 public oneGwei = 1 gwei;

    uint256 public oneEther = 1 ether;

    function getWei(uint types) public view  returns(uint256){
        if(1==types){
            return oneGwei;// 1 gwei = 10**9 wei
        } else if(2==types){
            return oneEther;// 1 ether = 10**18 wei
        }else {
            return oneWei;
        }

    }


}
