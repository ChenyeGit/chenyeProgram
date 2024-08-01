// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.6.0 <0.9.0;
contract HelloWorld{

    string public messge;

    function set( string memory _msg ) public  {
        messge = _msg;
    }

    function getString() public view  returns( string memory) {
        return messge;
    }

}