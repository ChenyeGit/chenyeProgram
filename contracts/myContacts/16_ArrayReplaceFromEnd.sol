
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ArrayReplaceFromEnd{

    uint256 [] arr;

    function remove(uint256 _index) public {

        arr[_index] = arr[arr.length-1];

        arr.pop();
    }

    function test() public{
        arr =[0,1,2,3,4,5];


        remove(1);

        //assert(arr[1] == 1);

        assert(arr[1] == 5);

    } 


}