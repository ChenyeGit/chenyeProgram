// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Error{
    //require 和revert 都能出现异常后返回gas
    function testRequire(uint256 i ) public pure{
        //检查输入是否符合要求
        require( i >10,"Input must be greater than 10");

    }

    function testRevert(uint256 i ) public pure{
        //revert 适用于多条件判断返回异常的情况 if .. else if .. else
        if(i<10){
            revert("Input must be greater than 10");
        }
    }
    int256 public num;
    //Assert要保证表达式中的结果一定为true 否则就会抛出异常
    function testAssert(){
        assert(num == 0);
    }

    error InsufficientBalance(uint256 balance,uint256 withdrawAmount);
    function testCustomError(uint256 _withdrawAmount) public view{
        uint256 bal = address(this).balance;
        if(bal < _withdrawAmount){
            revert InsufficientBalance({
                balance:bal,
                withdrawAmount:_withdrawAmount
            });

        }
    }
}