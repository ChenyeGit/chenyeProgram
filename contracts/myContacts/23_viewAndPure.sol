contract ViewAndPure{
    uint256 public x=1;

    //修改变量的状态时用 View
    function addToX(uint256 y) public view  returns(uint256){
        return x+y;
    }

    //不做任何状态的修改，只查看或者运行计算时用
    function add(uint256 i;uint256 j) public pure returns(uint256){
        return i+j;
    }

}