
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Enum {

    //枚举
    enum Status{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status;

    function get() public view returns (Status){
        return status;
    }

    function set(Status _status) public {
       status = _status;
    }

    function Accepted() public {
        status = Status.Accepted;
    }

    function Cancel() public {
        delete status;
    }

    function getEnumFromValue(uint value) public pure returns (Status){
        return Status(value);
    }
    
}