//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

interface ICallable {
    function getScore() external view returns(uint);
}

contract Callable {

    uint score = 20;

    function getScore() external view returns(uint){
        return score;
    }
  
}