// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Mapping {

    mapping (address => uint256)  map;

    mapping (address => mapping (string => uint )) maps;

    function setMap(address _address,uint256 addNum) public{
         map[_address] = addNum;
    }

    function getMap(address _address) public view returns (uint256)  {
        return map[_address];
    }

    function removeMap(address _address) public{
        delete map[_address];
    }

    function setMaps(address _address,string memory _name,uint256 _size) public {
        maps[_address][_name] = _size;
    }
    function getMaps(address _address,string memory _name ) public view returns(uint256){
        return maps[_address][_name];
    }
    // 删除 -delete 根据key 删除 value
    function removeMaps(address _address,string memory _name ) public {
        delete maps[_address][_name];
    }
}