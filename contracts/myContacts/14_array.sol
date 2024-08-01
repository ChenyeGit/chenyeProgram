
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Array{

    uint8 [] public arr1;
    uint8 [] public arr2 = [1,2,3,4,5];
    uint8 [10] public arr3 ;

    function setArr1(uint8 _num) public {
        arr1.push(_num);
    }

    function getArr2(uint _index) public view returns (uint8){
        return arr2[_index];
    }

    function removeArr2() public {
        arr2.pop();//从尾往头删，先进后出（栈）
    }
    function getArrLength() public view returns(uint256){
        return arr1.length;
    }

    function removeByIndex(uint8 _index) public{
        require(_index < arr2.length,"error");//false 才执行
        for(uint8 i = _index ; i < arr2.length-1;i++){
            arr2[i] = arr2[i+1];
        }
        arr2.pop();
    }


}