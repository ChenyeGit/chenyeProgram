// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract DataLocations{

    uint256 [] public arr;
    mapping(uint256 => address ) map;

    struct MyStruct{
        uint256 foo;
    }


    mapping(uint256 => MyStruct) MyStruct;

    function f() public{
        _f(arr,map,MyStruct[1]);

        //存储在链上
        MyStruct storage myStruct = myStruct[1];

        MyStruct memory myMemStruct = myStruct(0);

    }

    function _f(uint256[] storage _arr,mapping(uint256=>address storage _map,MyStruct storage _myStruct))
    internal {

    }

     function g(uint256[] memory _arr) public returns (uint256[] memory) {
        // do something with memory array
    }

    function h(uint256[] calldata _arr) external {
        // do something with calldata array
    }

}