
// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Struct{

    struct Person{
        string name;
        uint age;
    }

    Person public person;

    constructor() {
        person.name="jack";
        person.age = 10;
    }

    function changePersonName (string memory _name) public {
        person = Person(_name, 10);
    }
    //3种方式初始化结构体
    //1.直接按照结构体中变量的顺序进行初始化 Person(_name, 10);
    //2.键值对初始化Person({k:v,k2:v2}) 不分顺序
    //3.直接对结构体中某个变量直接赋值  person.name = "Bob";

    function changePersonName2 ( string memory _name,uint _age ) public {
        person = Person({age:_age,name:_name});
    }

    function changePersonName3 () public { 
        person.name = "Bob";
        person.age = 20;
    }
}