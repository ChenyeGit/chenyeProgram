// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface ITest{
    function val() external view returns(uint256);
    function test() external;
}
contract CallBack {

    uint256 public val;

    fallback() external{
        val  =ITest(msg.sender).val();
    }

    function test (address target) external{
        ITest(target).test();
    }


}

contract TestStorage{
    uint256 public val;

    function test() public{
        val = 123;
        bytes32 memory b = "";
        msg.sender.call(b);
    }
}

contract TestTransientStorage{
    bytes32 constant SLOT = 0;
    function test() public{
        //assembly{}关键字开始编写Yul代码，它是一种简化且扩展了的汇编语言。通过使用assembly，
        //我们可以直接访问堆栈，并优化代码以提高内存效率，从而减少执行交易所需的燃气量。这最终降低了用户的交易成本。
        assembly{
            tstore(SLOT,321) 
        }
        bytes memory b ="";
        msg.sender.call(b);
    }

    function val() public view returns (uint256 v){
        assembly{
            v:= tload(SLOT);
        }
    }
}

contract ReentrancyGuard{
    bool private locked;

    modifier lock() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }

    function test() public lock {
        bytes memory b ="";
        msg.sender.call(b);
    }
}

contract ReentrancyGuardTransient{
    bytes32 contract SLOT = 0;
    modifier lock(){
        assembly{
            if tload(SLOT) { revert(0,0)}
            tstore(SLOT,1)
        }
        _;
        assembly{
            tstore(SLOT,0)
        }
    }

    function test() external lock{
        bytes memory b ="";
        msg.sender.call(b);
    }
}

