//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

import "./callable.sol";

contract Calling {
    // pointer that store the callable contract address in storage
    address public callAdd;
    // copy & paste callable contract address to set address in callAdd to storage 
    function setAddress(address _callAdd) external {
        callAdd = _callAdd;
    }

    function callExternal() external view returns(uint) {
        // Callable = contract type | callable = contract instance
        // Callable callable = Callable(callAdd);
        ICallable callable = ICallable(callAdd);
        return callable.getScore();
    }
  
}