// SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract Demo {
    struct Todo {
        string name;
        bool isCompleted;
    }
    Todo [] public list;

    //创建任务
    function create(string memory _name) external{
        list.push(
            Todo({
                name:_name,
                isCompleted:false
            })
        );
    }

    //修改任务名称
    function modiName1(uint256 _index,string memory _name) external{
        //方法1: 直接修改，修改一个属性时候比较省 gas
        list[_index].name = _name;
    }

    function modiName2(uint256 _index,string memory _name) external{
    // 方法2: 先获取储存到 storage，在修改，在修改多个属性的时候比较省 gas
        Todo storage temp = list[_index];
        temp.name = _name;
    }

     // 修改完成状态1:手动指定完成或者未完成
    function modiStatus1(uint256 _index,bool _status) external{
        list[_index].isCompleted = _status;
    }
    function modiStatus2(uint256 _index) external{
        list[_index].isCompleted = !list[_index].isCompleted;
    }

    // 获取任务1: memory : 2次拷贝
    // 29448 gas
    function get1(uint256 _index) external view 
        returns (string memory _name,bool _status){
            Todo memory temp = list[_index];
            return (temp.name,temp.isCompleted);
    }

    // 获取任务2: storage : 1次拷贝
    // 预期：get2 的 gas 费用比较低（相对 get1）
    // 29388 gas
    function get2(uint256 _index) external view 
        returns (string memory _name,bool _status){
            Todo storage temp = list[_index];
            rerurn(temp.name,temp.isCompleted);
        }
}