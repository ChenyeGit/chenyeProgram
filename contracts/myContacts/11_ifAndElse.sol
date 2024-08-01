
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract IfAndElse{

    uint256 num = 100 ;

    function get( uint256 _num) public view returns (int) {
        if( _num > num ){
            return 1;
        }else if ( _num == num){
            return 0;
        }else {
            return -1;
        }
    }
}