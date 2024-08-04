// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract X{
    string public name;
    constructor(string memory _name){
        name = _name;
    }

}

contract Y{
    string public text;
    constructor(string memory _text){
        text = _text;
    }
}

contract B is X("Input to X"),Y("Input to Y"){

}

contract C is X,Y{
    //子类构造器进行参数传递到父类构造器
    constructor(string memory _name,string memory _text) X(_name) Y(_text){

    }

}

//调用多个父类构造器的时候不分先后顺序
contract D is X,Y {
    constructor() X("X was called ") Y("Y was called"){}
}

contract E is X,Y{
    constructor() Y("Y was called") X("X was called"){}
}