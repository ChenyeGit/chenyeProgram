
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Gas {

    uint256 public uGas ;

    function limitGas() public {
        //此无限循环会消耗完最大gas限制
        while (true){
            uGas+=1;
        }
    }


}