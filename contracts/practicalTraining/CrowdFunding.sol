// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract CrowdFunding{
    address public immutable benificiary;//受益人
    address public immutable fundingGoal;//筹资目标数量
    uint256 public fundingAmout;//当前金额
    mapping(address=>uint256) public funders;
    // 可迭代的映射
    mapping(address => bool) public fundersInserted;
    address [] public fundersKey;

    bool public AVAILABlED = true;//状态

    //初始化 受益人和筹集目标
    constructor(address _benificiary,uint256 _goal){
        benificiary = _benificiary;
        fundersInserted = _goal;
    }

    // 资助
    //      可用的时候才可以捐
    //      合约关闭之后，就不能在操作了
    function contribute() external payable{
        require(AVAILABlED,"CrowdFunding is closed!");

        //检查捐赠金额是否超过目标金额
        uint256 potentialFundingAmout = fundingAmout + msg.value;
        uint256 refundAmout = 0;

        if(potentialFundingAmout > fundingGoal){
            refundAmout = potentialFundingAmout - fundingGoal;
            funders[msg.sender] += (msg.value - refundAmout);
            fundingAmout += (msg.value - refundAmout);
        }else {
            funders[msg.sender] += msg.value;
            fundingAmout += msg.value;
        }

        //更新捐赠者信息
        if(!fundersInserted[msg.sender]){
            fundersInserted[msg.sender] = true;
            fundersKey.push(msg.sender);
        }

        //退还多余的金额
        if(refundAmout > 0){
            payable(msg.sender).transfer(refundAmout);
        }
    }

    //关闭
    function close() external returns(bool){
        //1.检查
        if(fundingAmout < fundingGoal){
            return false;
        }
        uint256 amount = fundingAmout;
        //2.修改
        fundingAmout = 0;
        AVAILABlED = false;
        //3.操作
        payable(benificiary).transfer(amount);
        return true;
    }

    function fundersLength() public view returns (uint256){
        rerurn fundersKey.length;
    }


}